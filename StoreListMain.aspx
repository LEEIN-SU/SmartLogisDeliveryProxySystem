<%@ Page Title="매장별 리스트" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StoreListMain.aspx.cs" Inherits="SmartLogisticsDeliveryProxySystem_Search.StoreListMain" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row row-cols-auto align-items-center justify-content-center">
            <div class="col">
                <asp:Label ID="Label4" runat="server" Text="매장별 리스트" Font-Bold="True" Font-Size="2em" ForeColor="#3366FF"></asp:Label>
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
                <asp:Button CssClass="btn btn-outline-primary" ID="btnSearch" Text="조회" runat="server" OnClick="btnSearch_Click" Width="135px" />
            </div>
        </div>
        <div class="row row-cols-auto align-items-center justify-content-center">
            <div class="col">
                <asp:Label ID="Label2" runat="server" Text="집하수량" Font-Bold="True" Font-Size="1em"></asp:Label>
            </div>            
            <div class="col">
                <asp:Label ID="lblCenter" runat="server" Text="" Font-Bold="True" Font-Size="1em" ForeColor="#3366FF"></asp:Label>
            </div>           
            <%--<div class="col">
                <asp:Label ID="Label3" runat="server" Text="입고수량" Font-Bold="True" Font-Size="1em"></asp:Label>
            </div>            
            <div class="col">
                <asp:Label ID="lblIn" runat="server" Text="" Font-Bold="True" Font-Size="1em" ForeColor="#3366FF"></asp:Label>
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
        <div class="row row-cols-auto align-items-center justify-content-center">
            <asp:Label ID="Label1" runat="server" Font-Size="9pt" Text="범례:(구분 1.B:백화점, 2.O:아울렛, 3.D:대리점, 4.M:면세점, 5.H:본사)"></asp:Label>
        </div>
    </div>
    <hr />    
    <div class="container">
        <asp:GridView ID="gdView" CssClass="table table-group-divider" runat="server" AutoGenerateColumns="false"
            DataKeyNames="구분, 입고일자, 상세, 매장명, 집하, 입고, 출고, 미출고" Font-Size ="0.84em"
            HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" 
            DataSourceID="SqlDataSource1" OnRowDataBound="gdView_RowDataBound" HorizontalAlign="Center" ShowFooter="true"
            DataMember="DefaultView">
            <Columns>
                <asp:BoundField DataField="구분" HeaderText="구분" SortExpression="구분" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="입고일자" HeaderText="입고일" SortExpression="입고일자" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" Visible="False">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="상세" HeaderText="상세" SortExpression="상세" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
                <asp:HyperLinkField HeaderText="매장" DataTextField="매장명" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" DataNavigateUrlFields="입고일자, 상세, 매장명" DataNavigateUrlFormatString="./StoreListSub.aspx?입고일자={0}&상세={1}&매장명={2}"/>                    
                <asp:BoundField DataField="집하" HeaderText="집하" SortExpression="집하" DataFormatString="{0:#,###}" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="입고" HeaderText="입고" SortExpression="입고" DataFormatString="{0:#,###}" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" Visible="false">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="출고" HeaderText="출고" SortExpression="출고" DataFormatString="{0:#,###}" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="미출고" HeaderText="미출" SortExpression="미출고" DataFormatString="{0:#,###}" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
            </Columns>
            <FooterStyle BorderStyle="Dashed" HorizontalAlign="Center" VerticalAlign="Middle" />
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SDPSConnectionString %>" 
            SelectCommand="EXEC usp_웹_배송의뢰서마스터_매장별1_Get @입고일자">
            <SelectParameters>
                <asp:Parameter Name="입고일자" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
