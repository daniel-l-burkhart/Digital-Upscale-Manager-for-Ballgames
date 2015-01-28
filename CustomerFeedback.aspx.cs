using System;
using System.Web.UI;

public partial class CustomerFeedback : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.toggleControls(false);
    }

    private void toggleControls(bool enableOrDisable)
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
    protected void btnForCustomerIDSearch_Click(object sender, EventArgs e)
    {
        if (this.txtCustomerID.Text != null)
        {
            //search for customer ID in database.
            this.toggleControls(true);
        }
    }
}