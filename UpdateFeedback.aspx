<%@ Page Title="" Language="C#" MasterPageFile="~/BallgamesMasterPage.master" AutoEventWireup="true" CodeFile="UpdateFeedback.aspx.cs" Inherits="UpdateFeedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="bodyContent" ContentPlaceHolderID="contentPlaceHolder" Runat="Server">
    <div id="margin">
    <h2>Please select a customer to show the existing feedback for the customer.</h2>
    <br/>
    <asp:DropDownList ID="ddlCustomers" runat="server" DataSourceID="odsCustomers" DataTextField="Name" DataValueField="CustomerID" AutoPostBack="True"></asp:DropDownList>
    <br/>
    <asp:ObjectDataSource ID="odsCustomers" runat="server" SelectMethod="GetCustomersWithFeedback" TypeName="CustomerDatabase"></asp:ObjectDataSource>
    <br/>
    <br/>
    <asp:GridView ID="gvFeedbackIncidents" runat="server" CellPadding="4" DataSourceID="odsUpdateFeedback" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowEditButton="True" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <asp:ObjectDataSource ID="odsUpdateFeedback" runat="server" SelectMethod="GetCustomerFeedback" TypeName="FeedbackDatabase" UpdateMethod="UpdateFeedback">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlCustomers" Name="customerId" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="originalFeedback" Type="Object" />
            <asp:Parameter Name="newFeedback" Type="Object" />
        </UpdateParameters>
    </asp:ObjectDataSource>
        </div>
</asp:Content>


