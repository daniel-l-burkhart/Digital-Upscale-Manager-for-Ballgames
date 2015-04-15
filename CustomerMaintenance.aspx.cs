using System;
using System.Web.UI;

/// <author>
///     Daniel Burkhart
/// </author>
/// <version>
///     Spring 2015
/// </version>
/// <summary>
///     Code behind for the Customer Maintenance page.
/// </summary>
public partial class CustomerMaintenance : Page
{
    /// <summary>
    ///     Handles the Load event of the Page control.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">The <see cref="EventArgs" /> instance containing the event data.</param>
    protected void Page_Load(object sender, EventArgs e)
    {
        this.lblError.Text = "";
    }

    /// <summary>
    /// Handles the ItemDeleted event of the dvCustomers control.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">The <see cref="System.Web.UI.WebControls.DetailsViewDeletedEventArgs"/> instance containing the event data.</param>
    protected void dvCustomers_ItemDeleted(object sender, System.Web.UI.WebControls.DetailsViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            this.lblError.Text = "A database error has occurred. <br/>"
                                 + "Message: <br/>" + e.Exception.Message;
            e.ExceptionHandled = true;
        }
        else if (e.AffectedRows == 0)
        {
            this.lblError.Text = "Another user may have updated that customer. " + "Please try again";
        }
        else
        {
            this.gvCustomers.DataBind();
        }
    }

    /// <summary>
    /// Handles the ItemUpdated event of the dvCustomers control.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">The <see cref="System.Web.UI.WebControls.DetailsViewUpdatedEventArgs"/> instance containing the event data.</param>
    protected void dvCustomers_ItemUpdated(object sender, System.Web.UI.WebControls.DetailsViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            this.lblError.Text = "A database error has occurred. "
                                 + "Message: " + e.Exception.Message;
            e.ExceptionHandled = true;
            e.KeepInEditMode = true;
        }
        else if (e.AffectedRows == 0)
        {
            this.lblError.Text = "Another user may have updated that customer. " + "Please try again";
        }
        else
        {
            this.gvCustomers.DataBind();
        }
    }

    /// <summary>
    /// Handles the ItemInserted event of the dvCustomers control.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">The <see cref="System.Web.UI.WebControls.DetailsViewInsertedEventArgs"/> instance containing the event data.</param>
    protected void dvCustomers_ItemInserted(object sender, System.Web.UI.WebControls.DetailsViewInsertedEventArgs e)
    {
        if (e.Exception != null)
        {
            this.lblError.Text = "A database error has occurred. "
                                 + "Message: " + e.Exception.Message;
            e.ExceptionHandled = true;
            e.KeepInInsertMode = true;
        }
        else if (e.AffectedRows == 0)
        {
            this.lblError.Text = "Another user may have updated that customer. " + "Please try again";
        }
        else
        {
            this.gvCustomers.DataBind();
        }
    }
}