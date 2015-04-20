using System.Collections;
using System.Data.OleDb;

/// <author>
///     Daniel Burkhart
/// </author>
/// <version>
///     Spring 2015
/// </version>
/// <summary>
///     Summary description for CustomerDatabase
/// </summary>
public class CustomerDatabase
{
    /// <summary>
    /// Gets the customers with feedback.
    /// </summary>
    /// <returns>Collection of customer feedback</returns>
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