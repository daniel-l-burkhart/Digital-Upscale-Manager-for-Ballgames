using System;
using System.Collections.Generic;

/// <author>
///     Daniel Burkhart
/// </author>
/// <version>
///     3/4/15
/// </version>
/// <summary>
///     Sort for the last name of the customer list
/// </summary>
public class LastNameCustomerSort : IComparer<CustomerListItem>
{
    /// <summary>
    /// Compares the specified first customer.
    /// </summary>
    /// <param name="firstCustomer">The first customer.</param>
    /// <param name="secondCustomer">The second customer.</param>
    /// <returns></returns>
    public int Compare(CustomerListItem firstCustomer, CustomerListItem secondCustomer)
    {
        var firstCustomerName = firstCustomer.Customer.CustomerName.Split();
        var firstCustomerLastName = firstCustomerName[1];

        var secondCustomername = secondCustomer.Customer.CustomerName.Split();
        var secondCustomerLastName = secondCustomername[1];

        return String.Compare(firstCustomerLastName, secondCustomerLastName, StringComparison.Ordinal);
    }
}