using BO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entity;

namespace BanhBao.UserControl.DonHang
{
    public partial class List : System.Web.UI.UserControl
    {
        public int khachHangId = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["khachHangId"] != null)
                int.TryParse(Request.QueryString["khachHangId"].ToString(), out khachHangId);

            if(!IsPostBack)
            {
                KhachHangInfo objKhachHangInfo = new KhachHangInfo();
                KhachHangHelper objKHHelper = new KhachHangHelper();
                objKhachHangInfo = objKHHelper.GetKhachHangInfoById(khachHangId);
                ltrKhachHang.Text = objKhachHangInfo.XungHo + " " + objKhachHangInfo.HoTen;
                ltrDiaChi.Text = objKhachHangInfo.DiaChi;
                ltrSDT.Text = objKhachHangInfo.SDT;

                objListSource.SelectParameters["strWhere"].DefaultValue = GetStrWhere();
            }
        }

        protected void grdList_SelectedIndexChanged(object sender, EventArgs e)
        {
            objListSource.SelectParameters["strWhere"].DefaultValue = GetStrWhere();
            objListSource.DataBind();
        }

        protected void grdList_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            objListSource.SelectParameters["strWhere"].DefaultValue = GetStrWhere();
            objListSource.DataBind();
        }

        private string GetStrWhere()
        {
            string strWhere = "";
            if (txtSearch.Text.Trim() != "")
            {
                //strWhere += " and ( HoTen like N'%" + txtSearch.Text.Trim() + "%' ";
                //strWhere += " OR SDT like '%" + txtSearch.Text.Trim() + "%' ) ";
            }

            if (khachHangId > 0)
            {
                strWhere += "  AND KhachHangID  = " + khachHangId;
            }

            return strWhere;
        }

        protected void grdList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.ToLower() == "deleteaccount")
            {
                DonHangHelper obj = new DonHangHelper();
                obj.DeleteDonHang(Convert.ToInt32(e.CommandArgument));
            }

            objListSource.SelectParameters["strWhere"].DefaultValue = GetStrWhere();
            //objListSource.DataBind();
            grdList.DataBind();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            objListSource.SelectParameters["strWhere"].DefaultValue = GetStrWhere();
            //objListSource.DataBind();
            grdList.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            objListSource.SelectParameters["strWhere"].DefaultValue = GetStrWhere();
            //objListSource.DataBind();
            grdList.DataBind();
        } 

    }
}