<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Edit.ascx.cs" Inherits="BanhBao.UserControl.DonHang.Edit" %>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">

<style>
  .custom-combobox {
    position: relative;
    display: inline-block;
  }
  .custom-combobox-toggle {
    position: absolute;
    top: 0;
    bottom: 0;
    margin-left: -1px;
    padding: 0;
  }
  .custom-combobox-input {
    margin: 0;
    padding: 5px 10px;
  }
  </style>
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="/Scripts/jquery-ui-combobox.js"></script>
  <script>

</script>



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
            <a href="javascript:addRow(true)"><img src="/Images/new.gif" /></a>
            <table cellpadding="2" cellspacing="2" border="0" style="border:0" id="tblDonHangDetail">
                <tr>
                    <td>
                        Món hàng : <select name="cboMonHang" id="cboMonHang">
                            <option value="1" selected>Bánh bao mặn nhân đậu gà, đậu hà lan (non GMO) (KH: Lá mùi)</option>
                            <option value="2">Bánh bao vị mặn nhân miến truyền thống nhé (vỏ trắng)</option>
                            <option value="3">Bánh ngọt nhân bí đỏ, yến mạch (KH: mè đen)</option>
                            <%--<option value="4">Pate chay</option>--%>
                            <option value="5">Pate chay cỡ đại</option>
                            <option value="6">Pate chay hộp tròn</option>
                            <option value="7">Pate hộp cỡ trung</option>
                            <option value="8">Bánh bao chay không nhân</option>
                            <option value="9">Bánh bao mini</option>
                            <option value="10">Bánh bao đậu đỏ mini</option>
                            <option value="11">Bánh chay không nhân</option>
                            <option value="12">Hộp nem rán sẵn</option>
                            <option value="13">Bánh ngọt nhân đậu đỏ (KH: Chấm cacao)</option>
                            <%--<option value="14">Hộp nem chưa rán</option>--%>
                            <option value="15">Thính nấm</option>
                            <%--<option value="16">Thùng sữa óc chó đậu đen hạnh nhân Hàn Quốc</option>--%>
                            <option value="17">Sữa óc chó Hàn Quốc</option>
                            <option value="18">Sữa Macca Hàn Quốc</option>
                            <option value="19">Chả tảo</option>
                            <option value="20">Thính nấm</option>
                            <option value="21">Mắm tép</option>
                            <option value="22">Giò nấm</option>
                            <option value="23">Giò lụa</option>
                            <option value="24">Chả</option>
                            <option value="25">Giò thực dưỡng</option>
                            <option value="26">Sả chay</option>
                            <option value="27">Sườn dừa</option>
                            <option value="28">Dồi chay</option>
                            <option value="29">Gói thính gạo</option>
                            <option value="30">Sữa mix</option>
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
                            <option value="1" selected>Bánh bao mặn nhân đậu gà, đậu hà lan (non GMO) (KH: Lá mùi)</option>
                            <option value="2">Bánh bao vị mặn nhân miến truyền thống nhé (vỏ trắng)</option>
                            <option value="3">Bánh ngọt nhân bí đỏ, yến mạch (KH: mè đen)</option>
                            <%--<option value="4">Pate chay</option>--%>
                            <option value="5">Pate chay cỡ đại</option>
                            <option value="6">Pate chay hộp tròn</option>
                            <option value="7">Pate hộp cỡ trung</option>
                            <option value="8">Bánh bao chay không nhân</option>
                            <option value="9">Bánh bao mini</option>
                            <option value="10">Bánh bao đậu đỏ mini</option>
                            <option value="11">Bánh chay không nhân</option>
                            <option value="12">Hộp nem rán sẵn</option>
                            <option value="13">Bánh ngọt nhân đậu đỏ (KH: Chấm cacao)</option>
                            <%--<option value="14">Hộp nem chưa rán</option>--%>
                            <option value="15">Thính nấm</option>
                            <%--<option value="16">Thùng sữa óc chó đậu đen hạnh nhân Hàn Quốc</option>--%>
                            <option value="17">Sữa óc chó Hàn Quốc</option>
                            <option value="18">Sữa Macca Hàn Quốc</option>
                            <option value="19">Chả tảo</option>
                            <option value="20">Thính nấm</option>
                            <option value="21">Mắm tép</option>
                            <option value="22">Giò nấm</option>
                            <option value="23">Giò lụa</option>
                            <option value="24">Chả</option>
                            <option value="25">Giò thực dưỡng</option>
                            <option value="26">Sả chay</option>
                            <option value="27">Sườn dừa</option>
                            <option value="28">Dồi chay</option>
                            <option value="29">Gói thính gạo</option>
                            <option value="30">Sữa mix</option>
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
                            <option value="1" selected>Bánh bao mặn nhân đậu gà, đậu hà lan (non GMO) (KH: Lá mùi)</option>
                            <option value="2">Bánh bao vị mặn nhân miến truyền thống nhé (vỏ trắng)</option>
                            <option value="3">Bánh ngọt nhân bí đỏ, yến mạch (KH: mè đen)</option>
                            <%--<option value="4">Pate chay</option>--%>
                            <option value="5">Pate chay cỡ đại</option>
                            <option value="6">Pate chay hộp tròn</option>
                            <option value="7">Pate hộp cỡ trung</option>
                            <option value="8">Bánh bao chay không nhân</option>
                            <option value="9">Bánh bao mini</option>
                            <option value="10">Bánh bao đậu đỏ mini</option>
                            <option value="11">Bánh chay không nhân</option>
                            <option value="12">Hộp nem rán sẵn</option>
                            <option value="13">Bánh ngọt nhân đậu đỏ (KH: Chấm cacao)</option>
                            <%--<option value="14">Hộp nem chưa rán</option>--%>
                            <option value="15">Thính nấm</option>
                            <%--<option value="16">Thùng sữa óc chó đậu đen hạnh nhân Hàn Quốc</option>--%>
                            <option value="17">Sữa óc chó Hàn Quốc</option>
                            <option value="18">Sữa Macca Hàn Quốc</option>
                            <option value="19">Chả tảo</option>
                            <option value="20">Thính nấm</option>
                            <option value="21">Mắm tép</option>
                            <option value="22">Giò nấm</option>
                            <option value="23">Giò lụa</option>
                            <option value="24">Chả</option>
                            <option value="25">Giò thực dưỡng</option>
                            <option value="26">Sả chay</option>
                            <option value="27">Sườn dừa</option>
                            <option value="28">Dồi chay</option>
                            <option value="29">Gói thính gạo</option>
                            <option value="30">Sữa mix</option>
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


    function addRow(isFormatSuggestion) {
        $("#tblDonHangDetail").append(strFormatRow);

        if (isFormatSuggestion == true)
            $("select[name='cboMonHang']").combobox();


    }

    function getFirstRowHtml() {
        //return $("#tblDonHangDetail").children().html();
        return "<tr>" + $("#tblDonHangDetail").find('tr:first').html() + "</tr>";
    }

    var strFormatRow = getFirstRowHtml();

    function loadDonHangInfo() {
        if (id > 0) {

            // Bind HTML
            var objDonHangDetailInfo = JSON.parse($("#<%=hdJson.ClientID%>").val());
            var length = objDonHangDetailInfo.length;
            for (var i = 0; i < length; i++) {
                addRow(false);

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



    $(document).ready(function () {
        loadDonHangInfo();

        $("select[name='cboMonHang']").combobox();
    });
</script>



<!--<a href="javascript:parent.CloseLightbox();">Close iframe parent</a>-->