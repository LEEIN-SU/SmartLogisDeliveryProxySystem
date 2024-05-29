<%@ Page Title="차량번호 차수별 출고 내역" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CarReleaseSub.aspx.cs" Inherits="SmartLogisticsDeliveryProxySystem_Search.CarReleaseSub" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row row-cols-auto align-items-center justify-content-center">
            <div class="col">
                <asp:Label ID="Label4" runat="server" Text="차량번호 차수별 출고내역" Font-Bold="True" Font-Size="2em" ForeColor="#3366FF"></asp:Label>
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
        <asp:GridView ID="GridView1" CssClass="table table-group-divider" runat="server" AutoGenerateColumns="false"
            DataKeyNames="출고일자, 출고차량, 출고수량" 
            HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" Font-Size ="0.84em"
            OnRowDataBound="GridView1_RowDataBound" HorizontalAlign="Center" ShowFooter="true">
            <Columns>
                <asp:BoundField DataField="출고일자" HeaderText="출고일" SortExpression="출고일자" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" Visible="false">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="출고시간" HeaderText="출고시간" SortExpression="출고시간"  DataFormatString="{0:T}" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
                <asp:HyperLinkField HeaderText="출고차량" DataTextField="출고차량" 
                    ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle"
                    DataNavigateUrlFields="출고일자, 출고차량" DataNavigateUrlFormatString="./CarReleaseSubSub.aspx?출고일자={0}&출고차량={1}" />
                <asp:BoundField DataField="출고수량" HeaderText="출고수량" SortExpression="출고수량" DataFormatString="{0:#,###}" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                </asp:BoundField>
            </Columns>
            <FooterStyle BorderStyle="Dashed" HorizontalAlign="Center" VerticalAlign="Middle" />
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        </asp:GridView>
    </div>
</asp:Content>
