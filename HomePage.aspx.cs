using System;
using System.Web.UI;

public partial class HomePage : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btnBuildContactList_Click(object sender, EventArgs e)
    {
        Response.Redirect("CustomerDisplay.aspx");
    }

    protected void btnFeedback_Click(object sender, EventArgs e)
    {
        Response.Redirect("CustomerFeedback.aspx");
    }
}