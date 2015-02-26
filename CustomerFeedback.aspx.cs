using System;
using System.Collections.Generic;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

/// <author>
///     Daniel Burkhart
/// </author>
/// <version>
///     3/4/15
/// </version>
/// <summary>
///     The code behind for the Customer feedback page
/// </summary>
public partial class CustomerFeedback : Page
{
    /// <summary>
    ///     The _current feedback
    /// </summary>
    private Feedback _currentFeedback;

    /// <summary>
    ///     The _feedback list
    /// </summary>
    private List<Feedback> _feedbackList;

    /// <summary>
    ///     Handles the Load event of the Page control.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">The <see cref="EventArgs" /> instance containing the event data.</param>
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.ClearInputFields();

            this.ToggleControls(false);
            SetFocus(this.txtCustomerID);
        }
        if (this.lbClosedFeedbackList.Enabled)
        {
            SetFocus(this.lbClosedFeedbackList);
        }
        this._feedbackList = new List<Feedback>();
        this.lblCustomerIDNotInList.Text = string.Empty;
    }

    /// <summary>
    ///     Clears the input fields.
    /// </summary>
    private void ClearInputFields()
    {
        this.lbClosedFeedbackList.Items.Clear();
        this.rblServiceTime.ClearSelection();
        this.rblTechnicalEfficiency.ClearSelection();
        this.rblProblemResolution.ClearSelection();
        this.txtAdditionalComments.Text = string.Empty;
        this.cbContact.Checked = false;
        this.rblHowToContact.ClearSelection();
    }

    /// <summary>
    ///     Toggles the controls.
    /// </summary>
    /// <param name="enableOrDisable">if set to <c>true</c> [enable or disable].</param>
    private void ToggleControls(bool enableOrDisable)
    {
        this.lbClosedFeedbackList.Enabled = enableOrDisable;
        this.lblRatings.Enabled = enableOrDisable;
        this.rblServiceTime.Enabled = enableOrDisable;
        this.lblTechnicalEfficiency.Enabled = enableOrDisable;
        this.rblTechnicalEfficiency.Enabled = enableOrDisable;
        this.lblProblemResolution.Enabled = enableOrDisable;
        this.rblProblemResolution.Enabled = enableOrDisable;
        this.lblAdditionalComments.Enabled = enableOrDisable;
        this.txtAdditionalComments.Enabled = enableOrDisable;
        this.cbContact.Enabled = enableOrDisable;
        this.lblContactHow.Enabled = enableOrDisable;
        this.rblHowToContact.Enabled = enableOrDisable;
        this.btnSubmit.Enabled = enableOrDisable;
    }

    /// <summary>
    ///     Handles the Click event of the btnForCustomerIDSearch control.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">The <see cref="EventArgs" /> instance containing the event data.</param>
    protected void btnForCustomerIDSearch_Click(object sender, EventArgs e)
    {
        SetFocus(this.lbClosedFeedbackList);
        if (this.txtCustomerID.Text == null)
        {
            return;
        }

        var feedbackTable = (DataView)
            this.AccessDataSource1.Select(DataSourceSelectArguments.Empty);
        if (feedbackTable == null)
        {
            return;
        }


        feedbackTable.RowFilter = "CustomerID = '" + this.txtCustomerID.Text + "' AND DateClosed IS NOT NULL";

        if (feedbackTable.Count <= 0)
        {
            this.lblCustomerIDNotInList.Text = "This customer ID is not in the list. Please try again.";
            this.ToggleControls(false);
        }
        else if (feedbackTable.Count > 0)
        {
            this.FindFeedBack(feedbackTable);
        }
    }

    /// <summary>
    ///     Finds the feed back.
    /// </summary>
    /// <param name="feedbackTable">The feedback table.</param>
    private void FindFeedBack(DataView feedbackTable)
    {
        this.lbClosedFeedbackList.Items.Clear();
        for (var i = 0; i < feedbackTable.Count; i++)
        {
            var row = feedbackTable[i];

            if (row != null)
            {
                this._currentFeedback = new Feedback
                {
                    CustomerId = row["CustomerID"].ToString(),
                    SoftwareId = row["SoftwareID"].ToString(),
                    SupportId = row["SupportID"].ToString(),
                    FeedbackId = row["FeedbackID"].ToString(),
                    DateOpened = row["DateOpened"].ToString(),
                    DateClosed = row["DateClosed"].ToString(),
                    Title = row["Title"].ToString(),
                    Description = row["Description"].ToString()
                };
            }
            this.AddToList(this._currentFeedback);
        }

        this.SortFeedbackList();
        this.ToggleControls(true);
    }

    /// <summary>
    ///     Adds to list.
    /// </summary>
    /// <param name="currentFeedback">The current feedback.</param>
    private void AddToList(Feedback currentFeedback)
    {
        this._feedbackList.Add(currentFeedback);
    }

    /// <summary>
    ///     Sorts the feedback list.
    /// </summary>
    private void SortFeedbackList()
    {
        this._feedbackList.Sort((a, b) => String.Compare(a.DateClosed, b.DateClosed, StringComparison.Ordinal));
        foreach (var currentFeedback in this._feedbackList)
        {
            this.lbClosedFeedbackList.Items.Add(new ListItem(currentFeedback.FormatFeedback(),
                currentFeedback.FeedbackId));
        }
    }

    /// <summary>
    ///     Handles the Click event of the btnHomeButton control.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">The <see cref="EventArgs" /> instance containing the event data.</param>
    protected void btnHomeButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx");
    }

    /// <summary>
    ///     Handles the Click event of the btnSubmit control.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">The <see cref="EventArgs" /> instance containing the event data.</param>
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        var feedback = new Description
        {
            CustomerId = Convert.ToInt32(this.txtCustomerID.Text),
            SericeTime = this.rblServiceTime.SelectedIndex,
            Efficiency = this.rblTechnicalEfficiency.SelectedIndex,
            Resolution = this.rblProblemResolution.SelectedIndex,
            Comments = this.txtAdditionalComments.Text,
            Contact = this.cbContact.Checked,
            ContactMethod = this.rblHowToContact.SelectedValue
        };
        Session["BooleanValueContact"] = this.cbContact.Checked;
        Session["GivenFeedback"] = feedback;
        Response.Redirect("~/FeedbackComplete.aspx");
    }

    protected void cbContact_CheckedChanged(object sender, EventArgs e)
    {
        if (this.cbContact.Checked)
        {
            this.rfvContactMethod.Enabled = true;
        }
        else if (this.cbContact.Checked == false)
        {
            this.rfvContactMethod.Enabled = false;
        }
    }
}