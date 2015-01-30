<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ContactList.aspx.cs" Inherits="ContactList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="Styles/Main.css"/>
    <link rel="stylesheet" type="text/css" href="Styles/ContactList.css"/>
    <title>Contact List</title>

</head>
<body>
<header>
    <img src="Images/DigitalBallGamesManagerHeader.png" alt="Digital Upscale manager for ballgames"/>
</header>
<section>
    <form id="form1" runat="server">
        <h3>Contact List</h3>
        <div id="actionButtons">
            <asp:Button ID="btnAddMoreCustomer" runat="server"
                        PostBackUrl="~/CustomerDisplay.aspx" Text="Add More Customers" CssClass="button" Width="163px"/>

            <asp:Button ID="btnRemoveCustomer" runat="server" Text="Remove Customer"
                        onclick="btnRemove_Click"/>

            <asp:Button ID="btnClearList" runat="server" Text="Clear Contact List"
                        onclick="btnEmpty_Click"/>
            <br/>
            <br/>
        </div>
        <asp:ListBox ID="firstCustomerList" runat="server" Height="200px" Width="700px" AutoPostBack="True"></asp:ListBox>
        <div id="cartbuttons">
            <asp:Label ID="lblMessage" runat="server"></asp:Label>
        </div>
        <br/>
        <br/>
        <asp:Button ID="btnHomeButton" runat="server" OnClick="btnHomeButton_Click" Text="Return to Home Page" />
    </form>
</section>
    
</body>
</html>