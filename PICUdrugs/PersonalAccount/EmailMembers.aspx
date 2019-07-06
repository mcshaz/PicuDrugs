<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmailMembers.aspx.cs" Inherits="PICUdrugs.WebsiteAdmin.EmailMembers" %>
<asp:Content ID="Content3" ContentPlaceHolderId="headings" runat="server">
    <h3>Email Members</h3>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderId="MainContent" runat="server">
    <asp:GridView ID="MembershipList" runat="server" AutoGenerateColumns = "false">
        <Columns>
            <asp:Boundfield DataField="UserName" HeaderText="User" />
            <asp:CheckboxField DataField ="IsWardAdmin" HeaderText="Ward Admin"/>
            <asp:CheckboxField DataField ="IsSiteAdmin" HeaderText="User Admin"/>
            <asp:CheckboxField DataField ="IsDrugAdmin" HeaderText="Drug Admin"/>
            <asp:BoundField DataField ="Created" HeaderText="Created" DataFormatString="{0:dd-MMM-yyyy}" />
            <asp:BoundField DataField ="Centre" HeaderText ="Centre"/>
            <asp:TemplateField HeaderText="To" >
                <ItemTemplate>
                    <input id="emailCB" type="checkbox" class="emailTo" value='<%# Bind("Email") %>' runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <label>
        <input type="checkbox" id="selectAll" /> Select All
    </label>
    <input type="button" id ="emailSelected" value="Create Email" />
</asp:Content>
<asp:Content ID="MyScripts" ContentPlaceHolderId="MasterScripts" runat="server">
    <asp:ScriptManagerProxy runat="server" EnableViewState="false">
        <CompositeScript>
            <Scripts>
                <asp:ScriptReference Path="~/Scripts/emailGridUtilities.js" />
            </Scripts>
        </CompositeScript>
    </asp:ScriptManagerProxy>
</asp:Content>
