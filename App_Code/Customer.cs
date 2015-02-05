using System.Diagnostics;

/// <author>
///     Daniel Burkhart
/// </author>
/// <version>
///     2/5/15
/// </version>
/// <summary>
///     Attributes and description for Customer
/// </summary>
public class Customer
{
    #region Properties

    /// <summary>
    ///     Gets or sets the name of the customer.
    /// </summary>
    /// <value>
    ///     The name of the customer.
    /// </value>
    public string CustomerName
    {
        get { return this._name; }

        set
        {
            Trace.Assert(value != null, "Invalid Data");
            this._name = value;
        }
    }

    /// <summary>
    ///     Gets or sets the address.
    /// </summary>
    /// <value>
    ///     The address.
    /// </value>
    public string Address
    {
        get { return this._addess; }
        set
        {
            Trace.Assert(value != null, "Invalid Data");
            this._addess = value;
        }
    }

    /// <summary>
    ///     Gets or sets the city.
    /// </summary>
    /// <value>
    ///     The city.
    /// </value>
    public string City
    {
        get { return this._city; }
        set
        {
            Trace.Assert(value != null, "Invalid Data");
            this._city = value;
        }
    }

    /// <summary>
    ///     Gets or sets the state.
    /// </summary>
    /// <value>
    ///     The state.
    /// </value>
    public string State
    {
        get { return this._state; }
        set
        {
            Trace.Assert(value != null, "Invalid Data");
            this._state = value;
        }
    }

    /// <summary>
    ///     Gets or sets the zip code.
    /// </summary>
    /// <value>
    ///     The zip code.
    /// </value>
    public string ZipCode
    {
        get { return this._zipCode; }
        set
        {
            Trace.Assert(value != null, "Invalid Data");
            this._zipCode = value;
        }
    }

    /// <summary>
    ///     Gets or sets the phone number.
    /// </summary>
    /// <value>
    ///     The phone number.
    /// </value>
    public string PhoneNumber
    {
        get { return this._phoneNumber; }
        set
        {
            Trace.Assert(value != null, "Invalid Data");
            this._phoneNumber = value;
        }
    }

    /// <summary>
    ///     Gets or sets the email address.
    /// </summary>
    /// <value>
    ///     The email address.
    /// </value>
    public string EmailAddress
    {
        get { return this._email; }
        set
        {
            Trace.Assert(value != null, "Invalid Data");
            this._email = value;
        }
    }

    /// <summary>
    ///     Gets or sets the customer identifier.
    /// </summary>
    /// <value>
    ///     The customer identifier.
    /// </value>
    public string CustomerId
    {
        get { return this._customerId; }
        set
        {
            Trace.Assert(value != null, "Invalid Data");
            this._customerId = value;
        }
    }

    #endregion

    #region Instance Variables

    /// <summary>
    ///     The _addess
    /// </summary>
    private string _addess;

    /// <summary>
    ///     The _city
    /// </summary>
    private string _city;

    /// <summary>
    ///     The _customer identifier
    /// </summary>
    private string _customerId;

    /// <summary>
    ///     The _email
    /// </summary>
    private string _email;

    /// <summary>
    ///     The _name
    /// </summary>
    private string _name;

    /// <summary>
    ///     The _phone number
    /// </summary>
    private string _phoneNumber;

    /// <summary>
    ///     The _state
    /// </summary>
    private string _state;

    /// <summary>
    ///     The _zip code
    /// </summary>
    private string _zipCode;

    #endregion
}