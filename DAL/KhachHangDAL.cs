using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FluentData;
using Entity;
using System.Data;

namespace DAL
{
    public class KhachHangDAL : MainDB
    {


        public KhachHangInfo GetKhachHangInfoById(int id)
        {
            using (var context = Context())
            {
                return context.StoredProcedure("GetKhachHangInfoById")
                    .Parameter("id", id, DataTypes.Int32)
                    .QuerySingle<KhachHangInfo>();
            }
        }

        public void DeleteKhachHang(int id)
        {
            using (var context = Context())
            {
                context.StoredProcedure("DeleteKhachHang")
                    .Parameter("id", id, DataTypes.Int32)
                    .Execute();
            }
        }

        public int CreateKhachHang(string hoTen, string xungHo, string diaChi, string sdt)
        {
            using (var context = Context())
            {
                return context.StoredProcedure("CreateKhachHang")
                    .Parameter("HoTen", hoTen, DataTypes.String)
                    .Parameter("XungHo", xungHo, DataTypes.String)
                    .Parameter("DiaChi", diaChi, DataTypes.String)
                    .Parameter("SDT", sdt, DataTypes.String)
                    .QuerySingle<int>();
            }
        }

        public void UpdateKhachHang(int id, string hoTen, string xungHo, string diaChi, string sdt)
        {
            using (var context = Context())
            {
                context.StoredProcedure("UpdateKhachHang")
                    .Parameter("id", id, DataTypes.Int32)
                    .Parameter("HoTen", hoTen, DataTypes.String)
                    .Parameter("XungHo", xungHo, DataTypes.String)
                    .Parameter("DiaChi", diaChi, DataTypes.String)
                    .Parameter("SDT", sdt, DataTypes.String)
                    .Execute();
            }
        }

        public DataTable GetListKhachHang(string strWhere, int StartRow, int PageSize)
        {
            using (var context = Context())
            {
                return context.StoredProcedure("GetListKhachHang")
                    .Parameter("strWhere", strWhere, DataTypes.String)
                    .Parameter("StartRow", StartRow, DataTypes.Int32)
                    .Parameter("PageSize", PageSize, DataTypes.Int32)
                    .QuerySingle<DataTable>();
            }
        }

        public int GetListKhachHang_Count(string strWhere)
        {
            using (var context = Context())
            {
                return context.StoredProcedure("GetListKhachHang_Count")
                    .Parameter("strWhere", strWhere, DataTypes.String)
                    .QuerySingle<int>();
            }
        }
    }
}
