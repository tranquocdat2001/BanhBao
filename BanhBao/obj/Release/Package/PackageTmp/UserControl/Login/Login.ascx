<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Login.ascx.cs" Inherits="BookingAdv.UserControl.Login.Login" %>
<div style="width:250px;float:right;border:1px solid #E0DCDC">
    <div style="width:100%;padding-top:5px;padding-bottom:5px;background:#52A9D4;font-size:12px;color:#FFFFFF;text-transform:uppercase;font-weight:bold;text-align:center">Đăng nhập hệ thống</div>
    <div style="float:left;width:200px;font-size:12px;padding:10px 0px 10px 10px">Tài khoản</div>
    <div style="float:left;width:200px;padding:0px 10px 0px 10px"><asp:TextBox runat="server" ID="txtUserName" Width="200"></asp:TextBox></div>
    <div style="float:left;width:200px;font-size:12px;padding:10px 10px 10px 10px">Mật khẩu</div>
    <div style="float:left;width:200px;padding:0px 10px 0px 10px"><asp:TextBox runat="server" ID="txtPassword" Width="200" TextMode="Password"></asp:TextBox></div>
    <div style="float:left;width:200px;padding:10px 10px 10px 10px">
        <asp:Button runat="server" ID="btnLogin" Text="Đăng nhập" CssClass="button" OnClick="btnLogin_Click" />
    </div>
    <div style="float:left;width:200px;padding:10px 10px 10px 10px;color:red">
        <asp:Literal ID="ltrMessage" runat="server"></asp:Literal> 
    </div>
</div>