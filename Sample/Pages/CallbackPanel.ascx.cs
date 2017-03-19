using System;
using System.Web.UI;

namespace Sample.Pages
{
    public partial class CallbackPanel : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && !Page.IsCallback)
            {
                Session["CarId"] = 1;
                CallbackDataBinding();
            }
        }

        protected void ASPxCallbackPanelCars_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            Session["CarId"] = ASPxListBoxCallbackPanelCars.SelectedItem.Value;
            CallbackDataBinding();
        }

        private void CallbackDataBinding()
        {
            RepeaterParts.DataSource = SqlDSCallbackDetail;
            RepeaterParts.DataBind();

            string id = Session["CarId"].ToString();
            ASPxImageCar.ImageUrl = "../Content/Pictures/" + id + ".jpg";
        }
    }
}