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
using BO.Common;
using Entity;

namespace BookingAdv.UserControl.Login
{
    public partial class ChangePassword : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            AccountHelper objAccountHelper = new AccountHelper();
            AccountInfo accountInfo = objAccountHelper.GetUserInfo(HttpContext.Current.User.Identity.Name);
            if (accountInfo != null)
            {
                if (accountInfo.Password == CommonHelper.GetMD5Hash(txtCurrentPassword.Text.Trim()))
                {
                    if (txtNewPassword.Text.Trim() == txtReNewPassword.Text.Trim())
                    {
                        objAccountHelper.UpdatePassword(HttpContext.Current.User.Identity.Name, CommonHelper.GetMD5Hash(txtNewPassword.Text.Trim()));

                        Page.RegisterClientScriptBlock("aa", "<script>alert(' Bạn đã thay đổi mật khẩu thành công !');</script>");
                    }
                    else
                    {

                    }
                }
                else
                {
                    Page.RegisterClientScriptBlock("aa", "<script>alert(' Bạn nhập mật khẩu hiện tại không đúng !');</script>");
                }
            }
        }
    }
}