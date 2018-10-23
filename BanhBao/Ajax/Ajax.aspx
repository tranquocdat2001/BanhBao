<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ajax.aspx.cs" Inherits="CMS.Ajax.Ajax" ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <link href="/Styles/style.css" type="text/css" rel="Stylesheet" />
    <script src="/Scripts/jquery-1.8.2.js" type="text/javascript"></script>
     <script type="text/javascript" src="/Scripts/jquery-ui.min.js"></script>
	<link rel="stylesheet" type="text/css" href="/Scripts/jquery-ui.min.css" media="screen" />
    <script type="text/javascript" src="/Scripts/jquery-ui-timepicker-addon.js"></script>
	<link rel="stylesheet" type="text/css" href="/Scripts/jquery-ui-timepicker-addon.css" media="screen" />
    <script src="/Scripts/libary.js" type="text/javascript"></script>
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="float:left;width:100%;background:rgba(230, 230, 230, 0.27);">
        <asp:PlaceHolder ID="plhControl" runat="server"></asp:PlaceHolder>
    </div>
    </form>
</body>
</html>
