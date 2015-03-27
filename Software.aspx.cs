using System;
using System.Configuration;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Runtime.InteropServices;
using System.Web.UI;

public partial class Software : Page

    
{

    NewSoftware newSoftware;
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btnAddToSoftware_Click(object sender, EventArgs e)
    {
        this.newSoftware = new NewSoftware
        {
            SoftwareId = this.txtSoftwareID.Text,
            Name =  this.txtName.Text,
            Version = this.txtVersion.Text,
            ReleaseDate = this.txtReleaseDate.Text
        };

        InsertSoftware(this.newSoftware);
    }

    public static int InsertSoftware(NewSoftware newSoftware)
    {
        const string insertString =
            "INSERT INTO Software " + " (SoftwareID, Name, Version, ReleaseDate) " +
            " VALUES(@SoftwareID, @Version, @ReleaseDate)";
        var connection =
            new OleDbConnection(ConfigurationManager.ConnectionStrings["BallGamesConnectionString"].ConnectionString);

        var command = new OleDbCommand(insertString, connection);
        command.Parameters.AddWithValue("SoftwareID", newSoftware.SoftwareId);
        command.Parameters.AddWithValue("Name", newSoftware.Name);
        command.Parameters.AddWithValue("Version", newSoftware.Version);
        command.Parameters.AddWithValue("ReleaseDate", newSoftware.ReleaseDate);
        connection.Open();
        var returnValue = command.ExecuteNonQuery();
        connection.Close();
        return returnValue;
    }
}