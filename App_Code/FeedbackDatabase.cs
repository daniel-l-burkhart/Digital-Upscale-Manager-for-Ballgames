using System.Collections;
using System.Data.OleDb;

/// <summary>
///     Summary description for FeedbackDatabase
/// </summary>
/// <author>
///     Daniel Burkhart
/// </author>
/// <version>
///     Spring 2015
/// </version>
public class FeedbackDatabase
{
    /// <summary>
    ///     Gets the open feedback incidents.
    /// </summary>
    /// <param name="supportStaffId">The support staff identifier.</param>
    /// <returns></returns>
    public static IEnumerable GetOpenFeedbackIncidents(int supportStaffId)
    {
        var connection =
            new OleDbConnection(BallgameDatabase.GetConnectionString());

        const string selection = "SELECT DateOpened, SoftwareID, Name " +
                                 "FROM Feedback " +
                                 "INNER JOIN Customer ON Feedback.CustomerID = Customer.CustomerID " +
                                 "WHERE SupportID = @SupportID AND DateClosed IS NULL " +
                                 "ORDER BY DateOpened";

        var command = new OleDbCommand(selection, connection);
        command.Parameters.AddWithValue("SupportID", supportStaffId);
        connection.Open();
        var dataReader = command.ExecuteReader();
        return dataReader;
    }

    public static IEnumerable GetCustomerFeedback(int customerId)
    {
        var connection =
    new OleDbConnection(BallgameDatabase.GetConnectionString());

        const string selection = "SELECT DateOpened, SoftwareID, Name " +
                                 "FROM Feedback " +
                                 "INNER JOIN Customer ON Feedback.CustomerID = Customer.CustomerID " +
                                 "WHERE CustomerID = @CustomerID AND DateClosed IS NOT NULL " +
                                 "ORDER BY DateOpened";

        var command = new OleDbCommand(selection, connection);
        command.Parameters.AddWithValue("CustomerID", customerId);
        connection.Open();
        var dataReader = command.ExecuteReader();
        return dataReader;
    }

    public static int UpdateFeedback(Feedback originalFeedback, Feedback newFeedback)
    {
        
    }
}