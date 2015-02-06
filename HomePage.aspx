<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HomePage.aspx.cs" Inherits="HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Styles/Main.css" rel="stylesheet"/>
    <link href="Styles/HomePage.css" rel="stylesheet"/>
    <title>Burkhart Project 1: Home Page</title>

</head>
<body>
<header>
    <img alt="Digital Upscale manager for ballgames" class="auto-style1" src="Images/DigitalBallGamesManagerHeader.png"/>
</header>
<p>Welcome to the Digital Upscale Manager for the Ballgames Website.</p>
<p>Please select one of the links below.</p>
<form id="form1" runat="server">

    <asp:Label ID="lblContactList" runat="server" Text="Click here to create a contact list" CssClass="label"></asp:Label>
    <asp:Button ID="btnBuildContactList" runat="server" Text="Build Contact List" OnClick="btnBuildContactList_Click"/>
    <br/>
    <br/>
    <asp:Label ID="lblFeedBack" runat="server" Text="Click here to give feedback" CssClass="label"></asp:Label>
    <asp:Button ID="btnFeedback" runat="server" Text="Find Feedback" OnClick="btnFeedback_Click"/>

</form>

</body>
</html>