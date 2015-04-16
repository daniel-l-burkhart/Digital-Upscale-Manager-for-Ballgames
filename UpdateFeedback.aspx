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
        <asp:GridView ID="gvCustomerFeedback" runat="server" AutoGenerateColumns="False" DataSourceID="odsUpdateFeedback" CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" OnRowUpdated="gvCustomerFeedback_RowUpdated" >
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                
                <asp:TemplateField HeaderText="Support ID">
                    <EditItemTemplate>
                       <asp:Label ID="lblSupportID" runat="server" Text='<%# Eval("SupportID") %>' ForeColor="White"></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("SupportID") %>' ></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Software ID">
                    <EditItemTemplate>
                        <asp:Label ID="lblSoftwareID" runat="server" Text='<%# Eval("SoftwareID") %>' ForeColor="White"></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("SoftwareID") %>' ></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Date Opened">
                    <EditItemTemplate>
                        <asp:Label ID="lblDateOpened" runat="server" Text='<%# Eval("DateOpened") %>' ForeColor="White"></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("DateOpened") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Date Closed">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtDateClosed" runat="server" Text='<%# Eval("DateClosed") %>'></asp:TextBox>
                        <asp:CompareValidator ID="cvDateClosed" runat="server" ErrorMessage="Please enter a valid date." Display="Dynamic" ControlToValidate="txtDateClosed" Font-Underline="False" Type="Date" Operator="DataTypeCheck">*</asp:CompareValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("DateClosed") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Feedback Title">
                    <EditItemTemplate>
                        <asp:Label ID="lblTitle" runat="server" Text='<%# Bind("Title") %>' ForeColor="White"></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Title") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Feedback Description">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtDescription" runat="server" Text='<%# Bind("Description") %>' TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDescription" ControlToValidate="txtDescription" Display="Dynamic" runat="server" ErrorMessage="Description is a required field.">*</asp:RequiredFieldValidator>
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
            <RowStyle BackColor="#EFF3FB" HorizontalAlign="Center" Width="700px" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <asp:ValidationSummary ID="vsUpdateFeedback" runat="server" />
        <asp:ObjectDataSource ID="odsUpdateFeedback" 
            runat="server" SelectMethod="GetCustomerFeedback" 
            TypeName="FeedbackDatabase" UpdateMethod="UpdateFeedback" >
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlCustomers" Name="customerId" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="original_Feedback" Type="Object" />
                <asp:Parameter Name="newFeedback" Type="Object" />
            </UpdateParameters>
        </asp:ObjectDataSource>
        <br />
        <asp:Label ID="lblError" runat="server" SkinID="error"></asp:Label>
    </div>
</asp:Content>


