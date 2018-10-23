using Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL;
using System.Data;

namespace BO
{
    public class KhachHangHelper
    {
        public KhachHangInfo GetKhachHangInfoById(int id)
        {
            KhachHangDAL objDAL = new KhachHangDAL();
            return objDAL.GetKhachHangInfoById(id);
        }

        public void DeleteKhachHang(int id)
        {
            KhachHangDAL objDAL = new KhachHangDAL();
            objDAL.DeleteKhachHang(id);
        }

        public int CreateKhachHang(string hoTen, string xungHo, string diaChi, string sdt)
        {
            KhachHangDAL objDAL = new KhachHangDAL();
            return objDAL.CreateKhachHang(hoTen, xungHo, diaChi, sdt);
        }

        public void UpdateKhachHang(int id, string hoTen, string xungHo, string diaChi, string sdt)
        {
            KhachHangDAL objDAL = new KhachHangDAL();
            objDAL.UpdateKhachHang(id, hoTen, xungHo, diaChi, sdt);
        }

        public DataTable GetListKhachHang(string strWhere, int StartRow, int PageSize)
        {
            if (strWhere == null)
                strWhere = "";
            KhachHangDAL objDAL = new KhachHangDAL();
            return objDAL.GetListKhachHang(strWhere, StartRow, PageSize);
        }

        public int GetListKhachHang_Count(string strWhere)
        {
            if (strWhere == null)
                strWhere = "";

            KhachHangDAL objDAL = new KhachHangDAL();
            return objDAL.GetListKhachHang_Count(strWhere);
        }
    }
}
