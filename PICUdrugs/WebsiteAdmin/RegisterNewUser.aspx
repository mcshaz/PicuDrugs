<%@ MasterType VirtualPath="~/Site.Master" %>
<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="RegisterNewUser.aspx.cs" Inherits="PICUdrugs.websiteAdmin.RegisterNewUser" %>
<%@ Register Src="~/websiteAdmin/RoleList.ascx" TagPrefix="uc" TagName="RoleList" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderId="HeadContent">
    
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderId="MainContent">
    <h2>
        Create a New Account
    </h2>
    <span class="validationError">
        <asp:Literal ID="ErrorMessage" runat="server"></asp:Literal>
    </span>
    <asp:ValidationSummary ID="RegisterUserValidationSummary" runat="server" CssClass="validationError" 
            ValidationGroup="RegisterUserValidationGroup"/>
    <span class="successNotification">
        <asp:Literal runat="server" ID="successNotification" Text="New user successfully added." Visible="false" />
    </span>
    <div class="accountInfo">
        <fieldset class="register">
            <legend>Account Information</legend>
            <div class="editor-label">
                <asp:Label ID="EmailLabel" runat="server" AssociatedControlId="Email">E-mail:</asp:Label>
            </div>
            <div class="editor-field">
                <asp:TextBox ID="Email" runat="server" CssClass="textEntry" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email" 
                        CssClass="validationError" ErrorMessage="E-mail is required." ToolTip="E-mail is required." 
                        ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="validEmailValidator" runat="server" ControlToValidate="Email"
                        CssClass="validationError" ErrorMessage="Address must be a valid email." ToolTip="Enter a valid E-mail adress." 
                        ValidationGroup="RegisterUserValidationGroup" 
                        ValidationExpression="^(([^<>()[\]\\.,;:\s@\&quot;]+(\.[^<>()[\]\\.,;:\s@\&quot;]+)*)|(\&quot;.+\&quot;))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$"/>
            </div>
            <div class="editor-label">
                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlId="UserName">User Name:</asp:Label>
            </div>
            <div class="editor-field">
                <asp:TextBox ID="UserName" runat="server" CssClass="textEntry"></asp:TextBox>
                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" 
                        CssClass="validationError" ErrorMessage="User Name is required." ToolTip="User Name is required." 
                        ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
            </div>
            <div class="editor-label">
                Roles:
            </div>
            <div class="editor-field">
                <uc:RoleList runat="server" ID="currentRoleList" AutoPostBack="False" ValidationGroup="RegisterUserValidationGroup"/>
            </div>
            <div class="editor-label">
            </div>
            <div class="editor-field">
                <asp:Button ID="CreateUserButton" runat="server" OnClick="submitClick" Text="Create User" 
                        ValidationGroup="RegisterUserValidationGroup"/>
            </div>
        </fieldset>
    </div>
</asp:Content>
<asp:Content ID="MyScripts" ContentPlaceHolderId="masterScripts" runat="server">
    <script src="<%# ResolveUrl("~/Scripts/manageUser.js")%>" type="text/javascript"></script>
</asp:Content>