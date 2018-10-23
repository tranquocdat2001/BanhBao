using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BO;
using Entity;

namespace BanhBao
{
    public partial class PrintHoaDon : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int khachHangId = 0;
            int donHangId = 0;

            if (Request.QueryString["khachHangId"] != null)
                int.TryParse(Request.QueryString["KhachHangId"].ToString(), out khachHangId);
            if (Request.QueryString["DonHangId"] != null)
                int.TryParse(Request.QueryString["DonHangId"].ToString(), out donHangId);

            if (donHangId > 0 && khachHangId > 0)
            {
                DonHangHelper objDonHangHelper = new DonHangHelper();
                KhachHangHelper objKHHelper = new KhachHangHelper();
                KhachHangInfo objKhachHangInfo = objKHHelper.GetKhachHangInfoById(khachHangId);
                ltrDiaChi.Text = objKhachHangInfo.DiaChi;
                ltrSDT.Text = objKhachHangInfo.SDT;
                ltrKhachHang.Text = objKhachHangInfo.XungHo + " " + objKhachHangInfo.HoTen;

                DonHangInfo objDonHangInfo = objDonHangHelper.GetDonHangInfo(donHangId);
                ltrTotalAmount.Text = objDonHangInfo.TotalAmount.ToString("C0").Replace("$", "").Replace("₫", "").Trim();
                ltrShipFee.Text = objDonHangInfo.ShipFee.ToString("C0").Replace("$", "").Replace("₫", "").Trim();

                if (objDonHangInfo.Discount == 0)
                    trDisCount.Visible = false;
                else
                {
                    ltrDisCount.Text = "-" + objDonHangInfo.Discount.ToString("C0").Replace("$", "").Replace("₫", "").Trim();
                }

                List<DonHangDetailInfo> objList = objDonHangHelper.GetDonHangDetail(donHangId);
                rptListDonHangDetail.DataSource = objList;
                rptListDonHangDetail.DataBind();

                ltrSTTPhiShip.Text = (objList.Count + 1).ToString();
                ltrSTTDisCount.Text = (objList.Count + 2).ToString();
            }
        }
    }
}