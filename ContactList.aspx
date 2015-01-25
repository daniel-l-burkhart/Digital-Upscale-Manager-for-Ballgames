<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ContactList.aspx.cs" Inherits="ContactList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <link rel="stylesheet" type="text/css" href ="Styles/Main.css"/>
        <link rel="stylesheet" type="text/css" href ="Styles/ContactList.css"/>
    <title>Contact List</title>
        <style type="text/css">
            #form1 {
                height: 483px;
            }
        </style>
</head>
<body>
    <section>
        <form id="form1" runat="server">
            <h1>Digital Upscale Manager for Ballgames</h1>
            <h2>Managing Ballgames with Technology</h2>
            <h3>Contact List</h3>
            <div id="actionButtons">
                <asp:Button ID="btnAddMoreCustomer" runat="server"
                    PostBackUrl="~/CustomerDisplay.aspx" Text="Add More Customers" CssClass="button" Width="163px" />
                <asp:Button ID="btnRemoveCustomer" runat="server" Text="Remove Customer" 
                    onclick="btnRemove_Click" CssClass="button" />

                <asp:Button ID="btnClearList" runat="server" Text="Clear Contact List" 
                    onclick="btnEmpty_Click" CssClass="button" />
                <br />
            </div>
            <asp:ListBox ID="firstCustomerList" runat="server" Height="200px" Width="700px" AutoPostBack="True"></asp:ListBox>
            <div id="cartbuttons">
                <asp:Label ID="lblMessage" runat="server"></asp:Label>
            </div>
        </form>
    </section>
</body>
</html>