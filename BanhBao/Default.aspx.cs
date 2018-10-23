using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace CMS
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string tab = Request.QueryString["tab"] != null ? Request.QueryString["tab"].ToString() : "";

            if (tab.ToLower() != "login" && HttpContext.Current.User.Identity.Name == "")
            {
                Response.Redirect("/Default.aspx?tab=login");
            }

            if (tab == "" && HttpContext.Current.User.Identity.Name != "")
                Response.Redirect("/Default.aspx?tab=welcome");

            XmlDocument doc = new XmlDocument();
            doc.Load(Server.MapPath("/Config/Tab.config"));

            XmlNodeList noteTab = doc.SelectNodes("//tab");
            XmlNodeList notePath = doc.SelectNodes("//path");
            XmlNodeList noteMode = doc.SelectNodes("//mode");

            string strPath = "";
            string strMode = "";
            for (int i = 0; i < noteTab.Count; i++)
            {
                if (noteTab[i].InnerText.Trim() == tab)
                {
                    strPath = notePath[i].InnerText.Trim();
                    strMode = noteMode[i].InnerText.Trim();
                    break;
                }
            }
            //if (strPath != "" && (strMode.IndexOf(mode.ToString()) >= 0 || strMode == "-1"))
            if (strPath != "" )
            {
                Control ctr = LoadControl(strPath);
                plhControl.Controls.Add(ctr);
            }
        }
    }
}