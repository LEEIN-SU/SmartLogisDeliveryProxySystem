<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SmartLogisticsDeliveryProxySystem_Search._Default" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <div class="container text-center align-content-center align-items-center">
            <div class="row">
                <asp:LinkButton ID="lbtnBrandStockSearch" CssClass="form-control" Text="브랜드별 입고 현황" runat="server" OnClick="lbtnBrandStockSearch_Click" />                
            </div>
            <div class="row">
                <asp:LinkButton ID="lbtnStoreStockSearch" CssClass="form-control"  Text="매장별 입고 현황" runat="server" OnClick="lbtnStoreStockSearch_Click" />                
            </div>
            <div class="row">
                <asp:LinkButton ID="lbnGroupStore" CssClass="form-control"  Text="집합 건물별 입고 현황" runat="server" OnClick="lbnGroupStore_Click" />                
            </div>
            <div class="row">
                <asp:LinkButton ID="lbnDivideStoreGroup" CssClass="form-control"  Text="배송권역별 입고 현황" runat="server" OnClick="lbnDivideStoreGroup_Click" />                
            </div>
            <div class="row">
                <asp:LinkButton ID="lbnCarReleaseMain" CssClass="form-control"  Text="차량별 출고 현황" runat="server" OnClick="lbnCarReleaseMain_Click" />                
            </div>
            <div class="row">
                <asp:LinkButton ID="lbnCarTimeOut" CssClass="form-control"  Text="시간대별 차량 출고 현황" runat="server" OnClick="lbnCarTimeOut_Click" />                
            </div>
            <div class="row">
                <asp:LinkButton ID="lbnCarTimeIn" CssClass="form-control"  Text="시간대별 차량 집하 현황" runat="server" OnClick="lbnCarTimeIn_Click" />                
            </div>
            <div class="row">
                <asp:LinkButton ID="lbnCarCenterTimeIn" CssClass="form-control"  Text="시간대별 차량 센터입고 현황" runat="server" OnClick="lbnCarCenterTimeIn_Click" />                
            </div>
            <div class="row">
                <asp:LinkButton ID="lbnPointToPointNoReleaseSearch" CssClass="form-control"  Text="RT매장별" runat="server" OnClick="lbnPointToPointNoReleaseSearch_Click" />                
            </div>
            <div class="row">
                <asp:LinkButton ID="lbnPointToPointReleaseSearch" CssClass="form-control"  Text="RT 출고 현황" runat="server" OnClick="lbnPointToPointReleaseSearch_Click" />                
            </div>
        </div>
    </main>
</asp:Content>
