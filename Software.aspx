<%@ Page Title="" Language="C#" MasterPageFile="~/BallgamesMasterPage.master" AutoEventWireup="true" CodeFile="Software.aspx.cs" Inherits="Software" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="Styles/Software.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="ContentHolder" ContentPlaceHolderID="contentPlaceHolder" runat="Server">
    <div id="margin">
        <h2>Software Maintenance</h2>
        <br />

        <asp:GridView ID="gvSoftware" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataKeyNames="SoftwareID" DataSourceID="sdsBallGames" ForeColor="#333333" 
            GridLines="None" OnRowDeleted="gvSoftware_RowDeleted" OnRowUpdated="gvSoftware_RowUpdated" HorizontalAlign="Center">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="SoftwareID" SortExpression="SoftwareID">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" ForeColor="GhostWhite" Text='<%# Eval("SoftwareID") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("SoftwareID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Name" SortExpression="Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEditName" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEditName" runat="server" ControlToValidate="txtEditName" Display="Dynamic" ErrorMessage="Name is a required field.">*</asp:RequiredFieldValidator>

                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Version" SortExpression="Version">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEditVersion" runat="server" Text='<%# Bind("Version") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEditVersion" runat="server" ControlToValidate="txtEditVersion" Display="Dynamic" ErrorMessage="Version is a required field.">*</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="cvEditVersion" runat="server" ControlToValidate="txtEditVersion" ErrorMessage="Please enter a valid version." Operator="DataTypeCheck" Type="Double">*</asp:CompareValidator>

                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Version") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ReleaseDate" SortExpression="ReleaseDate">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEditReleaseDate" runat="server" Text='<%# Bind("ReleaseDate") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEditReleaseDate" runat="server" ControlToValidate="txtEditReleaseDate" ErrorMessage="Release Date is a field.">*</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="cvEditReleaseDate" runat="server" ControlToValidate="txtEditReleaseDate" ErrorMessage="Please enter a valid release date." Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator>


                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("ReleaseDate") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="True" />
                <asp:CommandField ShowDeleteButton="True" />
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

        <asp:SqlDataSource ID="sdsBallGames" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:BallGamesConnectionString %>" DeleteCommand="DELETE FROM [Software] WHERE [SoftwareID] = ?" InsertCommand="INSERT INTO [Software] ([SoftwareID], [Name], [Version], [ReleaseDate]) VALUES (?, ?, ?, ?)" OldValuesParameterFormatString="original_{0}" ProviderName="<%$ ConnectionStrings:BallGamesConnectionString.ProviderName %>" SelectCommand="SELECT [SoftwareID], [Name], [Version], [ReleaseDate] FROM [Software] ORDER BY [SoftwareID]" UpdateCommand="UPDATE [Software] SET [Name] = ?, [Version] = ?, [ReleaseDate] = ? WHERE [SoftwareID] = ? AND [Name] = ? AND [Version] = ? AND [ReleaseDate] = ?">
            <DeleteParameters>
                <asp:Parameter Name="original_SoftwareID" Type="String" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_Version" Type="Decimal" />
                <asp:Parameter Name="original_ReleaseDate" Type="DateTime" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="SoftwareID" Type="String" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Version" Type="Decimal" />
                <asp:Parameter Name="ReleaseDate" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Version" Type="Decimal" />
                <asp:Parameter Name="ReleaseDate" Type="DateTime" />
                <asp:Parameter Name="original_SoftwareID" Type="String" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_Version" Type="Decimal" />
                <asp:Parameter Name="original_ReleaseDate" Type="DateTime" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:ValidationSummary ID="vsGridViewSummary" runat="server" />
        <br />

        <asp:Label ID="lblError" runat="server"></asp:Label>
        <br />
        <br />



        <div id="newSoftware">
          
            <h3>Add new software: </h3>
            <br />
            <asp:Label ID="lblSoftwareID" CssClass="label" runat="server" Text="Software ID: "></asp:Label>
            <asp:TextBox ID="txtSoftwareID" CssClass="txtBox" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvSoftwareID" runat="server" ControlToValidate="txtSoftwareID" Display="Dynamic" ErrorMessage="Software ID is a required field." ValidationGroup="newSoftwareValidation">*</asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="lblName" CssClass="label" runat="server" Text="Name: "></asp:Label>
            <asp:TextBox ID="txtName" CssClass="txtBox" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" Display="Dynamic" ErrorMessage="Name is a required field." ValidationGroup="newSoftwareValidation">*</asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="lblVersion" CssClass="label" runat="server" Text="Version: "></asp:Label>
            <asp:TextBox ID="txtVersion" CssClass="txtBox" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvVersion" runat="server" ControlToValidate="txtVersion" Display="Dynamic" ErrorMessage="Version is a required field." ValidationGroup="newSoftwareValidation">*</asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cvVersion" runat="server" ControlToValidate="txtVersion" ErrorMessage="Please enter a valid version." Operator="DataTypeCheck" Type="Double" ValidationGroup="newSoftwareValidation">*</asp:CompareValidator>
            <br />
            <asp:Label ID="lblReleaseDate" CssClass="label" runat="server" Text="Release Date: "></asp:Label>
            <asp:TextBox ID="txtReleaseDate" CssClass="txtBox" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvReleaseDate" runat="server" ControlToValidate="txtReleaseDate" ErrorMessage="Release Date is a field." ValidationGroup="newSoftwareValidation">*</asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cvReleaseDate" runat="server" ControlToValidate="txtReleaseDate" ErrorMessage="Please enter a valid release date." Operator="DataTypeCheck" Type="Date" ValidationGroup="newSoftwareValidation">*</asp:CompareValidator>
            <br />
            <asp:Button ID="btnAddToSoftware" runat="server" Text="Add" OnClick="btnAddToSoftware_Click" ValidationGroup="newSoftwareValidation" />
            <br />
            <br />
            <asp:ValidationSummary ID="vsNewSoftware" runat="server" HeaderText="Please fix the following errors:" ValidationGroup="newSoftwareValidation" />
                </div>
        </div>
    
</asp:Content>


