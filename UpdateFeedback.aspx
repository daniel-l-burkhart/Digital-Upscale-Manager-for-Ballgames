<%@ Page Title="" Language="C#" MasterPageFile="~/BallgamesMasterPage.master" AutoEventWireup="true" CodeFile="UpdateFeedback.aspx.cs" Inherits="UpdateFeedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="bodyContent" ContentPlaceHolderID="contentPlaceHolder" runat="Server">
    <div id="margin">
        <h2>Please select a customer to show the existing feedback for the customer.</h2>
        <br />
        <asp:DropDownList ID="ddlCustomers" runat="server" DataSourceID="odsCustomers" DataTextField="Name" DataValueField="CustomerID" AutoPostBack="True"></asp:DropDownList>
        <br />
        <asp:ObjectDataSource ID="odsCustomers" runat="server" SelectMethod="GetCustomersWithFeedback" TypeName="CustomerDatabase"></asp:ObjectDataSource>
        <br />
        <br />
        <asp:GridView ID="gvCustomerFeedback" runat="server" AutoGenerateColumns="False" DataSourceID="odsFeedback" OnRowUpdated="gvCustomerFeedback_RowUpdated" CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center">
            <AlternatingRowStyle BackColor="White" />
            <Columns>

                <asp:TemplateField HeaderText="Software ID" SortExpression="SoftwareId">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" ForeColor="White" Text='<%# Eval("SoftwareId") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("SoftwareId") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Support ID" SortExpression="SupportId">
                    <EditItemTemplate>
                        <asp:Label ID="Label2" runat="server" ForeColor="White" Text='<%# Eval("SupportId") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("SupportId") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Date Opened" SortExpression="DateOpened">
                    <EditItemTemplate>
                        <asp:Label ID="Label3" runat="server" ForeColor="White" Text='<%# Eval("DateOpened") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("DateOpened") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Date Closed" SortExpression="DateClosed">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("DateClosed") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("DateClosed") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Title" SortExpression="Title">
                    <EditItemTemplate>
                        <asp:Label ID="Label4" runat="server" ForeColor="White" Text='<%# Eval("Title") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Title") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Description" SortExpression="Description">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtDescription" runat="server" Text='<%# Bind("Description") %>' TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ControlToValidate="txtDescription" ID="rfvDescription" runat="server" ErrorMessage="Description is a required field.">*</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblDescription" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:CommandField ShowEditButton="True" />

            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>

        <asp:ObjectDataSource
            ID="odsFeedback" runat="server"
            DataObjectTypeName="Feedback"
            SelectMethod="GetCustomerFeedback"
            TypeName="FeedbackDatabase"
            UpdateMethod="Update"
            ConflictDetection="CompareAllValues"
            OnDeleted="odsUpdateFeedback_OnDeleted"
            OnUpdated="odsUpdateFeedback_OnUpdated" 
            OldValuesParameterFormatString="originalFeedback">

            <SelectParameters>
                <asp:ControlParameter ControlID="ddlCustomers" Name="customerId" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="originalFeedback" Type="Object" />
                <asp:Parameter Name="feedback" Type="Object" />
            </UpdateParameters>
        </asp:ObjectDataSource>
        <asp:ValidationSummary ID="vsUpdateFeedback" runat="server" />

        <br />
        <asp:Label ID="lblError" runat="server" SkinID="error"></asp:Label>
    </div>
</asp:Content>


