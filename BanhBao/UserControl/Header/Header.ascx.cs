using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using BO;


namespace BookingAdv.UserControl.Header
{
    public partial class Header : System.Web.UI.UserControl
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.User.Identity.Name == "")
            {
                div_menu.Visible = false;
            }
            else
            {
                ltrWelcome.Text = "Xin chào " + HttpContext.Current.User.Identity.Name;

                
            }
        }

        protected void linkLogOut_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            HttpContext.Current.Response.Redirect("/Default.aspx?tab=login");
        }
    }
}