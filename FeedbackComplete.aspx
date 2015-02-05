<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FeedbackComplete.aspx.cs" Inherits="FeedbackComplete" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Styles/Main.css" rel="stylesheet"/>
    <title>Feedback Complete</title>
</head>
<body>
<header>
    <img src="Images/DigitalBallGamesManagerHeader.png" alt="Digital Upscale manager for ballgames"/>
</header>
<form id="form1" runat="server">
    <div>
        <asp:Label ID="lblThankYou" runat="server" Text="Thank you for submitting feedback"></asp:Label>
    </div>
    <div>

        <asp:Label ID="lblContacted" runat="server"></asp:Label>

    </div>
</form>
</body>
</html>