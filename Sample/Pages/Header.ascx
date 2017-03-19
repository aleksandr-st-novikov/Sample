<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="Sample.Pages.Header" %>

<dx:ASPxPanel ID="ASPxPanelHeader" runat="server">
    <PanelCollection>
        <dx:PanelContent runat="server">
            <div class="container">
                <div class="col-lg-12" style="background-color: #f5f5f5;">
                    <div class="inline left">
                        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Web User Control"></dx:ASPxLabel>
                    </div>
                    <div class="inline right">
                        <dx:ASPxLabel ID="ASPxLabelUserName" runat="server" Text="" CssClass="label"></dx:ASPxLabel>
                        <dx:ASPxButton ID="ASPxButtonHeaderLogin" runat="server" Text="log in" OnClick="ASPxButtonHeaderLogin_Click"></dx:ASPxButton>
                        <dx:ASPxButton ID="ASPxButtonHeaderLogout" runat="server" Text="log out" OnClick="ASPxButtonHeaderLogout_Click"></dx:ASPxButton>
                        <dx:ASPxLabel ID="ASPxLabelASPXAUTH" runat="server" Text=".ASPXAUTH" ToolTip="Empty">
                            <ClientSideEvents Click="function(s, e) {
	                                ASPxClientPopupControlASPXAUTH.Show();
                                }" />
                        </dx:ASPxLabel>
                        <dx:ASPxPopupControl ID="ASPxPopupControlASPXAUTH" runat="server" ClientInstanceName="ASPxClientPopupControlASPXAUTH" 
                            PopupElementID="ASPxLabelASPXAUTH" Width="300px" HeaderText="ASPXAUTH" MaxWidth="500px">
                            <ContentStyle HorizontalAlign="Left">
                            </ContentStyle>
                            <HeaderStyle HorizontalAlign="Left" />
                            <ContentCollection>
                                <dx:PopupControlContentControl runat="server">
                                </dx:PopupControlContentControl>
                            </ContentCollection>
                        </dx:ASPxPopupControl>
                    </div>
                </div>
            </div>
        </dx:PanelContent>
    </PanelCollection>

</dx:ASPxPanel>
