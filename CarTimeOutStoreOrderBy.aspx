<%@ Page Title="시간대 차수별 출고 현황" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CarTimeOutStoreOrderBy.aspx.cs" Inherits="SmartLogisticsDeliveryProxySystem_Search.CarTimeOutStoreOrderBy" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="container">
    <div class="row row-cols-auto align-items-center justify-content-center">
        <div class="col">
            <asp:Label ID="Label4" runat="server" Text="시간대별 차수별 출고 현황" Font-Bold="True" Font-Size="2em" ForeColor="#3366FF"></asp:Label>
        </div>
    </div>
    <div class="row row-cols-auto align-items-center justify-content-center">
        <div class="col">
            <asp:Label ID="lblDate" runat="server" Text="출고일자" Font-Bold="True" Font-Size="1em"></asp:Label>
        </div>
        <div class="col">
            <asp:Label ID="lblOutDate" runat="server" Font-Bold="True" Font-Size="1em" ForeColor="#3366FF"></asp:Label>
        </div>
        <div class="col">
            <asp:Label ID="Label1" runat="server" Text="차량번호" Font-Bold="True" Font-Size="1em"></asp:Label>
        </div>
        <div class="col">
            <asp:Label ID="lblCarNumber" runat="server" Font-Bold="True" Font-Size="1em" ForeColor="#3366FF"></asp:Label>
        </div>
        <div class="col">
            <asp:Label ID="Label3" runat="server" Text="차수" Font-Bold="True" Font-Size="1em"></asp:Label>
        </div>
        <div class="col">
            <asp:Label ID="lblCarChaSu" runat="server" Font-Bold="True" Font-Size="1em" ForeColor="#3366FF"></asp:Label>
        </div>  
    </div>
</div>
<hr /><div class="container justify-content-center">
    <asp:GridView ID="GridView1" CssClass="table table-group-divider" runat="server" AutoGenerateColumns="false" Font-Size ="0.84em"
        DataKeyNames="출고일자, 일자, 매장명, 소계, 시, 분, 초, 차량번호, 차수, 수량, 누계" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle"
        HorizontalAlign="Center" OnRowDataBound="GridView1_RowDataBound" ShowFooter="true" Width="100%">
        <Columns>
            <asp:BoundField DataField="출고일자" HeaderText="출고일" SortExpression="출고일자" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" Visible="false">
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="일자" HeaderText="일자" SortExpression="일자" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="매장명" HeaderText="매장명" SortExpression="매장명" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="소계" HeaderText="소계" SortExpression="소계" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" Visible="false">
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="시" HeaderText="시" SortExpression="시" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="분" HeaderText="분" SortExpression="분" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="초" HeaderText="초" SortExpression="초" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="차량번호" HeaderText="차량번호" SortExpression="차량번호" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle"  Visible="false">
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="차수" HeaderText="차수" SortExpression="차수" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle"  Visible="false">
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="수량" HeaderText="수량" SortExpression="수량" DataFormatString="{0:#,###}" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
            </asp:BoundField>            
            <asp:BoundField DataField="누계" HeaderText="누계" SortExpression="누계" DataFormatString="{0:#,###}" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" Visible="false">
            </asp:BoundField>
        </Columns>
        <FooterStyle BorderStyle="Dashed" HorizontalAlign="Center" VerticalAlign="Middle" />
        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
    </asp:GridView>
</div>
</asp:Content>
