using System;
using System.Diagnostics;

/// <author>
///     Daniel Burkhart
/// </author>
/// <version>
///     3/4/15
/// </version>
/// <summary>
///     Code for the feedback objects.
/// </summary>
public class Feedback
{
    /// <summary>
    ///     Gets or sets the feedback identifier.
    /// </summary>
    /// <value>
    ///     The feedback identifier.
    /// </value>
    public string FeedbackId
    {
        get { return this._feedbackId; }
        set
        {
            Trace.Assert(value != null, "Invalid Data");
            this._feedbackId = value;
        }
    }

    /// <summary>
    ///     Gets or sets the customer identifier.
    /// </summary>
    /// <value>
    ///     The customer identifier.
    /// </value>
    public string CustomerId
    {
        get { return this._customerId; }
        set
        {
            Trace.Assert(value != null, "Invalid Data");
            this._customerId = value;
        }
    }

    /// <summary>
    ///     Gets or sets the software identifier.
    /// </summary>
    /// <value>
    ///     The software identifier.
    /// </value>
    public string SoftwareId
    {
        get { return this._softwareId; }
        set
        {
            Trace.Assert(value != null, "Invalid Data");
            this._softwareId = value;
        }
    }

    /// <summary>
    ///     Gets or sets the support identifier.
    /// </summary>
    /// <value>
    ///     The support identifier.
    /// </value>
    public string SupportId
    {
        get { return this._supportId; }
        set
        {
            Trace.Assert(value != null, "Invalid Data");
            this._supportId = value;
        }
    }

    /// <summary>
    ///     Gets or sets the date opened.
    /// </summary>
    /// <value>
    ///     The date opened.
    /// </value>
    public string DateOpened
    {
        get { return this._dateOpened; }
        set
        {
            Trace.Assert(value != null, "Invalid Data");
            this._dateOpened = value;
        }
    }

    /// <summary>
    ///     Gets or sets the date closed.
    /// </summary>
    /// <value>
    ///     The date closed.
    /// </value>
    public string DateClosed
    {
        get { return this._dateClosed; }
        set
        {
            Trace.Assert(value != null, "Invalid Data");
            this._dateClosed = value;
        }
    }
    

    /// <summary>
    ///     Gets or sets the title.
    /// </summary>
    /// <value>
    ///     The title.
    /// </value>
    public string Title
    {
        get { return this._title; }
        set
        {
            Trace.Assert(value != null, "Invalid Data");
            this._title = value;
        }
    }

    /// <summary>
    ///     Gets or sets the description.
    /// </summary>
    /// <value>
    ///     The description.
    /// </value>
    public string Description
    {
        get { return this._description; }
        set
        {
            Trace.Assert(value != null, "Invalid Data");
            this._description = value;
        }
    }

    /// <summary>
    ///     The _customer identifier
    /// </summary>
    private string _customerId;

    /// <summary>
    ///     The _date closed
    /// </summary>
    private string _dateClosed;

    /// <summary>
    ///     The _date opened
    /// </summary>
    private string _dateOpened;

    /// <summary>
    ///     The _description
    /// </summary>
    private string _description;

    /// <summary>
    ///     The _feedback identifier
    /// </summary>
    private string _feedbackId;

    /// <summary>
    ///     The _software identifier
    /// </summary>
    private string _softwareId;

    /// <summary>
    ///     The _support identifier
    /// </summary>
    private string _supportId;

    /// <summary>
    ///     The _title
    /// </summary>
    private string _title;

    /// <summary>
    ///     Formats the feedback.
    /// </summary>
    /// <returns>Returns a formatted string.</returns>
    public string FormatFeedback()
    {
        var dateClosed = this.DateClosed.Split();

        var resultString = "Feedback for software " + this.SoftwareId +
                           " closed " + dateClosed[0] +
                           " (" + this.Title + ")";
        return resultString;
    }
}