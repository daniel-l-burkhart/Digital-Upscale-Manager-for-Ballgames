﻿using System.Diagnostics;

/// <author>
///     Daniel Burkhart
/// </author>
/// <version>
///     3/4/15
/// </version>
/// <summary>
///     Each item of the list that holds the customers.
/// </summary>
public class CustomerListItem
{
    /// <summary>
    ///     Gets or sets the customer.
    /// </summary>
    /// <value>
    ///     The customer.
    /// </value>
    public Customer Customer
    {
        get { return this._customer; }
        set
        {
            Trace.Assert(value != null, "Invalid Data");
            this._customer = value;
        }
    }

    /// <summary>
    ///     The _customer
    /// </summary>
    private Customer _customer;

    /// <summary>
    ///     Initializes a new instance of the <see cref="CustomerListItem" /> class.
    /// </summary>
    /// <param name="cusomter">The cusomter.</param>
    public CustomerListItem(Customer cusomter)
    {
        this.Customer = cusomter;
    }

    /// <summary>
    ///     Displays this instance in a string format to be used by the list page.
    /// </summary>
    /// <returns>Returns the formatted string of the display.</returns>
    public string Display()
    {
        var customerNameSplit = this.Customer.CustomerName.Split(' ');
        var firstName = customerNameSplit[0];
        var lastName = customerNameSplit[1];
        var stringForDisplay = lastName + ", " + firstName + ": " + this.Customer.PhoneNumber
                               + "; " + this.Customer.EmailAddress;
        return stringForDisplay;
    }
}