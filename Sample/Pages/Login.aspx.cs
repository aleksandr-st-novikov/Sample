using System;
using System.Web.Security;

namespace Sample.Pages
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Context.User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/Pages/Home.aspx");
            }
            else
            {
                ASPxTextBoxUserName.Focus();
            }
        }

        protected void ASPxButtonLogin_Click(object sender, EventArgs e)
        {
            if (FormsAuthentication.Authenticate(ASPxTextBoxUserName.Text, ASPxTextBoxPassword.Text))
            {
                FormsAuthentication.RedirectFromLoginPage(ASPxTextBoxUserName.Text, true);
            }
        }
    }
}