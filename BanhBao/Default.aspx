<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CMS.Default" %>


<%@ Register Src="UserControl/Header/Header.ascx" TagName="Header" TagPrefix="uc1" %>
<%@ Register Src="UserControl/Login/Login.ascx" TagName="Login" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>CMS</title>
    <link href="/Styles/style.css" type="text/css" rel="Stylesheet" />
    
    <script src="/Scripts/jquery-1.8.2.js" type="text/javascript"></script>
    <script src="/Scripts/libary.js" type="text/javascript"></script>
    <script type="text/javascript" src="/Scripts/fancybox/jquery.fancybox.js"></script>
	<link rel="stylesheet" type="text/css" href="/Scripts/fancybox/jquery.fancybox.css" media="screen" />

    <script type="text/javascript" src="/Scripts/jquery-ui.min.js"></script>
	<link rel="stylesheet" type="text/css" href="/Scripts/jquery-ui.min.css" media="screen" />

</head>
<body style="margin: 0">
    <form id="form1" runat="server">
    <div class="content">
        <uc1:Header ID="Header1" runat="server" />
        <div style="width:100%;float:left;border-bottom:3px solid #52A9D4"></div>
        <div style="float:left;width:100%;background:#e6e6e6;">
            <div class="main">
                <asp:PlaceHolder ID="plhControl" runat="server"></asp:PlaceHolder>
            </div>
        </div>
        <div style="float:left;width:100%;background:#FFFFFF none repeat scroll 0 0;border-top:3px solid #52A9D4;text-align:center;padding-top:10px;padding-bottom:10px">
            CMS
        </div>
        
    </div>
    </form>
</body>
</html>
