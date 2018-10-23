using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FluentData;
using Entity;
using System.Data;

namespace DAL
{
    public class DonHangDAL : MainDB
    {
        public int CreateDonHang(int khachHangId, int shipFee, int totalAmount, int disCount)
        {
            using (var context = Context())
            {
                return context.StoredProcedure("CreateDonHang")
                    .Parameter("khachHangId", khachHangId, DataTypes.Int32)
                    .Parameter("shipFee", shipFee, DataTypes.Int32)
                    .Parameter("totalAmount", totalAmount, DataTypes.Int32)
                    .Parameter("DisCount", disCount, DataTypes.Int32)
                    .QuerySingle<int>();
            }
        }

        public void UpdateDonHang(int donHangId, int khachHangId, int shipFee, int totalAmount, int disCount)
        {
            using (var context = Context())
            {
                context.StoredProcedure("UpdateDonHang")
                    .Parameter("id", donHangId, DataTypes.Int32)
                    .Parameter("khachHangId", khachHangId, DataTypes.Int32)
                    .Parameter("shipFee", shipFee, DataTypes.Int32)
                    .Parameter("totalAmount", totalAmount, DataTypes.Int32)
                    .Parameter("DisCount", disCount, DataTypes.Int32)
                    .Execute();
            }
        }

        public void DeleteDonHang(int donHangId)
        {
            using (var context = Context())
            {
                context.StoredProcedure("DeleteDonHang")
                    .Parameter("donHangId", donHangId, DataTypes.Int32)
                    .Execute();
            }
        }

        public void DeleteDonHangDetail(int donHangId)
        {
            using (var context = Context())
            {
                context.StoredProcedure("DeleteDonHangDetail")
                    .Parameter("donHangId", donHangId, DataTypes.Int32)
                    .Execute();
            }
        }
        public void CreateDonHangDetail(int donHangId, int monHangId, int soLuong, int isFree)
        {
            using (var context = Context())
            {
                context.StoredProcedure("CreateDonHangDetail")
                    .Parameter("donHangId", donHangId, DataTypes.Int32)
                    .Parameter("monHangId", monHangId, DataTypes.Int32)
                    .Parameter("soLuong", soLuong, DataTypes.Int32)
                    .Parameter("isFree", isFree, DataTypes.Int32)
                    .Execute();
            }
        }

        public DataTable GetListDonHang(string strWhere, int StartRow, int PageSize)
        {
            using (var context = Context())
            {
                return context.StoredProcedure("GetListDonHang")
                    .Parameter("strWhere", strWhere, DataTypes.String)
                    .Parameter("StartRow", StartRow, DataTypes.Int32)
                    .Parameter("PageSize", PageSize, DataTypes.Int32)
                    .QuerySingle<DataTable>();
            }
        }

        public int GetListDonHang_Count(string strWhere)
        {
            using (var context = Context())
            {
                return context.StoredProcedure("GetListDonHang_Count")
                    .Parameter("strWhere", strWhere, DataTypes.String)
                    .QuerySingle<int>();
            }
        }


        public List<DonHangDetailInfo> GetDonHangDetail(int donHangId)
        {
            using (var context = Context())
            {
                return context.StoredProcedure("GetDonHangDetail")
                    .Parameter("donHangId", donHangId, DataTypes.Int32)
                    .QueryMany<DonHangDetailInfo>();
            }
        }

        public DonHangInfo GetDonHangInfo(int donHangId)
        {
            using (var context = Context())
            {
                return context.StoredProcedure("GetDonHangInfo")
                    .Parameter("donHangId", donHangId, DataTypes.Int32)
                    .QuerySingle<DonHangInfo>();
            }
        }
    }
}
