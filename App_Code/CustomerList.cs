using System.Collections.Generic;
using System.Diagnostics;
using System.Web;

/// <author>
///     Daniel Burkhart
/// </author>
/// <version>
///     Spring 2015
/// </version>
/// <summary>
///     The list class that holds all the customers that the user adds to the list on the CustomerDisplay Page.
/// </summary>
public class CustomerList
{
    #region Instance Variable

    /// <summary>
    ///     The _contact list
    /// </summary>
    private readonly List<CustomerListItem> _contactList;

    #endregion

    #region Constructor

    /// <summary>
    ///     Initializes a new instance of the <see cref="CustomerList" /> class.
    /// </summary>
    public CustomerList()
    {
        this._contactList = new List<CustomerListItem>();
    }

    #endregion

    #region Properties

    /// <summary>
    ///     Gets the count.
    /// </summary>
    /// <value>
    ///     The count.
    /// </value>
    public int Count
    {
        get { return this._contactList.Count; }
    }

    /// <summary>
    ///     Gets or sets the <see cref="CustomerListItem" /> at the specified index.
    /// </summary>
    /// <value>
    ///     The <see cref="CustomerListItem" />.
    /// </value>
    /// <param name="index">The index.</param>
    /// <returns></returns>
    public CustomerListItem this[int index]
    {
        get { return this._contactList[index]; }
        set
        {
            Trace.Assert(value != null, "Invalid Data");
            this._contactList[index] = value;
        }
    }

    /// <summary>
    ///     Gets the <see cref="CustomerListItem" /> with the specified identifier.
    /// </summary>
    /// <value>
    ///     The <see cref="CustomerListItem" />.
    /// </value>
    /// <param name="id">The identifier.</param>
    /// <returns></returns>
    public CustomerListItem this[string id]
    {
        get
        {
            foreach (var currCustomer in this._contactList)
            {
                if (currCustomer.Customer.CustomerId == id)
                {
                    return currCustomer;
                }
            }
            return null;
        }
    }

    #endregion

    #region Methods

    /// <summary>
    ///     Gets the list.
    /// </summary>
    /// <returns></returns>
    public static CustomerList GetList()
    {
        var contactList = (CustomerList) HttpContext.Current.Session["ContactList"];
        if (contactList == null)
        {
            HttpContext.Current.Session["ContactList"] = new CustomerList();
        }
        return (CustomerList) HttpContext.Current.Session["ContactList"];
    }

    /// <summary>
    ///     Adds the customer.
    /// </summary>
    /// <param name="currentCustomer">The current customer.</param>
    public void AddCustomer(Customer currentCustomer)
    {
        var newCustomer = new CustomerListItem(currentCustomer);
        this._contactList.Add(newCustomer);
    }

    /// <summary>
    ///     Removes at.
    /// </summary>
    /// <param name="index">The index.</param>
    public void RemoveAt(int index)
    {
        this._contactList.RemoveAt(index);
    }

    /// <summary>
    ///     Clears this instance.
    /// </summary>
    public void Clear()
    {
        this._contactList.Clear();
    }

    #endregion
}