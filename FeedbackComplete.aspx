<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FeedbackComplete.aspx.cs" Inherits="FeedbackComplete" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Styles/Main.css" rel="stylesheet"/>
    <link href="Styles/FeedbackComplete.css" rel="stylesheet"/>
    <title>Feedback Complete</title>
</head>
<body>
<header>
    <img src="Images/DigitalBallGamesManagerHeader.png" alt="Digital Upscale manager for ballgames"/>
</header>
<form id="form1" runat="server">
    <div>
        <h3>Thank you for submitting feedback.</h3>
    </div>
    <div>

        <asp:Label ID="lblContacted" runat="server"></asp:Label>

        <br/>

        <br/>

    </div>
    <div id="FeedbackData">

        <asp:Label ID="lblCustomerLabel" runat="server" Text="Customer ID: " CssClass="bold"></asp:Label>
        <asp:Label ID="lblCustomerID" runat="server"></asp:Label> <br/><br/>

        <asp:Label ID="lblServiceTime" runat="server" Text="Service Time: " CssClass="bold"></asp:Label>
        <asp:Label ID="lblServiceTimeValue" runat="server"></asp:Label> <br/><br/>

        <asp:Label ID="lblEfficiency" runat="server" Text="Technical Efficiency: " CssClass="bold"></asp:Label>
        <asp:Label ID="lblEfficiencyValue" runat="server"></asp:Label> <br/><br/>

        <asp:Label ID="lblProblemResolution" runat="server" Text="Problem Resolution: " CssClass="bold"></asp:Label>
        <asp:Label ID="lblProblemResolutionValue" runat="server"></asp:Label> <br/><br/>

        <asp:Label ID="lblComments" runat="server" Text="Additional Comments: " CssClass="bold"></asp:Label>
        <asp:Label ID="lblAdditionalComments" runat="server"></asp:Label> <br/><br/>

        <asp:Label ID="lblContact" runat="server" Text="Contact:" CssClass="bold"></asp:Label>
        <asp:Label ID="lblContactValue" runat="server"></asp:Label> <br/><br/>

        <asp:Label ID="lblContactHow" runat="server" Text="Preferred Contact Method: " CssClass="bold"></asp:Label>
        <asp:Label ID="lblPreferredContactMentod" runat="server"></asp:Label> <br/>
    </div>
</form>
</body>
</html>