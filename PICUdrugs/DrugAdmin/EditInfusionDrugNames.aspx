<%@ MasterType VirtualPath="~/Site.Master" %>
<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditInfusionDrugNames.aspx.cs" Inherits="PICUdrugs.drugAdmin.editInfusionDrugNames" %>
<asp:Content ID="Content1" ContentPlaceHolderId="HeadContent" runat="server">
    <style type="text/css">
        .listItemTable tr
        {
            background-color: #FFFFFF;
            border-collapse: collapse;
            border-color: #999999;
            border-style:none;
            border-width:1px;
            font-family: Verdana, Arial, Helvetica, sans-serif;
        }
        input[type=text]
        {
            width:97%
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderId="headings" runat="server">
    <h3>Edit Infusion Drug Names</h3>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderId="MainContent" runat="server">
    <asp:ValidationSummary ID="editValidationSummary" runat="server" ValidationGroup="Edit" />
    <asp:ValidationSummary ID="InsertValidationSummary" runat="server" ValidationGroup="insert" />
    <asp:ListView ID="InfusionListview" runat="server" DataKeyNames="InfusionDrugId" 
        DataSourceID="InfusionDrugsEntity" InsertItemPosition="LastItem" OnItemDataBound="InfusionLV_dataBound">
        <EditItemTemplate>
            <tr style="background-color: #999999;">
                <td>
                    <asp:LinkButton ID="UpdateButton" runat="server" CommandName="Update" 
                        Text="Update" CausesValidation="true" ValidationGroup="Edit"/> 
                    <asp:LinkButton ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Cancel" />
                </td>
                <td>
                    <asp:DynamicControl ID="editFullnameTB" runat="server" DataField="fullname" 
                        ValidationGroup="Edit" Mode="Edit" CssClass="fullname"/>
                </td>
                <td>
                    <asp:TextBox ID="abbrevTB" runat="server" Text='<%# Bind("Abbrev") %>' CssClass="abbrev" />
                </td>
                <td runat="server">
                    <asp:DropDownList ID="WardDropDown" runat="server"
                        DataTextField="Value" OnDataBinding="WardDropDown_DataBinding"
                        DataValueField="Key"
                        SelectedValue='<%# Bind("SpecificWardId") %>' />
                </td>
                <td>
                    <asp:DropDownList ID="prefixDropDown" runat="server" 
                            DataSourceID="SiPrefixesObjDataSrc" DataTextField="Value" 
                            DataValueField="Key" 
                            SelectedValue='<%# Bind("SiPrefixVal") %>'>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:DropDownList ID="unitDropDown" runat="server" 
                        DataSourceID="EntitySiUnits" DataTextField="Measure" 
                        DataValueField="SiUnitId"
                        SelectedValue='<%# Bind("SiUnitId") %>'>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:DropDownList ID="routeIDdropDown" runat="server" 
                    DataTextField="abbrev" DataValueField="routeId"
                    Text='<%# Bind("RouteId") %>' 
                    DataSourceID="DrugRoutesEntity"
                    AppendDataBoundItems="true">
                        <asp:ListItem Value="">Not Set</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:DropDownList ID="diluentIDdropDown" runat="server" 
                    DataTextField="abbrev" DataValueField="DiluentId"
                    Text='<%# Bind("InfusionDiluentId") %>' 
                    DataSourceID="diluentsEntity"
                    AppendDataBoundItems="true">
                        <asp:ListItem Value="">Not Set</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:DropDownList ID="ReferenceIDdropDown" runat="server" 
                    DataTextField="abbrev" DataValueField="DrugReferenceId"
                    Text='<%# Bind("DrugReferenceId") %>' 
                    DataSourceID="referencesEntity"/>
                </td>
                <td>
                    <asp:TextBox ID="NoteTB" runat="server" Text='<%# Bind("Note") %>' />
                </td>
                <td>
                    <asp:HiddenField runat="server" ID="IsTitratableHidden" Value='<%# Bind("IsTitratable") %>' />
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
            <tr>
                <td>
                    <asp:LinkButton ID="InsertButton" runat="server" CommandName="Insert" 
                        Text="Insert" CausesValidation="true" ValidationGroup="insert"/> 
                    <asp:LinkButton ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Clear" />
                </td>
                <td>
                    <asp:DynamicControl ID="InsertFullnameTB" runat="server" DataField="fullname"
                        ValidationGroup="insert" Mode="Insert" CssClass="fullname"/>
                </td>
                <td>
                    <asp:TextBox ID="abbrevTB" runat="server" Text='<%# Bind("Abbrev") %>' CssClass="abbrev"/>
                </td>
                <td runat="server">
                    <asp:DropDownList ID="WardDropDown" runat="server"
                        DataTextField="Value" OnDataBinding="WardDropDown_DataBinding"
                        DataValueField="Key"
                        SelectedValue='<%# Bind("SpecificWardId") %>' />
                </td>
                <td>
                    <asp:DropDownList ID="prefixDropDown" runat="server" 
                            DataSourceID="SiPrefixesObjDataSrc" DataTextField="Value" 
                            DataValueField="Key" 
                            SelectedValue='<%# Bind("SiPrefixVal") %>'>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:DropDownList ID="unitDropDown" runat="server" 
                        DataSourceID="EntitySiUnits" DataTextField="Measure" 
                        DataValueField="SiUnitId" SelectedValue='<%# Bind("SiUnitId") %>'>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:DropDownList ID="routeIDdropDown" runat="server" 
                    DataTextField="Abbrev" DataValueField="RouteId"
                    Text='<%# Bind("RouteId") %>' 
                    DataSourceID="DrugRoutesEntity"
                    AppendDataBoundItems="true">
                        <asp:ListItem Value="">Not Set</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:DropDownList ID="diluentIDdropDown" runat="server" 
                    DataTextField="Abbrev" DataValueField="DiluentId"
                    Text='<%# Bind("InfusionDiluentId") %>' 
                    DataSourceID="diluentsEntity"
                    AppendDataBoundItems="true">
                        <asp:ListItem Value="">Not Set</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:DropDownList ID="ReferenceIDdropDown" runat="server" 
                    DataTextField="Abbrev" DataValueField="DrugReferenceId"
                    Text='<%# Bind("DrugReferenceId") %>'
                    DataSourceID="referencesEntity"/>
                </td>
                <td>
                    <asp:TextBox ID="NoteTB" runat="server" Text='<%# Bind("Note") %>' />
                </td>
                <td>
                    <asp:RadioButton ID="titratableInfusionRadio" runat="server" 
                        Checked='<%# Bind("IsTitratable") %>' Text="titrate" GroupName="InfusionTypeRadioGroup" CssClass="InfusionTypeRadioGroup" 
                        ToolTip="generally Infusions which are titrated to effect (eg inotropes)"/>
                    <br />
                    <asp:RadioButton ID="loadInfusionRadio" runat="server" 
                        Text="fixed" GroupName="InfusionTypeRadioGroup" CssClass="InfusionTypeRadioGroup" Checked="true"
                        ToolTip="generally Infusions which require a physiological loading"/>
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="background-color: #FFFFFF;color: #284775;">
                <td>
                    <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" 
                        Text="Delete" /> 
                    <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="fullnameLabel" runat="server" />
                </td>
                <td>
                    <asp:Label ID="abbrevLabel" runat="server" Text='<%# Eval("Abbrev") %>' />
                </td>
                <td runat="server">
                    <asp:DropDownList ID="WardDropDown" runat="server"
                        DataTextField="Value" OnDataBinding="WardDropDown_DataBinding"
                        DataValueField="Key" Enabled="false"
                        SelectedValue='<%# Bind("SpecificWardId") %>' />
                </td>
                <td>
                    <asp:Label ID="SiPrefixValLabel" runat="server" />
                </td>
                <td>
                    <asp:Label ID="SiUnitIDLabel" runat="server" Text='<%# Eval("SiUnit.Measure") %>' />
                </td>
                <td>
                    <asp:Label ID="routeLabel" runat="server" Text='<%# Eval("DrugRoute.Abbrev") %>' />
                </td>
                <td>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("InfusionDiluent.Abbrev") %>' />
                </td>
                <td>
                    <asp:Label ID="ReferenceIDLabel" runat="server" Text='<%# Eval("DrugReferenceSource.Abbrev") %>' />
                </td>
                <td>
                    <asp:Label ID="NoteLabel" runat="server" Text='<%# Eval("Note") %>' />
                </td>
                <td>
                    <asp:HyperLink ID="InfusionHyperlink" runat="server" Target="_self" CssClass="likeAbutton" Text="edit..." />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table border="1" class="listItemTable">
                <thead>
                    <tr>
                        <th></th>
                        <th>
                            Drug Name</th>
                        <th>
                            Abbreviation</th>
                        <th>
                            Ward
                        </th>
                        <th>
                            prefix</th>
                        <th>
                            unit</th>
                        <th>
                            route</th>
                        <th>
                            diluent</th>
                        <th>
                            link</th>
                        <th>
                            Note</th>
                        <th>
                            Infusions</th>
                    </tr>
                </thead>
                <tbody>
                    <tr ID="itemPlaceholder" runat="server">
                    </tr>
                </tbody>
                <tfoot>
                </tfoot>
            </table>
        </LayoutTemplate>
    </asp:ListView>
    <asp:ObjectDataSource ID="InfusionDrugsEntity" runat="server" 
        DataObjectTypeName="PICUdrugs.DAL.InfusionDrug" DeleteMethod="DeleteInfusionDrug" 
        InsertMethod="InsertInfusionDrug" SelectMethod="GetInfusionDrugs"
        TypeName="PICUdrugs.DAL.InfusionDrugNameRepository" UpdateMethod="UpdateInfusionDrug"
        ConflictDetection="CompareAllValues" OldValuesParameterFormatString="orig{0}">
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="referencesEntity" runat="server" 
        DataObjectTypeName="PICUdrugs.DAL.DrugReferenceSource"
        TypeName="PICUdrugs.DAL.DrugReferenceRepository"
        SelectMethod="GetReferences"
        >
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="DrugRoutesEntity" runat="server" 
        DataObjectTypeName="PICUdrugs.DAL.DrugRoute"
        TypeName="PICUdrugs.DAL.DropDownItemsRepository"
        SelectMethod="GetDrugRoutes"
        >
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="diluentsEntity" runat="server" 
        DataObjectTypeName="PICUdrugs.DAL.InfusionDiluent"
        TypeName="PICUdrugs.DAL.DropDownItemsRepository"
        SelectMethod="GetInfusionDiluents"
        >
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="SiPrefixesObjDataSrc" runat="server" 
        SelectMethod="SiPrefixesList" TypeName="PICUdrugs.Utils.formUtilities"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="EntitySiUnits" runat="server" 
        DataObjectTypeName="PICUdrugs.DAL.SiUnit"
        TypeName="PICUdrugs.DAL.DropDownItemsRepository"
        SelectMethod="GetSiUnits"
        >
    </asp:ObjectDataSource>
</asp:Content>

<asp:Content ID="MyScripts" ContentPlaceHolderId="masterScripts" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('.listItemTable tr:even').css({ 'background-color': '#E0FFFF', 'color': '#333333' });
            $(':submit').each(function () {
                if (this.value == 'Update' || this.value == 'Insert') {
                    $(this).click(function () {
                        var $parentRow = $(this).closest('tr');
                        var $abbrev = $parentRow.find('.Abbrev');
                        if (!$abbrev.val()) {
                            var fullnameVal = $parentRow.find('.Fullname').find(':input').val()
                            if (fullnameVal) $abbrev.val(fullnameVal);
                        }
                    })
                }
            });
        });
    </script>
</asp:Content>