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


    [DataObjectMethod(DataObjectMethodType.Update)]
    public static object Update(Feedback originalFeedback, Feedback feedback)
    {
        const string update = "UPDATE Feedback " +
                              "SET DateClosed = @DateClosed, "
                              + "Description = @Description " +
                              "WHERE DateClosed = @originalDateClosed " +
                              "AND Description = @originalDescription";

        var connection = new OleDbConnection(BallgameDatabase.GetConnectionString());

        var command = new OleDbCommand(update, connection);

        if (feedback.DateClosed == null)
        {
            command.Parameters.AddWithValue("DateClosed", DBNull.Value);
        }
        else
        {
            command.Parameters.AddWithValue("DateClosed", feedback.DateClosed);
        }

        command.Parameters.AddWithValue("Description", feedback.Description);

        command.Parameters.AddWithValue("originalDateClosed", originalFeedback.DateClosed);
  
        command.Parameters.AddWithValue("originalDescription", originalFeedback.Description);

        connection.Open();

        var updateCount = command.ExecuteNonQuery();

        connection.Close();

        return updateCount;
    }
}