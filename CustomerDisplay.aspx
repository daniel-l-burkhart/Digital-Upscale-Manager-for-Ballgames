<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CustomerDisplay.aspx.cs" Inherits="CustomerDisplay" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <label>Please select a product&nbsp;</label>

        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/Digital Manager.mdb" SelectCommand="SELECT * FROM [Customer]"></asp:AccessDataSource>
        <br />
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="AccessDataSource1" DataTextField="Name" DataValueField="CustomerID">
        </asp:DropDownList>
        <br />
        <div id="productData">
            <asp:Label ID="lblName" runat="server"></asp:Label>
            <asp:Label ID="lblShortDescription" runat="server"></asp:Label>
            <asp:Label ID="lblLongDescription" runat="server"></asp:Label>
            <asp:Label ID="lblUnitPrice" runat="server"></asp:Label>
            <label id="lblQuantity">Quantity&nbsp;</label>
            <asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="validator"
                    runat="server" ControlToValidate="txtQuantity" Display="Dynamic" 
                    ErrorMessage="Quantity is a required field."></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="RangeValidator1" runat="server" CssClass="validator" 
                    ControlToValidate="txtQuantity" Display="Dynamic" 
                    ErrorMessage="Quantity must range from 1 to 500."
                    MaximumValue="500" MinimumValue="1" Type="Integer"></asp:RangeValidator><br />
        </div>
    </form>
</body>
</html>
