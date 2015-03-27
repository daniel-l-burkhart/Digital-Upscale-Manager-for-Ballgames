<%@ Page Title="" Language="C#" MasterPageFile="~/BallgamesMasterPage.master" AutoEventWireup="true" CodeFile="Software.aspx.cs" Inherits="Software" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="ContentHolder" ContentPlaceHolderID="contentPlaceHolder" Runat="Server">

    <br/>
    <asp:Label ID="lblSoftware" runat="server" Text="Software:"></asp:Label>
    <br/>
    <asp:GridView ID="gvSoftware" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="SoftwareID" DataSourceID="sdsSoftware" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" Width="800px">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="SoftwareID" HeaderText="SoftwareID" ReadOnly="True" SortExpression="SoftwareID" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Version" HeaderText="Version" SortExpression="Version" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="ReleaseDate" HeaderText="ReleaseDate" SortExpression="ReleaseDate" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:CommandField ShowEditButton="True" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <br />
    <br />
    <asp:SqlDataSource ID="sdsSoftware" runat="server" ConnectionString="<%$ ConnectionStrings:BallGamesConnectionString %>" OldValuesParameterFormatString="original_{0}" ProviderName="<%$ ConnectionStrings:BallGamesConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Software] ORDER BY [Version] DESC">
    </asp:SqlDataSource>
       <div id="newSoftware">
           <h3>Add new software: </h3>
           <br/>
           <asp:Label ID="lblSoftwareID" runat="server" Text="Software ID: "></asp:Label>
           <asp:TextBox ID="txtSoftwareID" runat="server"></asp:TextBox>
           <br/>
           <asp:Label ID="lblName" runat="server" Text="Name: "></asp:Label>
           <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
           <br/>
           <asp:Label ID="lblVersion" runat="server" Text="Version: "></asp:Label>
           <asp:TextBox ID="txtVersion" runat="server"></asp:TextBox>
           <br/>
           <asp:Label ID="lblReleaseDate" runat="server" Text="Release Date: "></asp:Label>
           <asp:TextBox ID="txtReleaseDate" runat="server"></asp:TextBox>
           <br/>
       </div>
</asp:Content>


