
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="KhachHangList.ascx.cs" Inherits="BanhBao.UserControl.KhachHang.KhachHangList" %>

<asp:ScriptManager ID="ScriptManager1" runat="server">
		</asp:ScriptManager>
<asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="UpdatePanel1" runat="server">
	<ProgressTemplate>
		<div style="text-align: center;">
			Xin bạn chờ trong giây lát...</div>
	</ProgressTemplate>
</asp:UpdateProgress>

<div class="titlefunction">
    <a href="/Default.aspx?tab=listkhachhang">Quản lý khách hàng</a> (Tổng KH: <asp:Literal runat="server" ID="ltrTotalKhachHang"></asp:Literal>)
</div>

<div style="float:left;width:400px;text-align:left;margin-top:10px">
    <asp:TextBox runat="server" ID="txtSearch" CssClass="txtSearch" Width="200"></asp:TextBox>
    <asp:Button runat="server" ID="btnSearch" CssClass="button3" Text="Tìm kiếm" 
        onclick="btnSearch_Click" />
</div>

<div style="float:right;width:100px;margin-top:10px"><input type="button" id="Button1" value="Thêm mới" onclick="opennewform()" class="button2" /></div>

<asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
<ContentTemplate>
<div style="width:100%;float:left;margin-top:10px">
     <asp:GridView Width="100%" ID="grdList" runat="server" CssClass="grd" EmptyDataText="<span style='color:Red'><b>Không có !</b></span>"
			    AutoGenerateColumns="False" AllowPaging="True" AllowSorting="true" DataSourceID="objListSource"
			    PageSize="40"  HeaderStyle-CssClass="grdHeader"  BorderColor="#DFDFDF"
			    AlternatingRowStyle-CssClass="grdAlterItem" RowStyle-CssClass="grdItem" PagerStyle-CssClass="paging" OnSelectedIndexChanged="grdList_SelectedIndexChanged" OnSelectedIndexChanging="grdList_SelectedIndexChanging" OnRowCommand="grdList_RowCommand">
	    <Columns>
            <asp:TemplateField  HeaderText="STT" ItemStyle-CssClass="text" ItemStyle-HorizontalAlign="Center" >
                <ItemTemplate>
                     <%#Container.DataItemIndex+1 %>
                </ItemTemplate>
                 <HeaderStyle Width="20px"  />
		        <ItemStyle Width="20px" />
            </asp:TemplateField>
	        <asp:TemplateField>
		        <HeaderTemplate>
			        <input type="checkbox" id="chkAll" onclick="CheckAll(this)" />
		        </HeaderTemplate>
		        <ItemTemplate>
			        <input type="checkbox" value="<%#Eval("Id")%>" name="chkSelect" id="chkSelect_<%#Eval("Id")%>" />
		        </ItemTemplate>
		        <HeaderStyle Width="20px" />
		        <ItemStyle Width="20px" />
	        </asp:TemplateField>
             <asp:TemplateField HeaderText="Họ tên" ItemStyle-CssClass="text" ItemStyle-HorizontalAlign="Left" >
	            <ItemTemplate>
	              <a href="javascript:opennewform(<%#Eval("Id")%>)"><%#Eval("XungHo")%> <%#Eval("HoTen")%></a>
	            </ItemTemplate>
	        </asp:TemplateField>
            <asp:TemplateField HeaderText="Địa chỉ" ItemStyle-CssClass="text" ItemStyle-HorizontalAlign="Left" >
	            <ItemTemplate>
	               <%#Eval("DiaChi")%>
	            </ItemTemplate>
	        </asp:TemplateField>
            <asp:TemplateField HeaderText="SDT" ItemStyle-CssClass="text" ItemStyle-HorizontalAlign="Left" >
	            <ItemTemplate>
	               <%#Eval("SDT")%>
	            </ItemTemplate>
                <ItemStyle Width="80px" HorizontalAlign="Center" />
	        </asp:TemplateField>
            <asp:TemplateField HeaderText="" ItemStyle-CssClass="text" >
	            <ItemTemplate>
	                <a href ="/Default.aspx?tab=listdonhang&khachHangId=<%#Eval("ID")%>">Đơn hàng</a>
	            </ItemTemplate>
	            <ItemStyle Width="100px" HorizontalAlign="Center" />
	        </asp:TemplateField> 
	         <asp:TemplateField HeaderText="" ItemStyle-CssClass="text" >
	            <ItemTemplate>
	                <asp:ImageButton runat="server" ID="imgDelete" CommandArgument='<%#Eval("ID")%>' CommandName="deleteAccount" ImageUrl="/Images/delete.gif" OnClientClick="return confirm('Bạn có muốn xóa khách hàng không?');" />
                    
	            </ItemTemplate>
	            <ItemStyle Width="50px" HorizontalAlign="Center" />
	        </asp:TemplateField> 
	        </Columns>
    </asp:GridView>
</div>
<asp:Button ID="btnSubmit" runat="server" onclick="btnSubmit_Click" style="display:none"   />
</ContentTemplate>
</asp:UpdatePanel>


<script type="text/javascript">
    function opennewform(id) {
        $.fancybox.open({
            href: '/Ajax/Ajax.aspx?tab=editkhachhang&id=' + id,
            type: 'iframe',
            fitToView: false,
            autoSize: false,
            autoDimensions: false,
            width: 520,
            height: 700,
            padding: 5
        });
    }

    function RefreshPage() {
        document.getElementById("<%=btnSubmit.ClientID %>").click();
    }

    function CloseLightbox() {
        jQuery.fancybox.close();
        RefreshPage();
    }
</script>

<asp:ObjectDataSource ID="objListSource" runat="server" SelectMethod="GetListKhachHang"
	SelectCountMethod="GetListKhachHang_Count"
	TypeName="BO.KhachHangHelper" 
	EnablePaging="true" MaximumRowsParameterName="PageSize" StartRowIndexParameterName="StartRow">
	<SelectParameters>
		<asp:Parameter Name="strWhere" DefaultValue="" Type="String" />
	</SelectParameters>
</asp:ObjectDataSource>