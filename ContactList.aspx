<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ContactList.aspx.cs" Inherits="ContactList" MasterPageFile="BallgamesMasterPage.master"%>

<asp:Content ID="headContent" ContentPlaceHolderID="head" Runat="Server">
    <link href="Styles/ContactList.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="bodyContent" ContentPlaceHolderID="contentPlaceHolder" Runat="Server">
    <h3>Contact List</h3>
        <div id="actionButtons">
            <asp:Button ID="btnAddMoreCustomer" runat="server"
                        PostBackUrl="~/CustomerDisplay.aspx" Text="Add More Customers" CssClass="button" Width="163px" TabIndex="2"/>

            <asp:Button ID="btnRemoveCustomer" runat="server" Text="Remove Customer"
                        onclick="btnRemove_Click" TabIndex="3"/>

            <asp:Button ID="btnClearList" runat="server" Text="Clear Contact List"
                        onclick="btnEmpty_Click" TabIndex="4"/>
            <br/>
            <br/>
        </div>
        <asp:ListBox ID="firstCustomerList" runat="server" Height="200px" Width="700px" AutoPostBack="True" TabIndex="1"></asp:ListBox>
        <div id="cartbuttons">
            <asp:Label ID="lblMessage" runat="server" CssClass="messageRemoveText"></asp:Label>
        </div>
        <br/>
        <br/>
        <asp:Button ID="btnHomeButton" runat="server" OnClick="btnHomeButton_Click" Text="Return to Home Page" TabIndex="5"/>
</asp:Content>

