﻿using System;
using System.Web.UI;

/// <author>
///     Daniel Burkhart
/// </author>
/// <version>
///     3/4/15
/// </version>
/// <summary>
///     The code for the page that allows the user to view their current contact list and edit or clear that list.
/// </summary>
public partial class ContactList : Page
{
    /// <summary>
    ///     The _customer list
    /// </summary>
    private CustomerList _customerList;

    /// <summary>
    ///     Handles the Load event of the Page control.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">The <see cref="EventArgs" /> instance containing the event data.</param>
    protected void Page_Load(object sender, EventArgs e)
    {
        this._customerList = new CustomerList();
        this._customerList = CustomerList.GetCustomers();
        if (!IsPostBack)
        {
            this.DisplayCustomers();
        }
    }

    /// <summary>
    ///     Displays the customers.
    /// </summary>
    private void DisplayCustomers()
    {
        this.firstCustomerList.Items.Clear();
        this._customerList.CustomerListSort();
        for (var i = 0; i < this._customerList.Count; i++)
        {
            var customerForList = this._customerList[i];
            this.firstCustomerList.Items.Add(customerForList.Display());
        }
    }

    /// <summary>
    ///     Handles the Click event of the btnRemove control.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">The <see cref="EventArgs" /> instance containing the event data.</param>
    protected void btnRemove_Click(object sender, EventArgs e)
    {
        if (this._customerList.Count > 0)
        {
            this.RemoveCustomer();
        }
    }

    /// <summary>
    ///     Removes the customer.
    /// </summary>
    private void RemoveCustomer()
    {
        if (this.firstCustomerList.SelectedIndex > -1)
        {
            this._customerList.RemoveAt(this.firstCustomerList.SelectedIndex);
            this.DisplayCustomers();
        }
        else
        {
            this.lblMessage.Text = "Please select the customer you want to remove.";
        }
    }

    /// <summary>
    ///     Handles the Click event of the btnEmpty control.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">The <see cref="EventArgs" /> instance containing the event data.</param>
    protected void btnEmpty_Click(object sender, EventArgs e)
    {
        if (this._customerList.Count <= 0)
        {
            return;
        }
        this._customerList.Clear();
        this.firstCustomerList.Items.Clear();
    }

    /// <summary>
    ///     Handles the Click event of the btnHomeButton control.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">The <see cref="EventArgs" /> instance containing the event data.</param>
    protected void btnHomeButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}