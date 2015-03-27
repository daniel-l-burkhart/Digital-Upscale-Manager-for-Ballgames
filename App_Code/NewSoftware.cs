using System;

/// <author>
///     Daniel Burkhart
/// </author>
/// <version>
///     Spring 2015
/// </version>
/// <summary>
///     Summary description for Software
/// </summary>
public class NewSoftware
{

    public NewSoftware()
    {
        
    }
    /// <summary>
    ///     Gets or sets the software identifier.
    /// </summary>
    /// <value>
    ///     The software identifier.
    /// </value>
    /// <exception cref="System.ArgumentException">Invalid Data</exception>
    public string SoftwareId
    {
        get { return this._softwareId; }
        set
        {
            if (value == null)
            {
                throw new ArgumentException("Invalid Data");
            }
            this._softwareId = value;
        }
    }

    /// <summary>
    ///     Gets or sets the version.
    /// </summary>
    /// <value>
    ///     The version.
    /// </value>
    /// <exception cref="System.ArgumentException">Invalid Data</exception>
    public string Version
    {
        get { return this._version; }
        set
        {
            if (value == null)
            {
                throw new ArgumentException("Invalid Data");
            }
            this._version = value;
        }
    }

    /// <summary>
    ///     Gets or sets the release date.
    /// </summary>
    /// <value>
    ///     The release date.
    /// </value>
    /// <exception cref="System.ArgumentException">Invalid Data</exception>
    public string ReleaseDate
    {
        get { return this._releaseDate; }
        set
        {
            if (value == null)
            {
                throw new ArgumentException("Invalid Data");
            }
            this._releaseDate = value;
        }
    }

    /// <summary>
    ///     The _release date
    /// </summary>
    private string _releaseDate;

    /// <summary>
    ///     The _software identifier
    /// </summary>
    private string _softwareId;

    /// <summary>
    ///     The _version
    /// </summary>
    private string _version;

    private string _name;

    public string Name
    {
        get { return this._name; }
        set
        {
            if (value == null)
            {
                throw new ArgumentException("Invalid Data.");
            }
            this._name = value;
        }
    }
}