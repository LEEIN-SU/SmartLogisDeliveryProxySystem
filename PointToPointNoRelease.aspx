<%@ Page Title="RT 매장별 출고 현황" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PointToPointNoRelease.aspx.cs" Inherits="SmartLogisticsDeliveryProxySystem_Search.PointToPointNoReease" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row row-cols-auto align-items-center justify-content-center">
            <div class="col">
                <asp:Label ID="Label4" runat="server" Text="RT 매장별 출고 현황" Font-Bold="True" Font-Size="2em" ForeColor="#3366FF"></asp:Label>
            </div>
        </div>
        <div class="row row-cols-auto align-items-center justify-content-center">
            <div class="col">
                <asp:Label ID="lblDate" runat="server" Text="출고일자" Font-Bold="True" Font-Size="1em"></asp:Label>
            </div>             
            <div class="col">
                <asp:TextBox ID="txtOutDate" runat="server" Font-Size="1em"></asp:TextBox>
            </div>  
        </div>
        <div class="row row-cols-auto align-items-center justify-content-center">         
            <div class="col">
                <asp:Button CssClass="btn btn-outline-primary" ID="btnSearch" Text="조회" runat="server" OnClick="btnSearch_Click" Width="500px"/>
            </div>
        </div>
    </div>
    <hr />
    <div class="container">
        <asp:GridView ID="GridView1" CssClass="table table-group-divider" runat="server" AutoGenerateColumns="false"
            DataKeyNames="출고일, 입고일, 고객사, 브랜드명, 보내는매장, 받는매장, 수량"
            HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" 
            DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound" HorizontalAlign="Center" ShowFooter="true"
            DataMember="DefaultView">
            <Columns>
                <asp:BoundField DataField="출고일" HeaderText="출고일" SortExpression="출고일" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="입고일" HeaderText="입고일" SortExpression="입고일" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" Visible="false">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="고객사" HeaderText="고객사" SortExpression="고객사" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" Visible="false">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="브랜드명" HeaderText="브랜드명" SortExpression="브랜드명" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="보내는매장" HeaderText="보내는매장" SortExpression="보내는매장" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="받는매장" HeaderText="받는매장" SortExpression="받는매장" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="수량" HeaderText="수량" SortExpression="수량" DataFormatString="{0:#,###}" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
            </Columns>
            <FooterStyle BorderStyle="Dashed" HorizontalAlign="Center" VerticalAlign="Middle" />
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SDPSConnectionString %>" 
            SelectCommand="EXEC usp_웹_배송RT의뢰서마스터_매장별_Get @출고일자">
            <SelectParameters>
                <asp:Parameter Name="출고일자" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
