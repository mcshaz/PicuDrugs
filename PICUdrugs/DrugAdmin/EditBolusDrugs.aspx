<%@ MasterType VirtualPath="~/Site.Master" %>
<%@ Page Title="Edit Bolus Drugs" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditBolusDrugs.aspx.cs" Inherits="PICUdrugs.drugAdmin.editBolusDrugs" %>
<asp:Content ID="Content1" ContentPlaceHolderId="HeadContent" runat="server">
    <link href="<%# ResolveUrl("~/Content/BolusDrugs.css")%>" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderId="headings" runat="server">
    <h2>Edit Bolus Drugs</h2>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderId="MainContent" runat="server">
    <asp:HiddenField ID="rowsToDisplayInsert" runat="server" />
    <asp:ObjectDataSource ID="BolusDrugObjDataSource" runat="server" 
        DataObjectTypeName="PICUdrugs.DAL.BolusDrug" DeleteMethod="DeleteBolusDrug" 
        InsertMethod="InsertBolusDrug" SelectMethod="GetBolusDrugs"
        TypeName="PICUdrugs.BLL.BolusBL" UpdateMethod="UpdateBolusDrug" OnUpdated="General_CRUD" OnInserted="General_CRUD"
        ConflictDetection="CompareAllValues" OldValuesParameterFormatString="orig{0}">
    </asp:ObjectDataSource>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="validationError" />
    <asp:ValidationSummary ID="InsertValSum" runat="server" ValidationGroup="insert" CssClass="validationError" />
    <asp:ValidationSummary ID="editValSum" runat="server" ValidationGroup="Edit" CssClass="validationError" />
    <asp:ValidationSummary ID="editDoseValSum" runat="server" ValidationGroup="EditDose" CssClass="validationError" />
    <asp:ValidationSummary ID="InsertDoseValSum" runat="server" ValidationGroup="insertDose" CssClass="validationError" />
    <asp:ListView ID="BolusDrugLV" runat="server" DataSourceID="BolusDrugObjDataSource"
        InsertItemPosition="LastItem" DataKeyNames="BolusDrugId"
        OnItemCreated="BolusDrugLV_ItemCreated" ViewStateMode="Disabled">
        <EditItemTemplate>
            <tr class="editable">
                <td>
                    <asp:LinkButton ID="UpdateButton" runat="server" CommandName="Update" 
                        Text="Update" /><br />
                    <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" 
                        Text="Delete" /><br />
                    <asp:LinkButton ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Cancel" />
                </td>
                <td>
                    <asp:HiddenField runat="server" ID="BolusDrugId" Value='<%# Bind("BolusDrugId") %>' />
                    <asp:DynamicControl runat="server" DataField="DrugName" Mode="Edit" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Route" Mode="Edit" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Conc_ml" Mode="Edit" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Units" Mode="Edit" CssClass="unitTB" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="AmpuleConcentration" Mode="Edit" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="AdultMax" Mode="Edit" />
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
                    <asp:LinkButton ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" ValidationGroup="insert" /><br />
                    <asp:LinkButton ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="DrugName" Mode="Insert" 
                        ValidationGroup="insert" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Route" Mode="Insert" 
                        ValidationGroup="insert" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Conc_ml" Mode="Insert" 
                        ValidationGroup="insert" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Units" Mode="Insert" 
                        ValidationGroup="insert" CssClass="unitTB" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="AmpuleConcentration" Mode="Insert" 
                        ValidationGroup="insert" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="AdultMax" Mode="Insert" 
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
                    <asp:HiddenField runat="server" ID="BolusDrugId" Value='<%# Eval("BolusDrugId") %>'  />
                    <asp:DynamicControl runat="server" DataField="DrugName" Mode="ReadOnly" />
                </td>
                <td runat="server">
                    <asp:DynamicControl runat="server" DataField="Route" Mode="ReadOnly" />
                </td>
                <td runat="server">
                    <asp:Label ID="Conc_ml_Lbl" runat="server" />
                </td>
                <td runat="server">
                    <asp:DynamicControl runat="server" DataField="Units" Mode="ReadOnly" />
                </td>
                <td runat="server">
                    <asp:DynamicControl runat="server" DataField="AmpuleConcentration" Mode="ReadOnly" />
                </td>
                <td runat="server">
                    <asp:DynamicControl runat="server" DataField="AdultMax" Mode="ReadOnly" />
                    <asp:DynamicControl ID="DynamicControl5" runat="server" DataField="Units" Mode="ReadOnly"  CssClass="subTH"/>
                </td>
                <td runat="server">
                    <asp:LinkButton ID="allowInsert" runat="server" Text="Insert" />
                </td>
                <asp:ObjectDataSource ID="bolusDoseObjDataSource" runat="server" 
                    DataObjectTypeName="PICUdrugs.DAL.bolusDose" DeleteMethod="DeleteBolusDose" 
                    InsertMethod="InsertBolusDose" SelectMethod="GetBolusDoses" OnDeleted="General_CRUD"
                    TypeName="PICUdrugs.BLL.BolusBL" UpdateMethod="UpdateBolusDose" OnUpdated="General_CRUD" OnInserted="General_CRUD"
                    ConflictDetection="CompareAllValues" OldValuesParameterFormatString="orig{0}">
                        <SelectParameters>                         
                            <asp:Parameter Name="drugId" Type="Int32"/>                      
                        </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ListView ID="bolusDoseLV" runat="server" DataSourceID="bolusDoseObjDataSource" ItemPlaceholderId="dosePlaceholder" ViewStateMode="Disabled" DataKeyNames="bolusDoseId"
                OnInit="bolusDoseLV_init" OnItemDataBound="bolusDoseLV_ItemBound" OnDataBound="bolusDose_allDataBound" InsertItemPosition="None" OnItemInserted="bolusDoseLV_Inserted"
                OnItemDeleted="bolusDoseLV_Deleted" >
                    <ItemTemplate>
                        <asp:PlaceHolder runat="server" ID="rowStart">
            <tr>
                        </asp:PlaceHolder>
                        <td class="doseFields">
                            <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" Text="Modify" />
                        </td>
                        <td colspan="2" class="doseFields">
                            <%-- <asp:HiddenField runat="server" ID="bolusDoseId" Value='<%# Bind("bolusDoseId") %>'  /> --%>
                            <asp:Label runat="server" ID="doseRange" />
                        </td>
                        <td colspan="2" class="doseFields">
                            <asp:Label runat="server" ID="weightRange" />
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
                            <asp:HiddenField runat="server" ID="bolusDoseId" Value='<%# Bind("bolusDoseId") %>'  />
                            <asp:HiddenField runat="server" ID="BolusDrugId" Value='<%# Bind("BolusDrugId") %>'  />
                            <span class="minMax">min</span><br />
                            <asp:DynamicControl ID="DynamicControl4" runat="server" DataField="MinDosePerKg" Mode="Edit" ValidationGroup="EditDose" />
                        </td>
                        <td class="editable">
                            <span class="minMax">max</span><br />
                            <asp:DynamicControl ID="DynamicControl1" runat="server" DataField="MaxDosePerKg" Mode="Edit" ValidationGroup="EditDose" />
                        </td>
                        <td class="editable">
                            <span class="minMax">min</span><br />
                            <asp:DynamicControl ID="DynamicControl2" runat="server" DataField="WeightMin" Mode="Edit" ValidationGroup="EditDose" />
                        </td>
                        <td class="editable">
                            <span class="minMax">max</span><br />
                            <asp:DynamicControl ID="DynamicControl3" runat="server" DataField="WeightMax" Mode="Edit" ValidationGroup="EditDose" />
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
                            <asp:HiddenField runat="server" ID="BolusDrugId" Value='<%# Bind("BolusDrugId") %>' ViewStateMode="Enabled"/>
                            <span class="minMax">min</span><br />
                            <asp:DynamicControl ID="DynamicControl4" runat="server" DataField="MinDosePerKg" Mode="Edit" ValidationGroup="insertDose" />
                        </td>
                        <td class="editable">
                            <span class="minMax">max</span><br />
                            <asp:DynamicControl ID="DynamicControl1" runat="server" DataField="MaxDosePerKg" Mode="Edit" ValidationGroup="insertDose" />
                        </td>
                        <td class="editable">
                            <span class="minMax">min</span><br />
                            <asp:DynamicControl ID="DynamicControl2" runat="server" DataField="WeightMin" Mode="Edit" ValidationGroup="insertDose" />
                        </td>
                        <td class="editable">
                            <span class="minMax">max</span><br />
                            <asp:DynamicControl ID="DynamicControl3" runat="server" DataField="WeightMax" Mode="Edit" ValidationGroup="insertDose" />
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
                    <th rowspan="2">
                    </th>
                    <th rowspan="2">
                        Drug<br />Name</th>
                    <th rowspan="2">
                        Drug<br />Route</th>
                    <th rowspan="2">
                        Conc.</th>
                    <th rowspan="2">
                        Units <br /><span class="headerDescription">(pleural)</span></th>
                    <th rowspan="2">
                        Ampule</th>
                    <th rowspan="2">
                        Adult<br />Dose</th>
                    <th colspan="6">
                        Dose</th>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td colspan="2">per Kg</td>
                    <td colspan="2">weight</td>
                </tr>
                <tr ID="itemPlaceholder" runat="server" />
            </table>
        </LayoutTemplate>
    </asp:ListView>
</asp:Content>
<asp:Content ID="MyScripts" ContentPlaceHolderId="masterScripts" runat="server">
    <script src="<%# ResolveUrl("~/Scripts/editBolus.js")%>" type="text/javascript" ></script>
</asp:Content>