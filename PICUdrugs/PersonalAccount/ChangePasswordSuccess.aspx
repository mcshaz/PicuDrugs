<%@ Page Title="Change Password" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="ChangePasswordSuccess.aspx.cs" Inherits="PICUdrugs.personalAccount.ChangePasswordSuccess" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderId="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderId="MainContent">
    <h2>
        Change Password
    </h2>
    <h4>
        Your password has been changed successfully.
    </h4>
    <div>
        If this is your first time logging in, please:
        <ul>
            <li>
                Note the new menu items now displaying to the left of the page.
            </li> 
            <li>
                Read the
                <asp:HyperLink runat="server" NavigateUrl="~/Administrators Guide to the Starship PICU Drug Calculator.pdf" Text="Administrator's guide" />
                if you haven't already.
            </li>
        </ul>
    </div>
</asp:Content>
