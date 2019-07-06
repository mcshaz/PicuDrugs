<%@ MasterType VirtualPath="~/Site.Master" %>
<%@ Page Title="Edit Bolus Drugs" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditFixedDoseDrugs.aspx.cs" Inherits="PICUdrugs.drugAdmin.EditFixedDoseDrugs" %>
<asp:Content ID="Content1" ContentPlaceHolderId="HeadContent" runat="server">
    <link href="<%# ResolveUrl("~/Content/BolusDrugs.css")%>" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderId="headings" runat="server">
    <h2>Edit Fixed Dose Drugs</h2>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderId="MainContent" runat="server">
    <asp:HiddenField ID="rowsToDisplayInsert" runat="server" />
    <asp:ObjectDataSource ID="FixedDrugObjDataSource" runat="server" 
        DataObjectTypeName="PICUdrugs.DAL.FixedDrug" DeleteMethod="DeleteFixedDrug" 
        InsertMethod="InsertFixedDrug" SelectMethod="GetFixedDrugs"
        TypeName="PICUdrugs.BLL.FixedBolusBL" UpdateMethod="UpdateFixedDrug" OnUpdated="General_CRUD" OnInserted="General_CRUD"
        ConflictDetection="CompareAllValues" OldValuesParameterFormatString="orig{0}">
    </asp:ObjectDataSource>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="validationError" />
    <asp:ValidationSummary ID="InsertValSum" runat="server" ValidationGroup="insert" CssClass="validationError" />
    <asp:ValidationSummary ID="editValSum" runat="server" ValidationGroup="Edit" CssClass="validationError" />
    <asp:ValidationSummary ID="editDoseValSum" runat="server" ValidationGroup="EditDose" CssClass="validationError" />
    <asp:ValidationSummary ID="InsertDoseValSum" runat="server" ValidationGroup="insertDose" CssClass="validationError" />
    <asp:ListView ID="FixedDrugLV" runat="server" DataSourceID="FixedDrugObjDataSource"
        InsertItemPosition="LastItem" DataKeyNames="FixedDrugId"
        OnItemCreated="FixedDrugLV_ItemCreated" ViewStateMode="Disabled">
        <EditItemTemplate>
            <tr class="editable">
                <td>
                    <asp:LinkButton ID="UpdateButton" runat="server" CommandName="Update" OnClientClick="tinyMCE.triggerSave();"
                        Text="Update" /><br />
                    <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" 
                        Text="Delete" /><br />
                    <asp:LinkButton ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Cancel" />
                </td>
                <td>
                    <asp:HiddenField runat="server" ID="FixedDrugId" Value='<%# Bind("FixedDrugId") %>' />
                    <asp:DynamicControl runat="server" DataField="DrugName" Mode="Edit" CssClass="rich" HtmlEncode="false"/>
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" 
                style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                <tr>
                    <td>
                        No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr class="editable">
                <td>
                    <asp:LinkButton ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" ValidationGroup="insert" OnClientClick="tinyMCE.triggerSave();" /><br />
                    <asp:LinkButton ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="DrugName" Mode="Insert" CssClass="rich" HtmlEncode="false" 
                        ValidationGroup="insert" />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr class="stdItem">
                <td runat="server">
                    <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" Text="Modify" />
                </td>
                <td runat="server">
                    <asp:HiddenField runat="server" ID="FixedDrugId" Value='<%# Eval("FixedDrugId") %>'  />
                    <asp:DynamicControl runat="server" DataField="DrugName" Mode="ReadOnly" HtmlEncode="false" />
                </td>
                <td runat="server">
                    <asp:LinkButton ID="allowInsert" runat="server" Text="Insert" />
                </td>
                <asp:ObjectDataSource ID="FixedDoseObjDataSource" runat="server" 
                    DataObjectTypeName="PICUdrugs.DAL.FixedDose" DeleteMethod="DeleteFixedDose" 
                    InsertMethod="InsertFixedDose" SelectMethod="GetFixedDoses" OnDeleted="General_CRUD"
                    TypeName="PICUdrugs.BLL.FixedBolusBL" UpdateMethod="UpdateFixedDose" OnUpdated="General_CRUD" OnInserted="General_CRUD"
                    ConflictDetection="CompareAllValues" OldValuesParameterFormatString="orig{0}">
                        <SelectParameters>                         
                            <asp:Parameter Name="drugId" Type="Int32"/>                      
                        </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ListView ID="FixedDoseLV" runat="server" DataSourceID="FixedDoseObjDataSource" ItemPlaceholderId="dosePlaceholder" ViewStateMode="Disabled" DataKeyNames="FixedDoseId"
                        OnInit="FixedDoseLV_init" OnItemDataBound="FixedDoseLV_ItemBound" OnDataBound="FixedDose_allDataBound" InsertItemPosition="None" OnItemInserted="FixedDoseLV_Inserted"
                        OnItemDeleted="FixedDoseLV_Deleted" >
                    <ItemTemplate>
                        <asp:PlaceHolder runat="server" ID="rowStart">
            <tr>
                        </asp:PlaceHolder>
                        <td class="doseFields">
                            <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" Text="Modify" />
                        </td>
                        <td class="doseFields">
                            <asp:DynamicControl runat="server" DataField="Dose" Mode="ReadOnly" />
                        </td>
                        <td class="doseFields">
                            <asp:DynamicControl runat="server" DataField="MinAgeMonths" Mode="ReadOnly" />
                        </td>
                        <td class="doseFields">
                            <asp:DynamicControl runat="server" DataField="MaxAgeMonths" Mode="ReadOnly" />
                        </td>
            </tr>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:PlaceHolder runat="server" ID="rowStart">
                <tr>
                        </asp:PlaceHolder>
                        <td class="editable">
                            <asp:LinkButton ID="UpdateButton" runat="server" CommandName="Update" Text="Update" /><br />
                            <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" /><br />
                            <asp:LinkButton ID="cancelButton" runat="server" CommandName="Cancel" Text="Cancel" CausesValidation="false" ValidationGroup="EditDose"  />
                        </td>
                        <td class="editable">
                            <asp:HiddenField runat="server" ID="FixedDoseId" Value='<%# Bind("FixedDoseId") %>'  />
                            <asp:HiddenField runat="server" ID="FixedDrugId" Value='<%# Bind("FixedDrugId") %>'  />
                            <asp:DynamicControl ID="DynamicControl6" runat="server" DataField="Dose" Mode="Edit" ValidationGroup="EditDose" />
                        </td>
                        <td>
                            <asp:DynamicControl ID="DynamicControl4" runat="server" DataField="MinAgeMonths" Mode="Edit" ValidationGroup="EditDose" />
                        </td>
                        <td class="editable">
                            <asp:DynamicControl ID="DynamicControl1" runat="server" DataField="MaxAgeMonths" Mode="Edit" ValidationGroup="EditDose" />
                        </td>
                 </tr>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                    <asp:PlaceHolder runat="server" ID="rowStart">
                 <tr>
                    </asp:PlaceHolder>
                        <td class="editable">
                            <asp:LinkButton ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" ValidationGroup="insertDose" /><br />
                            <asp:LinkButton ID="cancelInsert" runat="server" Text="Cancel" CausesValidation="false" />
                        </td>
                        <td class="editable">
                            <asp:HiddenField runat="server" ID="FixedDrugId" Value='<%# Bind("FixedDrugId") %>' ViewStateMode="Enabled"/>
                            <asp:DynamicControl ID="DynamicControl4" runat="server" DataField="Dose" Mode="Edit" ValidationGroup="insertDose" />
                        </td>
                        <td class="editable">
                            <asp:DynamicControl ID="DynamicControl1" runat="server" DataField="MinAgeMonths" Mode="Edit" ValidationGroup="insertDose" />
                        </td>
                        <td class="editable">
                            <asp:DynamicControl ID="DynamicControl2" runat="server" DataField="MaxAgeMonths" Mode="Edit" ValidationGroup="insertDose" />
                        </td>
                     </tr>
                    </InsertItemTemplate>
                    <LayoutTemplate>
                        <asp:PlaceHolder ID="dosePlaceholder" runat="server" />
                    </LayoutTemplate>
                </asp:ListView>
        </ItemTemplate>
        <LayoutTemplate>
            <table ID="itemPlaceholderContainer" runat="server" border="1" 
                style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                <tr class="mainHeader">
                    <th>
                    </th>
                    <th>
                        Drug Name
                    </th>
                    <th>

                    </th>
                    <th>
                        
                    </th>
                    <th>
                        Dose
                    </th>
                    <th title="Age must be greater than">
                        Min Age (months)
                    </th>
                    <th title="Age less than or equal to (max 1200 = 100 yo)">
                        Max Age (months)
                    </th>
                </tr>
                <tr ID="itemPlaceholder" runat="server" />
            </table>
        </LayoutTemplate>
    </asp:ListView>
</asp:Content>
<asp:Content ID="MyScripts" ContentPlaceHolderId="MasterScripts" runat="server">
<asp:ScriptManagerProxy runat="server" EnableViewState="false">
    <CompositeScript>
        <Scripts>
            <asp:ScriptReference Path="~/Scripts/editBolus.js" />
        </Scripts>
    </CompositeScript>
</asp:ScriptManagerProxy></asp:Content>
