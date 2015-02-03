using System;
using System.Web.UI;

public partial class FeedbackComplete : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.Session["BooleanValueContact"].Equals(true))
        {
            this.lblContacted.Text = "Someone will be in contact with you shortly.";
        }
    }
}