<%@ Page Title="" Language="C#" MasterPageFile="~/BallgamesMasterPage.master" AutoEventWireup="true" CodeFile="Software.aspx.cs" Inherits="Software" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="Styles/Software.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="ContentHolder" ContentPlaceHolderID="contentPlaceHolder" Runat="Server">
    <div id="margin">
    <br/>
    <asp:Label ID="lblSoftware" runat="server" Text="Software:"></asp:Label>
    <br/>
    <asp:GridView ID="gvSoftware" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="SoftwareID" DataSourceID="sdsSoftware" ForeColor="#333333" GridLines="None" Width="800px" OnRowUpdated="gvSoftware_RowUpdated">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="SoftwareID" HeaderText="SoftwareID" ReadOnly="True" SortExpression="SoftwareID" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Name" SortExpression="Name">
                <EditItemTemplate>
                    <asp:TextBox ID="txtSoftwareName" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>

                    <asp:RequiredFieldValidator ID="rfvSoftwareName" ControlToValidate="txtSoftwareName" runat="server" Display="Dynamic" ErrorMessage="Software Name is a required field.">*</asp:RequiredFieldValidator>

                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Version" SortExpression="Version">
                <EditItemTemplate>
                    <asp:TextBox ID="txtVersion" runat="server" Text='<%# Bind("Version") %>'></asp:TextBox>


                    <asp:RequiredFieldValidator ID="rfvVersion" runat="server" ControlToValidate="txtVersion" Display="Dynamic" ErrorMessage="Version is a required field.">*</asp:RequiredFieldValidator>


                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Version") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ReleaseDate" SortExpression="ReleaseDate">
                <EditItemTemplate>
                    <asp:TextBox ID="txtReleaseDate" runat="server" Text='<%# Bind("ReleaseDate") %>'></asp:TextBox>

                    <asp:RequiredFieldValidator ID="rfvReleaseDate" runat="server" ControlToValidate="txtReleaseDate" Display="Dynamic" ErrorMessage="Release date is a required field.">*</asp:RequiredFieldValidator>

                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("ReleaseDate") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
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
    <asp:ValidationSummary ID="vsSoftware" runat="server" HeaderText="Please fix the following errors:" />
    <br />
    <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
    <br />
    <br />
    <asp:SqlDataSource ID="sdsSoftware" runat="server" ConnectionString="<%$ ConnectionStrings:BallGamesConnectionString %>" OldValuesParameterFormatString="original_{0}" ProviderName="<%$ ConnectionStrings:BallGamesConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Software] ORDER BY [SoftwareID]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Software] WHERE [SoftwareID] = ? AND [Name] = ? AND [Version] = ? AND [ReleaseDate] = ?" InsertCommand="INSERT INTO [Software] ([SoftwareID], [Name], [Version], [ReleaseDate]) VALUES (?, ?, ?, ?)" UpdateCommand="UPDATE [Software] SET [Name] = ?, [Version] = ?, [ReleaseDate] = ? WHERE [SoftwareID] = ? AND [Name] = ? AND [Version] = ? AND [ReleaseDate] = ?">
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
       <div>
           <h3>Add new software: </h3>
           <br/>
           <asp:Label ID="lblSoftwareID" CssClass="label" runat="server" Text="Software ID: "></asp:Label>
           <asp:TextBox ID="txtSoftwareID" CssClass="txtBox" runat="server"></asp:TextBox>
           <asp:RequiredFieldValidator ID="rfvSoftwareID" runat="server" ControlToValidate="txtSoftwareID" Display="Dynamic" ErrorMessage="Software ID is a required field." ValidationGroup="newSoftwareValidation">*</asp:RequiredFieldValidator>
           <br/>
           <asp:Label ID="lblName" CssClass="label" runat="server" Text="Name: "></asp:Label>
           <asp:TextBox ID="txtName" CssClass="txtBox" runat="server"></asp:TextBox>
           <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" Display="Dynamic" ErrorMessage="Name is a required field." ValidationGroup="newSoftwareValidation">*</asp:RequiredFieldValidator>
           <br/>
           <asp:Label ID="lblVersion" CssClass="label" runat="server" Text="Version: "></asp:Label>
           <asp:TextBox ID="txtVersion" CssClass="txtBox" runat="server"></asp:TextBox>
           <asp:RequiredFieldValidator ID="rfvVersion" runat="server" ControlToValidate="txtVersion" Display="Dynamic" ErrorMessage="Version is a required field." ValidationGroup="newSoftwareValidation">*</asp:RequiredFieldValidator>
           <asp:CompareValidator ID="cvVersion" runat="server" ControlToValidate="txtVersion" ErrorMessage="Please enter a valid version." Operator="DataTypeCheck" Type="Double" ValidationGroup="newSoftwareValidation">*</asp:CompareValidator>
           <br/>
           <asp:Label ID="lblReleaseDate" CssClass="label" runat="server" Text="Release Date: "></asp:Label>
           <asp:TextBox ID="txtReleaseDate" CssClass="txtBox" runat="server"></asp:TextBox>
           <asp:RequiredFieldValidator ID="rfvReleaseDate" runat="server" ControlToValidate="txtReleaseDate" ErrorMessage="Release Date is a field." ValidationGroup="newSoftwareValidation">*</asp:RequiredFieldValidator>
           <asp:CompareValidator ID="cvReleaseDate" runat="server" ControlToValidate="txtReleaseDate" ErrorMessage="Please enter a valid release date." Operator="DataTypeCheck" Type="Date" ValidationGroup="newSoftwareValidation">*</asp:CompareValidator>
           <br/>
           <asp:Button ID="btnAddToSoftware" runat="server" Text="Add" OnClick="btnAddToSoftware_Click" ValidationGroup="newSoftwareValidation" />
           <br />
           <br />
           <asp:ValidationSummary ID="vsNewSoftware" runat="server" HeaderText="Please fix the following errors:" ValidationGroup="newSoftwareValidation" />
       </div>
        </div>
</asp:Content>


