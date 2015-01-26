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
        var stringForDisplay = this.Customer.CustomerName + " " + this.Customer.Address
                               + " " + this.Customer.City + ", " + this.Customer.State + " " +
                               this.Customer.ZipCode + " " + this.Customer.PhoneNumber
                               + " " + this.Customer.EmailAddress;
        return stringForDisplay;
    }
}