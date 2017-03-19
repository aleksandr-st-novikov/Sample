<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Sample.Pages.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .panel {
            margin: 100px auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <dx:ASPxRoundPanel ID="ASPxRoundPanelLogin" runat="server" ShowCollapseButton="false" Width="330px" HeaderText="Log In" HorizontalAlign="Center" CssClass="panel">
            <PanelCollection>
                <dx:PanelContent runat="server">
                    <div style="text-align: left;">
                        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="UserName (admin)">
                        </dx:ASPxLabel>
                    </div>
                    <div style="margin-bottom: 10px;">
                        <dx:ASPxTextBox ID="ASPxTextBoxUserName" runat="server" Width="314px" NullText="admin">
                        </dx:ASPxTextBox>
                    </div>
                    <div style="text-align: left;">
                        <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Password (admin)">
                        </dx:ASPxLabel>
                    </div>
                    <dx:ASPxTextBox ID="ASPxTextBoxPassword" runat="server" Password="True" Width="314px">
                    </dx:ASPxTextBox>
                    <div style="margin: 15px 0 5px 0;">
                        <dx:ASPxButton ID="ASPxButtonLogin" runat="server" HorizontalAlign="Center" Text="log in" OnClick="ASPxButtonLogin_Click">
                        </dx:ASPxButton>
                    </div>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxRoundPanel>
    </div>
</asp:Content>
