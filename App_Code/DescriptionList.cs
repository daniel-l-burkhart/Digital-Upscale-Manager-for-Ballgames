using System.Collections.Generic;

/// <summary>
/// Summary description for DescriptionList
/// </summary>
public class DescriptionList
{
    /// <summary>
    /// The feedback list
    /// </summary>
    private List<Description> feedbackList;

    /// <summary>
    /// Initializes a new instance of the <see cref="DescriptionList"/> class.
    /// </summary>
	public DescriptionList()
	{
		this.feedbackList = new List<Description>();
	}

    /// <summary>
    /// Adds the feed back to list.
    /// </summary>
    /// <param name="currentFeedback">The current feedback.</param>
    public void AddFeedBackToList(Description currentFeedback)
    {
        this.feedbackList.Add(currentFeedback);
    }
}