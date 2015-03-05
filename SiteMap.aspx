<%@ Page Title="" Language="C#" MasterPageFile="~/BallgamesMasterPage.master" AutoEventWireup="true" CodeFile="SiteMap.aspx.cs" Inherits="SiteMap" %>

<asp:Content ID="headerContent" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="bodyContent" ContentPlaceHolderID="contentPlaceHolder" Runat="Server">
    <div id="margin">
    <h3>Sitemap of the Digital Upscale Manager for Ballgames Site</h3>
    <asp:TreeView ID="TreeView1" runat="server" DataSourceID="smdsBallgamesSiteMap" ImageSet="Arrows">
        <HoverNodeStyle Font-Underline="True" ForeColor="#5555DD"/>
        <NodeStyle Font-Names="Tahoma" Font-Size="10pt" ForeColor="Black" HorizontalPadding="5px" NodeSpacing="0px" VerticalPadding="0px"/>
        <ParentNodeStyle Font-Bold="False"/>
        <SelectedNodeStyle Font-Underline="True" ForeColor="#5555DD" HorizontalPadding="0px" VerticalPadding="0px"/>
    </asp:TreeView>
    <asp:SiteMapDataSource ID="smdsBallgamesSiteMap" runat="server"/>
        </div>
</asp:Content>