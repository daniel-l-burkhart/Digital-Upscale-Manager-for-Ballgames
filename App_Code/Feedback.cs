using System.Diagnostics;

/// <author>
/// Daniel Burkhart
/// </author>
/// <version>
/// 2/5/15
/// </version>
/// <summary>
/// Summary description for Feedback
/// </summary>
public class Feedback
{
    /// <summary>
    /// The _customer identifier
    /// </summary>
    private string _customerID;
    /// <summary>
    /// The _date closed
    /// </summary>
    private string _dateClosed;
    /// <summary>
    /// The _date opened
    /// </summary>
    private string _dateOpened;
    /// <summary>
    /// The _description
    /// </summary>
    private string _description;
    /// <summary>
    /// The _feedback identifier
    /// </summary>
    private string _feedbackID;
    /// <summary>
    /// The _software identifier
    /// </summary>
    private string _softwareId;
    /// <summary>
    /// The _support identifier
    /// </summary>
    private string _supportID;
    /// <summary>
    /// The _title
    /// </summary>
    private string _title;

    /// <summary>
    /// Gets or sets the feedback identifier.
    /// </summary>
    /// <value>
    /// The feedback identifier.
    /// </value>
    public string FeedbackId
    {
        get { return this._feedbackID; }
        set
        {
            Trace.Assert(value != null, "Invalid Data");
            this._feedbackID = value;
        }
    }

    /// <summary>
    /// Gets or sets the customer identifier.
    /// </summary>
    /// <value>
    /// The customer identifier.
    /// </value>
    public string CustomerId
    {
        get { return this._customerID; }
        set
        {
            Trace.Assert(value != null, "Invalid Data");
            this._customerID = value;
        }
    }

    /// <summary>
    /// Gets or sets the software identifier.
    /// </summary>
    /// <value>
    /// The software identifier.
    /// </value>
    public string SoftwareID
    {
        get { return this._softwareId; }
        set
        {
            Trace.Assert(value != null, "Invalid Data");
            this._softwareId = value;
        }
    }

    /// <summary>
    /// Gets or sets the support identifier.
    /// </summary>
    /// <value>
    /// The support identifier.
    /// </value>
    public string SupportID
    {
        get { return this._supportID; }
        set
        {
            Trace.Assert(value != null, "Invalid Data");
            this._supportID = value;
        }
    }

    /// <summary>
    /// Gets or sets the date opened.
    /// </summary>
    /// <value>
    /// The date opened.
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
    /// Gets or sets the date closed.
    /// </summary>
    /// <value>
    /// The date closed.
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
    /// Gets or sets the title.
    /// </summary>
    /// <value>
    /// The title.
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
    /// Gets or sets the description.
    /// </summary>
    /// <value>
    /// The description.
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
    /// Formats the feedback.
    /// </summary>
    /// <returns></returns>
    public string FormatFeedback()
    {
        var dateClosed = this.DateClosed.Split();

        var resultString = "Feedback for software " + this.SoftwareID +
                           " closed " + dateClosed[0] +
                           " (" + this.Title + ")";
        return resultString;
    }
}