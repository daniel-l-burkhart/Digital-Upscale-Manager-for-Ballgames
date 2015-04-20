using System.Configuration;

/// <author>
///     Daniel Burkhart
/// </author>
/// <version>
///     Spring 2015
/// </version>
/// <summary>
///     Summary description for BallgameDatabase
/// </summary>
public class BallgameDatabase
{
    /// <summary>
    /// Gets the connection string.
    /// </summary>
    /// <returns></returns>
    public static string GetConnectionString()
    {
        return ConfigurationManager.ConnectionStrings["BallGamesConnectionString"].ConnectionString;
    }
}