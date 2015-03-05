using System.Collections.Generic;
using System.Diagnostics;
using System.Web;

/// <author>
///     Daniel Burkhart
/// </author>
/// <version>
///     3/4/15
/// </version>
/// <summary>
///     The list class that holds all the
///     customers that the user adds to the
///     list on the CustomerDisplay Page.
/// </summary>
public class CustomerList
{
    /// <summary>
    ///     Gets the count.
    /// </summary>
    /// <value>
    ///     The count.
    /// </value>
    public int Count
    {
        get { return this._customerList.Count; }
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
        get { return this._customerList[index]; }
        set
        {
            Trace.Assert(value != null, "Invalid Data");
            this._customerList[index] = value;
        }
    }

    /// <summary>
    ///     Gets the <see cref="CustomerListItem" /> with the specified identifier.
    /// </summary>
    /// <value>
    ///     The <see cref="CustomerListItem" />.
    /// </value>
    /// <param name="name">Returning customer with matching name.</param>
    /// <returns>Returns the customer list item.</returns>
    public CustomerListItem this[string name]
    {
        get
        {
            foreach (var currCustomer in this._customerList)
            {
                if (currCustomer.Customer.CustomerName == name)
                {
                    return currCustomer;
                }
            }
            return null;
        }
    }

    /// <summary>
    ///     The _contact list
    /// </summary>
    private readonly List<CustomerListItem> _customerList;

    /// <summary>
    ///     Initializes a new instance of the <see cref="CustomerList" /> class.
    /// </summary>
    public CustomerList()
    {
        this._customerList = new List<CustomerListItem>();
    }

    /// <summary>
    ///     Gets the list.
    /// </summary>
    /// <returns>Returns the Customer List.</returns>
    public static CustomerList GetCustomers()
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
        this._customerList.Add(newCustomer);
    }

    /// <summary>
    ///     Removes at.
    /// </summary>
    /// <param name="index">The index.</param>
    public void RemoveAt(int index)
    {
        this._customerList.RemoveAt(index);
    }

    /// <summary>
    ///     Clears this instance.
    /// </summary>
    public void Clear()
    {
        this._customerList.Clear();
    }

    /// <summary>
    /// Customers the list sort.
    /// </summary>
    public void CustomerListSort()
    {
        this._customerList.Sort(new LastNameCustomerSort());
    }
}