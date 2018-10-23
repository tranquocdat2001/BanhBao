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


namespace BookingAdv.UserControl.Login
{
    public partial class Login : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (txtUserName.Text.Trim() != "" && txtPassword.Text.Trim() != "")
            {
                AccountHelper objAccountHelper = new AccountHelper();
                if (objAccountHelper.IsLoginOk(txtUserName.Text.Trim(), txtPassword.Text.Trim()))
                {
                    FormsAuthentication.SetAuthCookie(txtUserName.Text.Trim(), false);
                    //HttpContext.Current.Response.Redirect("/Default.aspx?tab=welcome");
                    HttpContext.Current.Response.Redirect("/Default.aspx?tab=listkhachhang&TypeList=0");
                    
                }
                else
                {
                    ltrMessage.Text = "Mật khẩu hoặc tài khoản không đúng";
                }
            }
        }
    }
}