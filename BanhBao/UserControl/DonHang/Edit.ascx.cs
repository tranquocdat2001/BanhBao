using BO;
using Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;

namespace BanhBao.UserControl.DonHang
{
    public partial class Edit : System.Web.UI.UserControl
    {
        public int khachHangId;
        public int id = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["khachHangId"] != null)
                int.TryParse(Request.QueryString["khachHangId"].ToString(), out khachHangId);
            if (Request.QueryString["id"] != null)
                int.TryParse(Request.QueryString["id"].ToString(), out id);

            if (!IsPostBack)
            {
                KhachHangInfo objKhachHangInfo = new KhachHangInfo();
                KhachHangHelper objKHHelper = new KhachHangHelper();
                objKhachHangInfo = objKHHelper.GetKhachHangInfoById(khachHangId);
                ltrKhachHangInfo.Text = objKhachHangInfo.XungHo + " " + objKhachHangInfo.HoTen;

                if(id > 0)
                {
                    DonHangHelper objDHHelper = new DonHangHelper();
                    List<DonHangDetailInfo> lstDH_DetailInfo = objDHHelper.GetDonHangDetail(id);
                    JavaScriptSerializer jss = new JavaScriptSerializer();
                    hdJson.Value = jss.Serialize(lstDH_DetailInfo);

                    DonHangInfo objDonHang = objDHHelper.GetDonHangInfo(id);
                    txtShipFee.Text = objDonHang.ShipFee.ToString();
                    txtDisCount.Text = objDonHang.Discount.ToString();
                }
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            int shipFree = txtShipFee.Text.Trim() != "" ? Convert.ToInt32(txtShipFee.Text.Trim()) : 0;
            int disCount = txtDisCount.Text.Trim() != "" ? Convert.ToInt32(txtDisCount.Text.Trim()) : 0;
            List<string> lstMonHang = Request.Form["cboMonHang"].ToString().Split(',').ToList() ;
            List<string> lstSoLuong = Request.Form["txtSoLuong"].ToString().Split(',').ToList();
            List<string> lstIsFree = Request.Form["cboIsFree"].ToString().Split(',').ToList();

            MonHangInfo objMonHangInfo = new MonHangInfo();
            DonHangDetailInfo objDonHangDetail = new DonHangDetailInfo();
            MonHangHelper objMonHangHelper = new MonHangHelper();
            DonHangHelper objDonHangHelper = new DonHangHelper();
            

            if (id == 0)
            {
                id = objDonHangHelper.CreateDonHang(khachHangId, shipFree, 0, disCount);
            }
            else
            {
                objDonHangHelper.DeleteDonHangDetail(id);
            }
            
            int i = 0;
            int totalAmount = shipFree - disCount;
            foreach (string item in lstSoLuong)
            {
                objMonHangInfo = new MonHangInfo();
                if (item != "")
                {
                    if(lstIsFree[i] == "0")
                    {
                        objMonHangInfo = objMonHangHelper.GetMonHangInfo(Convert.ToInt32(lstMonHang[i]));
                        totalAmount = totalAmount + objMonHangInfo.Price * Convert.ToInt32(lstSoLuong[i]);

                    }
                    
                    objDonHangHelper.CreateDonHangDetail(id, Convert.ToInt32(lstMonHang[i]), Convert.ToInt32(lstSoLuong[i]), Convert.ToInt32(lstIsFree[i]));
                }
                i++;
            }

            objDonHangHelper.UpdateDonHang(id, khachHangId, shipFree, totalAmount, disCount);

            this.Page.RegisterClientScriptBlock("aa", "<script>parent.CloseLightbox();</script>");
        }
    }
}