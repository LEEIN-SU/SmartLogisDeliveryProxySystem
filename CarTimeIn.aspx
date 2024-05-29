<%@ Page Title="시간대별 집하 현황" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CarTimeIn.aspx.cs" Inherits="SmartLogisticsDeliveryProxySystem_Search.CarTimeIn" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="container">
        <div class="row row-cols-auto align-items-center justify-content-center">
            <div class="col">
                <asp:Label ID="Label4" runat="server" Text="시간대별 집하 현황" Font-Bold="True" Font-Size="2em" ForeColor="#3366FF"></asp:Label>
            </div>
        </div>
        <div class="row row-cols-auto align-items-center justify-content-center">
            <div class="col">
                <asp:Label ID="lblDate" runat="server" Text="입고일자" Font-Bold="True" Font-Size="1em"></asp:Label>
            </div>             
            <div class="col">
                <asp:TextBox ID="txtOutDate" runat="server" Font-Size="1em"></asp:TextBox>
            </div>           
            <div class="col">
                <asp:Button CssClass="btn btn-outline-primary" ID="btnSearch" Text="조회" runat="server" OnClick="btnSearch_Click" Width="100px" />
            </div>
        </div>
        <div class="row row-cols-auto align-items-center justify-content-center">            
            <div class="text-right col">
                <asp:Label ID="Label1" runat="server" Text="차량회차수" Font-Bold="True" Font-Size="0.9em"></asp:Label>
            </div>            
            <div class="text-left col">
                <asp:Label ID="lblCarRoate" runat="server" Text="" Font-Size="0.9em" ForeColor="#3366FF"></asp:Label>
            </div>           
            <div class="text-right col">
                <asp:Label ID="Label2" runat="server" Text="집하수량" Font-Size="0.9em"></asp:Label>
            </div>            
            <div class="text-left col">
                <asp:Label ID="lblOut" runat="server" Text="" Font-Size="0.9em" ForeColor="#3366FF"></asp:Label>
            </div>          
            <div class="col">
                <asp:Button CssClass="btn btn-outline-success" ID="btnExcelPort" Text="엑셀다운" runat="server" OnClick="btnExcelPort_Click"/>
            </div>
        </div>
    </div>
    <hr />
    <div class="container justify-content-center">
        <asp:GridView ID="GridView1" CssClass="table table-group-divider" runat="server" AutoGenerateColumns="false" Font-Size ="0.84em"
            DataKeyNames="입고일자, 일자, 브랜드명, 소계, 시, 분, 차량번호, 차수, 수량, 누계" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle"
            OnRowDataBound="GridView1_RowDataBound" HorizontalAlign="Center" OnRowCreated="GridView1_RowCreated" ShowFooter="true" Width="100%">
            <Columns>
                <asp:BoundField DataField="입고일자" HeaderText="입고일" SortExpression="입고일자" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" Visible="false">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="일자" HeaderText="일자" SortExpression="일자" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="소계" HeaderText="소계" SortExpression="소계" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" Visible="false">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="브랜드명" HeaderText="브랜드명" SortExpression="브랜드명" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="시" HeaderText="시" SortExpression="시" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="분" HeaderText="분" SortExpression="분" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="차량번호" HeaderText="차량번호" SortExpression="차량번호" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="차수" HeaderText="차수" SortExpression="차수" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
                <asp:HyperLinkField HeaderText="수량" DataTextField="수량" DataTextFormatString="{0:#,###}" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" />   <%--DataNavigateUrlFields="출고일자, 차량번호, 차수" DataNavigateUrlFormatString="./CarTimeOutStoreOrderBy.aspx?출고일자={0}&차량번호={1}&차수={2}"     --%>         
                <asp:BoundField DataField="누계" HeaderText="누계" SortExpression="누계" DataFormatString="{0:#,###}" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                </asp:BoundField>
            </Columns>
            <FooterStyle BorderStyle="Dashed" HorizontalAlign="Center" VerticalAlign="Middle" />
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        </asp:GridView>
    </div>
</asp:Content>
