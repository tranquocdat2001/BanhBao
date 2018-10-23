<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Edit.ascx.cs" Inherits="BanhBao.UserControl.DonHang.Edit" %>
<div style="width:100%;padding-top:5px;padding-bottom:5px;background:#52A9D4;font-size:12px;color:#FFFFFF;text-transform:uppercase;font-weight:bold;text-align:center;">Thông tin đơn hàng</div>

<table cellpadding="2" cellspacing="2" border="0" style="border:0">
    <tr>
        <td>
           Khách hàng:
        </td>
        <td>
           <asp:Literal runat="server" ID="ltrKhachHangInfo"></asp:Literal>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <a href="javascript:addRow()"><img src="/Images/new.gif" /></a>
            <table cellpadding="2" cellspacing="2" border="0" style="border:0" id="tblDonHangDetail">
                <tr>
                    <td>
                        Món hàng : <select name="cboMonHang" id="cboMonHang">
                            <option value="1" selected>Bánh bao mặn nhân đậu gà, đậu hà lan (non GMO) (KH: Lá mùi)</option>
                            <option value="2">Bánh bao nhân mặn truyền thống (vỏ trắng)</option>
                            <option value="3">Bánh ngọt nhân bí đỏ, yến mạch (KH: mè đen)</option>
                            <option value="4">Pate chay</option>
                        </select>

                    </td>
                    <td>
                        Số lượng: <input type="text"  name="txtSoLuong" id="txtSoLuong" style="width:50px" />
                    </td>
                    <td>
                        Miễn phí <select name="cboIsFree"  id="cboIsFree">
                                    <option value="0" selected>Không</option>
                                    <option value="1">Có</option>
                                </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        Món hàng : <select name="cboMonHang" id="cboMonHang">
                            <option value="1">Bánh bao mặn nhân đậu gà, đậu hà lan (non GMO) (KH: Lá mùi)</option>
                            <option value="2" selected>Bánh bao nhân mặn truyền thống (vỏ trắng)</option>
                            <option value="3">Bánh ngọt nhân bí đỏ, yến mạch (KH: mè đen)</option>
                            <option value="4">Pate chay</option>
                        </select>

                    </td>
                    <td>
                        Số lượng: <input type="text"  name="txtSoLuong" id="txtSoLuong"  style="width:50px" />
                    </td>
                    <td>
                        Miễn phí <select name="cboIsFree" id="cboIsFree">
                                    <option value="0" selected>Không</option>
                                    <option value="1">Có</option>
                                </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        Món hàng : <select name="cboMonHang" id="cboMonHang">
                            <option value="1">Bánh bao mặn nhân đậu gà, đậu hà lan (non GMO) (KH: Lá mùi)</option>
                            <option value="2">Bánh bao nhân mặn truyền thống (vỏ trắng)</option>
                            <option value="3" selected>Bánh ngọt nhân bí đỏ, yến mạch (KH: mè đen)</option>
                            <option value="4">Pate chay</option>
                        </select>

                    </td>
                    <td>
                        Số lượng: <input type="text" name="txtSoLuong" id="txtSoLuong"  style="width:50px" />
                    </td>
                    <td>
                        Miễn phí <select name="cboIsFree" id="cboIsFree">
                                    <option value="0" selected="true">Không</option>
                                    <option value="1">Có</option>
                                </select>
                    </td>
                </tr>
            </table>
            
        </td>
        
    </tr>
     <tr>
        <td style="width:100px">
            Tiền ship:
        </td>
        <td>
            <asp:TextBox runat="server" ID="txtShipFee" Width="100"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="width:100px">
            Giảm giá
        </td>
        <td>
            <asp:TextBox runat="server" ID="txtDisCount" Width="100"></asp:TextBox>
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
<asp:HiddenField ID="hdJson" runat="server" />
<script language="javascript">
    var id = <%=id%>
    function Close() {
        parent.CloseLightbox();
    }

    
    function addRow() {
        $("#tblDonHangDetail").append(strFormatRow);
    }

    function getFirstRowHtml() {
        //return $("#tblDonHangDetail").children().html();
        return "<tr>" + $("#tblDonHangDetail").find('tr:first').html() + "</tr>";
    }

    var strFormatRow = getFirstRowHtml();

    function loadDonHangInfo()
    {
        if (id > 0) {

            // Bind HTML
            var objDonHangDetailInfo = JSON.parse($("#<%=hdJson.ClientID%>").val());
            var length = objDonHangDetailInfo.length;
            for (var i = 0; i < length; i++)
            {
                addRow();

                var item = $("#tblDonHangDetail").children().children().last();
                //var item = $("#tblDonHangDetail tbody:last-child");
                item.find("#cboMonHang").val(objDonHangDetailInfo[i].MonHangID);
                item.find("#txtSoLuong").val(objDonHangDetailInfo[i].SoLuong);
                item.find("#cboIsFree").val(objDonHangDetailInfo[i].IsFree);
            }

            
            $("#tblDonHangDetail").find('tr:first').remove();
            $("#tblDonHangDetail").find('tr:first').remove();
            $("#tblDonHangDetail").find('tr:first').remove();

        }
    }

    loadDonHangInfo();
    
</script>
<!--<a href="javascript:parent.CloseLightbox();">Close iframe parent</a>-->