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
    /// Handles the Load event of the Page control.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">The <see cref="EventArgs"/> instance containing the event data.</param>
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["BooleanValueContact"].Equals(true))
        {
            this.lblContacted.Text = "Someone will be in contact with you shortly.";
        }
    }
}