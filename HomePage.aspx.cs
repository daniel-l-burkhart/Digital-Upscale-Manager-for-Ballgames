using System;
using System.Web.UI;

/// <author>
///     Damiel Burkhart
/// </author>
/// <version>
///     2/5/15
/// </version>
/// <summary>
///     The Home page of the website
/// </summary>
public partial class HomePage : Page
{
    /// <summary>
    ///     Handles the Load event of the Page control.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">The <see cref="EventArgs" /> instance containing the event data.</param>
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    /// <summary>
    ///     Handles the Click event of the btnBuildContactList control.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">The <see cref="EventArgs" /> instance containing the event data.</param>
    protected void btnBuildContactList_Click(object sender, EventArgs e)
    {
        Response.Redirect("CustomerDisplay.aspx");
    }

    /// <summary>
    ///     Handles the Click event of the btnFeedback control.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">The <see cref="EventArgs" /> instance containing the event data.</param>
    protected void btnFeedback_Click(object sender, EventArgs e)
    {
        Response.Redirect("CustomerFeedback.aspx");
    }
}