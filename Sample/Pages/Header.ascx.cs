using System;
using System.Linq;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace Sample.Pages
{
    public partial class Header : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Context.Request.Path.ToString() == "/" || Context.Request.Path.Contains("Login"))
            {
                ASPxPanelHeader.Visible = false;
                return;
            }

            if (Context.User.Identity.IsAuthenticated)
            {
                ASPxLabelUserName.Text = "Hello, " + Context.User.Identity.Name;
                ASPxButtonHeaderLogin.Visible = false;
                ASPxButtonHeaderLogout.Visible = true;
                var tmpValue = Request.Cookies[".ASPXAUTH"].Value;
                var tmpValueList = Enumerable.Range(0, tmpValue.Length / 50).Select(i => tmpValue.Substring(i * 50, 50)).ToList();
                var res = string.Join("\n", tmpValueList);
                ASPxLabelASPXAUTH.ToolTip = Request.Cookies[".ASPXAUTH"].Value;
                ASPxPopupControlASPXAUTH.Text = res;
            }
            else
            {
                ASPxButtonHeaderLogin.Visible = true;
                ASPxButtonHeaderLogout.Visible = false;
                ASPxLabelASPXAUTH.Visible = false;
            }
        }

        protected void ASPxButtonHeaderLogout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            FormsAuthentication.RedirectToLoginPage();
        }

        protected void ASPxButtonHeaderLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Pages/Login.aspx");
        }
    }
}