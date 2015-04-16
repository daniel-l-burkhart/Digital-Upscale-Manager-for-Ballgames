<%@ Page Title="" Language="C#" MasterPageFile="~/BallgamesMasterPage.master" AutoEventWireup="true" CodeFile="UpdateFeedback.aspx.cs" Inherits="UpdateFeedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="bodyContent" ContentPlaceHolderID="contentPlaceHolder" Runat="Server">
    <asp:DropDownList ID="ddlCustomers" runat="server"></asp:DropDownList>
    <br/>
    <br/>
    <asp:GridView ID="gvFeedbackIncidents" runat="server"></asp:GridView>
</asp:Content>


