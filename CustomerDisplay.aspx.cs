using System;
using System.Data;
using System.Web.UI;

/// <author>
///     Daniel Burkhart
/// </author>
/// <version>
///     Spring 2015
/// </version>
/// <summary>
///     Page that displays the information of the customer after it is selected
/// </summary>
public partial class CustomerDisplay : Page
{
    /// <summary>
    ///     The _current customer
    /// </summary>
    private Customer _currentCustomer;

    /// <summary>
    ///     Selecteds the customer.
    /// </summary>
    /// <returns></returns>
    private Customer SelectedCustomer()
    {
        var customerTable = (DataView)
            this.AccessDataSource1.Select(DataSourceSelectArguments.Empty);

        if (customerTable == null)
        {
            return null;
        }
        customerTable.RowFilter =
            "CustomerID = '" + this.ddlCustomerList.SelectedValue + "'";
        var row = customerTable[0];

        var selectedCustomer = new Customer
        {
            CustomerId = row["CustomerID"].ToString(),
            CustomerName = row["Name"].ToString(),
            Address = row["Address"].ToString(),
            City = row["City"].ToString(),
            State = row["State"].ToString(),
            ZipCode = row["ZipCode"].ToString(),
            PhoneNumber = row["Phone"].ToString(),
            EmailAddress = row["Email"].ToString()
        };

        return selectedCustomer;
    }

    /// <summary>
    ///     Handles the Load event of the Page control.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">The <see cref="EventArgs" /> instance containing the event data.</param>
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.ddlCustomerList.DataBind();
        }

        this._currentCustomer = this.SelectedCustomer();

        this.lblName.Text = this._currentCustomer.CustomerName;
        this.lblAddress.Text = this._currentCustomer.Address;
        this.lblCity.Text = this._currentCustomer.City + ",";
        this.lblState.Text = this._currentCustomer.State;
        this.lblZipCode.Text = this._currentCustomer.ZipCode;
        this.lblPhone.Text = this._currentCustomer.PhoneNumber;
        this.lblEmail.Text = this._currentCustomer.EmailAddress;
    }

    protected void btnAddToContacts_Click(object sender, EventArgs e)
    {
        if (!Page.IsValid)
        {
            return;
        }
        var customerList = CustomerList.GetCustomers();
        var customerItem = customerList[this._currentCustomer.CustomerId];
        if (customerItem == null)
        {
            customerList.AddCustomer(this._currentCustomer);
        }
        else
        {
            this.alreadyBeenAdded();
        }
        Response.Redirect("ContactList.aspx");
    }

    private void alreadyBeenAdded()
    {
        
    }

    protected void btnViewContactList_Click(object sender, EventArgs e)
    {
        Response.Redirect("ContactList.aspx");
    }
}