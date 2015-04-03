<%@ Page Title="" Language="C#" MasterPageFile="~/BallgamesMasterPage.master" AutoEventWireup="true" CodeFile="Software.aspx.cs" Inherits="Software" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="Styles/Software.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="ContentHolder" ContentPlaceHolderID="contentPlaceHolder" runat="Server">
    <div id="margin">
        <br />
        <asp:Label ID="lblSoftware" runat="server" Text="Software:"></asp:Label>
        <br />
          <asp:GridView ID="gvSoftware" runat="server" 
            AutoGenerateColumns="False" DataKeyNames="SoftwareID" 
            DataSourceID="SqlDataSource1" ForeColor="Black" 
            OnRowDeleted="gvSoftware_RowDeleted" OnRowUpdated="gvSoftware_RowUpdated">
            <Columns>
                <asp:BoundField DataField="SoftwareID" HeaderText="SoftwareID" 
                    ReadOnly="True" SortExpression="SoftwareID" >
                </asp:BoundField>
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Version" HeaderText="Version" SortExpression="Version" />
                <asp:BoundField DataField="ReleaseDate" HeaderText="ReleaseDate" SortExpression="ReleaseDate" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            </Columns>
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="White" ForeColor="Black" />
            <AlternatingRowStyle BackColor="#E3EAEB" ForeColor="Black" />
            <EditRowStyle BackColor="#F46D11" ForeColor="White" />
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConflictDetection="CompareAllValues" 
            ConnectionString="<%$ ConnectionStrings:BallGamesConnectionString2 %>" 
            OldValuesParameterFormatString="original_{0}" 

            SelectCommand="SELECT [SoftwareID], [Name], [Version], [ReleaseDate] FROM [Software]" 
            DeleteCommand="DELETE FROM [Software] WHERE [SoftwareID] = ? AND [Name] = ? AND [Version] = ? AND [ReleaseDate] = ?" 
            InsertCommand="INSERT INTO [Software] ([SoftwareID], [Name], [Version], [ReleaseDate]) VALUES (?, ?, ?, ?)" 
            UpdateCommand="UPDATE [Software] SET [Name] = ?, [Version] = ?, [ReleaseDate] = ? WHERE [SoftwareID] = ? AND [Name] = ? AND [Version] = ? AND [ReleaseDate] = ?" ProviderName="<%$ ConnectionStrings:BallGamesConnectionString2.ProviderName %>">
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



        <asp:Label ID="lblError" runat="server"></asp:Label>
        <br />
        <br />



        <div>
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


