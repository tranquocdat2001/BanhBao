<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="List.ascx.cs" Inherits="BanhBao.UserControl.DonHang.List" %>

<asp:ScriptManager ID="ScriptManager1" runat="server">
		</asp:ScriptManager>
<asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="UpdatePanel1" runat="server">
	<ProgressTemplate>
		<div style="text-align: center;">
			Xin bạn chờ trong giây lát...</div>
	</ProgressTemplate>
</asp:UpdateProgress>

<div class="titlefunction">
    <a href="/Default.aspx?tab=listkhachhang">Đơn hàng của <asp:Literal runat="server" ID="ltrKhachHang"></asp:Literal> - <asp:Literal runat="server" ID="ltrSDT"></asp:Literal></a>
    <br />
    Địa chỉ :<asp:Literal runat="server" ID="ltrDiaChi"></asp:Literal>
</div>

<!--<div style="float:left;width:400px;text-align:left;margin-top:10px">
    <asp:TextBox runat="server" ID="txtSearch" CssClass="txtSearch" Width="200"></asp:TextBox>
    <asp:Button runat="server" ID="btnSearch" CssClass="button3" Text="Tìm kiếm" 
        onclick="btnSearch_Click" />
</div>!-->

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
             <asp:TemplateField HeaderText="Ngày tạo" ItemStyle-CssClass="text" ItemStyle-HorizontalAlign="Left" >
	            <ItemTemplate>
	              <a href="javascript:opennewform(<%#Eval("Id")%>)"><%#Convert.ToDateTime(Eval("CreateDate").ToString()).ToString("dd/MM/yyyy HH:mm") %></a>
	            </ItemTemplate>
	        </asp:TemplateField>
            <asp:TemplateField HeaderText="Tiền ship" ItemStyle-CssClass="text" ItemStyle-HorizontalAlign="Left" >
	            <ItemTemplate>
	               <%#Eval("ShipFee")%>
                    <ItemStyle HorizontalAlign="Center" />
	            </ItemTemplate>
	        </asp:TemplateField>
            <asp:TemplateField HeaderText="Tổng tiền" ItemStyle-CssClass="text" ItemStyle-HorizontalAlign="Left" >
	            <ItemTemplate>
	               <%#Eval("TotalAmount")%>
	            </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
	        </asp:TemplateField>
	         <asp:TemplateField HeaderText="" ItemStyle-CssClass="text" >
	            <ItemTemplate>
	                <asp:ImageButton runat="server" ID="imgDelete" CommandArgument='<%#Eval("ID")%>' CommandName="deleteAccount" ImageUrl="/Images/delete.gif" OnClientClick="return confirm('Bạn có muốn xóa khách hàng không?');" />
                    <img src="/Images/print.gif" style="cursor:pointer;padding-left:10px" onclick="print(<%#Eval("ID")%>)"  />
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
    var khachHangId = "<%=khachHangId%>";
    function opennewform(id) {
        $.fancybox.open({
            href: '/Ajax/Ajax.aspx?tab=editdonhang&id=' + id + "&khachHangId=" + khachHangId,
            type: 'iframe',
            fitToView: false,
            autoSize: false,
            autoDimensions: false,
            width: 700,
            height: 700,
            padding: 5
        });
    }

    function print(donHangId)
    {
        var myWindow = window.open("/PrintHoaDon.aspx?KhachHangId=" + khachHangId + "&DonHangId=" + donHangId, "", "width=400,height=auto");
    }

    function RefreshPage() {
        document.getElementById("<%=btnSubmit.ClientID %>").click();
    }

    function CloseLightbox() {
        jQuery.fancybox.close();
        RefreshPage();
    }
</script>

<asp:ObjectDataSource ID="objListSource" runat="server" SelectMethod="GetListDonHang"
	SelectCountMethod="GetListDonHang_Count"
	TypeName="BO.DonHangHelper" 
	EnablePaging="true" MaximumRowsParameterName="PageSize" StartRowIndexParameterName="StartRow">
	<SelectParameters>
		<asp:Parameter Name="strWhere" DefaultValue="" Type="String" />
	</SelectParameters>
</asp:ObjectDataSource>