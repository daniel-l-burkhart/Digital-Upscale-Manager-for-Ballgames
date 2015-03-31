using System;
using System.Configuration;
using System.Data.OleDb;
using System.Web.UI;

public partial class Software : Page
{

    NewSoftware _newSoftware;
    protected void Page_Load(object sender, EventArgs e)
    {
    }

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
    protected void gvSoftware_RowUpdated(object sender, System.Web.UI.WebControls.GridViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            this.lblError.Text = "A database error has occurred.<br /><br />" +
                e.Exception.Message;
            if (e.Exception.InnerException != null)
                this.lblError.Text += "<br />Message: "
                    + e.Exception.InnerException.Message;
            e.ExceptionHandled = true;
            e.KeepInEditMode = true;
        }
        else if (e.AffectedRows == 0)
            this.lblError.Text = "Another user may have updated that category."
                + "<br />Please try again.";
    }
}