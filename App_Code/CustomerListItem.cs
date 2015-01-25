using System;
using System.Diagnostics;

/// <summary>
///     Summary description for CustomerListItem
/// </summary>
public class CustomerListItem
{
    public Customer Customer
    {
        get { return this._customer; }
        set
        {
            Trace.Assert(value != null, "Invalid Data");
            this._customer = value;
        }
    }

    private Customer _customer;

    public CustomerListItem(Customer cusomter)
    {
        this.Customer = cusomter;
    }

    public string Display()
    {
        string stringForDisplay = this.Customer.CustomerName + Environment.NewLine + this.Customer.Address + Environment.NewLine + this.Customer.City+", " +this.Customer.State + " " + this.Customer.ZipCode + Environment.NewLine + this.Customer.PhoneNumber + Environment.NewLine + this.Customer.EmailAddress;
        return stringForDisplay;
    }
}