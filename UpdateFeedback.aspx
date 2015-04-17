<%@ Page Title="" Language="C#" MasterPageFile="~/BallgamesMasterPage.master" AutoEventWireup="true" CodeFile="UpdateFeedback.aspx.cs" Inherits="UpdateFeedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="bodyContent" ContentPlaceHolderID="contentPlaceHolder" runat="Server">
    <div id="margin">
        <h2>Please select a customer to show the existing feedback for the customer.</h2>
        <br />
        <asp:DropDownList ID="ddlCustomers" runat="server" DataSourceID="odsCustomers" DataTextField="Name" DataValueField="CustomerID" AutoPostBack="True"></asp:DropDownList>
        <br />
        <asp:ObjectDataSource ID="odsCustomers" runat="server" SelectMethod="GetCustomersWithFeedback" TypeName="CustomerDatabase"></asp:ObjectDataSource>
        <br />
        <br />
        <asp:GridView ID="gvCustomerFeedback" runat="server" AutoGenerateColumns="False" DataSourceID="odsFeedback" OnRowUpdated="gvCustomerFeedback_RowUpdated" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateEditButton="True">
            <AlternatingRowStyle BackColor="White" />
            <Columns>

                <asp:BoundField DataField="SoftwareId" HeaderText="SoftwareId" SortExpression="SoftwareId" ReadOnly="True" />
                <asp:BoundField DataField="SupportId" HeaderText="SupportId" SortExpression="SupportId" ReadOnly="True" />
                <asp:BoundField DataField="DateOpened" HeaderText="DateOpened" SortExpression="DateOpened" ReadOnly="True" />
                <asp:BoundField DataField="DateClosed" HeaderText="DateClosed" SortExpression="DateClosed" />
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" ReadOnly="True" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />

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

        <asp:ObjectDataSource
            ID="odsFeedback" runat="server"
            DataObjectTypeName="Feedback"
            SelectMethod="GetCustomerFeedback"
            TypeName="FeedbackDatabase"
            UpdateMethod="Update"
            ConflictDetection="CompareAllValues"
            OnDeleted="odsUpdateFeedback_OnDeleted"
            OnUpdated="odsUpdateFeedback_OnUpdated" OldValuesParameterFormatString="originalFeedback{0}">

            <SelectParameters>
                <asp:ControlParameter ControlID="ddlCustomers" Name="customerId" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="originalFeedback" Type="Object" />
                <asp:Parameter Name="feedback" Type="Object" />
            </UpdateParameters>
        </asp:ObjectDataSource>
        <asp:ValidationSummary ID="vsUpdateFeedback" runat="server" />

        <br />
        <asp:Label ID="lblError" runat="server" SkinID="error"></asp:Label>
    </div>
</asp:Content>


