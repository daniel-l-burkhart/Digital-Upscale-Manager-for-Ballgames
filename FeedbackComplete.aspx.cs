using System;
using System.Web.UI;

/// <author>
///     Daniel Burkhart
/// </author>
/// <version>
///     2/5/15
/// </version>
/// <summary>
///     The feedback complete page
/// </summary>
public partial class FeedbackComplete : Page
{
    /// <summary>
    ///     The _description details
    /// </summary>
    private Description _descriptionDetails;

    /// <summary>
    ///     Handles the Load event of the Page control.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">The <see cref="EventArgs" /> instance containing the event data.</param>
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["BooleanValueContact"] == null || Session["GivenFeedback"] == null)
        {
            return;
        }
        if (Session["BooleanValueContact"].Equals(true))
        {
            this.lblContacted.Text = "Someone will be in contact with you shortly.";
        }

        this._descriptionDetails = (Description) Session["GivenFeedback"];
        this.DisplayFeedback();
    }

    /// <summary>
    ///     Displays the feedback.
    /// </summary>
    private void DisplayFeedback()
    {
        this.lblCustomerID.Text = this._descriptionDetails.CustomerId.ToString();

        this.lblServiceTimeValue.Text = this.DetermineRatingString(this._descriptionDetails.SericeTime);
        this.lblEfficiencyValue.Text = this.DetermineRatingString(this._descriptionDetails.Efficiency);
        this.lblProblemResolutionValue.Text = this.DetermineRatingString(this._descriptionDetails.Resolution);

        this.lblAdditionalComments.Text = this._descriptionDetails.Comments;
        if (this._descriptionDetails.Contact)
        {
            this.lblContactValue.Text = "Yes";
            this.lblPreferredContactMentod.Text = this._descriptionDetails.ContactMethod;
        }
        else
        {
            this.lblContactValue.Text = "No";
            this.lblContactHow.Text = "";
            this.lblPreferredContactMentod.Text = "";
        }
    }

    /// <summary>
    ///     Determines the rating string.
    /// </summary>
    /// <param name="ratingLevel">The rating level.</param>
    /// <returns></returns>
    private string DetermineRatingString(int ratingLevel)
    {
        switch (ratingLevel)
        {
            case 0:
                return "Satisfied";
            case 1:
                return "Neither Satisfied nor Dissatisfied";
            case 2:
                return "Dissatisfied";
        }
        return null;
    }

    /// <summary>
    ///     Handles the Click event of the lblReturnToHomePage control.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">The <see cref="EventArgs" /> instance containing the event data.</param>
    protected void lblReturnToHomePage_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/HomePage.aspx");
    }

    /// <summary>
    ///     Handles the Click event of the btnReturnToFeedbackPage control.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">The <see cref="EventArgs" /> instance containing the event data.</param>
    protected void btnReturnToFeedbackPage_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/CustomerFeedback.aspx");
    }
}