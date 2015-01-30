using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for LastNameCustomerSort
/// </summary>
public class LastNameCustomerSort : IComparer<CustomerListItem>
{

    public int Compare(CustomerListItem firstCustomer, CustomerListItem secondCustomer)
    {
        var firstCustomerName = firstCustomer.Customer.CustomerName.Split();
        var firstCustomerLastName = firstCustomerName[1];
        var secondCustomername = secondCustomer.Customer.CustomerName.Split();
        var secondCustomerLastName = secondCustomername[1];
        return String.Compare(firstCustomerLastName, secondCustomerLastName, StringComparison.Ordinal);
    }
}