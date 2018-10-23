<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Edit.ascx.cs" Inherits="BanhBao.UserControl.KhachHang.Edit" %>
<div style="width:100%;padding-top:5px;padding-bottom:5px;background:#52A9D4;font-size:12px;color:#FFFFFF;text-transform:uppercase;font-weight:bold;text-align:center;">Thông tin khách hàng</div>

<table cellpadding="2" cellspacing="2" border="0" style="border:0">
    <tr>
        <td>
           Xưng hô
        </td>
        <td>
            <asp:DropDownList runat="server" ID="lstXungHo" Width="300" >
                <asp:ListItem Value="Bác" Text="Bác"></asp:ListItem>
                <asp:ListItem Value="Cô" Text="Cô"></asp:ListItem>
                <asp:ListItem Value="Chú" Text="Chú"></asp:ListItem>
                <asp:ListItem Value="Anh" Text="Anh"></asp:ListItem>
                <asp:ListItem Value="Chị" Text="Chị"></asp:ListItem>
                <asp:ListItem Value="Bạn" Text="Bạn"></asp:ListItem>
                <asp:ListItem Value="Em" Text="Em"></asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    
    
    <tr>
        <td style="width:100px">
            Họ tên:
        </td>
        <td>
            <asp:TextBox runat="server" ID="txtHoTen" Width="300"></asp:TextBox>
        </td>
    </tr>
     <tr>
        <td style="width:100px">
            Địa chỉ:
        </td>
        <td>
            <asp:TextBox runat="server" ID="txtDiaChi" Width="300"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="width:100px">
            Số điện thoại:
        </td>
        <td>
            <asp:TextBox runat="server" ID="txtSDT" Width="300"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="width:100px">
            
        </td>
        <td>
            <asp:Button runat="server" Text="Lưu lại" id="btnSave" 
                onclick="btnSave_Click"  Width="100" />
        </td>
    </tr>
</table>

<script language="javascript">
    function Close() {
        parent.CloseLightbox();
    }
</script>
<!--<a href="javascript:parent.CloseLightbox();">Close iframe parent</a>-->