<%@ Page Title="차량 차수별 상세 내역" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CarReleaseSubSub.aspx.cs" Inherits="SmartLogisticsDeliveryProxySystem_Search.CarReleaseSubSub" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row row-cols-auto align-items-center justify-content-center">
            <div class="col">
                <asp:Label ID="Label4" runat="server" Text="차량번호 차수별 상세 내역" Font-Bold="True" Font-Size="2em" ForeColor="#3366FF"></asp:Label>
            </div>
        </div>
        <div class="row row-cols-auto align-items-center justify-content-center">
            <div class="col">
                <asp:Label ID="Label1" runat="server" Text="출고일자" Font-Bold="True" Font-Size="1em"></asp:Label>
            </div>            
            <div class="col">
                <asp:Label ID="lblOutDate" runat="server" Text="" Font-Bold="True" Font-Size="1em" ForeColor="#3366FF"></asp:Label>
            </div>           
            <div class="col">
                <asp:Label ID="Label2" runat="server" Text="차량번호" Font-Bold="True" Font-Size="1em"></asp:Label>
            </div>            
            <div class="col">
                <asp:Label ID="lblCarNo" runat="server" Text="" Font-Bold="True" Font-Size="1em" ForeColor="#3366FF"></asp:Label>
            </div>
        </div>
    </div>
    <hr />
    <div class="container">
        <asp:GridView ID="GridView1" CssClass="table table-group-divider" runat="server" AutoGenerateColumns="False"
            DataKeyNames="입고일자, 상세, 출고시간, 매장명, 물류명, 합계"
            HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle"  Font-Size ="0.84em"
            OnRowCreated="GridView1_RowCreated" OnRowDataBound="GridView1_RowDataBound" ShowFooter="True" HorizontalAlign="Center" DataMember="DefaultView">
            <Columns>
                <asp:BoundField DataField="입고일자" HeaderText="입고일자" SortExpression="입고일자" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" Visible="false">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="상세" HeaderText="상세" SortExpression="상세" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="출고시간" HeaderText="출고시간" SortExpression="출고시간"  DataFormatString="{0:T}" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="매장명" HeaderText="매장명" SortExpression="매장명" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="물류명" HeaderText="물류명" SortExpression="물류명" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="합계" HeaderText="합계" SortExpression="합계" DataFormatString="{0:#,###}" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
            </Columns>
            <FooterStyle BorderStyle="Dashed" HorizontalAlign="Center" VerticalAlign="Middle" />
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        </asp:GridView>
    </div>
</asp:Content>
