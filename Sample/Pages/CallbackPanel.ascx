<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CallbackPanel.ascx.cs" Inherits="Sample.Pages.CallbackPanel" %>
<dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="ASPxCallbackPanel"></dx:ASPxLabel>
<hr />

<dx:ASPxSplitter ID="ASPxSplitterCallbackPanel" runat="server">
    <Panes>
        <dx:SplitterPane Size="20%">
            <ContentCollection>
                <dx:SplitterContentControl runat="server">
                    <dx:ASPxListBox ID="ASPxListBoxCallbackPanelCars" runat="server" ValueType="System.String" Width="100%" Height="100%" SelectedIndex="0" DataSourceID="SqlDSCallbackMaster" ValueField="Id">
                        <Columns>
                            <dx:ListBoxColumn FieldName="Model" Caption="Model" />
                        </Columns>
                        <ItemStyle Border-BorderStyle="None"></ItemStyle>
                        <ClientSideEvents SelectedIndexChanged="function(s, e) {
	                            ASPxClientCallbackPanelCars.PerformCallback();
                            }" />
                        <Border BorderStyle="None" />
                    </dx:ASPxListBox>
                    <asp:SqlDataSource ID="SqlDSCallbackMaster" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="GetCars" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                </dx:SplitterContentControl>
            </ContentCollection>
        </dx:SplitterPane>
        <dx:SplitterPane>
            <ContentCollection>
                <dx:SplitterContentControl runat="server">
                    <dx:ASPxCallbackPanel ID="ASPxCallbackPanelCars" ClientInstanceName="ASPxClientCallbackPanelCars" runat="server" Width="100%" OnCallback="ASPxCallbackPanelCars_Callback">
                        <PanelCollection>
                            <dx:PanelContent runat="server">
                                <table style="width: 100%;">
                                    <tr>
                                        <td style="width: 40%;">
                                            <dx:ASPxImage ID="ASPxImageCar" runat="server" ShowLoadingImage="false"></dx:ASPxImage>
                                        </td>
                                        <td>
                                            <asp:Repeater ID="RepeaterParts" runat="server">
                                                <ItemTemplate>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <dx:ASPxLabel ID="ASPxLabelName" runat="server" Text='<%# Eval("Name") %>'>
                                                                </dx:ASPxLabel>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </td>
                                    </tr>
                                </table>

                                <asp:SqlDataSource ID="SqlDSCallbackDetail" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="GetPartsByCarId" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="CarId" SessionField="CarId" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </dx:PanelContent>
                        </PanelCollection>

                    </dx:ASPxCallbackPanel>
                </dx:SplitterContentControl>
            </ContentCollection>
        </dx:SplitterPane>
    </Panes>
</dx:ASPxSplitter>
