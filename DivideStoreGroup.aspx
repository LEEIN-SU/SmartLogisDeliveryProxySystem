﻿<%@ Page Title="배송권역별 리스트" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DivideStoreGroup.aspx.cs" Inherits="SmartLogisticsDeliveryProxySystem_Search.DivideStoreGroup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row row-cols-auto align-items-center justify-content-center">
            <div class="col">
                <asp:Label ID="Label4" runat="server" Text="배송권역별 리스트" Font-Bold="True" Font-Size="2em" ForeColor="#3366FF"></asp:Label>
            </div>
        </div>
        <div class="row row-cols-auto align-items-center justify-content-center">
            <div class="col">
                <asp:Label ID="lblDate" runat="server" Text="입고일자" Font-Bold="True" Font-Size="1em"></asp:Label>
            </div>             
            <div class="col">
                <asp:TextBox ID="txtInDate" runat="server" Font-Size="1em" Width="100px"></asp:TextBox>
            </div>           
            <div class="col">
                <asp:Button CssClass="btn btn-outline-primary" ID="btnSearch" Text="조회" runat="server" OnClick="btnSearch_Click" Width="150px" />
            </div>
        </div>
    </div>
    <hr />
    <div class="container">
        <asp:GridView ID="GridView1" CssClass="table table-group-divider" runat="server" AutoGenerateColumns="false"
            DataKeyNames="입고일자, 구분, 입고, 출고, 미출고, 슈트번호" Font-Size ="0.84em"
            HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" 
            DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound" HorizontalAlign="Center" ShowFooter="true"
            DataMember="DefaultView">
            <Columns>
                <asp:BoundField DataField="입고일자" HeaderText="입고일" SortExpression="입고일자" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
                <asp:HyperLinkField HeaderText="구분" DataTextField="구분" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" DataNavigateUrlFields="입고일자, 슈트번호, 구분" DataNavigateUrlFormatString="./DivideStoreDetail.aspx?입고일자={0}&슈트번호={1}&구분={2}"/>                
                <asp:BoundField DataField="입고" HeaderText="집하" SortExpression="입고" DataFormatString="{0:#,###}" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="출고" HeaderText="출고" SortExpression="출고" DataFormatString="{0:#,###}" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
                <asp:HyperLinkField HeaderText="미출고" DataTextField="미출고" DataTextFormatString="{0:#,###}" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" DataNavigateUrlFields="입고일자, 슈트번호, 구분" DataNavigateUrlFormatString="./DivideNotShippedList.aspx?입고일자={0}&슈트번호={1}&구분={2}"/>                 
                <asp:BoundField DataField="슈트번호" HeaderText="슈트번호" SortExpression="슈트번호" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" Visible="False">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
            </Columns>
            <FooterStyle BorderStyle="Dashed" HorizontalAlign="Center" VerticalAlign="Middle" />
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SDPSConnectionString %>" 
            SelectCommand="EXEC usp_웹_배송의뢰서마스터_슈트별_GROUP_Get @입고일자">
            <SelectParameters>
                <asp:Parameter Name="입고일자" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
