<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CustomerDisplay.aspx.cs" Inherits="CustomerDisplay" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customer Display</title>
    <link rel="stylesheet" type="text/css" href="Styles/Main.css"/>
    <link rel="stylesheet" type="text/css" href="Styles/CustomerDisplay.css"/>
</head>
<body>
<header>
    <img src="Images/DigitalBallGamesManagerHeader.png" alt="Digital Upscale manager for ballgames"/>
</header>
<section>
    <form id="form1" runat="server">

        <h3>Please sPlease select a Customer</h3>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/Digital Manager.mdb" SelectCommand="SELECT * FROM [Customer]"></asp:AccessDataSource>
        <br/>
        <asp:DropDownList ID="ddlCustomerList" runat="server" DataSourceID="AccessDataSource1" DataTextField="Name" DataValueField="CustomerID" AutoPostBack="True">
        </asp:DropDownList>
        <br/>
        <div id="productData">
            <asp:Label ID="lblName" runat="server"></asp:Label>
            <asp:Label ID="lblAddressLabel" runat="server" CssClass="bold" Text="Address: "></asp:Label>
            <asp:Label ID="lblAddress" runat="server"></asp:Label>
            <br/>
            <br/>
            <asp:Label ID="lblCity" runat="server" Width="98px"></asp:Label>
            <asp:Label ID="lblState" runat="server" Width="65px"></asp:Label>
            <asp:Label ID="lblZipCode" runat="server"></asp:Label>
            <asp:Label ID="lblPhoneLabel" runat="server" CssClass="bold" Text="Phone Number:"></asp:Label>
            <asp:Label ID="lblPhone" runat="server" Width="111px"></asp:Label>
            <br />
            <asp:Label ID="lblEmailLabel" runat="server" CssClass="bold" Text="Email: "></asp:Label>
            <asp:Label ID="lblEmail" runat="server" Width="111px"></asp:Label>
            <br />
            <br />
            <br />
            <br/>
            <asp:Button ID="btnAddToContacts" runat="server" OnClick="btnAddToContacts_Click" Text="Add to Contacts" Width="143px"/>
            <asp:Button ID="btnViewContactList" runat="server" OnClick="btnViewContactList_Click" Text="View Contact List"/>
            <br/>
            <br />
            <asp:Label ID="lblMessage" runat="server" CssClass="validator"></asp:Label>
            <br />
            <br/>
            <br/>
            <br />
            <br />
            <asp:Button ID="btnHomeButton" runat="server" Text="Return to Home Page" OnClick="btnHomeButton_Click"/>

        </div>

    </form>

</section>
</body>
</html>