using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FluentData;
using Entity;
using System.Data;

namespace DAL
{
    public class AccountDAL : MainDB
    {
        public AccountInfo GetAccountInfo(string username)
        {
            using (var context = Context())
            {
                return context.StoredProcedure("GetAccountInfo")
                    .Parameter("username", username, DataTypes.String)
                    .QuerySingle<AccountInfo>();
            }
        }

        public AccountInfo GetAccountInfo(int accountId)
        {
            using (var context = Context())
            {
                return context.StoredProcedure("GetAccountInfoById")
                    .Parameter("accountId", accountId, DataTypes.Int32)
                    .QuerySingle<AccountInfo>();
            }
        }

        public void UpdatePassword(string username, string password)
        {
            using (var context = Context())
            {
                context.StoredProcedure("UpdatePassword")
                    .Parameter("username", username, DataTypes.String)
                    .Parameter("password", password, DataTypes.String)
                    .Execute();
            }
        }

        public void DeleteAccount(int accountId)
        {
            using (var context = Context())
            {
                context.StoredProcedure("DeleteAccount")
                    .Parameter("accountId", accountId, DataTypes.Int32)
                    .Execute();
            }
        }

        public int CreateAccount(string username, string password, string fullname, Int64 permission, Int32 role, int status, string ListCategoryId)
        {
            using (var context = Context())
            {
                return context.StoredProcedure("CreateAccount")
                    .Parameter("username", username, DataTypes.String)
                    .Parameter("password", password, DataTypes.String)
                    .Parameter("fullname", fullname, DataTypes.String)
                    .Parameter("permission", permission, DataTypes.Int32)
                    .Parameter("role", role, DataTypes.Int32)
                    .Parameter("status", status, DataTypes.Int32)
                    .Parameter("ListCategoryId", ListCategoryId, DataTypes.String)
                    .QuerySingle<int>();
            }
        }

        public void UpdateAccount(string username, string password, string fullname, Int64 permission, Int32 role, int status, string ListCategoryId)
        {
            if (password == null) password = "";
            using (var context = Context())
            {
                context.StoredProcedure("UpdateAccount")
                    .Parameter("username", username, DataTypes.String)
                    .Parameter("password", password, DataTypes.String)
                    .Parameter("fullname", fullname, DataTypes.String)
                    .Parameter("permission", permission, DataTypes.Int32)
                    .Parameter("role", role, DataTypes.Int32)
                    .Parameter("status", status, DataTypes.Int32)
                    .Parameter("ListCategoryId", ListCategoryId, DataTypes.String)
                    .Execute();
            }
        }

        public DataTable GetListAccount(string strWhere, int StartRow, int PageSize)
        {
            using (var context = Context())
            {
                return context.StoredProcedure("GetListAccount")
                    .Parameter("strWhere", strWhere, DataTypes.String)
                    .Parameter("StartRow", StartRow, DataTypes.Int32)
                    .Parameter("PageSize", PageSize, DataTypes.Int32)
                    .QuerySingle<DataTable>();
            }
        }

        public int GetListAccount_Count(string strWhere)
        {
            using (var context = Context())
            {
                return context.StoredProcedure("GetListAccount_Count")
                    .Parameter("strWhere", strWhere, DataTypes.String)
                    .QuerySingle<int>();
            }
        }
    }
}
