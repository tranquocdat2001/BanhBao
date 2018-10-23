using BO;
using Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BanhBao.UserControl.KhachHang
{
    public partial class Edit : System.Web.UI.UserControl
    {
        int id = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
                int.TryParse(Request.QueryString["id"].ToString(), out id);

            if (!IsPostBack)
            {
                KhachHangHelper objKH = new KhachHangHelper();
                KhachHangInfo objKHInfo = objKH.GetKhachHangInfoById(id);
                if (objKHInfo != null)
                {
                    txtHoTen.Text = objKHInfo.HoTen.Trim();
                    txtDiaChi.Text = objKHInfo.DiaChi.Trim();
                    txtSDT.Text = objKHInfo.SDT.Trim();
                    lstXungHo.SelectedValue = objKHInfo.XungHo.Trim();
                }
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            
            KhachHangHelper objKHHelper = new KhachHangHelper();
            if (id > 0)
            {
                objKHHelper.UpdateKhachHang(id, txtHoTen.Text.Trim(), lstXungHo.SelectedValue.Trim(), txtDiaChi.Text.Trim(), txtSDT.Text.Trim());
            }
            else
            {
                objKHHelper.CreateKhachHang(txtHoTen.Text.Trim(), lstXungHo.SelectedValue.Trim(), txtDiaChi.Text.Trim(), txtSDT.Text.Trim());
            }

            this.Page.RegisterClientScriptBlock("aa", "<script>parent.CloseLightbox();</script>");
        }
    }
}