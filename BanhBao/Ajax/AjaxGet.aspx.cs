﻿using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace CMS.Ajax
{
    public partial class AjaxGet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string tab = Request.QueryString["tab"] != null ? Request.QueryString["tab"].ToString() : "";

            if (tab.ToLower() != "login" && HttpContext.Current.User.Identity.Name == "")
            {
                Response.Redirect("/Default.aspx?tab=login");
            }

            XmlDocument doc = new XmlDocument();
            doc.Load(Server.MapPath("/Ajax/ajaxGet.config"));

            XmlNodeList noteTab = doc.SelectNodes("//tab");
            XmlNodeList notePath = doc.SelectNodes("//path");

            string strPath = "";
            for (int i = 0; i < noteTab.Count; i++)
            {
                if (noteTab[i].InnerText.Trim() == tab)
                {
                    strPath = notePath[i].InnerText.Trim();
                    break;
                }
            }
            if (strPath != "")
            {
                Control ctr = LoadControl(strPath);
                plhControl.Controls.Add(ctr);
            }
        }
    }
}