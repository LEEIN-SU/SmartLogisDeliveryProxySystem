<%@ Page Title="매장별 브랜드 리스트" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StoreListSub.aspx.cs" Inherits="SmartLogisticsDeliveryProxySystem_Search.StoreListSub" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row row-cols-auto align-items-center justify-content-center">
            <div class="col">
                <asp:Label ID="Label4" runat="server" Text="매장별 브랜드 리스트" Font-Bold="True" Font-Size="2em" ForeColor="#3366FF"></asp:Label>
            </div>
        </div>
        <div class="row row-cols-auto align-items-center justify-content-center">
            <div class="col">
                <asp:Label ID="Label1" runat="server" Text="입고일자" Font-Bold="True" Font-Size="1em"></asp:Label>
            </div>            
            <div class="col">
                <asp:Label ID="lblInDate" runat="server" Text="" Font-Bold="True" Font-Size="1em" ForeColor="#3366FF"></asp:Label>
            </div>           
            <div class="col">
                <asp:Label ID="Label2" runat="server" Text="매장명" Font-Bold="True" Font-Size="1em"></asp:Label>
            </div>            
            <div class="col">
                <asp:Label ID="lblStoreName" runat="server" Text="" Font-Bold="True" Font-Size="1em" ForeColor="#3366FF"></asp:Label>
            </div>
        </div>
        <div class="row row-cols-auto align-items-center justify-content-center">
            <div class="col">
                <asp:Label ID="Label6" runat="server" Text="집하수량" Font-Bold="True" Font-Size="1em"></asp:Label>
            </div>            
            <div class="col">
                <asp:Label ID="lblCenter" runat="server" Text="" Width="100%" Font-Bold="True" Font-Size="1em" ForeColor="#3366FF"></asp:Label>
            </div>           
            <%--<div class="col">
                <asp:Label ID="Label3" runat="server" Text="입고수량" Font-Bold="True" Font-Size="1em"></asp:Label>
            </div>            
            <div class="col">
                <asp:Label ID="lblIn" runat="server" Text="" Width="100%" Font-Bold="True" Font-Size="1em" ForeColor="#3366FF"></asp:Label>
            </div>    --%>       
            <div class="col">
                <asp:Label ID="Label5" runat="server" Text="출고수량" Font-Bold="True" Font-Size="1em"></asp:Label>
            </div>            
            <div class="col">
                <asp:Label ID="lblOut" runat="server" Text="" Font-Bold="True" Font-Size="1em" ForeColor="#3366FF"></asp:Label>
            </div>          
            <div class="col">
                <asp:Label ID="Label7" runat="server" Text="미출수량" Font-Bold="True" Font-Size="1em"></asp:Label>
            </div>            
            <div class="col">
                <asp:Label ID="lblNotShip" runat="server" Text="" Font-Bold="True" Font-Size="1em" ForeColor="#3366FF"></asp:Label>
            </div>
        </div>
    </div>
    <hr />
    <div class="container">
    <asp:GridView ID="GridView1" CssClass="table table-group-divider" runat="server"
        HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" AllowPaging="False" 
        OnRowDataBound="GridView1_RowDataBound" HorizontalAlign="Center" ShowFooter="true" Font-Size ="0.84em"
        AutoGenerateColumns="false"
        DataKeyNames="물류코드, 물류명, 매장명, 집하수량, 입고수량, 출고수량, 미출고수량" >
        <Columns>
            <asp:BoundField DataField="물류코드" HeaderText="물류코드" SortExpression="물류코드" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
            </asp:BoundField>
            <asp:BoundField DataField="물류명" HeaderText="물류" SortExpression="물류명" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
            </asp:BoundField>
            <asp:BoundField DataField="매장명" HeaderText="매장" SortExpression="매장명" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
            </asp:BoundField>
            <asp:BoundField DataField="집하수량" HeaderText="집하" SortExpression="집하수량" DataFormatString="{0:#,###}" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
            </asp:BoundField>
            <%--<asp:BoundField DataField="입고수량" HeaderText="입고" SortExpression="입고수량" DataFormatString="{0:#,###}" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle"  Visible="false">
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
            </asp:BoundField>--%>
            <asp:BoundField DataField="출고수량" HeaderText="출고" SortExpression="출고수량" DataFormatString="{0:#,###}" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="미출고수량" HeaderText="미출" SortExpression="미출고수량" DataFormatString="{0:#,###}" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
            </asp:BoundField>
        </Columns>
        <FooterStyle BorderStyle="Dashed" HorizontalAlign="Center" VerticalAlign="Middle" />
        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
    </asp:GridView>
    </div>
</asp:Content>
