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
    public static string GetConnectionString()
    {
        return ConfigurationManager.ConnectionStrings["BallGamesConnectionString"].ConnectionString;
    }
}