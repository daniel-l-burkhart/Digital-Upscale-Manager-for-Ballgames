﻿using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Data.SqlClient;

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

    public static List<Feedback> GetCustomerFeedback(int customerId)
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

    public static int UpdateFeedback(Feedback original_Feedback, Feedback newFeedback)
    {
        const string update = "SET DateClosed = @DateClosed, Description = @Description " +
                              "WHERE FeedbackID = @original_FeedbackID";

        var connection = new OleDbConnection(BallgameDatabase.GetConnectionString());
        var command = new OleDbCommand(update, connection);
        if (newFeedback.DateClosed == null)
        {
            command.Parameters.AddWithValue("DateClosed", DBNull.Value);
        }
        else
        {
            command.Parameters.AddWithValue("DateClosed", newFeedback.DateClosed);
        }

        command.Parameters.AddWithValue("Description", newFeedback.Description);
        command.Parameters.AddWithValue("original_FeedbackID", original_Feedback.FeedbackId);
        connection.Open();
        var updateCount = command.ExecuteNonQuery();
        return updateCount;
    }
}