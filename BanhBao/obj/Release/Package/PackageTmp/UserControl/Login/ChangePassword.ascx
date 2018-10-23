<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ChangePassword.ascx.cs" Inherits="BookingAdv.UserControl.Login.ChangePassword" %>
<div style="float:left;width:100%">
     <div style="float:left;width:100%;border-bottom:solid 1px #cccccc;vertical-align:middle">
        <div style="float:left;width:200px;font-size:15px;font-weight:bold;color:Green;padding-top:5px">Đổi mật khẩu</div> 
    </div>
    
    <div style="float:left;width:120px;margin-top:20px;margin-left:20px">Mật khẩu hiện tại</div>
    <div style="float:left;width:840px;margin-top:20px"><asp:TextBox runat="server" ID="txtCurrentPassword" Width="300" TextMode="Password"></asp:TextBox> (<font color="red">*</font>) </div>
    
    <div style="float:left;width:120px;margin-top:20px;margin-left:20px">Mật khẩu mới</div>
    <div style="float:left;width:840px;margin-top:20px"><asp:TextBox runat="server" ID="txtNewPassword" Width="300" TextMode="Password"></asp:TextBox> (<font color="red">*</font>) </div>
    
    <div style="float:left;width:120px;margin-top:20px;margin-left:20px">Gõ lại mật khẩu mới</div>
    <div style="float:left;width:840px;margin-top:20px"><asp:TextBox runat="server" ID="txtReNewPassword" Width="300" TextMode="Password"></asp:TextBox> (<font color="red">*</font>) </div>
    
    <div style="float:left;width:120px;margin-top:5px;margin-left:20px"></div>
    <div  style="float:left;width:840px;margin-top:5px">
        <asp:Button runat="server" ID="btnUpdate" Text="Cập nhật" CssClass="button"  OnClientClick="return CheckForm();" OnClick="btnUpdate_Click" />
        <input type="button" id="btnCancel" value="Cancel" class="button" onclick="history.go(-1);" />
    </div>
</div>
<script language="javascript" type="text/javascript">
    function CheckForm()
    {
        var isReturn = true;
        var txtCurrentPassword = document.getElementById("<%=txtCurrentPassword.ClientID%>");
        var txtNewPassword = document.getElementById("<%=txtNewPassword.ClientID%>");
        var txtReNewPassword = document.getElementById("<%=txtReNewPassword.ClientID%>");
        
        if(txtCurrentPassword.value == "" || txtNewPassword.value == "" || txtReNewPassword.value == "")
        {
            isReturn = false;
            alert("Bạn chưa nhập đủ thông tin!");
        }
        
        if(txtNewPassword.value != txtReNewPassword.value)
        {
            isReturn = false;
            alert("Bạn nhập mật khẩu mới chưa đúng!");
        }
        
        return isReturn;
    }
</script>