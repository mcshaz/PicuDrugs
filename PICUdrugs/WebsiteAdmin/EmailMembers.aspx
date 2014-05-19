<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmailMembers.aspx.cs" Inherits="PICUdrugs.WebsiteAdmin.EmailMembers" %>
<asp:Content ID="Content3" ContentPlaceHolderID="headings" runat="server">
    <h3>Email Members</h3>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="MembershipList" runat="server" AutoGenerateColumns = "false">
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="Email" DataTextField="UserName" HeaderText="User" />
            <asp:CheckboxField DataField ="IsWardAdmin" HeaderText="Ward"/>
            <asp:CheckboxField DataField ="IsSiteAdmin" HeaderText="Site"/>
            <asp:CheckboxField DataField ="IsDrugAdmin" HeaderText="Drug"/>
            <asp:BoundField DataField ="Created" HeaderText="Created" DataFormatString="{0:d}" />
            <asp:BoundField DataField ="Centre" HeaderText ="Centre"/>
            <asp:TemplateField HeaderText="Include" >
                <ItemTemplate>
                    <input id="emailCB" type="checkbox" class="emailTo" value='<%# Bind("Email") %>' runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <label>
        <input type="checkbox" id="selectAll" /> Select All
    </label>
    <input type="button" id ="emailSelected" value="Email" />
</asp:Content>
<asp:Content ID="MyScripts" ContentPlaceHolderId="masterScripts" runat="server">
    <script src="<%# ResolveUrl("~/Scripts/emailGridUtilities.js")%>" type="text/javascript"></script>
</asp:Content>
