<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Sample.Pages.Home" %>

<%@ Register TagPrefix="callbackPanel" TagName="Panel" Src="~/Pages/CallbackPanel.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="SM" runat="server"></asp:ScriptManager>

    <div class="container">
        <div class="col-lg-12">
            <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="ASPxGridView"></dx:ASPxLabel>
            <hr />
            <div class="col-lg-6">
                <div class="inline">
                    <div>
                        <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Data from LocalDB. Stored procedure. ContextMenu enabled (added 3 items)."></dx:ASPxLabel>
                    </div>
                    <div style="text-align: right; margin: 10px 0;">
                        <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Export to "></dx:ASPxLabel>
                        <dx:ASPxButton ID="ASPxButtonToExcel" runat="server" OnClick="ASPxButtonToExcel_Click" ClientInstanceName="ASPxClientButtonToExcel" RenderMode="Link" ToolTip="Excel">
                            <ClientSideEvents Click="function(s, e) {
	                            home.Confirm(s, e);
                            }" />
                            <Image IconID="export_exporttoxls_32x32office2013">
                            </Image>
                        </dx:ASPxButton>
                        <dx:ASPxButton ID="ASPxButtonToPdf" runat="server" OnClick="ASPxButtonToPdf_Click" ClientInstanceName="ASPxClientButtonToPdf" RenderMode="Link" ToolTip="PDF">
                            <ClientSideEvents Click="function(s, e) {
	                            home.Confirm(s, e);
                            }" />
                            <Image IconID="export_exporttopdf_32x32office2013">
                            </Image>
                        </dx:ASPxButton>
                        <dx:ASPxButton ID="ASPxButtonToRtf" runat="server" OnClick="ASPxButtonToRtf_Click" ClientInstanceName="ASPxClientButtonToRtf" RenderMode="Link" ToolTip="RTF">
                            <ClientSideEvents Click="function(s, e) {
	                            home.Confirm(s, e);
                            }" />
                            <Image IconID="export_exporttortf_32x32office2013">
                            </Image>
                        </dx:ASPxButton>
                    </div>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="GetCars" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="GetPartsByCarId" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="CarId" SessionField="CarId" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <dx:ASPxGridView ID="ASPxGridViewLeft" runat="server" ClientInstanceName="ASPxClientGridViewLeft" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="Id" OnFillContextMenuItems="ASPxGridViewLeft_FillContextMenuItems">
                        <ClientSideEvents ContextMenuItemClick="function(s, e) {
                               switch(e.item.name){
                                   case &quot;ExportToExcel&quot;:
                                    ASPxClientButtonToExcel.OnClick();
                                    break;
                                   case &quot;ExportToPDF&quot;:
                                    ASPxClientButtonToPdf.OnClick();
                                    break;
                                   case &quot;ExportToRTF&quot;:
                                    ASPxClientButtonToRtf.OnClick();
                                    break;
                                }
                            }" />
                        <SettingsDetail ShowDetailRow="True" />
                        <SettingsContextMenu Enabled="True">
                        </SettingsContextMenu>
                        <Templates>
                            <DetailRow>
                                <dx:ASPxGridView ID="ASPxGridViewLeftDetail" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" KeyFieldName="Id" OnBeforePerformDataSelect="ASPxGridViewLeftDetail_BeforePerformDataSelect">
                                    <SettingsCommandButton>
                                        <ShowAdaptiveDetailButton ButtonType="Image">
                                        </ShowAdaptiveDetailButton>
                                        <HideAdaptiveDetailButton ButtonType="Image">
                                        </HideAdaptiveDetailButton>
                                    </SettingsCommandButton>
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" Visible="False" VisibleIndex="0">
                                            <EditFormSettings Visible="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="CarId" Visible="False" VisibleIndex="1">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Name of part" FieldName="Name" VisibleIndex="2" Width="300px">
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:ASPxGridView>
                            </DetailRow>
                        </Templates>
                        <Settings ShowFilterRow="True" />
                        <SettingsBehavior AllowSelectByRowClick="True" />
                        <SettingsCommandButton>
                            <ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>

                            <HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
                        </SettingsCommandButton>
                        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                        <Columns>
                            <dx:GridViewCommandColumn ShowClearFilterButton="True" VisibleIndex="0">
                            </dx:GridViewCommandColumn>
                            <dx:GridViewDataTextColumn FieldName="Id" VisibleIndex="1" ReadOnly="True" Visible="False">
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Model" VisibleIndex="2" Width="400px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataDateColumn Caption="Production year" FieldName="Year" VisibleIndex="3">
                                <PropertiesDateEdit DisplayFormatString="yyyy">
                                </PropertiesDateEdit>
                            </dx:GridViewDataDateColumn>
                        </Columns>
                    </dx:ASPxGridView>
                </div>
            </div>

            <div class="col-lg-6">
                <div class="inline">
                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Data from MS Access file."></dx:ASPxLabel>
                    <dx:ASPxGridView ID="ASPxGridViewAccessMaster" runat="server" AutoGenerateColumns="False" KeyFieldName="Id" DataSourceID="AccessDSMaster">
                        <SettingsDetail ShowDetailRow="True" />
                        <Templates>
                            <DetailRow>
                                <dx:ASPxGridView ID="ASPxGridViewAccessDetail" runat="server" AutoGenerateColumns="False" KeyFieldName="Id" OnBeforePerformDataSelect="ASPxGridViewAccessDetail_BeforePerformDataSelect" DataSourceID="AccessDSDetail">
                                    <SettingsCommandButton>
                                        <ShowAdaptiveDetailButton ButtonType="Image">
                                        </ShowAdaptiveDetailButton>
                                        <HideAdaptiveDetailButton ButtonType="Image">
                                        </HideAdaptiveDetailButton>
                                    </SettingsCommandButton>
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" Visible="False" VisibleIndex="0">
                                            <EditFormSettings Visible="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="CarId" Visible="False" VisibleIndex="1">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Name of part" FieldName="Name" VisibleIndex="2" Width="300px">
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:ASPxGridView>
                                <asp:AccessDataSource ID="AccessDSDetail" runat="server" DataFile="~/App_Data/Sample-data.mdb" SelectCommand="SELECT * FROM [Parts] WHERE ([CarId] = ?)">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="CarId" SessionField="CarId" Type="Int32" />
                                    </SelectParameters>
                                </asp:AccessDataSource>
                            </DetailRow>
                        </Templates>
                        <Settings ShowFilterRow="True" />
                        <SettingsCommandButton>
                            <ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>

                            <HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
                        </SettingsCommandButton>
                        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                        <Columns>
                            <dx:GridViewCommandColumn ShowClearFilterButton="True" VisibleIndex="0">
                            </dx:GridViewCommandColumn>
                            <dx:GridViewDataTextColumn FieldName="Id" VisibleIndex="1" ReadOnly="True" Visible="False">
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Model" VisibleIndex="2" Width="400px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataDateColumn Caption="Production year" FieldName="Year" VisibleIndex="3">
                                <PropertiesDateEdit DisplayFormatString="yyyy">
                                </PropertiesDateEdit>
                            </dx:GridViewDataDateColumn>
                        </Columns>
                    </dx:ASPxGridView>
                    <asp:AccessDataSource ID="AccessDSMaster" runat="server" DataFile="~/App_Data/Sample-data.mdb" SelectCommand="SELECT * FROM [Cars]"></asp:AccessDataSource>
                </div>
            </div>
        </div>

        <div class="col-lg-12">
            <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="ASPxGridView PerformCallback(). ASPxSplitter."></dx:ASPxLabel>
            <dx:ASPxSplitter ID="ASPxSplitterMain" runat="server" Height="300px">
                <Panes>
                    <dx:SplitterPane Size="50%">
                        <ContentCollection>
                            <dx:SplitterContentControl runat="server">
                                <dx:ASPxGridView ID="ASPxGridViewMasterPerformCallback" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDSMasterCB" KeyFieldName="Id" Width="100%">
                                    <ClientSideEvents FocusedRowChanged="function(s, e) {
	                                        ASPxClientGridViewDetailPerformCallback.PerformCallback(s.GetFocusedRowIndex());
                                        }" />
                                    <SettingsBehavior AllowFocusedRow="True" />
                                    <SettingsCommandButton>
                                        <ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>

                                        <HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
                                    </SettingsCommandButton>
                                    <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" Visible="False" VisibleIndex="0">
                                            <EditFormSettings Visible="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Model" VisibleIndex="1" Width="80%">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataDateColumn Caption="Production year" FieldName="Year" VisibleIndex="2">
                                            <PropertiesDateEdit DisplayFormatString="yyyy">
                                            </PropertiesDateEdit>
                                        </dx:GridViewDataDateColumn>
                                    </Columns>
                                </dx:ASPxGridView>
                                <asp:SqlDataSource ID="SqlDSMasterCB" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="GetCars" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

                            </dx:SplitterContentControl>
                        </ContentCollection>
                    </dx:SplitterPane>
                    <dx:SplitterPane>
                        <ContentCollection>
                            <dx:SplitterContentControl runat="server">
                                <dx:ASPxGridView ID="ASPxGridViewDetailPerformCallback" runat="server" AutoGenerateColumns="False" KeyFieldName="Id"
                                    ClientInstanceName="ASPxClientGridViewDetailPerformCallback" OnCustomCallback="ASPxGridViewDetailPerformCallback_CustomCallback" Width="100%">
                                    <SettingsCommandButton>
                                        <ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>

                                        <HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
                                    </SettingsCommandButton>
                                    <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" Visible="False" VisibleIndex="0">
                                            <EditFormSettings Visible="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="CarId" Visible="False" VisibleIndex="1">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Name" VisibleIndex="2" Width="100%">
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:ASPxGridView>
                                <asp:SqlDataSource ID="SqlDSDetailCB" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="GetPartsByCarId" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="CarId" SessionField="CarId" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </dx:SplitterContentControl>
                        </ContentCollection>
                    </dx:SplitterPane>
                </Panes>
            </dx:ASPxSplitter>
        </div>


        <div class="col-lg-12">
            <div class="col-lg-6">
                <dx:ASPxCallback ID="ASPxCallbackButton" runat="server" ClientInstanceName="ASPxClientCallbackButton" OnCallback="ASPxCallbackButton_Callback">
                    <ClientSideEvents CallbackComplete="function(s, e) {
                            ASPxClientLabelCallbackButton.SetText(e.result);
                        }" />
                </dx:ASPxCallback>

                <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="ASPxCallback, ASPxButton, ASPxLabel, ASPxPopupMenu (on the button)"></dx:ASPxLabel>
                <hr />
                <dx:ASPxButton ID="ASPxButtonCallback" runat="server" Text="Get data from Server" AutoPostBack="False">
                    <ClientSideEvents Click="function(s, e) {
                            ASPxClientLabelCallbackButton.SetText('');
                            ASPxClientCallbackButton.PerformCallback();
                        }" />
                </dx:ASPxButton>
                <dx:ASPxLabel ID="ASPxLabelCallbackButton" runat="server" Text="waiting for data..." ClientInstanceName="ASPxClientLabelCallbackButton"></dx:ASPxLabel>
            </div>
            <dx:ASPxGridViewExporter ID="ASPxGridViewExporterMain" runat="server">
            </dx:ASPxGridViewExporter>

            <dx:ASPxPopupMenu ID="ASPxPopupMenuButton" runat="server" OnItemClick="ASPxPopupMenuButton_ItemClick" PopupElementID="ASPxButtonCallback">
                <Items>
                    <dx:MenuItem Text="AutoPostBack is True">
                    </dx:MenuItem>
                    <dx:MenuItem Text="AutoPostBack is False" Selected="True">
                    </dx:MenuItem>
                </Items>
            </dx:ASPxPopupMenu>
            <div class="col-lg-6">
                <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="ASPxPopupControl"></dx:ASPxLabel>
                <hr />
                <dx:ASPxButton ID="ASPxButtonShowPopup" runat="server" Text="Show Popup" AutoPostBack="False">
                    <ClientSideEvents Click="function(s, e) {
	                        ASPxClientPopupControlShow.Show();
                        }" />
                </dx:ASPxButton>
                <dx:ASPxPopupControl ID="ASPxPopupControlShow" ClientInstanceName="ASPxClientPopupControlShow" runat="server" HeaderText="ASPxPopupControl"
                    Text="The ASPxPopupControl provides the ability to create and use a number of popup windows in your web application. Popup windows are a special type of overlapped temporary window that appear separately from an application's main window, and are typically used to display quick reference information." 
                    PopupElementID="ASPxButtonShowPopup" Width="351px">
                </dx:ASPxPopupControl>
            </div>
        </div>
        <div class="col-lg-12">
            <callbackPanel:Panel ID="Panel1" runat="server" />
        </div>

    </div>
</asp:Content>

