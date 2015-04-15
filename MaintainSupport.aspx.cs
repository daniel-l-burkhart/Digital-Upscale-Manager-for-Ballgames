﻿using System;
using System.Web.UI.WebControls;

/// <summary>
/// 
/// </summary>
public partial class MaintainSupport : System.Web.UI.Page
{
    /// <summary>
    /// Handles the Load event of the Page control.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">The <see cref="EventArgs" /> instance containing the event data.</param>
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            return;
        }
        this.fvSupport.DataBind();
        this.ddlSupport.DataBind();
    }
    /// <summary>
    /// Handles the Click event of the btnEdit control.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">The <see cref="EventArgs" /> instance containing the event data.</param>
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        this.fvSupport.ChangeMode(FormViewMode.Edit);
    }
    /// <summary>
    /// Handles the Click event of the btnInsert control.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">The <see cref="EventArgs" /> instance containing the event data.</param>
    protected void btnInsert_Click(object sender, EventArgs e)
    {
        this.fvSupport.ChangeMode(FormViewMode.Insert);
    }
    protected void fvSupport_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            this.lblError.Text = "A database error has occurred. " + "Message: " + e.Exception.Message;
            e.ExceptionHandled = true;
            e.KeepInEditMode = true;
        }
        else if (e.AffectedRows == 0)
        {
            this.lblError.Text = "Another user may have updated that item. " + "Please try again.";
        }
        else
        {
            this.ddlSupport.DataBind();
        }
    }
    protected void fvSupport_ItemDeleted(object sender, FormViewDeletedEventArgs e)
    {
             if (e.Exception != null)
        {
            this.lblError.Text = "A database error has occurred. " + "Message: " + e.Exception.Message;
            e.ExceptionHandled = true;
          
        }
        else if (e.AffectedRows == 0)
        {
            this.lblError.Text = "Another user may have updated that item. " + "Please try again.";
        }
        else
        {
            this.ddlSupport.DataBind();
        }
    }
    protected void fvSupport_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
             if (e.Exception != null)
        {
            this.lblError.Text = "A database error has occurred. " + "Message: " + e.Exception.Message;
            e.ExceptionHandled = true;
            e.KeepInInsertMode = true;
        }
        else if (e.AffectedRows == 0)
        {
            this.lblError.Text = "Another user may have updated that item. " + "Please try again.";
        }
        else
        {
            this.ddlSupport.DataBind();
        }
    }
}