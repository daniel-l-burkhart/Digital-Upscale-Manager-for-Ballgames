using System.Diagnostics;

/// <author>
///     Daniel Burkhart
/// </author>
/// <version>
///     2/5/15
/// </version>
/// <summary>
///     Summary description for Description
/// </summary>
public class Description
{
    #region Properties

    /// <summary>
    ///     Gets or sets the customer identifier.
    /// </summary>
    /// <value>
    ///     The customer identifier.
    /// </value>
    public int CustomerId
    {
        get { return this._customerId; }
        set
        {
            Trace.Assert(value!=null, "Invalid Data");
            this._customerId = value;
        }
    }

    /// <summary>
    ///     Gets or sets the feedback identifier.
    /// </summary>
    /// <value>
    ///     The feedback identifier.
    /// </value>
    public int FeedbackId
    {
        get { return this._feedbackId; }
        set
        {
            Trace.Assert(value != null, "Invalid Data");
            this._feedbackId = value;
        }
    }

    /// <summary>
    ///     Gets or sets the serive time.
    /// </summary>
    /// <value>
    ///     The serice time.
    /// </value>
    public int SericeTime
    {
        get { return this._serviceTime; }
        set
        {
            Trace.Assert(value != null, "Invalid Data");
            this._serviceTime = value;
        }
    }

    public int Efficiency
    {
        get { return this._efficiency; }
        set
        {
            Trace.Assert(value != null, "Invalid Data");
            this._efficiency = value;
        }
    }

    /// <summary>
    ///     Gets or sets the resolution.
    /// </summary>
    /// <value>
    ///     The resolution.
    /// </value>
    public int Resolution
    {
        get { return this._resolution; }
        set
        {
            Trace.Assert(value != null, "Invalid Data");
            this._resolution = value;
        }
    }

    /// <summary>
    ///     Gets or sets the comments.
    /// </summary>
    /// <value>
    ///     The comments.
    /// </value>
    public string Comments
    {
        get { return this._comments; }
        set
        {
            Trace.Assert(value != null, "Invalid Data");
            this._comments = value;
        }
    }

    /// <summary>
    ///     Gets or sets a value indicating whether this <see cref="Description" /> is contact.
    /// </summary>
    /// <value>
    ///     <c>true</c> if contact; otherwise, <c>false</c>.
    /// </value>
    public bool Contact
    {
        get { return this._contact; }
        set
        {
            Trace.Assert(value != null, "Invalid Data");
            this._contact = value;
        }
    }

    /// <summary>
    ///     Gets or sets the contact method.
    /// </summary>
    /// <value>
    ///     The contact method.
    /// </value>
    public string ContactMethod
    {
        get { return this._contactMethod; }
        set
        {
            Trace.Assert(value != null, "Invalid Data");
            this._contactMethod = value;
        }
    }

    #endregion

    #region Instance Variables

    /// <summary>
    ///     The _comments
    /// </summary>
    private string _comments;

    /// <summary>
    ///     The _contact
    /// </summary>
    private bool _contact;

    /// <summary>
    ///     The _contact method
    /// </summary>
    private string _contactMethod;

    /// <summary>
    ///     The _customer identifier
    /// </summary>
    private int _customerId;

    private int _efficiency;

    /// <summary>
    ///     The _feedback identifier
    /// </summary>
    private int _feedbackId;

    /// <summary>
    ///     The _resolution
    /// </summary>
    private int _resolution;

    /// <summary>
    ///     The _service time
    /// </summary>
    private int _serviceTime;

    #endregion
}