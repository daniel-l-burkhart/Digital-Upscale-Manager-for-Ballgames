<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CustomerDisplay.aspx.cs" Inherits="CustomerDisplay" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="Styles/CustomerDisplay.css"/>
</head>
<body>
<form id="form1" runat="server">
    <asp:Label ID="lblBallGamesTitle" runat="server" Text="Digital Upscale Manager for Ballgames"></asp:Label>
    <label>
        <br/>
        <br/>
        <asp:Label ID="lblSlogan" runat="server" Text="Managing Ballgames with Technology"></asp:Label>
        <br/>
        <br/>
        Please select a product&nbsp;
    </label>

    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/Digital Manager.mdb" SelectCommand="SELECT * FROM [Customer]"></asp:AccessDataSource>
    <br/>
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="AccessDataSource1" DataTextField="Name" DataValueField="CustomerID">
    </asp:DropDownList>
    <br/>
    <div id="productData">
        <asp:Label ID="lblName" runat="server"></asp:Label>
        <asp:Label ID="lblShortDescription" runat="server"></asp:Label>
        <asp:Label ID="lblLongDescription" runat="server"></asp:Label>
        <asp:Label ID="lblUnitPrice" runat="server"></asp:Label>
        <label id="lblQuantity">&nbsp;</label>
        <br/>
    </div>
</form>
</body>
</html>