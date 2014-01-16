<%-- <%@ PreviousPageType VirtualPath="~/Pages/Admin/editInfusionDrugNames.aspx" %> --%>
<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="editTitratableInfusions.aspx.cs" Inherits="PICUdrugs.Pages.editTitratableInfusions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script src="../../Scripts/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="../../Scripts/editInfusion.js" type="text/javascript"></script>
    <link href="../../CSS/infusionDilution.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="sideNavLinks" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="headings" runat="server">
    <h2>Edit infusions for:</h2>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <h3><asp:Label ID="DrugName" runat="server"></asp:Label></h3>
    <asp:ObjectDataSource ID="variableTimeDilutionObjectDataSource" runat="server" 
        SelectMethod="getvariableTimeDilutions" InsertMethod="insertDilution"
        deleteMethod="deleteDilution" UpdateMethod="updateDilution"
        ConflictDetection="CompareAllValues" OldValuesParameterFormatString="orig{0}"
        TypeName="PICUdrugs.BLL.infusionBL" DataObjectTypeName="PICUdrugs.DAL.variableTimeDilution"
        onUpdated="variableTimeDilutionObjectDataSource_CRUD" OnInserted="variableTimeDilutionObjectDataSource_CRUD">
        <SelectParameters>
            <asp:QueryStringParameter Name="drugID" 
                QueryStringField="drugID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
   <asp:ObjectDataSource ID="SIprefixesObjDataSrc" runat="server"
        SelectMethod="SIprefixesList" TypeName="PICUdrugs.Utils.formUtilities"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dilutionMethodObjDataSrc" runat = "server" DataObjectTypeName="PICUdrugs.DAL.dilutionMethod"
        SelectMethod="getDilutionMethods" TypeName="PICUdrugs.BLL.infusionBL"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="doseCatObjDataSrc" runat = "server" DataObjectTypeName="PICUdrugs.DAL.doseCat"
        SelectMethod="getDoseCats" TypeName="PICUdrugs.BLL.infusionBL"></asp:ObjectDataSource>
    <asp:ValidationSummary ID="MainValidationSummary" runat="server" CssClass="validationError"/>
    <asp:ValidationSummary ID="insertDilValidationSummary" runat="server" CssClass="validationError"/>
    <asp:ValidationSummary ID="editDilValidationSummary" runat="server" CssClass="validationError" />
    <asp:ValidationSummary ID="editConcValidationSummary" runat="server" CssClass="validationError" />
    <asp:PlaceHolder ID="extraValidationSummaries" runat="server" />
    <asp:ListView ID="infDilutnLV" runat="server" DataKeyNames="infusionDilutionID" 
        DataSourceID="variableTimeDilutionObjectDataSource" InsertItemPosition="LastItem" 
        OnItemDataBound="infDilutnLV_itemDataBound" 
        onDataBound="infDilutnLV_allDataBound">
        <EditItemTemplate>
            <li class="editable">
                <ul class="templateBlock">
                    <li>
                        <asp:HiddenField ID="hiddenDrugID" runat="server" Value='<%# Bind("InfusionDrugID") %>' />
                        <asp:HiddenField ID="hiddenDilutionID" runat="server" Value='<%# Bind("infusionDilutionID") %>' />
                        Weight Range:
                        <asp:DynamicControl Mode="Edit" ID="wtMinTextBox" runat="server" DataField="wtMin" ValidationGroup="editDilution" />
                        -
                        <asp:DynamicControl Mode="Edit" ID="wtMaxTextBox" runat="server" DataField="wtMax" ValidationGroup="editDilution" />
                        Kg
                    </li>
                    <li>
                        Age Range:
                        <asp:DynamicControl Mode="Edit" ID="ageMinMonthsTextBox" runat="server" 
                            DataField="ageMinMonths" ValidationGroup="editDilution" />
                        -
                        <asp:DynamicControl Mode="Edit" ID="ageMaxMonthsTextBox" runat="server" 
                            DataField="ageMaxMonths" ValidationGroup="editDilution" />
                        Months
                    </li>
                    <li>
                        dilution Method:
                        <asp:DropDownList ID="dilutionMethodDropDown" runat="server" 
                            DataSourceID="dilutionMethodObjDataSrc" DataTextField="method" 
                            DataValueField="dilutionMethodID" CssClass="dilutionDropDown" 
                            SelectedValue='<%# Bind("dilutionMethodID") %>' />
                    </li>
                    <li>
                        Dose Range:
                        <asp:DynamicControl Mode="Edit" ID="rateMinTextBox" runat="server" DataField="rateMin" ValidationGroup="editDilution" />
                        -
                        <asp:DynamicControl Mode="Edit" ID="rateMaxTextBox" runat="server" DataField="rateMax" ValidationGroup="editDilution" />
                        <asp:DropDownList ID="prefixDropDown" runat="server" 
                            DataSourceID="SIprefixesObjDataSrc" DataTextField="Value" 
                            DataValueField="Key" 
                            SelectedValue='<%# Bind("SIprefixVal") %>'>
                        </asp:DropDownList>
                        <asp:Label ID="unitLabel" runat="server"><%=currentDrugUnit%></asp:Label>
                        <asp:Label ID="perKg" runat="server" CssClass="perKg">/kg</asp:Label>
                        per
                        <asp:RadioButton ID="perMinRadio" runat="server" 
                            Checked='<%# Bind("perMin") %>' Text="minute" GroupName="timeUnitRadioGroup" CssClass="timeUnitRadioGroup"/>
                        <asp:RadioButton ID="perHourRadio" runat="server" 
                            Text="hour" GroupName="timeUnitRadioGroup" CssClass="timeUnitRadioGroup"/>
                    </li>
                    <li>
                        Final Volume:
                        <asp:DynamicControl Mode="Edit" ID="volumeTextBox" runat="server" DataField="volume" CssClass="volume" ValidationGroup="editDilution"/>
                        ml
                    </li>
                    <li>
                        Round to (Significant Figures):
                        <asp:DynamicControl Mode="Edit" ID="RoundSigFigsTextBox" runat="server" 
                            DataField="RoundSigFigs" ValidationGroup="editDilution" />
                    </li>
                    <li>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                            Text="Update" ValidationGroup="editDilution" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                            Text="Cancel" />
                    </li>
                </ul>
            </li>
        </EditItemTemplate>
        <EmptyDataTemplate>
            No data was returned.
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <li class="editable">
                <ul class="templateBlock">
                    <li>
                        <asp:HiddenField ID="insertHiddenDrugID" runat="server" Value='<%# Bind("InfusionDrugID") %>' />
                        Weight Range:
                        <asp:DynamicControl Mode="Insert" ID="wtMinTextBox" runat="server" DataField="wtMin" ValidationGroup="insertDilution" />
                        -
                        <asp:DynamicControl Mode="Insert" ID="wtMaxTextBox" runat="server" DataField="wtMax" ValidationGroup="insertDilution" />
                        Kg
                    </li>
                    <li>
                        Age Range:
                        <asp:DynamicControl Mode="Insert" ID="ageMinMonthsTextBox" runat="server" 
                            DataField="ageMinMonths" ValidationGroup="insertDilution" />
                        -
                        <asp:DynamicControl Mode="Insert" ID="ageMaxMonthsTextBox" runat="server" 
                            DataField="ageMaxMonths" ValidationGroup="insertDilution" />
                        Months
                    </li>
                    <li>
                        dilution Method:
                        <asp:DropDownList ID="dilutionMethodDropDown" runat="server" 
                            DataSourceID="dilutionMethodObjDataSrc" DataTextField="method" 
                            DataValueField="dilutionMethodID" CssClass="dilutionDropDown" 
                            SelectedValue='<%# Bind("dilutionMethodID") %>' />
                    </li>
                    <li>
                        Dose Range:
                        <asp:DynamicControl Mode="Insert" ID="rateMinTextBox" runat="server" DataField="rateMin" ValidationGroup="insertDilution" />
                        -
                        <asp:DynamicControl Mode="Insert" ID="rateMaxTextBox" runat="server" DataField="rateMax" ValidationGroup="insertDilution" />
                        <asp:DropDownList ID="prefixDropDown" runat="server" 
                            DataSourceID="SIprefixesObjDataSrc" DataTextField="Value" 
                            DataValueField="Key" 
                            SelectedValue='<%# Bind("SIprefixVal") %>'>
                        </asp:DropDownList>
                        <asp:Label ID="unitLabel" runat="server"><%=currentDrugUnit%></asp:Label>
                        <asp:Label ID="perKg" runat="server" CssClass="perKg">/kg</asp:Label>
                        per
                        <asp:RadioButton ID="perMinRadio" runat="server" 
                            Checked='<%# Bind("perMin") %>' Text="minute" GroupName="timeUnitRadioGroup" CssClass="timeUnitRadioGroup"/>
                        <asp:RadioButton ID="perHourRadio" runat="server" 
                            Text="hour" GroupName="timeUnitRadioGroup" CssClass="timeUnitRadioGroup" />
                    </li>
                    <li>
                        Final Volume:
                        <asp:DynamicControl Mode="Insert" ID="volumeTextBox" runat="server" DataField="volume" CssClass="volume" ValidationGroup="insertDilution"/>
                        ml
                    </li>
                    <li>
                        Round to (Significant Figures):
                        <asp:DynamicControl Mode="Insert" ID="RoundSigFigsTextBox" runat="server" 
                            DataField="RoundSigFigs"  ValidationGroup="insertDilution"/>
                    </li>
                    <li>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                            Text="Insert" ValidationGroup="insertDilution" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                            Text="Cancel" />
                    </li>
                </ul>
            </li>
        </InsertItemTemplate>
        <ItemTemplate>
            <liclass="stdItem">
                <ul class="templateBlock">
                    <li>
                        <asp:HiddenField ID="hiddenDilutionID" runat="server" Value='<%# Eval("infusionDilutionID") %>' />
                        Weight Range:
                        <asp:Label ID="wtMinLabel" runat="server" Text='<%# Eval("wtMin") %>' />
                        -
                        <asp:Label ID="wtMaxLabel" runat="server" Text='<%# Eval("wtMax") %>' />
                        Kg
                    </li>
                    <li>
                        Age Range:
                        <asp:Label ID="ageMinMonthsLabel" runat="server" 
                            Text='<%# Eval("ageMinMonths") %>' />
                        -
                        <asp:Label ID="ageMaxMonthsLabel" runat="server" 
                            Text='<%# Eval("ageMaxMonths") %>' />
                            Months
                    </li>
                    <li>
                        dilution Method:
                        <asp:Label ID="dilutionMethodIDLabel" runat="server" 
                            Text='<%# Eval("dilutionMethod.method") %>' />
                    </li>
                    <li>
                        Dose Range:
                        <asp:Label ID="rateMinLabel" runat="server" Text='<%# Eval("rateMin") %>' />
                        -
                        <asp:Label ID="rateMaxLabel" runat="server" Text='<%# Eval("rateMax") %>' />
                        <asp:Label ID="rangeUnitLabel" runat="server" 
                            Text='<%# Eval("rateUnits()") %>' />
                    </li>
                    <li>
                        Final Volume:
                        <asp:Label ID="volumeLabel" runat="server" Text='<%# Eval("volume") %>' />
                        ml
                    </li>
                    <li>
                        Round to (Significant Figures):
                        <asp:Label ID="RoundSigFigsLabel" runat="server" 
                            Text='<%# Eval("RoundSigFigs") %>' />
                    </li>
                    <li>
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                        Text="Delete" />
                    </li>
                    <li>
                        <asp:ObjectDataSource ID="objconcentrations" runat="server" 
                            TypeName="PICUdrugs.BLL.infusionBL" DataObjectTypeName="PICUdrugs.DAL.variableTimeConcentration"
                            InsertMethod="insertconcentration" SelectMethod="getvariableTimeconcentrations"
                            deleteMethod="deleteconcentration" UpdateMethod="updateconcentration"
                            OldValuesParameterFormatString="orig{0}" ConflictDetection="CompareAllValues" 
                            OnUpdated="objconcentrations_CRUD" OnInserted="objconcentrations_CRUD">                      
                            <SelectParameters>                         
                                <asp:Parameter Name="infDilutionID" Type="Int32"/>                      
                            </SelectParameters>                   
                        </asp:ObjectDataSource>
                        <asp:ListView ID="infusionConcListView" runat="server" DataSourceID="objconcentrations"
                            ItemPlaceholderID="itemPlaceHolder1" InsertItemPosition="LastItem" DataKeyNames="infusionConcentrationID"
                            OnDataBound="concentrationLV_allDataBound" EnableViewState="True" OnInit="infusionConcLV_init"
                            OnItemCreated="concentrationLV_itemCreated">
                            <%-- DataSourceID="EntityDilutionMethods"  --%>
                            <EditItemTemplate>
                                <tr class="editable">
                                    <td>
                                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                                            Text="Update" ValidationGroup="editconcentration" />
                                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                                            Text="Cancel" />
                                    </td>
                                    <td>
                                        <asp:HiddenField runat="server" ID="infusionDilutionID" Value='<%# Bind("infusionDilutionID") %>'/>
                                        <asp:HiddenField runat="server" ID="infusionConcentrationID" Value='<%# Bind("infusionConcentrationID") %>'/>
                                        <asp:DropDownList ID="doseCatDropDown" runat="server" 
                                                DataSourceID="doseCatObjDataSrc" DataTextField="Category" 
                                                DataValueField="doseCatID" 
                                                SelectedValue='<%# Bind("doseCatID") %>'
                                                AppendDataBoundItems="true">
                                            <asp:ListItem Value="">Not Set</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:DynamicControl Mode="Edit" ID="concentrationTextBox" runat="server" 
                                            DataField="concentration" ValidationGroup="editconcentration"/>
                                    </td>
                                </tr>
                           </EditItemTemplate>
                            <EmptyDataTemplate>
                                <tr>
                                    <td>
                                        No data was returned.</td>
                                </tr>
                            </EmptyDataTemplate>
                            <InsertItemTemplate>
                                <tr class="editable">
                                    <td>
                                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert"
                                            Text="Insert" CausesValidation="true"/>
                                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                                            Text="Clear" />
                                    </td>
                                    <td>
                                        <asp:HiddenField runat="server" ID="insertinfusionDilutionID" Value='<%# Bind("infusionDilutionID") %>'/>
                                        <asp:DropDownList ID="doseCatDropDown" runat="server" 
                                                DataSourceID="doseCatObjDataSrc" DataTextField="Category" 
                                                DataValueField="doseCatID" 
                                                SelectedValue='<%# Bind("doseCatID") %>'
                                                AppendDataBoundItems="true">
                                            <asp:ListItem Value="">Not Set</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:DynamicControl Mode="Insert" ID="concentrationTextBox" runat="server" 
                                            DataField="concentration" />
                                    </td>
                                </tr>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                                            Text="Delete" />
                                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                                    </td>
                                    <td>
                                        <asp:Label ID="infusionConcentrationIDLabel" runat="server" 
                                            Text='<%# Eval("doseCat.Category") %>' />
                                    </td>
                                    <td>
                                        <asp:DynamicControl Mode="ReadOnly" ID="concentrationTextBox" runat="server" 
                                            DataField="concentration" />
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <table class="doseCatTable">
                                 <thead>
                                    <tr>
                                        <th>
                                        </th>
                                        <th>
                                            Category</th>
                                        <th>
                                            1ml/h=<br />
                                            <asp:Label runat="server" ID="unitDescription" CssClass="subTH"/></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr ID="itemPlaceHolder1" runat="server"></tr>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td></td>
                                    </tr>
                                </tfoot>
                                </table>
                            </LayoutTemplate>
                        </asp:ListView>
                    </li>
                </ul>
            </li>
        </ItemTemplate>
        <LayoutTemplate>
                <ul runat="server" ID="itemPlaceholderContainer" 
                    style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                    <li runat="server" id="itemPlaceholder" />
                </ul>
                <div style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF;">
                </div>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <li style="background-color: #E2DED6;font-weight: bold;color: #333333;">
                <ul>
                    <li>
                        dilution Method:
                        <asp:Label ID="dilutionMethodIDLabel" runat="server" 
                            Text='<%# Eval("dilutionMethod.method") %>' />
                    </li>
                    <li>
                        Dose Range:
                        <asp:Label ID="rateMinLabel" runat="server" Text='<%# Eval("rateMin") %>' />
                        -
                        <asp:Label ID="rateMaxLabel" runat="server" Text='<%# Eval("rateMax") %>' />
                        <asp:Label ID="SIprefixValLabel" runat="server" 
                            Text='<%# Eval("finalunits") %>' />
                    </li>
                    <li>
                        Final Volume:
                        <asp:Label ID="volumeLabel" runat="server" Text='<%# Eval("volume") %>' />
                        ml
                    </li>
                    <li>
                        Weight Range:
                        <asp:Label ID="wtMinLabel" runat="server" Text='<%# Eval("wtMin") %>' />
                        -
                        <asp:Label ID="wtMaxLabel" runat="server" Text='<%# Eval("wtMax") %>' />
                        Kg
                    </li>
                    <li>
                        Age Range:
                        <asp:Label ID="ageMinMonthsLabel" runat="server" 
                            Text='<%# Eval("ageMinMonths") %>' />
                        -
                        <asp:Label ID="ageMaxMonthsLabel" runat="server" 
                            Text='<%# Eval("ageMaxMonths") %>' />
                            Months
                    </li>
                    <li>
                        Round to (Significant Figures):
                        <asp:Label ID="RoundSigFigsLabel" runat="server" 
                            Text='<%# Eval("RoundSigFigs") %>' />
                    </li>
                    <li>
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                        Text="Delete" />
                    </li>
                </ul>
            </li>
        </SelectedItemTemplate>
    </asp:ListView>
</asp:Content>
