using System;
using System.Diagnostics;

/// <summary>
///     Summary description for Feedback
/// </summary>
public class Feedback
{

    private string _feedbackID;

    public string FeedbackId
    {
        get { return this._feedbackID; }
        set
        {
            Trace.Assert(value != null, "Invalid Data");
            this._feedbackID = value;
        }
    }

    private string _customerID;

    public string CustomerId
    {
        get { return _customerID; }
        set
        {
            Trace.Assert(value != null, "Invalid Data");
            _customerID = value;
        }
    }

    private string _softwareId;

    public string SoftwareID
    {
        get { return _softwareId; }
        set
        {
            Trace.Assert(value != null, "Invalid Data");
            _softwareId = value;
        }
    }

    private string _supportID;

    public string SupportID
    {
        get { return _supportID; }
        set
        {
            Trace.Assert(value != null, "Invalid Data");
            _supportID = value;
        }
    }

    private string _dateOpened;

    public string DateOpened
    {
        get { return _dateOpened; }
        set
        {
            Trace.Assert(value != null, "Invalid Data");
            _dateOpened = value;
        }
    }

    private string _dateClosed;

    public string DateClosed
    {
        get { return _dateClosed; }
        set
        {
            Trace.Assert(value != null, "Invalid Data");
            _dateClosed = value;
        }
    }

    private string _title;

    public string Title
    {
        get { return _title; }
        set
        {
            Trace.Assert(value != null, "Invalid Data");
            _title = value;
        }
    }

    private string _description;

    public string Description
    {
        get { return _description; }
        set
        {
            Trace.Assert(value != null, "Invalid Data");
            _description = value;
        }
    }
    
    
    public string FormatFeedback()
    {
        var dateClosed = this.DateClosed.Split();
       
        var resultString = "Feedback for software " + this.SoftwareID + 
                              " closed " + dateClosed[0] + 
                              " (" + this.Title + ")";
        return resultString;
    }
}