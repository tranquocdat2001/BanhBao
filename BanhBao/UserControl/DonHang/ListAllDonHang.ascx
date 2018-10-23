<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListAllDonHang.ascx.cs" Inherits="BanhBao.UserControl.DonHang.ListAllDonHang" %>
<asp:ScriptManager ID="ScriptManager1" runat="server">
		</asp:ScriptManager>
<asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="UpdatePanel1" runat="server">
	<ProgressTemplate>
		<div style="text-align: center;">
			Xin bạn chờ trong giây lát...</div>
	</ProgressTemplate>
</asp:UpdateProgress>

<div class="titlefunction">
    <a href="/Default.aspx?tab=listkhachhang">Danh sách đơn hàng</a>
</div>

<div style="float:left;width:100%;text-align:left;margin-top:10px">
    Từ khóa tìm kiếm: <asp:TextBox runat="server" ID="txtSearch" CssClass="txtSearch" Width="200"></asp:TextBox>
    <asp:Button runat="server" ID="btnSearch" CssClass="button3" Text="Tìm kiếm" 
        onclick="btnSearch_Click" />
</div>
<div style="float:left;width:100%;text-align:left;margin-top:10px">
    Ngày bắt đầu: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox runat="server" ID="txtFromDate" CssClass="txtSearch" Width="200"></asp:TextBox>
     Ngày kết thúc: <asp:TextBox runat="server" ID="txtToDate" CssClass="txtSearch" Width="200"></asp:TextBox>
</div>

<asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
<ContentTemplate>
<div style="width:100%;float:left;margin-top:10px">
     <asp:GridView Width="100%" ID="grdList" runat="server" CssClass="grd" EmptyDataText="<span style='color:Red'><b>Không có !</b></span>"
			    AutoGenerateColumns="False" AllowPaging="True" AllowSorting="true" DataSourceID="objListSource"
			    PageSize="40"  HeaderStyle-CssClass="grdHeader"  BorderColor="#DFDFDF" ShowFooter ="True"
			    AlternatingRowStyle-CssClass="grdAlterItem" RowStyle-CssClass="grdItem" PagerStyle-CssClass="paging" OnSelectedIndexChanged="grdList_SelectedIndexChanged" OnSelectedIndexChanging="grdList_SelectedIndexChanging" OnRowCommand="grdList_RowCommand" OnRowDataBound="grdList_RowDataBound">
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
            <asp:TemplateField HeaderText="Ngày tạo" ItemStyle-CssClass="text" ItemStyle-HorizontalAlign="Left"  >
	            <ItemTemplate>
	              <a href="javascript:opennewform(<%#Eval("Id")%>, <%#Eval("KhachHangID")%>)"><%#Eval("XungHo")%> <%#Eval("HoTen")%> <br/> <%#Eval("DiaChi")%></a>
	            </ItemTemplate>
                
	        </asp:TemplateField>
             <asp:TemplateField HeaderText="Ngày tạo" ItemStyle-CssClass="text" ItemStyle-HorizontalAlign="Left" >
	            <ItemTemplate>
	              <a href="javascript:opennewform(<%#Eval("Id")%>, <%#Eval("KhachHangID")%>)"><%#Convert.ToDateTime(Eval("CreateDate").ToString()).ToString("dd/MM/yyyy HH:mm") %></a>
	            </ItemTemplate>
                 <ItemStyle Width="120px"  HorizontalAlign="Center"  />
	        </asp:TemplateField>
            <asp:TemplateField HeaderText="Tiền ship" ItemStyle-CssClass="text" ItemStyle-HorizontalAlign="Left" >
	            <ItemTemplate>
	               <asp:Literal ID="ltrShipFee" runat="server" Text='<%#Eval("ShipFee")%>'></asp:Literal>                    
	            </ItemTemplate>
                <FooterTemplate>
                    <b><asp:Literal ID="ltrSumShipFee" runat="server"></asp:Literal></b>
                </FooterTemplate>
                <ItemStyle HorizontalAlign="Center" Width="80px" />
                 <FooterStyle HorizontalAlign="Center" />
	        </asp:TemplateField>
            <asp:TemplateField HeaderText="Tổng tiền" ItemStyle-CssClass="text" ItemStyle-HorizontalAlign="Left" >
	            <ItemTemplate>
	              <asp:Literal ID="ltrTotalAmount" runat="server" Text='<%#Eval("TotalAmount")%>'></asp:Literal> 
	            </ItemTemplate>
                <FooterTemplate>
                    <b><asp:Literal ID="ltrSumAmount" runat="server"></asp:Literal></b>
                </FooterTemplate>

                <ItemStyle HorizontalAlign="Center" Width="80px" />
                <FooterStyle HorizontalAlign="Center" />
	        </asp:TemplateField>
	         <asp:TemplateField HeaderText="" ItemStyle-CssClass="text" >
	            <ItemTemplate>
	                <asp:ImageButton runat="server" ID="imgDelete" CommandArgument='<%#Eval("ID")%>' CommandName="deleteAccount" ImageUrl="/Images/delete.gif" OnClientClick="return confirm('Bạn có muốn xóa khách hàng không?');" />
                    <img src="/Images/print.gif" style="cursor:pointer;padding-left:10px" onclick="print(<%#Eval("ID")%>, <%#Eval("KhachHangID")%>)"  />
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
    function opennewform(id, khachHangId) {
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

    function print(donHangId, khachHangId) {
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

<script>
    $(function () {
        //$("#datepicker").datepicker("option", "dateFormat", "dd/mm/yy");
        $("#<%=txtFromDate.ClientID%>").datepicker({ dateFormat: 'dd/mm/yy' });
        $("#<%=txtToDate.ClientID%>").datepicker({ dateFormat: 'dd/mm/yy' });
        
        
    });
  </script>



<asp:ObjectDataSource ID="objListSource" runat="server" SelectMethod="GetListDonHang"
	SelectCountMethod="GetListDonHang_Count"
	TypeName="BO.DonHangHelper" 
	EnablePaging="true" MaximumRowsParameterName="PageSize" StartRowIndexParameterName="StartRow">
	<SelectParameters>
		<asp:Parameter Name="strWhere" DefaultValue="" Type="String" />
	</SelectParameters>
</asp:ObjectDataSource>