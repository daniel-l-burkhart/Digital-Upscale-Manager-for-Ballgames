using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
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
[DataObject(true)]
public static class FeedbackDatabase
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

    /// <summary>
    ///     Gets the customer feedback.
    /// </summary>
    /// <param name="customerId">The customer identifier.</param>
    /// <returns></returns>
    [DataObjectMethod(DataObjectMethodType.Select)]
    public static IEnumerable GetCustomerFeedback(int customerId)
    {
        var feedbackList = new List<Feedback>();
        var connection = new OleDbConnection(BallgameDatabase.GetConnectionString());

        const string selection = "SELECT SupportID, SoftwareID, DateOpened, DateClosed, Title, Description " +
                                 "FROM Feedback " +
                                 "WHERE CustomerID = @CustomerID " +
                                 "ORDER BY SupportID";

        var command = new OleDbCommand(selection, connection);
        command.Parameters.AddWithValue("CustomerID", customerId);
        connection.Open();
        var dataReader = command.ExecuteReader();
        while (dataReader != null && dataReader.Read())
        {
            var currFeedback = new Feedback
            {
                SupportId = dataReader["SupportID"].ToString(),
                SoftwareId = dataReader["SoftwareID"].ToString(),
                DateOpened = dataReader["DateOpened"].ToString(),
                DateClosed = dataReader["DateClosed"].ToString(),
                Title = dataReader["Title"].ToString(),
                Description = dataReader["Description"].ToString()
            };
            feedbackList.Add(currFeedback);
        }

        return feedbackList;
    }

    /// <summary>
    ///     Updates the specified original feedback.
    /// </summary>
    /// <param name="originalFeedback">The original feedback.</param>
    /// <param name="feedback">The feedback.</param>
    /// <returns></returns>
    [DataObjectMethod(DataObjectMethodType.Update)]
    public static object Update(Feedback originalFeedback, Feedback feedback)
    {
        const string update = "UPDATE Feedback " +
                              "SET DateClosed = @DateClosed, "
                              + "Description = @Description " +
                              "WHERE Description = @originalDescription";

        var connection = new OleDbConnection(BallgameDatabase.GetConnectionString());

        var command = new OleDbCommand(update, connection);

        if (Convert.ToDateTime(feedback.DateClosed) == Convert.ToDateTime("01/01/0001 12:00:00 AM"))
        {
            command.Parameters.AddWithValue("DateClosed", DBNull.Value);
        }
        else
        {
            command.Parameters.AddWithValue("DateClosed", feedback.DateClosed);
        }

        command.Parameters.AddWithValue("Description", feedback.Description);

        command.Parameters.AddWithValue("originalDescription", originalFeedback.Description);

        connection.Open();

        var updateCount = command.ExecuteNonQuery();

        connection.Close();

        return updateCount;
    }
}