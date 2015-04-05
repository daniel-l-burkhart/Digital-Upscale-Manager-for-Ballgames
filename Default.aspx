<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="HomePage" MasterPageFile="BallgamesMasterPage.master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="Styles/HomePage.css" rel="stylesheet"/>
</asp:Content>
<asp:Content ID="contentContent" ContentPlaceHolderID="contentPlaceHolder" Runat="Server">
<div id="margin">
    <p class="para">Welcome to the Digital Upscale Manager for the Ballgames Website.</p>
    <p class="para">Please select one of the links below.</p>

    <asp:Label ID="lblContactList" runat="server" Text="Click here to create a contact list" CssClass="label"></asp:Label>
    <asp:Button ID="btnBuildContactList" runat="server" Text="Build Contact List" OnClick="btnBuildContactList_Click" TabIndex="1"/>
    <br/>
    <br/>
    <asp:Label ID="lblFeedBack" runat="server" Text="Click here to give feedback" CssClass="label"></asp:Label>
    <asp:Button ID="btnFeedback" runat="server" Text="Find Feedback" OnClick="btnFeedback_Click" TabIndex="2"/>
    </div>
</asp:Content>