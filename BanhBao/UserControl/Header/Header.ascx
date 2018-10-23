<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="BookingAdv.UserControl.Header.Header" %>
<div class="header">
    <div style="float:left;text-align:left;color:#ec8741;font-weight:bold">
        <asp:Literal runat="server" ID="ltrWelcome"></asp:Literal>
    </div>
    <div style="float:right;text-align:right;" runat="server" id="div_menu">
        <ul>
            <li><a href="/Default.aspx?tab=listkhachhang&TypeList=0">Khách hàng</a> |</li>
            <li><a href="/Default.aspx?tab=listalldonhang">Đơn hàng</a> |</li>
            <%--<li><a href="/Default.aspx?tab=listaccount">Quản lý tài khoản</a> |</li>--%>
            <li><a href="/Default.aspx?tab=changepassword">Đổi mật khẩu</a> |</li>
            <li><asp:LinkButton ID="linkLogOut" runat="server" Text="Đăng xuất" OnClick="linkLogOut_Click"></asp:LinkButton></li>
        </ul>
    </div>
</div>
