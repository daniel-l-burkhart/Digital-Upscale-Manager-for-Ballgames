using System;
using System.Web.UI;
using System.Web.UI.WebControls;

/// <author>
///     Daniel Burkhart
/// </author>
/// <version>
///     Spring 2015
/// </version>
/// <summary>
///     The code behind for the UpdateFeedback page
/// </summary>
public partial class UpdateFeedback : Page
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
    ///     Handles the RowUpdated event of the gvCustomerFeedback control.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">The <see cref="GridViewUpdatedEventArgs" /> instance containing the event data.</param>
    protected void gvCustomerFeedback_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            this.lblError.Text = "A database error has occurred. <br/> <br/>" + e.Exception.Message;
            this.InnerException(e);
            e.ExceptionHandled = true;
            e.KeepInEditMode = true;
        }
        else if (e.AffectedRows == 0)
        {
            this.lblError.Text = "Another user may have updated that category." + "<br/>Please try again.";
        }
    }

    /// <summary>
    ///     Inners the exception.
    /// </summary>
    /// <param name="e">The <see cref="GridViewUpdatedEventArgs" /> instance containing the event data.</param>
    private void InnerException(GridViewUpdatedEventArgs e)
    {
        if (e.Exception.InnerException != null)
        {
            this.lblError.Text += "<br/> Message " + e.Exception.InnerException.Message;
        }
    }

    /// <summary>
    ///     Handles the OnUpdated event of the odsUpdateFeedback control.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">The <see cref="ObjectDataSourceStatusEventArgs" /> instance containing the event data.</param>
    protected void odsUpdateFeedback_OnUpdated(object sender, ObjectDataSourceStatusEventArgs e)
    {
        e.AffectedRows = Convert.ToInt32(e.ReturnValue);
    }

    /// <summary>
    ///     Handles the OnDeleted event of the odsUpdateFeedback control.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">The <see cref="ObjectDataSourceStatusEventArgs" /> instance containing the event data.</param>
    protected void odsUpdateFeedback_OnDeleted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        e.AffectedRows = Convert.ToInt32(e.ReturnValue);
    }
}