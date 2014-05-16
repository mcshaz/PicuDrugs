<%@ MasterType VirtualPath="~/Site.Master" %>
<%@ Page Title="ManageExistingUser" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageExistingUser.aspx.cs" Inherits="PICUdrugs.websiteAdmin.manageExistingUser" %>
<%@ Register Src="~/websiteAdmin/RoleList.ascx" TagPrefix="uc" TagName="RoleList" %>
<asp:Content ID="Content1" ContentPlaceHolderId="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderId="headings" runat="server">
    <h3>Manage Users</h3>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderId="MainContent" runat="server">
    <asp:ValidationSummary ID="ManageUserValidationSummary" runat="server" CssClass="validationError" 
            ValidationGroup="ManageUserVal"/>
    <div class="successNotification">
        <asp:Literal runat="server" ID="successNotification" Text="User successfully updated." Visible="false" ViewStateMode="Disabled"/>
    </div>
        <p>
             <b>Select a User:</b>
             <asp:DropDownList ID="UserList" runat="server" AutoPostBack="True"
                  DataTextField="UserName" DataValueField="UserName" OnSelectedIndexChanged="UserList_SelectedIndexChanged">
             </asp:DropDownList>
        </p>
    <fieldset>
        <legend >
            <asp:Hyperlink runat="server" ID="Email" />
        </legend>
        <p>
            <asp:LinkButton ID="unlockUserButton" runat="server" OnClick="unlockClick" Text="Unlock" 
                CausesValidation="false" />
            <asp:LinkButton ID="DeleteUserButton" runat="server" OnClick="DeleteClick" Text="Remove" 
                CausesValidation="false" OnClientClick='return confirm("Are you sure you want to Remove this user?");' />
        </p>
        <p>
             <uc:RoleList runat="server" ID="currentRoleList"
                ValidationGroup="ManageUserVal"/>
        </p>
        <p>
            <asp:Button runat="server" ID="Submit" Text="Update" OnClick="Submit_Click" ValidationGroup="ManageUserVal" />
        </p>
    </fieldset>        

</asp:Content>
