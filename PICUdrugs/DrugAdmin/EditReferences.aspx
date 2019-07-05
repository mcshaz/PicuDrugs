<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditReferences.aspx.cs" Inherits="PICUdrugs.drugAdmin.editReferences" %>
<asp:Content ID="Content1" ContentPlaceHolderId="HeadContent" runat="server">
<style type="text/css">
   table
   {
       width:100%;
   }
   input[type=text]
   {
       width:90%;
   }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderId="headings" runat="server">
    <h2>Edit Drug References</h2>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderId="MainContent" runat="server">
    <asp:ObjectDataSource ID="DDDataSource" runat="server" TypeName="PICUdrugs.BLL.referenceBL"
    SelectMethod="GetReferences" DataObjectTypeName="PICUdrugs.BLL.ReferenceModel"/>
    <asp:ObjectDataSource ID="SelRefObjDataSrc" runat="server" SelectMethod="GetReference" InsertMethod="InsertReference"
    UpdateMethod="UpdateReference" DeleteMethod="DeleteReference" TypeName="PICUdrugs.BLL.referenceBL"
    OnUpdated="reference_CRUD" OnInserted="reference_CRUD" OnDeleted="reference_CRUD" DataObjectTypeName="PICUdrugs.BLL.ReferenceModel" >
    <SelectParameters>
        <asp:controlparameter Name="refId" ControlId="RefAbrevDDL" PropertyName="SelectedValue"/>
    </SelectParameters>
    </asp:ObjectDataSource>
    <asp:DropDownList ID="RefAbrevDDL" runat="server" AutoPostBack="True" 
        DataTextField="Abbrev" DataSourceID="DDDataSource" 
        DataValueField="DrugReferenceId" ViewStateMode="Disabled" >
    </asp:DropDownList>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataSourceID="SelRefObjDataSrc"
        CssClass="DetailView" DataKeyNames="DrugReferenceId" >
        <Fields>
            <asp:DynamicField DataField="ReferenceDescription" HeaderText="Reference Description" />
            <asp:DynamicField DataField="abbrev" HeaderText="Abbreviation" 
                SortExpression="abbrev" />
            <asp:DynamicField DataField="HyperLink" HeaderText="Hyperlink" 
                SortExpression="Hyperlink" />
            <asp:TemplateField ShowHeader="False" >
                <ItemTemplate>
                    <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" Text="Edit" /> &nbsp;
                    <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Remove" CausesValidation="false"  Text="Remove"
                        OnClientClick='return confirm("Are you sure you want to Remove this item?");' /> &nbsp;
                    <asp:LinkButton ID="Insert" runat="server" CommandName="New" Text="Insert" />
                </ItemTemplate>

                <EditItemTemplate>
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="true" 
                        CommandName="Update" Text="Update"></asp:LinkButton> &nbsp;
                    <asp:LinkButton ID="CancelButton" runat="server" CausesValidation="false" 
                        CommandName="Cancel" Text="Cancel"></asp:LinkButton> &nbsp;
                </EditItemTemplate>

                <InsertItemTemplate>
                    <asp:LinkButton ID="InserButton" runat="server" CausesValidation="true" 
                        CommandName="Insert" Text="Insert"></asp:LinkButton> &nbsp;
                    <asp:LinkButton ID="CancelButton" runat="server" CausesValidation="false" 
                        CommandName="Cancel" Text="Cancel"></asp:LinkButton> &nbsp;
                </InsertItemTemplate>
            </asp:TemplateField>
         </Fields>
    </asp:DetailsView>

</asp:Content>
