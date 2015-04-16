using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CustomerDatabase
/// </summary>
public class CustomerDatabase
{
	public CustomerDatabase()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static IEnumerable GetCustomersWithFeedback()
    {
        var connection =
      new OleDbConnection(BallgameDatabase.GetConnectionString());

        const string selection = "SELECT CustomerID, Name FROM Customer " +
                                 "WHERE CustomerID IN " +
                                 "(SELECT DISTINCT CustomerID FROM Feedback WHERE SupportID IS NOT NULL) " +
                                 "ORDER BY Name";

        var command = new OleDbCommand(selection, connection);
        connection.Open();
        var dataReader = command.ExecuteReader();
        return dataReader;
    } 
}