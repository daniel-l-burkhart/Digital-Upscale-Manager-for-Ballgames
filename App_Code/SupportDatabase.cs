using System.Collections;
using System.Data.OleDb;

/// <author>
///     Daniel Burkhart
/// </author>
/// <version>
///     Spring 2015
/// </version>
/// <summary>
///     Summary description for SupportDatabase
/// </summary>
public class SupportDatabase
{
    /// <summary>
    ///     Gets all support staff.
    /// </summary>
    /// <returns></returns>
    public static IEnumerable GetAllSupportStaff()
    {
        var connection =
            new OleDbConnection(BallgameDatabase.GetConnectionString());
        const string selection = "SELECT SupportID, Name, Email, Phone FROM Support ORDER BY Name";
        var command = new OleDbCommand(selection, connection);
        connection.Open();
        var dataReader = command.ExecuteReader();
        return dataReader;
    }
}