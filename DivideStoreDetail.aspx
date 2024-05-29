<%@ Page Title="배송권역별 상세 리스트" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DivideStoreDetail.aspx.cs" Inherits="SmartLogisticsDeliveryProxySystem_Search.DivideStoreDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row row-cols-auto align-items-center justify-content-center">
            <div class="col">
                <asp:Label ID="Label4" runat="server" Text="배송권역별 상세 리스트" Font-Bold="True" Font-Size="2em" ForeColor="#3366FF"></asp:Label>
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
                <asp:Label ID="Label2" runat="server" Text="구분" Font-Bold="True" Font-Size="1em"></asp:Label>
            </div>            
            <div class="col">
                <asp:Label ID="lblGubunName" runat="server" Text="" Font-Bold="True" Font-Size="1em" ForeColor="#3366FF"></asp:Label>
            </div>
        </div>
        <div class="row row-cols-auto align-items-center justify-content-center">
            <div class="col text-center">
                <asp:Label ID="Label3" runat="server" Text="집하" Font-Bold="True" Font-Size="1em"></asp:Label>
            </div>            
            <div class="col">
                <asp:Label ID="lblIn" runat="server" Text="" Font-Bold="True" Font-Size="1em" ForeColor="#3366FF" Width="20px"></asp:Label>
            </div>           
            <div class="col">
                <asp:Label ID="Label5" runat="server" Text="출고" Font-Bold="True" Font-Size="1em" ></asp:Label>
            </div>            
            <div class="col">
                <asp:Label ID="lblOut" runat="server" Text="" Font-Bold="True" Font-Size="1em" ForeColor="#3366FF" Width="20px"></asp:Label>
            </div>          
            <div class="col">
                <asp:Label ID="Label7" runat="server" Text="미출" Font-Bold="True" Font-Size="1em" ></asp:Label>
            </div>            
            <div class="col">
                <asp:Label ID="lblNotShip" runat="server" Text="" Font-Bold="True" Font-Size="1em" ForeColor="#3366FF" Width="20px"></asp:Label>
            </div>
        </div>
    </div>
    <hr />
    <div class="container">
        <asp:GridView ID="GridView1" CssClass="table table-group-divider" runat="server" AutoGenerateColumns="false"
            DataKeyNames="구분, 입고일자, 상세, 매장명, 입고, 출고, 미출고, 구분상세, 슈트번호" Font-Size ="0.84em"
            HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" 
            OnRowDataBound="GridView1_RowDataBound" HorizontalAlign="Center" ShowFooter="true" OnRowCreated="GridView1_RowCreated">
            <Columns>
                <asp:BoundField DataField="구분" HeaderText="구분" SortExpression="구분" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="입고일자" HeaderText="입고일" SortExpression="입고일자" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" Visible="false">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="상세" HeaderText="상세" SortExpression="상세" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
                <asp:HyperLinkField HeaderText="매장" DataTextField="매장명" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" DataNavigateUrlFields="입고일자, 상세, 매장명" DataNavigateUrlFormatString="./StoreListSub.aspx?입고일자={0}&상세={1}&매장명={2}"/>                
                <asp:BoundField DataField="입고" HeaderText="집하" SortExpression="입고" DataFormatString="{0:#,###}" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="출고" HeaderText="출고" SortExpression="출고" DataFormatString="{0:#,###}" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
                <asp:HyperLinkField HeaderText="미출" DataTextField="미출고" DataTextFormatString="{0:#,###}" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" 
                    DataNavigateUrlFields="입고일자, 슈트번호, 매장명, 상세" 
                    DataNavigateUrlFormatString="./DivideNotShippedStoreList.aspx?입고일자={0}&슈트번호={1}&매장명={2}&상세={3}"/>   
                <%--<asp:BoundField DataField="미출고" HeaderText="미출" SortExpression="미출고" DataFormatString="{0:#,###}" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>--%>
                <asp:BoundField DataField="구분상세" HeaderText="구분상세" SortExpression="구분상세" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" Visible="false">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="슈트번호" HeaderText="슈트번호" SortExpression="슈트번호" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" Visible="false">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
            </Columns>
            <FooterStyle BorderStyle="Dashed" HorizontalAlign="Center" VerticalAlign="Middle" />
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        </asp:GridView>
    </div>
</asp:Content>