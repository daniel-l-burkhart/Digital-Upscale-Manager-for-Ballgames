<%@ Page Title="" Language="C#" MasterPageFile="~/BallgamesMasterPage.master" AutoEventWireup="true" CodeFile="MaintainSupport.aspx.cs" Inherits="MaintainSupport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="bodyContent" ContentPlaceHolderID="contentPlaceHolder" runat="Server">
    <div id="margin">
        <h2>Please choose a staff member to see their information below.</h2>
        <br />
        <asp:DropDownList ID="ddlSupport" runat="server" AutoPostBack="True" DataSourceID="sdsSupport" DataTextField="Name" DataValueField="SupportID"></asp:DropDownList>
        <br />
        <br />
        <br />
        <asp:SqlDataSource ID="sdsSupport" runat="server" ConnectionString="<%$ ConnectionStrings:BallGamesConnectionString %>" ProviderName="<%$ ConnectionStrings:BallGamesConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Support]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Support] WHERE [SupportID] = ? AND [Name] = ? AND [Email] = ? AND [Phone] = ?" InsertCommand="INSERT INTO [Support] ([SupportID], [Name], [Email], [Phone]) VALUES (?, ?, ?, ?)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Support] SET [Name] = ?, [Email] = ?, [Phone] = ? WHERE [SupportID] = ? AND [Name] = ? AND [Email] = ? AND [Phone] = ?">
            <DeleteParameters>
                <asp:Parameter Name="original_SupportID" Type="Int32" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_Email" Type="String" />
                <asp:Parameter Name="original_Phone" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="SupportID" Type="Int32" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Phone" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Phone" Type="String" />
                <asp:Parameter Name="original_SupportID" Type="Int32" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_Email" Type="String" />
                <asp:Parameter Name="original_Phone" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:FormView ID="fvSupport" runat="server" CellPadding="4" DataKeyNames="SupportID" DataSourceID="sdsSupportFormView" ForeColor="#333333" OnItemDeleted="fvSupport_ItemDeleted" OnItemInserted="fvSupport_ItemInserted" OnItemUpdated="fvSupport_ItemUpdated">
            <EditItemTemplate>
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="lblSupportID" runat="server" Text="Support ID:" ForeColor="White"></asp:Label>
                        </td>

                        <td>
                            <asp:Label ID="SupportIDLabel1" runat="server" Text='<%# Eval("SupportID") %>' ForeColor="White" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblName" runat="server" Text="Name:" ForeColor="White"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="Name is a required field." ControlToValidate="NameTextBox" Display="Dynamic">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblEmail" runat="server" Text="Email:" ForeColor="White"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Email is a required field." ControlToValidate="EmailTextBox" Display="Dynamic">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="Please enter a valid email." ControlToValidate="EmailTextBox" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblPhone" runat="server" Text="Phone:" ForeColor="White"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="PhoneTextBox" runat="server" Text='<%# Bind("Phone") %>' />
                        </td>
                        <td>
                            <asp:RegularExpressionValidator ID="revPhone" runat="server" ControlToValidate="PhoneTextBox" Display="Dynamic" ErrorMessage="Please enter a valid phone number." ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}">*</asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="PhoneTextBox" Display="Dynamic" ErrorMessage="Phone is a required field">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:LinkButton ID="UpdateButton" runat="server" ForeColor="white" CausesValidation="True" CommandName="Update" Text="Update" />
                     
                            <asp:LinkButton ID="UpdateCancelButton" ForeColor="white" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </td>
                    </tr>
                </table>

            </EditItemTemplate>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <InsertItemTemplate>

                <table>
                    <tr>
                        <td>
                            <asp:Label ID="lblSupportID" runat="server" Text="Support ID:" ForeColor="White"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="SupportID" runat="server" Text='<%# Bind("SupportID") %>' />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfvSupportID" runat="server" ErrorMessage="Support ID is a required field." ControlToValidate="SupportID" Display="Dynamic">*</asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="cvSupportID" runat="server" ErrorMessage="Please enter a valid support ID." Type="Integer" ControlToValidate="SupportID" Operator="DataTypeCheck" Display="Dynamic">*</asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblName" runat="server" Text="Name:" ForeColor="White"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="Name is a required field." ControlToValidate="NameTextBox" Display="Dynamic">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblEmail" runat="server" Text="Email:" ForeColor="White"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Email is a required field." ControlToValidate="EmailTextBox" Display="Dynamic">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="Please enter a valid email." ControlToValidate="EmailTextBox" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                        </td>

                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblPhone" runat="server" Text="Phone:" ForeColor="White"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="PhoneTextBox" runat="server" Text='<%# Bind("Phone") %>' />
                        </td>
                        <td>
                            <asp:RegularExpressionValidator ID="revPhone" runat="server" ControlToValidate="PhoneTextBox" Display="Dynamic" ErrorMessage="Please enter a valid phone number." ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}">*</asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="PhoneTextBox" Display="Dynamic" ErrorMessage="Phone is a required field">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:LinkButton ID="InsertButton" runat="server" ForeColor="white" CausesValidation="True" CommandName="Insert" Text="Insert" />

                            <asp:LinkButton ID="InsertCancelButton" ForeColor="white" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </td>
                    </tr>
                </table>
            </InsertItemTemplate>
            <ItemTemplate>
                <table>
                    <tr>
                        <td>SupportID: </td>
                        <td>
                            <asp:Label ID="SupportIDLabel" runat="server" Text='<%# Eval("SupportID") %>' /></td>
                    </tr>
                    <tr>
                        <td>Name: </td>
                        <td>
                            <asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>' /></td>
                    </tr>
                    <tr>
                        <td>Email: </td>
                        <td>
                            <asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("Email") %>' /></td>
                    </tr>
                    <tr>
                        <td>Phone: </td>
                        <td>
                            <asp:Label ID="PhoneLabel" runat="server" Text='<%# Bind("Phone") %>' /></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                            <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />

                            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" /></td>
                    </tr>
                </table>

            </ItemTemplate>
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
        </asp:FormView>
        <br />
        <asp:ValidationSummary ID="vsSupport" runat="server" />
        <br />
        <asp:SqlDataSource ID="sdsSupportFormView" runat="server" ConflictDetection="CompareAllValues"
            ConnectionString="<%$ ConnectionStrings:BallGamesConnectionString %>"
            DeleteCommand="DELETE FROM [Support] WHERE [SupportID] = ? AND [Name] = ? AND [Email] = ? AND [Phone] = ?"
            InsertCommand="INSERT INTO [Support] ([SupportID], [Name], [Email], [Phone]) VALUES (?, ?, ?, ?)"
            OldValuesParameterFormatString="original_{0}"
            ProviderName="<%$ ConnectionStrings:BallGamesConnectionString.ProviderName %>"
            SelectCommand="SELECT * FROM [Support] WHERE ([SupportID] = ?)"
            UpdateCommand="UPDATE [Support] SET [Name] = ?, [Email] = ?, [Phone] = ? WHERE [SupportID] = ? AND [Name] = ? AND [Email] = ? AND [Phone] = ?">
            <DeleteParameters>
                <asp:Parameter Name="original_SupportID" Type="Int32" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_Email" Type="String" />
                <asp:Parameter Name="original_Phone" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="SupportID" Type="Int32" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Phone" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlSupport" Name="SupportID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Phone" Type="String" />
                <asp:Parameter Name="original_SupportID" Type="Int32" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_Email" Type="String" />
                <asp:Parameter Name="original_Phone" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <asp:Label ID="lblError" SkinID="error" runat="server"></asp:Label>
    </div>
</asp:Content>


