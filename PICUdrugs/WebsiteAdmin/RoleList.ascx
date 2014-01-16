<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RoleList.ascx.cs" Inherits="PICUdrugs.websiteAdmin.RoleList" %>
<%@ Register Src="~/WardAdmin/WardManagement.ascx" TagPrefix="uc" TagName="WardManager" %>
<fieldset ID="roleDetails" runat="server">
    <legend>Allowed roles:<asp:CustomValidator runat="server" ID="roleListValidator" Display="Dynamic" CssClass="validationError" ErrorMessage="Please choose a role." ToolTip="At least 1 role is required." 
         ClientValidationFunction="valOneChecked" OnServerValidate="valOneChecked" >*</asp:CustomValidator></legend>
    <asp:CheckBox runat="server" ID="websiteAdmin" Text="Manage users and permissions" Value="websiteAdmin" /><br />
    <asp:CheckBox runat="server" ID="drugAdmin" Text="Create and modify drugs" Value="drugAdmin" /><br />
    <asp:CheckBox runat="server" ID="wardAdmin" Text="Select Infusions for a specific Ward" Value="wardAdmin" />
    <asp:CustomValidator runat="server" ID="WardAdminValidator" Display="Dynamic" CssClass="validationError" ErrorMessage="A Ward must be selected if the user is to be a Ward administrator" ToolTip="Select A Ward" 
         OnServerValidate="valWardAdmin" >*</asp:CustomValidator><br />
    <uc:WardManager runat="server" ID="WardList" />
</fieldset>