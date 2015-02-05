<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CustomerFeedback.aspx.cs" Inherits="CustomerFeedback" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Styles/Main.css" rel="stylesheet"/>
    <link href="Styles/CustomerFeedback.css" rel="stylesheet"/>
    <title>Customer Feedback</title>

</head>
<body>
<header>
    <img src="Images/DigitalBallGamesManagerHeader.png" alt="Digital Upscale manager for ballgames"/>

</header>
<form id="form1" runat="server" DefaultFocus="txtCustomerID">
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/Digital Manager.mdb" SelectCommand="SELECT * FROM [Feedback] WHERE ([DateClosed] IS NOT NULL)">
    </asp:AccessDataSource>
   <div id ="customerIDSearch">
    <asp:Label ID="lblCustomerId" runat="server" Text="Insert Customer ID:"></asp:Label>
    <asp:TextBox ID="txtCustomerID" runat="server"></asp:TextBox>
       <asp:RequiredFieldValidator ID="rfvCustomerID" runat="server" ControlToValidate="txtCustomerID" CssClass="validator" Display="Dynamic" ErrorMessage="Must enter a customer ID"></asp:RequiredFieldValidator>
       <asp:CompareValidator ID="cvCustomerIDValidator" runat="server" ControlToValidate="txtCustomerID" Display="Dynamic" ErrorMessage="Must be a valid Customer ID" Operator="DataTypeCheck" Type="Integer" CssClass="validator"></asp:CompareValidator>
       <br />
       <asp:Button ID="btnForCustomerIDSearch" runat="server" Text="Submit Customer ID." OnClick="btnForCustomerIDSearch_Click"/>
       <br/>
       <br/>
       <asp:Label ID="lblCustomerIDNotInList" runat="server" CssClass="validator"></asp:Label>
   </div>
    <div id ="listBox">
        <asp:ListBox ID="lbClosedFeedbackList" runat="server" AutoPostBack="True" Width="676px">
            <asp:ListItem></asp:ListItem>
        </asp:ListBox>
    </div>
    <div>
        <asp:Label ID="lblRatings" runat="server" Text="Ratings"></asp:Label>
        <br />
        <br />
        <asp:Label ID="lblServiceTime" runat="server" Text="Service Time:"></asp:Label>
        <asp:RadioButtonList ID="rblServiceTime" runat="server" RepeatDirection="Horizontal">
            <asp:ListItem Value="1">Satisfied</asp:ListItem>
            <asp:ListItem Value="2">Neither Satisfied Nor Dissatisfied</asp:ListItem>
            <asp:ListItem Value="3">Dissatisfied</asp:ListItem>
        </asp:RadioButtonList>
        <br/>
        <asp:Label ID="lblTechnicalEfficiency" runat="server" Text="Technical Efficiency"></asp:Label>
        <asp:RadioButtonList ID="rblTechnicalEfficiency" runat="server" RepeatDirection="Horizontal">
            <asp:ListItem Value="1">Satisfied</asp:ListItem>
            <asp:ListItem Value="2">Neither Satisfied Nor Dissatisfied</asp:ListItem>
            <asp:ListItem Value="3">Dissatisfied</asp:ListItem>
        </asp:RadioButtonList>
        <br/>
        <asp:Label ID="lblProblemResolution" runat="server" Text="Problem Resolution"></asp:Label>
        <asp:RadioButtonList ID="rblProblemResolution" runat="server" RepeatDirection="Horizontal">
            <asp:ListItem Value="1">Satisfied</asp:ListItem>
            <asp:ListItem Value="2">Neither Satisfied Nor Dissatisfied</asp:ListItem>
            <asp:ListItem Value="3">Dissatisfied</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        <asp:Label ID="lblAdditionalComments" runat="server" Text="Additional Comments"></asp:Label>
        <br />
        <asp:TextBox ID="txtAdditionalComments" runat="server" Height="67px" TextMode="MultiLine" Width="247px"></asp:TextBox>
        <br />
        <br />
        <asp:CheckBox ID="cbContact" runat="server" Text="Click here if you would like to be contacted" />
        <br />
        <br />
        <asp:Label ID="lblContactHow" runat="server" Text="If so, how would you like to be contacted?"></asp:Label>
        <asp:RadioButtonList ID="rblHowToContact" runat="server" RepeatDirection="Horizontal">
            <asp:ListItem>Phone</asp:ListItem>
            <asp:ListItem>Email</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
        <br />
        <br />
        <asp:Button ID="btnHomeButton" runat="server" OnClick="btnHomeButton_Click" Text="Return to Home Page" CausesValidation="False" />
        
    </div>
</form>
</body>
</html>