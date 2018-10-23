using BO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BanhBao.UserControl.KhachHang
{
    public partial class KhachHangList : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ltrTotalKhachHang.Text = new BO.KhachHangHelper().GetListKhachHang_Count(GetStrWhere()).ToString();
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
                strWhere += " and ( HoTen like N'%" + txtSearch.Text.Trim() + "%' ";
                strWhere += " OR SDT like '%" + txtSearch.Text.Trim() + "%' ) ";
            }
                
            return strWhere;
        }

        protected void grdList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.ToLower() == "deleteaccount")
            {
                KhachHangHelper obj = new KhachHangHelper();
                obj.DeleteKhachHang(Convert.ToInt32(e.CommandArgument));
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