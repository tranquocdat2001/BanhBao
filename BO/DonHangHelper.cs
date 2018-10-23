using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entity;
using DAL;
using System.Data;

namespace BO
{
    public class DonHangHelper
    {
        public int CreateDonHang(int khachHangId, int shipFee, int totalAmount, int disCount)
        {
            DonHangDAL objDonHangDAL = new DonHangDAL();
            return objDonHangDAL.CreateDonHang(khachHangId, shipFee, totalAmount, disCount);
        }

        public void UpdateDonHang(int donHangId, int khachHangId, int shipFee, int totalAmount, int disCount)
        {
            DonHangDAL objDonHangDAL = new DonHangDAL();
            objDonHangDAL.UpdateDonHang(donHangId, khachHangId, shipFee, totalAmount, disCount);
        }

        public void DeleteDonHang(int donHangId)
        {
            DonHangDAL objDonHangDAL = new DonHangDAL();
            objDonHangDAL.DeleteDonHang(donHangId);
        }

        public void DeleteDonHangDetail(int donHangId)
        {
            DonHangDAL objDonHangDAL = new DonHangDAL();
            objDonHangDAL.DeleteDonHangDetail(donHangId);
        }

        public void CreateDonHangDetail(int donHangId, int monHangId, int soLuong, int isFree)
        {
            DonHangDAL objDonHangDAL = new DonHangDAL();
            objDonHangDAL.CreateDonHangDetail(donHangId, monHangId, soLuong, isFree);
        }
            
        public DataTable GetListDonHang(string strWhere, int StartRow, int PageSize)
        {
            if (strWhere == null)
                strWhere = "";
            DonHangDAL objDonHangDAL = new DonHangDAL();
            return objDonHangDAL.GetListDonHang(strWhere, StartRow, PageSize);
        }

        public int GetListDonHang_Count(string strWhere)
        {
            if (strWhere == null)
                strWhere = "";
            DonHangDAL objDonHangDAL = new DonHangDAL();
            return objDonHangDAL.GetListDonHang_Count(strWhere);
        }

        public List<DonHangDetailInfo> GetDonHangDetail(int donHangId)
        {
            DonHangDAL objDonHangDAL = new DonHangDAL();
            return objDonHangDAL.GetDonHangDetail(donHangId);
        }

        public DonHangInfo GetDonHangInfo(int donHangId)
        {
            DonHangDAL objDonHangDAL = new DonHangDAL();
            return objDonHangDAL.GetDonHangInfo(donHangId);
        }

    }
}
