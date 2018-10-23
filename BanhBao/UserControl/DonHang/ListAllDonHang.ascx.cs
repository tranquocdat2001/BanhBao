using BO;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BanhBao.UserControl.DonHang
{
    public partial class ListAllDonHang : System.Web.UI.UserControl
    {
        int sumAmount = 0, sumShipFee = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                txtFromDate.Text = DateTime.Today.AddDays(-7).ToString("dd/MM/yyyy");
                txtToDate.Text = DateTime.Today.ToString("dd/MM/yyyy");
            }
        }

        private string GetStrWhere()
        {
            string strWhere = "";
            if (txtSearch.Text.Trim() != "")
            {
                strWhere += " and ( HoTen like N'%" + txtSearch.Text.Trim() + "%' ";
                strWhere += " OR SDT like '%" + txtSearch.Text.Trim() + "%'  ";
                strWhere += " OR DiaChi like '%" + txtSearch.Text.Trim() + "%' ) ";
            }

            CultureInfo objCulture = new CultureInfo("vi-VN");
            if (txtFromDate.Text.Trim() != "")
            {
                DateTime dFromDate = Convert.ToDateTime(txtFromDate.Text, objCulture);
                strWhere += " and CreateDate >='" + dFromDate.ToString("yyyy-MM-dd") +"' ";
               
            }

            if (txtToDate.Text.Trim() != "")
            {
                DateTime dToDate = Convert.ToDateTime(txtToDate.Text, objCulture);
                strWhere += " and CreateDate <'" + dToDate.AddDays(1).ToString("yyyy-MM-dd") + "' ";

            }

            return strWhere;
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

        protected void grdList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Literal lbl = (Literal)e.Row.FindControl("ltrTotalAmount");
                sumAmount += Convert.ToInt32(lbl.Text);

                lbl = (Literal)e.Row.FindControl("ltrShipFee");
                sumShipFee += Convert.ToInt32(lbl.Text); 
            }

            if (e.Row.RowType == DataControlRowType.Footer)
            {
                Literal lbl = (Literal)e.Row.FindControl("ltrSumAmount");
                lbl.Text = sumAmount.ToString();

                lbl = (Literal)e.Row.FindControl("ltrSumShipFee");
                lbl.Text = sumShipFee.ToString();
            }
        }
    }
}