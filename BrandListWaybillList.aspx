<%@ Page Title="브랜드 매장별 입고 운송장 리스트" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BrandListWaybillList.aspx.cs" Inherits="SmartLogisticsDeliveryProxySystem_Search.BrandListWaybillList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row row-cols-auto align-items-center justify-content-center">
            <div class="col">
                <asp:Label ID="Label4" runat="server" Text="브랜드 매장별 운송장 리스트" Font-Bold="True" Font-Size="2em" ForeColor="#3366FF"></asp:Label>
            </div>
        </div>
        <div class="row row-cols-auto align-items-center justify-content-center">
            <div class="col">
                <asp:Label ID="Label3" runat="server" Text="매장명" Font-Bold="True" Font-Size="1.5em"></asp:Label>
            </div>
            <div class="col">
                <asp:Label ID="lblStoreName" runat="server" Text="" Font-Bold="True" Font-Size="1.5em" ForeColor="#3366FF"></asp:Label>
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
            OnRowDataBound="GridView1_RowDataBound" HorizontalAlign="Center" ShowFooter="true" Font-Size ="0.84em"
            AutoGenerateColumns="false"
            DataKeyNames="운송장번호, 생성일시, 생성자, 합계" >
            <Columns>
                <asp:BoundField DataField="운송장번호" HeaderText="운송장번호" SortExpression="운송장번호" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                </asp:BoundField>
                <asp:BoundField DataField="생성일시" HeaderText="생성일시" SortExpression="생성일시" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                </asp:BoundField>
                <asp:BoundField DataField="생성자" HeaderText="생성자" SortExpression="생성자" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" Visible="false">
                </asp:BoundField>
                <asp:BoundField DataField="합계" HeaderText="합계" SortExpression="합계" DataFormatString="{0:#,###}" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                </asp:BoundField>
            </Columns>
            <FooterStyle BorderStyle="Dashed" HorizontalAlign="Center" VerticalAlign="Middle" />
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        </asp:GridView>
    </div>
</asp:Content>
