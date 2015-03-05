<%@ Page Title="" Language="C#" MasterPageFile="~/BallgamesMasterPage.master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="Styles/ContactUs.css" rel="stylesheet"/>
</asp:Content>
<asp:Content ID="bodyContent" ContentPlaceHolderID="contentPlaceHolder" Runat="Server">
    <div id ="margin">
    <h3>Contact Us</h3>

    <p>You may use any of these ways to contact us.</p>

    <asp:Label ID="lblPhone" runat="server" CssClass="lblTitle" Text="Phone: "></asp:Label>
    <asp:HyperLink ID="hlPhone" NavigateUrl="tel:88-BallGame" runat="server">88-BallGame</asp:HyperLink>

    <br/>
    <br/>
    <asp:Label ID="lblHours" runat="server" CssClass="lblTitle" Text="Hours of Operation: "></asp:Label>
    <asp:Label ID="lblHoursVal" runat="server" Text="Monday-Friday 9-5."></asp:Label>
    <br/>
    <br/>
    <asp:Label ID="lblEmail" runat="server" CssClass="lblTitle" Text="Email: "></asp:Label>
    <asp:HyperLink ID="hlEmail" NavigateUrl="mailto:info@ballgame.com" runat="server">info@ballgame.com</asp:HyperLink>
    <br/>
    <br/>
    <asp:Label ID="lblMailAddress" CssClass="lblTitle" runat="server" Text="Mailing Address: "></asp:Label>
    <asp:Label ID="lblAddressVal" runat="server" Text="123 Ballgames Way. Los Angeles, CA. 90210"></asp:Label>
    <br/>
    </div>
</asp:Content>