<%@ Page Title="" Language="C#" MasterPageFile="~/BallgamesMasterPage.master" AutoEventWireup="true" CodeFile="IncidentDisplay.aspx.cs" Inherits="IncidentDisplay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="Styles/IncidentDisplay.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="ContentHolder" ContentPlaceHolderID="contentPlaceHolder" runat="Server">
    <h3>Please select a customer to see any incidents for that customer.</h3>
    <br/>
    <br/>
    <asp:DropDownList ID="ddlCustomers" runat="server" DataSourceID="sdsBallGames" DataTextField="Name" DataValueField="CustomerID" AutoPostBack="True"></asp:DropDownList>
    <asp:SqlDataSource ID="sdsBallGames" runat="server" ConnectionString="<%$ ConnectionStrings:BallGamesConnectionString %>" ProviderName="<%$ ConnectionStrings:BallGamesConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Customer] ORDER BY [Name]"></asp:SqlDataSource>
    <br />
    <br />

    <asp:DataList ID="dlIncidents" runat="server" DataSourceID="sdsDataList" CellPadding="4" ForeColor="#333333" HorizontalAlign="Center">
        <AlternatingItemStyle BackColor="White" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <ItemStyle BackColor="#EFF3FB" />
        <HeaderTemplate>
            <table>
                <tr>
                    <th>Incident</th>
                    <th>Support ID</th>
                    <th>Date Opened</th>
                    <th>Date Closed</th>
                </tr>
            </table>
        </HeaderTemplate>
        <ItemTemplate>
            <table>
                <tr>
                    <td>
                        <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CustomerIDLabel" runat="server" Text='<%# Eval("SupportID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DateOpenedLabel" runat="server" Text='<%# Eval("DateOpened") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DateClosedLabel" runat="server" Text='<%# Eval("DateClosed") %>' />
                    </td>

                </tr>
                <tr>
                    <td colspan="4">
                        <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                    </td>
                </tr>
            </table>
        </ItemTemplate>
        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    </asp:DataList>
     
    <asp:SqlDataSource ID="sdsDataList" runat="server" ConnectionString="<%$ ConnectionStrings:BallGamesConnectionString %>" ProviderName="<%$ ConnectionStrings:BallGamesConnectionString.ProviderName %>" SelectCommand="SELECT [CustomerID], [SoftwareID], [SupportID], [DateOpened], [DateClosed], [Title], [Description] FROM [Feedback] WHERE ([CustomerID] = @CustomerID) ORDER BY [DateOpened]">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlCustomers" Name="Name" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>


