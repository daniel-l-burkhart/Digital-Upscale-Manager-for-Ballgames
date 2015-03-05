<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CustomerDisplay.aspx.cs" Inherits="CustomerDisplay" MasterPageFile="BallgamesMasterPage.master" %>


<asp:Content ID="headContent" ContentPlaceHolderID="head" Runat="Server">
    <link href="Styles/CustomerDisplay.css" rel="stylesheet"/>
</asp:Content>
<asp:Content ID="bodyContent" ContentPlaceHolderID="contentPlaceHolder" Runat="Server">
    <div id="margin">

    <h3>Please select a Customer</h3>
    <asp:AccessDataSource ID="DigitalUpscaleDatabase" runat="server" DataFile="~/App_Data/Digital Manager.mdb" SelectCommand="SELECT * FROM [Customer]"></asp:AccessDataSource>
    <br/>
    <asp:DropDownList ID="ddlCustomerList" runat="server" DataSourceID="DigitalUpscaleDatabase" DataTextField="Name" DataValueField="CustomerID" AutoPostBack="True" TabIndex="1">
    </asp:DropDownList>
    <br/>
    <div id="productData">
        <br/>
        <asp:Label ID="lblName" runat="server" CssClass="nameLabel"></asp:Label>
        <br/>
        <asp:Label ID="lblAddressLabel" runat="server" CssClass="bold" Text="Address: "></asp:Label>
        <asp:Label ID="lblAddress" runat="server"></asp:Label>
        <br/>

        <asp:Label ID="lblCity" runat="server" Width="98px" CssClass="marginFormatting"></asp:Label>
        <asp:Label ID="lblState" runat="server" Width="45px" CssClass="marginFormatting"></asp:Label>
        <asp:Label ID="lblZipCode" runat="server" Width="65px" CssClass="marginFormatting"></asp:Label>
        <br/>
        <asp:Label ID="lblPhoneLabel" runat="server" CssClass="bold" Text="Phone Number:"></asp:Label>
        <asp:Label ID="lblPhone" runat="server" Width="111px" CssClass="marginFormatting"></asp:Label>
        <br/>
        <asp:Label ID="lblEmailLabel" runat="server" CssClass="bold" Text="Email: "></asp:Label>
        <asp:Label ID="lblEmail" runat="server" Width="111px" CssClass="marginFormatting"></asp:Label>
        <br/>
        <br/>

        <asp:Button ID="btnAddToContacts" runat="server" OnClick="btnAddToContacts_Click" Text="Add to Contacts" Width="143px" TabIndex="2"/>
        <asp:Button ID="btnViewContactList" runat="server" OnClick="btnViewContactList_Click" Text="View Contact List" TabIndex="3"/>
        <br/>
        <br/>
        <asp:Label ID="lblMessage" runat="server" CssClass="errorMessage"></asp:Label>

        <asp:Button ID="btnHomeButton" runat="server" Text="Return to Home Page" OnClick="btnHomeButton_Click" TabIndex="4"/>


    </div>
        </div>
</asp:Content>