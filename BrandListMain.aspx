<%@ Page Title="브랜드별 리스트" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BrandListMain.aspx.cs" Inherits="SmartLogisticsDeliveryProxySystem_Search.BrandListMain" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row row-cols-auto align-items-center justify-content-center">
            <div class="col">
                <asp:Label ID="Label4" runat="server" Text="브랜드별 리스트" Font-Bold="True" Font-Size="2em" ForeColor="#3366FF"></asp:Label>
            </div>
        </div>
        <div class="row row-cols-auto align-items-center justify-content-center">
            <div class="col">
                <asp:Label ID="lblDate" runat="server" Text="입고일자" Font-Bold="True" Font-Size="1em"></asp:Label>
            </div>             
            <div class="col">
                <asp:TextBox ID="txtInDate" runat="server" Font-Size="1em" Width="85px"></asp:TextBox>
            </div>           
            <div class="col">
                <asp:Button CssClass="btn btn-outline-primary" ID="btnSearch" Text="조회" runat="server" OnClick="btnSearch_Click" Width="134px" Height="100%"/>
            </div>
        </div>        
        <div class="row row-cols-auto align-items-center justify-content-center">
            <div class="col">
                <asp:Label ID="Label3" runat="server" Text="집하" Font-Bold="True" Font-Size="1em"></asp:Label>
            </div>
            <div class="col">
                <asp:Label ID="lblIn" runat="server" Text="" Font-Bold="True" Font-Size="1em" ForeColor="#3366FF"></asp:Label>
            </div>
            <div class="col">
                <asp:Label ID="Label5" runat="server" Text="출고" Font-Bold="True" Font-Size="1em"></asp:Label>
            </div>
            <div class="col">
                <asp:Label ID="lblOut" runat="server" Text="" Font-Bold="True" Font-Size="1em" ForeColor="#3366FF"></asp:Label>
            </div>
            <div class="col">
                <asp:Label ID="Label7" runat="server" Text="미출" Font-Bold="True" Font-Size="1em"></asp:Label>
            </div>
            <div class="col">
                <asp:Label ID="lblNotShip" runat="server" Text="" Font-Bold="True" Font-Size="1em" ForeColor="#3366FF"></asp:Label>
            </div>
        </div>
    </div>
    <hr />
    <div class="container row-cols-auto">
        <asp:GridView ID="gdView" CssClass="table table-group-divider" runat="server" AutoGenerateColumns="false"
            DataKeyNames="입고일, 출고일, 물류코드, 물류명, 입고, 출고, 미출"
            HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" Font-Size ="0.84em"
            DataSourceID="SqlDataSource1" AllowPaging="False" OnRowDataBound="gdView_RowDataBound" ShowFooter="True" HorizontalAlign="Center" AllowSorting="True" >
            <Columns>
                <asp:BoundField DataField="입고일" HeaderText="입고일" SortExpression="입고일" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" Visible="false">
                </asp:BoundField>
                <asp:BoundField DataField="출고일" HeaderText="출고일" SortExpression="출고일" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" Visible="false">
                </asp:BoundField>
                <asp:BoundField DataField="물류코드" HeaderText="물류코드" SortExpression="물류코드" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                </asp:BoundField>
                <asp:HyperLinkField HeaderText="물류명" DataTextField="물류명" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" DataNavigateUrlFields="물류코드, 물류명, 입고일" DataNavigateUrlFormatString="./BrandList.aspx?물류코드={0}&물류명={1}&입고일={2}"/>
                <asp:BoundField DataField="입고" HeaderText="집하" SortExpression="입고" DataFormatString="{0:#,###}" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                </asp:BoundField>
                <asp:BoundField DataField="출고" HeaderText="출고" SortExpression="출고" DataFormatString="{0:#,###}" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                </asp:BoundField>
                <%--<asp:BoundField DataField="미출" HeaderText="미출" SortExpression="미출" DataFormatString="{0:#,###}" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                </asp:BoundField>--%>
                <asp:HyperLinkField HeaderText="미출" DataTextField="미출" DataTextFormatString="{0:#,###}" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" DataNavigateUrlFields="물류코드, 물류명, 입고일" DataNavigateUrlFormatString="./BrandListNotShipped.aspx?물류코드={0}&물류명={1}&입고일={2}"/>   
            </Columns>
            <FooterStyle BorderStyle="Dashed" HorizontalAlign="Center" VerticalAlign="Middle" />
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SDPSConnectionString %>" 
            SelectCommand="EXEC usp_웹_배송의뢰서마스터_일자별_Get @입고일자">
            <SelectParameters>
                <asp:Parameter Name="입고일자" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
