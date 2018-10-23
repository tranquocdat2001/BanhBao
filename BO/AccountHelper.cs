using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BO.Common;
using Entity;
using DAL;
using System.Data;

namespace BO
{
    public class AccountHelper
    {

        public AccountInfo GetUserInfo(string username)
        {
            AccountDAL obj = new AccountDAL();
            return obj.GetAccountInfo(username);
        }

        public AccountInfo GetUserInfo(int accountId)
        {
            AccountDAL obj = new AccountDAL();
            return obj.GetAccountInfo(accountId);
        }

        public void UpdatePassword(string username, string password)
        {
            AccountDAL obj = new AccountDAL();
            obj.UpdatePassword(username, password);
        }

        //public int CreateAccount(string username, string password, string fullname, Int64 permission, Int32 role, int status, string ListCategoryId)
        public int CreateAccount(AccountInfo account)
        {
            AccountDAL obj = new AccountDAL();
            return obj.CreateAccount(account.UserName, account.Password, account.FullName, account.Permission, account.Role, account.Status, account.ListCategoryId);
        }

        //public void UpdateAccount(string username, string password, string fullname, Int64 permission, Int32 role, int status, string ListCategoryId)
        public void UpdateAccount(AccountInfo account)
        {
            AccountDAL obj = new AccountDAL();
            obj.UpdateAccount(account.UserName, account.Password, account.FullName, account.Permission, account.Role, account.Status, account.ListCategoryId);
        }

        public void DeleteAccount(int accountId)
        {
            AccountDAL obj = new AccountDAL();
            obj.DeleteAccount(accountId);
        }
             
        public static DataTable GetListAccount(string strWhere, int startRow, int pageSize)
        {
            if (strWhere == null)
                strWhere = "";

            AccountDAL obj = new AccountDAL();
            return obj.GetListAccount(strWhere, startRow, pageSize);
        }

        public static int GetListAccount_Count(string strWhere)
        {
            if (strWhere == null)
                strWhere = "";

            AccountDAL obj = new AccountDAL();
            return obj.GetListAccount_Count(strWhere);
        }

        public bool IsLoginOk(string username, string password)
        {
            bool isReturn = false;
            password = CommonHelper.GetMD5Hash(password);
            AccountInfo obj = GetUserInfo(username);
            if (obj != null)
            {
                if (obj.Password == password && obj.Status == 1)
                    isReturn = true;
            }
            return isReturn;

        }


        AccountInfo objAccountInfo = new AccountInfo();
        public bool CheckPermission(PermissionStates states, string username)
        {

            if (objAccountInfo.UserName == null)
            {
                AccountHelper objAccountHelper = new AccountHelper();
                objAccountInfo = objAccountHelper.GetUserInfo(username);
            }

            if (objAccountInfo != null)
            {
                if (objAccountInfo.Role.HasState(RoleStates.QuanTri))
                    return true;

                if (!objAccountInfo.Permission.HasState(states))
                    return false;
                else
                    return true;
            }

            return false;
        }

        public bool CheckPermissionInCategoryId(int CategoryId, string username)
        {
            if (objAccountInfo.UserName == null)
            {
                AccountHelper objAccountHelper = new AccountHelper();
                objAccountInfo = objAccountHelper.GetUserInfo(username);
            }

            if (objAccountInfo != null)
            {
                if (objAccountInfo.Role.HasState(RoleStates.QuanTri) || objAccountInfo.Role.HasState(RoleStates.ThuKyToaSoan))
                    return true;

                if (objAccountInfo.ListCategoryId.IndexOf(CategoryId.ToString()) >= 0)
                    return true;
            }

            return false;
        }

    }


    
}
