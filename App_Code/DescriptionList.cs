using System.Collections.Generic;

/// <author>
///     Daniel Burkhart
/// </author>
/// <version>
///     2/5/15
/// </version>
/// <summary>
///     Summary description for DescriptionList
/// </summary>
public class DescriptionList
{
    /// <summary>
    ///     The feedback list
    /// </summary>
    private readonly List<Description> _feedbackList;

    /// <summary>
    ///     Initializes a new instance of the <see cref="DescriptionList" /> class.
    /// </summary>
    public DescriptionList()
    {
        this._feedbackList = new List<Description>();
    }

    /// <summary>
    ///     Adds the feed back to list.
    /// </summary>
    /// <param name="currentFeedback">The current feedback.</param>
    public void AddFeedBackToList(Description currentFeedback)
    {
        this._feedbackList.Add(currentFeedback);
    }

    public string DisplayFeedbackList()
    {
        var resultString = string.Empty;
        foreach (var currentDescription in this._feedbackList)
        {
            resultString += currentDescription.CustomerId + currentDescription.Efficiency +
                            currentDescription.SericeTime + currentDescription.Efficiency + currentDescription.Comments +
                            currentDescription.Contact + currentDescription.ContactMethod;
        }
        return resultString;
    }
}