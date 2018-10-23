<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrintHoaDon.aspx.cs" Inherits="BanhBao.PrintHoaDon" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        table, td, th {
            border: 1px solid black;
        }
        table {
            border-collapse: collapse;
            width: 100%;
        }

        th {
            height: 20px;
        }
       
        </style>
</head>
<body style="margin:0;padding:0;font-family:Arial">
    <form id="form1" runat="server">
        <div style="float:left;width:400px">
            <div style="width:100%;float:left;font-size:24px;text-align:center">
                <b>Veganmart.vn</b>
            </div>
            <div style="width:100%;float:left;text-align:center;margin-bottom:10px">
                Đồ sạch - Từ tâm mong mọi người khỏe mạnh
            </div>
            <div style="width:100%;float:left;">
                Khách hàng: <asp:Literal runat="server" ID="ltrKhachHang"></asp:Literal>
            </div>
             <div style="width:100%;float:left;">
                Số điện thoại: <asp:Literal runat="server" ID="ltrSDT"></asp:Literal>
            </div>
            <div style="width:100%;float:left;margin-bottom:20px">
                Địa chỉ: <asp:Literal runat="server" ID="ltrDiaChi"></asp:Literal>
            </div>
            <table cellpadding="2" cellspacing="2" border="0" style="width:100%">
                  <tr>
                      <td style="width:20px;text-align:center;padding: 10px 0">TT</td>
                      <td style="text-align:center">TÊN HÀNG</td>
                      <td style="width:30px;text-align:center">SL</td>
                      <td style="width:50px;text-align:center">ĐƠN GIÁ</td>
                      <td style="width:70px;text-align:center">THÀNH TIỀN</td>
                  </tr>
                  <asp:Repeater runat="server" ID="rptListDonHangDetail" >
                      <ItemTemplate>
                          <tr>
                              <td style="text-align:center;padding: 10px 0"><%# Container.ItemIndex + 1 %></td>
                              <td><%# new BO.MonHangHelper().GetMonHangInfo(Convert.ToInt32(Eval("MonHangID"))).Name  %></td>
                              <td style="text-align:center"><%# Eval("SoLuong") %></td>
                              <td style="text-align:right">

                                   <%# Convert.ToInt32(Eval("IsFree")) == 0 ? new BO.MonHangHelper().GetMonHangInfo(Convert.ToInt32(Eval("MonHangID"))).Price.ToString("C0").Replace("$","").Replace("₫", "").Trim() : "-"  %>

                              </td>
                              <td style="text-align:right">
                                  <%# Eval("IsFree").ToString() == "0" ? 
                                  (new BO.MonHangHelper().GetMonHangInfo(Convert.ToInt32(Eval("MonHangID"))).Price * Convert.ToInt32(Eval("SoLuong"))).ToString("C0").Replace("$","").Replace("₫", "").Trim()   : "-" %>

                              </td>
                          </tr>
                      </ItemTemplate>
                  </asp:Repeater>

                  <tr>
                        <td style="text-align:center;padding: 10px 0">
                            <asp:Literal runat="server" ID="ltrSTTPhiShip"></asp:Literal>
                        </td>
                        <td colspan="3">Phí ship</td>
                        <td style="text-align:right">
                            <asp:Literal runat="server" ID="ltrShipFee"></asp:Literal>
                        </td>
                  </tr>
                <tr runat="server" id="trDisCount">
                        <td style="text-align:center;padding: 10px 0">
                            <asp:Literal runat="server" ID="ltrSTTDisCount"></asp:Literal>
                        </td>
                        <td colspan="3">Giảm giá</td>
                        <td style="text-align:right">
                            <asp:Literal runat="server" ID="ltrDisCount"></asp:Literal>
                        </td>
                  </tr>
                  <tr>
                      <td colspan="4">TỔNG CỘNG</td>
                      <td style="text-align:right"><asp:Literal runat="server" ID="ltrTotalAmount"></asp:Literal> </td>
                  </tr>
            </table>

           <%-- <div style="width:100%;float:left;padding-top:10px">
                <b><u>Cách sử dung:</u></b> Hấp hoặc quay lò vi sóng 30 giây sau khi dã đông
            </div>
            <div style="width:100%;float:left;">
                <b><u>Bảo quản:</u></b> Ngăn mát - 5 ngày, ngăn đông: 25 ngày kẻ từ ngày giao
            </div>
            <div style="width:100%;float:left;padding-bottom:10px">
                <b><u>Lưu ý:</u></b> Dã đông trước khi hấp hoặc quay lò vi sóng
            </div>--%>
            <div style="width:100%;float:left;font-weight:bold;padding-top:10px">
                Xin hãy góp ý để Veganmart.vn phục vụ được tốt hơn!
            </div>
            <div style="width:100%;float:left;font-weight:bold">
                Hotline: 098 646 3883
            </div>
            <div style="width:100%;float:left;font-weight:bold;padding-bottom:50px">
                Chân thành cảm ơn!
            </div>
            
        </div>

    </form>
</body>
</html>
