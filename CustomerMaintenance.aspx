<%@ Page Title="" Language="C#" MasterPageFile="~/BallgamesMasterPage.master" AutoEventWireup="true" CodeFile="CustomerMaintenance.aspx.cs" Inherits="CustomerMaintenance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentPlaceHolder" runat="Server">
    <h2>Customer Maintenance</h2>

    <h3>Select a customer to see the detailed information for that customer.</h3>

    <br />
    <asp:GridView ID="gvCustomers" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="sdsCustomers" DataKeyNames="CustomerID" ForeColor="#333333" GridLines="None" PageSize="6" Width="500px" HorizontalAlign="Center">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
            <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
            <asp:CommandField ShowSelectButton="True" />
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
    <asp:SqlDataSource ID="sdsCustomers" runat="server"
        ConnectionString="<%$ ConnectionStrings:BallGamesConnectionString %>"
        ProviderName="<%$ ConnectionStrings:BallGamesConnectionString.ProviderName %>" SelectCommand="SELECT [CustomerID], [Name], [City], [State] FROM [Customer] ORDER BY [Name]"></asp:SqlDataSource>
    <br />
    <asp:DetailsView ID="dvCustomers" runat="server" AutoGenerateRows="False" CellPadding="4" DataKeyNames="CustomerID" DataSourceID="sdsCustomersDetails" ForeColor="#333333" GridLines="None" Height="50px" Width="125px" HorizontalAlign="Center">
        <AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
        <EditRowStyle BackColor="#2461BF" />
        <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
        <Fields>
            <asp:TemplateField HeaderText="CustomerID" InsertVisible="False" SortExpression="CustomerID">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("CustomerID") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="txtCustomerId" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvCustomerId" runat="server" ControlToValidate="txtCustomerId" Display="Dynamic" ErrorMessage="Customer ID is a required field.">*</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cvCustomerID" runat="server" ControlToValidate="txtCustomerId" Display="Dynamic" ErrorMessage="Please insert a number." Operator="DataTypeCheck" Type="Integer">*</asp:CompareValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("CustomerID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Name" SortExpression="Name">
                <EditItemTemplate>
                    <asp:TextBox ID="txtEditName" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEditName" runat="server" ControlToValidate="txtEditName" Display="Dynamic" ErrorMessage="Name is a required field.">*</asp:RequiredFieldValidator>

                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" Display="Dynamic" ErrorMessage="Name is a required field.">*</asp:RequiredFieldValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Address" SortExpression="Address">
                <EditItemTemplate>
                    <asp:TextBox ID="txtEditAddress" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEditAddress" runat="server" ControlToValidate="txtEditAddress" Display="Dynamic" ErrorMessage="Address is a required field.">*</asp:RequiredFieldValidator>

                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="txtAddress" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="txtAddress" Display="Dynamic" ErrorMessage="Address is a required field.">*</asp:RequiredFieldValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Address") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="City" SortExpression="City">
                <EditItemTemplate>
                    <asp:TextBox ID="txtEditCity" runat="server" Text='<%# Bind("City") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEditCity" runat="server" ControlToValidate="txtEditCity" Display="Dynamic" ErrorMessage="City is a required field.">*</asp:RequiredFieldValidator>

                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="txtCity" runat="server" Text='<%# Bind("City") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvCity" runat="server" ControlToValidate="txtCity" Display="Dynamic" ErrorMessage="City is a required field.">*</asp:RequiredFieldValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("City") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="State" SortExpression="State">
                <EditItemTemplate>
                    <asp:TextBox ID="txtEditState" runat="server" Text='<%# Bind("State") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvSEdittate" runat="server" ControlToValidate="txtEditState" Display="Dynamic" ErrorMessage="State is a required field.">*</asp:RequiredFieldValidator>

                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="txtState" runat="server" Text='<%# Bind("State") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvState" runat="server" ControlToValidate="txtState" Display="Dynamic" ErrorMessage="State is a required field.">*</asp:RequiredFieldValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("State") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ZipCode" SortExpression="ZipCode">
                <EditItemTemplate>
                    <asp:TextBox ID="txtEditZipCode" runat="server" Text='<%# Bind("ZipCode") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEditZipCode" runat="server" ControlToValidate="txtEditZipCode" Display="Dynamic" ErrorMessage="Zip code is a required field.">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEditZipCode" runat="server" ControlToValidate="txtEditZipCode" Display="Dynamic" ErrorMessage="Please enter a valid zip code." ValidationExpression="\d{5}(-\d{4})?">*</asp:RegularExpressionValidator>

                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="txtZipCode" runat="server" Text='<%# Bind("ZipCode") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvZipCode" runat="server" ControlToValidate="txtZipCode" Display="Dynamic" ErrorMessage="Zip code is a required field.">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revZipCode" runat="server" ControlToValidate="txtZipCode" Display="Dynamic" ErrorMessage="Please enter a valid zip code." ValidationExpression="\d{5}(-\d{4})?">*</asp:RegularExpressionValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("ZipCode") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Phone" SortExpression="Phone">
                <EditItemTemplate>
                    <asp:TextBox ID="txtEditPhone" runat="server" Text='<%# Bind("Phone") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator ID="revEditPhone" runat="server" ControlToValidate="txtEditPhone" Display="Dynamic" ErrorMessage="Please enter a valid phone number." ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}">*</asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="rfvEditPhone" runat="server" ControlToValidate="txtEditPhone" Display="Dynamic" ErrorMessage="Phone is a required field.">*</asp:RequiredFieldValidator>

                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="txtPhone" runat="server" Text='<%# Bind("Phone") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator ID="revPhone" runat="server" ControlToValidate="txtPhone" Display="Dynamic" ErrorMessage="Please enter a valid phone number." ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}">*</asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhone" Display="Dynamic" ErrorMessage="Phone is a required field.">*</asp:RequiredFieldValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("Phone") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email" SortExpression="Email">
                <EditItemTemplate>
                    <asp:TextBox ID="txtEditEmail" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEditEmail" runat="server" ControlToValidate="txtEditEmail" Display="Dynamic" ErrorMessage="Email is a required field.">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEditEmail" runat="server" ControlToValidate="txtEditEmail" Display="Dynamic" ErrorMessage="Please enter a valid email." Text="*" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>

                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Email is a required field.">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Please enter a valid email." Text="*" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
        </Fields>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
    </asp:DetailsView>
    <asp:ValidationSummary ID="vsDetailsView" runat="server" HeaderText="Please fix the following errors:" />
    <asp:SqlDataSource ID="sdsCustomersDetails" runat="server" ConnectionString="<%$ ConnectionStrings:BallGamesConnectionString %>" OldValuesParameterFormatString="original_{0}" ProviderName="<%$ ConnectionStrings:BallGamesConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Customer] WHERE ([CustomerID] = ?)">
        <SelectParameters>
            <asp:ControlParameter ControlID="gvCustomers" Name="CustomerID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>


