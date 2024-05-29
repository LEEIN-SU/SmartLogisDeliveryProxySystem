<%@ Page Title="RT 출고 현황" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PointToPointRelease.aspx.cs" Inherits="SmartLogisticsDeliveryProxySystem_Search.PointToPointRelease" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row row-cols-auto align-items-center justify-content-center">
            <div class="col">
                <asp:Label ID="Label4" runat="server" Text="RT 출고 현황" Font-Bold="True" Font-Size="2em" ForeColor="#3366FF"></asp:Label>
            </div>
        </div>
        <div class="row row-cols-auto align-items-center justify-content-center">
            <div class="col">
                <asp:Label ID="Label1" runat="server" Text="입고일자" Font-Bold="True" Font-Size="1em"></asp:Label>
            </div>            
            <div class="col">
                <asp:TextBox ID="txtInDate" runat="server"  Font-Size="1em" Width="80px"></asp:TextBox>
            </div>           
            <div class="col">
                <asp:Label ID="Label2" runat="server" Text="출고일자" Font-Bold="True" Font-Size="1em"></asp:Label>
            </div>            
            <div class="col">
                <asp:TextBox ID="txtOutDate" runat="server"  Font-Size="1em" Width="80px"></asp:TextBox>
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
            DataKeyNames="입고일자, 상세, 받는매장명, 입고, 출고, 미출고"
            HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" 
            DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound" HorizontalAlign="Center" ShowFooter="true"
            DataMember="DefaultView">
            <Columns>
                <asp:BoundField DataField="입고일자" HeaderText="입고일" SortExpression="입고일자" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="상세" HeaderText="상세" SortExpression="상세" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="받는매장명" HeaderText="받는매장명" SortExpression="받는매장명" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>                
                <asp:BoundField DataField="입고" HeaderText="입고" SortExpression="입고" DataFormatString="{0:#,###}" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="출고" HeaderText="출고" SortExpression="출고" DataFormatString="{0:#,###}" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="미출고" HeaderText="미출고" SortExpression="미출고" DataFormatString="{0:#,###}" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
            </Columns>
            <FooterStyle BorderStyle="Dashed" HorizontalAlign="Center" VerticalAlign="Middle" />
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SDPSConnectionString %>" 
            SelectCommand="EXEC usp_웹_배송RT의뢰서마스터_집합건물별_GROUP_Get @입고일자, @출고일자">
            <SelectParameters>
                <asp:Parameter Name="입고일자" />
                <asp:Parameter Name="출고일자" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
