using System;
using System.Web.UI;
using DevExpress.Web;
using DevExpress.Export;

using DevExpress.XtraPrinting;

namespace Sample.Pages
{
    public partial class Home : System.Web.UI.Page
    {
        string fileName = "Cars";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CarId"] != null)
            {
                ASPxGridViewDetailPerformCallback.DataSource = SqlDSDetailCB;
                ASPxGridViewDetailPerformCallback.DataBind();
            }
            if (!ClientScript.IsStartupScriptRegistered("home"))
            {
                string script = @"Home = function () {
                        this.confirmText = 'Save data?';
                    }

                        Home.prototype =
                        {
                        Confirm: function(s, e) {
                                if (!confirm(this.confirmText))
                                {
                                    e.processOnServer = false;
                                };
                            }
                        }

                        window.home = new Home(); ";
                Page.ClientScript.RegisterStartupScript(this.GetType(),
                    "home", script, true);
            }
        }

        protected void ASPxGridViewLeftDetail_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["CarId"] = (sender as ASPxGridView).GetMasterRowKeyValue();

        }

        protected void ASPxGridViewAccessDetail_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["CarId"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }

        protected void ASPxCallbackButton_Callback(object source, CallbackEventArgs e)
        {
            string result = "Answer from server";
            e.Result = result;
        }

        protected void ASPxButtonToExcel_Click(object sender, EventArgs e)
        {
            ASPxGridViewExporterMain.WriteXlsToResponse(fileName, new XlsExportOptionsEx { ExportType = ExportType.WYSIWYG });
        }

        protected void ASPxButtonToPdf_Click(object sender, EventArgs e)
        {
            ASPxGridViewExporterMain.WritePdfToResponse(fileName, true);
        }

        protected void ASPxButtonToRtf_Click(object sender, EventArgs e)
        {
            ASPxGridViewExporterMain.WriteRtfToResponse(fileName, true);
        }

        protected void ASPxPopupMenuButton_ItemClick(object source, MenuItemEventArgs e)
        {
            if (e.Item == null) return;
            switch (e.Item.Index)
            {
                case 0:
                    ASPxButtonCallback.AutoPostBack = true;
                    e.Item.Selected = true;
                    break;
                case 1:
                    ASPxButtonCallback.AutoPostBack = false;
                    e.Item.Selected = true;
                    break;
            }
        }

        protected void ASPxGridViewLeft_FillContextMenuItems(object sender, ASPxGridViewContextMenuEventArgs e)
        {
            var item = e.CreateItem("Export to Excel", "ExportToExcel");
            item.BeginGroup = true;
            item.Image.IconID = "export_exporttoxls_16x16office2013";
            e.Items.Add(item);

            item = e.CreateItem("Export to PDF", "ExportToPDF");
            item.Image.IconID = "export_exporttopdf_16x16office2013";
            e.Items.Add(item);

            item = e.CreateItem("Export to RTF", "ExportToRTF");
            item.Image.IconID = "export_exporttortf_16x16office2013";
            e.Items.Add(item);
        }

        protected void ASPxGridViewDetailPerformCallback_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            object masterKeyValue = ASPxGridViewMasterPerformCallback.GetRowValues(Convert.ToInt32(e.Parameters), "Id");
            Session["CarId"] = masterKeyValue;
            ASPxGridViewDetailPerformCallback.DataSource = SqlDSDetailCB;
            ASPxGridViewDetailPerformCallback.DataBind();
        }


    }
}