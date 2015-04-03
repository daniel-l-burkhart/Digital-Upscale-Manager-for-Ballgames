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
    ///     The _new software
    /// </summary>
    private NewSoftware _newSoftware;

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
        this._newSoftware = new NewSoftware
        {
            SoftwareId = this.txtSoftwareID.Text,
            Name = this.txtName.Text,
            Version = Convert.ToDouble(this.txtVersion.Text),
            ReleaseDate = Convert.ToDateTime(this.txtReleaseDate.Text)
        };

        this.InsertSoftware(this._newSoftware);

        this.txtSoftwareID.Text = "";
        this.txtVersion.Text = "";
        this.txtName.Text = "";
        this.txtReleaseDate.Text = "";
    }

    /// <summary>
    ///     Inserts the software.
    /// </summary>
    /// <param name="newSoftware">The new software.</param>
    public void InsertSoftware(NewSoftware newSoftware)
    {
        const string insertString =
            "INSERT INTO [Software] ([SoftwareID], [Name], [Version], [ReleaseDate]) " +
            "VALUES(@SoftwareID, @Name, @Version, @ReleaseDate)";

        var connection =
            new OleDbConnection(ConfigurationManager.ConnectionStrings["BallGamesConnectionString"].ConnectionString);

        var command = new OleDbCommand(insertString, connection);

        command.Parameters.AddWithValue("SoftwareID", newSoftware.SoftwareId);
        command.Parameters.AddWithValue("Name", newSoftware.Name);
        command.Parameters.AddWithValue("Version", newSoftware.Version);
        command.Parameters.AddWithValue("ReleaseDate", newSoftware.ReleaseDate);

        connection.Open();

        command.ExecuteNonQuery();

        connection.Close();
        this.gvSoftware.DataBind();
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
            if (e.Exception.InnerException != null)
            {
                this.lblError.Text += "<br />Message: "
                                      + e.Exception.InnerException.Message;
            }
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
        else if(e.AffectedRows == 0)
        {
            this.lblError.Text = "Another user may have updated that category."
                                 + "<br />Please try again.";
        }
    }
}