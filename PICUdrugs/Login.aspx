<%@ Page Title="Log In" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Login.aspx.cs" Inherits="PICUdrugs.Pages.Login" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderId="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderId="MainContent">
    <h2>
        Log In
    </h2>
    <p>
        Please enter your username and password.
    </p>
    <asp:Login ID="LoginUser" runat="server" EnableViewState="false" RenderOuterTable="false">
        <LayoutTemplate>
            <span class="validationError">
                <asp:Literal ID="FailureText" runat="server"></asp:Literal>
            </span>
            <asp:ValidationSummary ID="LoginUserValidationSummary" runat="server" CssClass="validationError" 
                 ValidationGroup="LoginUserValidationGroup"/>
            <div class="accountInfo">
                <fieldset class="login">
                    <legend>Account Information</legend>
                    <div class="editor-label">
                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlId="UserName">Username:</asp:Label>
                    </div>
                    <div class="editor-field">
                        <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" 
                             CssClass="validationError" ErrorMessage="User Name is required." ToolTip="User Name is required." 
                             ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                    </div>
                    <div class="editor-label">
                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlId="Password">Password:</asp:Label>
                    </div>
                    <div class="editor-field">
                        <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" 
                             CssClass="validationError" ErrorMessage="Password is required." ToolTip="Password is required." 
                             ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                    </div>
                    <div class="editor-label"></div>
                    <div class="editor-field">
                        <asp:CheckBox ID="RememberMe" runat="server"/>
                        <asp:Label ID="RememberMeLabel" runat="server" AssociatedControlId="RememberMe" CssClass="inline">Keep me logged in</asp:Label>
                    </div>
                </fieldset>
                <p class="submitButton">
                    <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="LoginUserValidationGroup"/>
                </p>
            </div>
        </LayoutTemplate>
    </asp:Login>
    <p>
        If you have been granted access, but have forgotten your password, please 
        <asp:HyperLink ID="HyperLink1" runat="server" EnableViewState="False" 
            NavigateUrl="~/PasswordRecovery.aspx">click here</asp:HyperLink>
        .
    </p>
    <p class="preList">
        If you:
    </p>
    <ol class="inlineList">
        <li>Do not have a user name and password.</li>
        <li>Are a senior nurse or medical officer within your department.</li>
        <li>Work within a New Zealand DHB.</li>
        <li>Would like to use starship drug protocols, but alter the exact Infusions displayed.</li>
    </ol>
    <p class="postList">
        You can request that you be given access to tools to manage a customised drug sheet, by contacting the <a href="mailto:brentm@adhb.govt.nz">website administrator</a>.
    </p>
</asp:Content>
