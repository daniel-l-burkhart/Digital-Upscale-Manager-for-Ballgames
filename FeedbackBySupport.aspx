<%@ Page Title="" Language="C#" MasterPageFile="~/BallgamesMasterPage.master" AutoEventWireup="true" CodeFile="FeedbackBySupport.aspx.cs" Inherits="FeedbackBySupport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="bodyContent" ContentPlaceHolderID="contentPlaceHolder" runat="Server">
    <div id="margin">
        <h2>Please select a support staff name to see the open incidents for that staff memeber.</h2>
        <asp:DropDownList ID="ddlSupportStaff" runat="server" AutoPostBack="True" DataSourceID="odsSupportStaff" DataTextField="Name" DataValueField="SupportID"></asp:DropDownList>

        <asp:ObjectDataSource ID="odsSupportStaff" runat="server" SelectMethod="GetAllSupportStaff" TypeName="SupportDatabase"></asp:ObjectDataSource>
        <br />

        <br />
        <asp:GridView ID="gvSupportFeedback" runat="server" AutoGenerateColumns="False" DataSourceID="odsFeedback" CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" Width="450px">
            
            <Columns>
                <asp:BoundField DataField="DateOpened" HeaderText="Date Opened" />
                <asp:BoundField DataField="SoftwareID" HeaderText="Software ID" />
                <asp:BoundField DataField="Name" HeaderText="Customer Name" />
            </Columns>

            <AlternatingRowStyle BackColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <asp:ObjectDataSource ID="odsFeedback" runat="server" SelectMethod="GetOpenFeedbackIncidents" TypeName="FeedbackDatabase">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlSupportStaff" Name="supportStaffId" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>

    </div>
</asp:Content>

