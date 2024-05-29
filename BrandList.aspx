<%@ Page Title="브랜드별 상세 리스트" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BrandList.aspx.cs" Inherits="SmartLogisticsDeliveryProxySystem_Search.BrandList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row row-cols-auto align-items-center justify-content-center">
            <div class="col">
                <asp:Label ID="Label4" runat="server" Text="브랜드별 상세 리스트" Font-Bold="True" Font-Size="2em" ForeColor="#3366FF"></asp:Label>
            </div>
        </div>
        <div class="row row-cols-auto align-items-center justify-content-center">
            <div class="col">
                <asp:Label ID="Label1" runat="server" Text="입고일자" Font-Bold="True" Font-Size="1em"></asp:Label>
            </div>            
            <div class="col">
                <asp:Label ID="lblInDate" runat="server" Text="" Font-Bold="True" Font-Size="1em" ForeColor="#3366FF"></asp:Label>
            </div>   
        </div>
        <div class="row row-cols-auto align-items-center justify-content-center">        
            <div class="col">
                <asp:Label ID="Label2" runat="server" Text="물류명" Font-Bold="True" Font-Size="1em"></asp:Label>
            </div>            
            <div class="col">
                <asp:Label ID="lblLogisName" runat="server" Text="" Font-Bold="True" Font-Size="1em" ForeColor="#3366FF"></asp:Label>
            </div>
        </div>
    </div>
    <hr />
    <div class="container">
        <asp:GridView ID="GridView1" CssClass="table table-group-divider" runat="server"
            HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" AllowPaging="False" 
            OnRowDataBound="GridView1_RowDataBound" HorizontalAlign="Center" ShowFooter="true"  Font-Size ="0.84em"
            AutoGenerateColumns="false"
            DataKeyNames="입고일, 출고일, 물류코드, 물류명, 상세, 매장코드, 브랜드매장명, 입고, 출고, 미출">
            <Columns>
                <asp:BoundField DataField="입고일" HeaderText="입고일" SortExpression="입고일" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" Visible="false">
                </asp:BoundField>
                <asp:BoundField DataField="출고일" HeaderText="출고일" SortExpression="출고일" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" Visible="false">
                </asp:BoundField>
                <asp:BoundField DataField="물류코드" HeaderText="물류코드" SortExpression="물류코드" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" Visible="false">
                </asp:BoundField>
                <asp:BoundField DataField="물류명" HeaderText="물류명" SortExpression="물류명" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" Visible="false">
                </asp:BoundField>
                <asp:BoundField DataField="상세" HeaderText="상세" SortExpression="상세" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                </asp:BoundField>
                <asp:BoundField DataField="매장코드" HeaderText="매장코드" SortExpression="매장코드" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" Visible="false">
                </asp:BoundField>
                <asp:HyperLinkField HeaderText="브랜드매장명" DataTextField="브랜드매장명" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" DataNavigateUrlFields="물류코드, 매장코드, 브랜드매장명, 입고일, 물류명" DataNavigateUrlFormatString="./BrandListWayBillList.aspx?물류코드={0}&매장코드={1}&브랜드매장명={2}&입고일={3}&물류명={4}"/>
                <asp:BoundField DataField="입고" HeaderText="집하" SortExpression="입고" DataFormatString="{0:#,###}" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                </asp:BoundField>
                <asp:BoundField DataField="출고" HeaderText="출고" SortExpression="출고" DataFormatString="{0:#,###}" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                </asp:BoundField>
                <asp:BoundField DataField="미출" HeaderText="미출" SortExpression="미출" DataFormatString="{0:#,###}" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                </asp:BoundField>
            </Columns>
            <FooterStyle BorderStyle="Dashed" HorizontalAlign="Center" VerticalAlign="Middle" />
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        </asp:GridView>
    </div>
</asp:Content>
