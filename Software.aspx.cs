using System;
using System.Configuration;
using System.Data.OleDb;
using System.Web.UI;
using System.Web.UI.WebControls;

/// <author>
///     Daniel Burkhart
/// </author>
/// <version>
///     Spring 2015
/// </version>
/// <summary>
///     Code behind for the software page.
/// </summary>
public partial class Software : Page
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
    ///     Handles the Click event of the btnAddToSoftware control.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">The <see cref="EventArgs" /> instance containing the event data.</param>
    protected void btnAddToSoftware_Click(object sender, EventArgs e)
    {

        this.sdsBallGames.InsertParameters["SoftwareID"].DefaultValue
            = this.txtSoftwareID.Text;
        this.sdsBallGames.InsertParameters["Name"].DefaultValue
            = this.txtName.Text;
        this.sdsBallGames.InsertParameters["Version"].DefaultValue
            = this.txtVersion.Text;
        this.sdsBallGames.InsertParameters["ReleaseDate"].DefaultValue
            = this.txtReleaseDate.Text;

        try
        {
            this.sdsBallGames.Insert();
            this.txtSoftwareID.Text = "";
            this.txtName.Text = "";
            this.txtVersion.Text = "";
            this.txtReleaseDate.Text = "";
        }
        catch (Exception ex)
        {
            this.lblError.Text = "A database error has occurred.<br /><br />" +
                "Message: " + ex.Message;
        }
    }

    /// <summary>
    ///     Handles the RowUpdated event of the gvSoftware control.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">
    ///     The <see cref="System.Web.UI.WebControls.GridViewUpdatedEventArgs" /> instance containing the event
    ///     data.
    /// </param>
    protected void gvSoftware_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            this.lblError.Text = "A database error has occurred.<br /><br />" +
                                 e.Exception.Message;

            e.ExceptionHandled = true;
            e.KeepInEditMode = true;
        }
        else if (e.AffectedRows == 0)
        {
            this.lblError.Text = "Another user may have updated that category."
                                 + "<br />Please try again.";
        }
    }

    /// <summary>
    /// Handles the RowDeleted event of the gvSoftware control.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">The <see cref="GridViewDeletedEventArgs"/> instance containing the event data.</param>
    protected void gvSoftware_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            this.lblError.Text = "A database error has occurred. <br/> <br/>" + "Message: " + e.Exception.Message;
            e.ExceptionHandled = true;
        }
        else if (e.AffectedRows == 0)
        {
            this.lblError.Text = "Another user may have updated that category or that record cannot be deleted."
                                 + "<br />Please try again.";
        }
    }
}