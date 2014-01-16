<%-- <%@ PreviousPageType VirtualPath="~/Pages/Admin/editInfusionDrugNames.aspx" %> --%>
<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="editInfusions_oldNestedListViews.aspx.cs" 
    Inherits="PICUdrugs.Pages.editInfusions_oldNestedListViews" ViewStateMode="Disabled" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script src="../../Scripts/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="../../Scripts/editInfusion.js" type="text/javascript"></script>
    <script src="../../Scripts/editFixedTimeInfusions.js" type="text/javascript"></script>
    <link href="../../CSS/infusionDilution.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="sideNavLinks" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="headings" runat="server">
    <h2>Edit infusions for:</h2>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HiddenField runat="server" ID="JSdilutionArray" ViewStateMode="Enabled" />
    <h3><asp:Label ID="DrugName" runat="server" ViewStateMode="Enabled"></asp:Label></h3>
    <asp:ObjectDataSource ID="dilutionsObjDataSource" runat="server" 
        InsertMethod="insertDilution" deleteMethod="deleteDilution" UpdateMethod="updateDilution"
        ConflictDetection="CompareAllValues" OldValuesParameterFormatString="orig{0}"
        TypeName="PICUdrugs.BLL.infusionBL" OnUpdated="ObjDilutions_CRUD" OnInserted="ObjDilutions_CRUD">
        <SelectParameters>
            <asp:QueryStringParameter Name="drugID" 
                QueryStringField="drugID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
   <asp:ObjectDataSource ID="SIprefixesObjDataSrc" runat="server" 
        SelectMethod="SIprefixesList" TypeName="PICUdrugs.Utils.formUtilities"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dilutionMethodObjDataSrc" runat = "server"
        SelectMethod="getDilutionMethods" TypeName="PICUdrugs.BLL.infusionBL"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="doseCatObjDataSrc" runat = "server"
        SelectMethod="getDoseCats" TypeName="PICUdrugs.BLL.infusionBL"></asp:ObjectDataSource>
    <asp:ValidationSummary ID="MainValidationSummary" runat="server" CssClass="validationError"/>
    <asp:ValidationSummary ID="insertDilValidationSummary" runat="server" ValidationGroup="insertDilution" CssClass="validationError"/>
    <asp:ValidationSummary ID="editDilValidationSummary" runat="server" ValidationGroup="editDilution" CssClass="validationError"/>
    <asp:ValidationSummary ID="editConcValidationSummary" runat="server" ValidationGroup="editConcentration" CssClass="validationError"/>
    <asp:PlaceHolder ID="extraValidationSummaries" runat="server" />
    <asp:ListView ID="infDilutnLV" runat="server" DataKeyNames="infusionDilutionID" 
        DataSourceID="dilutionsObjDataSource" InsertItemPosition="LastItem" 
        OnItemDataBound="infDilutnLV_itemDataBound"
        onDataBound="infDilutnLV_allDataBound" ViewStateMode="Disabled">
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
                        Dose Units:
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
                        Dose Units:
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
            <li class="itemView">
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
                        Round to (Significant Figures):
                        <asp:Label ID="RoundSigFigsLabel" runat="server" 
                            Text='<%# Eval("RoundSigFigs") %>' />
                    </li>
                    <li>
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    </li>
                    <li>
                        Infusions:
                        <span class="concOptions"></span>
                        <asp:ObjectDataSource ID="objConcentrations" runat="server" 
                            TypeName="PICUdrugs.BLL.infusionBL" DataObjectTypeName="PICUdrugs.DAL.fixedTimeConcentration"
                            InsertMethod="insertConcentration" SelectMethod="getfixedTimeConcentrations"
                            deleteMethod="deleteConcentration" UpdateMethod="updateConcentration"
                            OldValuesParameterFormatString="orig{0}" ConflictDetection="CompareAllValues" 
                            OnUpdated="objConcentrations_CRUD" OnInserted="objConcentrations_CRUD">                      
                            <SelectParameters>                         
                                <asp:Parameter Name="infDilutionID" Type="Int32"/>                      
                            </SelectParameters>                   
                        </asp:ObjectDataSource>
                        <asp:ListView ID="infusionConcListView" runat="server" DataSourceID="objConcentrations"
                            ItemPlaceholderID="itemPlaceHolder1" InsertItemPosition="LastItem" DataKeyNames="infusionConcentrationID"
                            OnDataBound="ConcentrationLV_allDataBound" OnInit="infusionConcLV_init"
                            OnItemCreated="ConcentrationLV_itemCreated" ViewStateMode="Disabled">
                            <%-- DataSourceID="EntityDilutionMethods"  --%>
                            <EditItemTemplate>
                                <tr class="editable">
                                    <td>
                                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                                            Text="Update" ValidationGroup="editConcentration" />
                                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                                            Text="Cancel" />
                                    </td>
                                    <td>
                                        <asp:HiddenField runat="server" ID="infusionDilutionID" Value='<%# Bind("infusionDilutionID") %>'/>
                                        <asp:HiddenField runat="server" ID="infusionConcentrationID" Value='<%# Bind("infusionConcentrationID") %>'/>
                                        <asp:DynamicControl Mode="Edit" ID="ConcentrationTextBox" runat="server" 
                                            DataField="concentration" ValidationGroup="editConcentration" CssClass="concField"/>
                                    </td>
                                    <td>
                                        <asp:DynamicControl Mode="Edit" ID="volumeDynamicControl" runat="server" 
                                            DataField="volume" ValidationGroup="editConcentration" CssClass="volume"/>
                                    </td>
                                    <td>
                                        <asp:DynamicControl Mode="Edit" ID="rateDynamicControl" runat="server" 
                                            DataField="rate" ValidationGroup="editConcentration"/>                               
                                    </td>
                                    <td>
                                        <asp:DynamicControl Mode="Edit" ID="stopTimeDynamicControl" runat="server" 
                                            DataField="stopMinutes" ValidationGroup="editConcentration"/>                                    
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
                                        <asp:DynamicControl Mode="Insert" ID="ConcentrationTextBox" runat="server" 
                                            DataField="concentration" CssClass="concField"/>
                                    </td>
                                    <td>
                                        <asp:DynamicControl Mode="Insert" ID="volumeDynamicControl" runat="server" 
                                            DataField="volume" CssClass="volume"/>
                                    </td>
                                    <td>
                                        <asp:DynamicControl Mode="Insert" ID="rateDynamicControl" runat="server" 
                                            DataField="rate"/>                               
                                    </td>
                                    <td>
                                        <asp:DynamicControl Mode="Insert" ID="stopTimeDynamicControl" runat="server" 
                                            DataField="stopMinutes"/>                                    
                                    </td>
                                </tr>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                                    </td>
                                    <td>
                                        <asp:DynamicControl Mode="ReadOnly" ID="ConcentrationTextBox" runat="server" 
                                            DataField="concentration" ValidationGroup="editConcentration" CssClass="concField"/>
                                    </td>
                                    <td>
                                        <asp:DynamicControl Mode="ReadOnly" ID="volumeDynamicControl" runat="server" 
                                            DataField="volume" ValidationGroup="editConcentration" CssClass="volume"/>
                                    </td>
                                    <td>
                                        <asp:DynamicControl Mode="ReadOnly" ID="rateDynamicControl" runat="server" 
                                            DataField="rate" ValidationGroup="editConcentration"/>                               
                                    </td>
                                    <td>
                                        <asp:DynamicControl Mode="ReadOnly" ID="stopTimeDynamicControl" runat="server" 
                                            DataField="stopMinutes" ValidationGroup="editConcentration"/>                                    
                                    </td>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <table class="doseCatTable">
                                 <thead>
                                    <tr>
                                        <th>
                                        </th>
                                        <th><span class="conc">1ml/h=</span>
                                            <span class="drugAdded" style="display:none;">Add</span></th>
                                        <th>
                                            diluted to</th>
                                        <th>
                                            rate</th>
                                        <th>
                                            Stop @</th>
                                    </tr>
                                    <tr class="subTH">
                                        <th>
                                        </th>
                                        <th><span class="conc"><asp:Label runat="server" ID="concUnits" ViewStateMode="Enabled" /></span>
                                            <span class="drugAdded" style="display:none;">
                                            <asp:Label runat="server" ID="drugUnits" ViewStateMode="Enabled" /></span></th>
                                        <th>
                                            <asp:Label runat="server" ID="dilutionUnits" ViewStateMode="Enabled" /></th>
                                        <th>
                                            <asp:Label runat="server" ID="rateUnits" ViewStateMode="Enabled" /></th>
                                        <th>
                                            (mins)</th>                                    
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr ID="itemPlaceHolder1" runat="server"></tr>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td>
                                        </td>
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
                        Dose Units
                        <asp:Label ID="SIprefixValLabel" runat="server" 
                            Text='<%# Eval("finalunits") %>' />
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
