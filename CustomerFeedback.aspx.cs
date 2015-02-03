using System;
using System.Data;
using System.Linq;
using System.Web.UI;

/// <author>
/// Daniel Burkhart
/// </author>
/// <version>
/// 2/5/15
/// </version>
/// <summary>
/// The code behind for the Customer feedback page
/// </summary>
public partial class CustomerFeedback : Page
{

    /// <summary>
    /// The _description list
    /// </summary>
    private DescriptionList _descriptionList;
    /// <summary>
    /// The _current feedback
    /// </summary>
    private Feedback _currentFeedback;

    /// <summary>
    /// Handles the Load event of the Page control.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">The <see cref="EventArgs"/> instance containing the event data.</param>
    protected void Page_Load(object sender, EventArgs e)
    {
        this._descriptionList = new DescriptionList();
        if (!IsPostBack)
        {
            this.ToggleControls(false);
        }
    }

    /// <summary>
    /// Toggles the controls.
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
    /// Handles the Click event of the btnForCustomerIDSearch control.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">The <see cref="EventArgs"/> instance containing the event data.</param>
    protected void btnForCustomerIDSearch_Click(object sender, EventArgs e)
    {
        this.SetFocus(this.lbClosedFeedbackList);
        if (this.txtCustomerID.Text == null)
        {
            return;
        }
        DataView feedbackTable = (DataView)
            this.AccessDataSource1.Select(DataSourceSelectArguments.Empty);
        if (feedbackTable == null)
        {
            return;
        }

        feedbackTable.RowFilter = "CustomerID = '" + this.txtCustomerID.Text + "'";
        var row = feedbackTable[0];

        this._currentFeedback = new Feedback
        {
            CustomerId = row["CustomerID"].ToString(),
            SoftwareID = row["SoftwareID"].ToString(),
            SupportID = row["SupportID"].ToString(),
            FeedbackId = row["FeedbackID"].ToString(),
            DateOpened = row["DateOpened"].ToString(),
            DateClosed = row["DateClosed"].ToString(),
            Title = row["Title"].ToString(),
            Description = row["Description"].ToString()
        };

        this.lbClosedFeedbackList.Items.Add(this._currentFeedback.FormatFeedback());
        this.ToggleControls(true);
    }
    /// <summary>
    /// Handles the Click event of the btnHomeButton control.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">The <see cref="EventArgs"/> instance containing the event data.</param>
    protected void btnHomeButton_Click(object sender, EventArgs e)
    {
        this.Response.Redirect("HomePage.aspx");
    }

    /// <summary>
    /// Handles the Click event of the btnSubmit control.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">The <see cref="EventArgs"/> instance containing the event data.</param>
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        
        var feedback = new Description
        {
            SericeTime = this.rblServiceTime.SelectedIndex,
            Efficiency = this.rblTechnicalEfficiency.SelectedIndex,
            Resolution = this.rblProblemResolution.SelectedIndex,
            Comments = this.txtAdditionalComments.Text,
            Contact = this.cbContact.Checked,
            ContactMethod = this.rblHowToContact.SelectedValue
        };
        this._descriptionList.AddFeedBackToList(feedback);
        this.Session["BooleanValueContact"] = this.cbContact.Checked;
        this.Response.Redirect("~/FeedbackComplete.aspx");
    }
}