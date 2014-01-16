<%@ MasterType VirtualPath="~/Site.Master" %>
<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditInfusions.aspx.cs" 
    Inherits="PICUdrugs.drugAdmin.editInfusions" ViewStateMode="Inherit" %>
<asp:Content ID="Content1" ContentPlaceHolderId="HeadContent" runat="server">
    
    <link href="<%# ResolveUrl("~/CSS/InfusionDilution.css")%>" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderId="headings" runat="server">
    <h2>Edit Infusions for:</h2>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderId="MainContent" runat="server">
    <asp:ObjectDataSource ID="DilutionsObjDataSource" runat="server" 
        InsertMethod="InsertDilution" DeleteMethod="DeleteDilution" UpdateMethod="UpdateDilution"
        ConflictDetection="CompareAllValues" OldValuesParameterFormatString="orig{0}"
        TypeName="PICUdrugs.BLL.InfusionBL" OnUpdated="General_CRUD" OnInserted="General_CRUD">
        <SelectParameters>
            <asp:QueryStringParameter Name="drugId" 
                QueryStringField="drugId" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
   <asp:ObjectDataSource ID="SiPrefixesObjDataSrc" runat="server" 
        SelectMethod="SiPrefixesList" TypeName="PICUdrugs.Utils.formUtilities">
       <SelectParameters>
           <asp:QueryStringParameter Name="excludeAbove" QueryStringField="drugPrefix" 
               Type="Int32" />
       </SelectParameters>
    </asp:ObjectDataSource>

    <asp:ObjectDataSource ID="AmpConcObjDataSrc" runat="server" SelectMethod="GetAmpules"
        UpdateMethod="UpdateAmpule" DeleteMethod="DeleteAmpule" TypeName="PICUdrugs.BLL.DrugAmpuleBL"
        OnUpdated="General_CRUD" OnInserted="General_CRUD" DataObjectTypeName="PICUdrugs.DAL.DrugAmpuleConcentration" 
        ConflictDetection="CompareAllValues"
        OldValuesParameterFormatString="orig{0}" InsertMethod="InsertAmpule" >
        <SelectParameters>
            <asp:QueryStringParameter Name="drugId" 
                QueryStringField="drugId" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>

    <h3><asp:Literal ID="DrugName" runat="server" ViewStateMode="Disabled"></asp:Literal></h3>

    <asp:ValidationSummary ID="MainValSum" runat="server" CssClass="validationError"/>
    <asp:ValidationSummary ID="InsertDilValSum" runat="server" ValidationGroup="insertDilution" CssClass="validationError"/>
    <asp:ValidationSummary ID="editDilValSum" runat="server" ValidationGroup="editDilution" CssClass="validationError"/>
    <asp:ValidationSummary ID="ConcentrationValSum" runat="server" ValidationGroup="editConcentration" CssClass="validationError"/>
    <asp:ValidationSummary ID="editAmpValidationSummary" runat="server" ValidationGroup="editAmpConc" CssClass="validationError" />
    <asp:ValidationSummary ID="InsertAmpValidationSummary" runat="server" ValidationGroup="insertAmpConc" CssClass="validationError" />
    <asp:PlaceHolder ID="extraValidationSummaries" runat="server" />

    <h4>Ampule(s) available at Starship: </h4>
    <asp:ListView ID="DrugAmpListView" runat="server" DataSourceID="AmpConcObjDataSrc" 
        InsertItemPosition="LastItem" DataKeyNames="ampuleConcentrationId" ViewStateMode="Disabled"
        ondatabound="DrugAmpLV_AllDataBound">
        <ItemTemplate>
            <tr style="background-color: #FFFFFF;color: #284775;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                        Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:HiddenField ID="ampConc" runat="server" Value='<%# Eval("ampuleConcentrationId") %>' />
                    <asp:DynamicControl ID="DynamicControl1" runat="server" DataField="Concentration" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl ID="DynamicControl2" runat="server" DataField="Volume" Mode="ReadOnly" />
                </td>
            </tr>
        </ItemTemplate>
        <EditItemTemplate>
            <tr class="edit">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" ValidationGroup="editAmpConc"
                        Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" CausesValidation="false"
                        Text="Cancel" />
                </td>
                <td>
                    <span class="balanceValidators"></span>
                    <asp:HiddenField runat="server" ID="ampConc" Value='<%# Bind("ampuleConcentrationId") %>' />
                    <asp:HiddenField runat="server" ID="drugId" Value='<%# Bind("InfusionDrugId") %>' />
                    <asp:DynamicControl ID="DynamicControl3" runat="server" DataField="Concentration" Mode="Edit" ValidationGroup="editAmpConc"/>
                </td>
                <td>
                    <span class="balanceValidators"></span>
                    <asp:DynamicControl ID="DynamicControl4" runat="server" DataField="Volume" Mode="Edit" ValidationGroup="editAmpConc"/>
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table ID="Table1" runat="server" 
                style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                <tr>
                    <td>
                        No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr class="insert">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" 
                        ValidationGroup="insertAmpConc" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" CausesValidation="false"
                        Text="Clear" />
                </td>
                <td>
                    <span class="balanceValidators"></span>
                    <asp:HiddenField ID="drugId" runat="server" Value='<%# Bind("InfusionDrugId") %>' />
                    <asp:DynamicControl ID="DynamicControl5" runat="server" DataField="Concentration" Mode="Insert" 
                        ValidationGroup="insertAmpConc" />
                </td>
                <td>
                    <span class="balanceValidators"></span>
                    <asp:DynamicControl ID="DynamicControl6" runat="server" DataField="Volume" Mode="Insert" 
                        ValidationGroup="insertAmpConc" />
                </td>
            </tr>
        </InsertItemTemplate>
        <LayoutTemplate>
            <table ID="itemPlaceholderContainer" runat="server" border="1" class="drugAmpTable">
                <tr id="headerRowAmpule" style="background-color: #E0FFFF;color: #333333;">
                    <th>
                    </th>
                    <th id="AmpConcHeader">
                        Concentration</th>
                    <th id="AmpVolHeader">
                        Ampule Volume</th>
                </tr>
                <tr class="subTH" id="subHeaderRowAmpule" style="background-color: #E0FFFF;color: #333333;">
                    <th>
                    </th>
                    <th ID="drugAmpuleConcentration" runat="server">
                        </th>
                    <th>
                        mL</th>
                </tr>
                <tr ID="itemPlaceholder" runat="server">
                </tr>
            </table>
        </LayoutTemplate>
    </asp:ListView>

    <h4>Administration guidelines: <asp:Label ID="DrugReferenceSource" runat="server" /></h4>
    <h4>Associated Infusions: </h4>

    <asp:ListView ID="infDilutnLV" runat="server" DataKeyNames="InfusionDilutionId" 
        DataSourceID="DilutionsObjDataSource" InsertItemPosition="LastItem"
        OnItemCreated="InfDilutnLV_itemCreated"  OnItemDataBound="InfDilutnLV_itemDataBound"
        onDataBound="InfDilutnLV_allDataBound" ViewStateMode="Disabled" >
        <EditItemTemplate>
            <li class="edit">
                <fieldset><legend>Edit existing Infusion rules for specific patient age and weight</legend>
                    <ul class="templateBlock">
                        <li>
                            <asp:HiddenField ID="hiddenDrugId" runat="server" Value='<%# Bind("InfusionDrugId") %>' />
                            <asp:HiddenField ID="hiddenDilutionId" runat="server" Value='<%# Bind("InfusionDilutionId") %>' />
                            <div class="fieldLabel">Weight Range <span class=""><span class="unit">(Kg)</span>:</div>
                            <div class="fieldInputs">
                                <label class="minMax">
                                    <asp:DynamicControl Mode="Edit" ID="WeightMinTextBox" runat="server" DataField="WeightMin" ValidationGroup="editDilution" />
                                    <span class="describe">(&lt;min)</span>
                                </label>
                                <span class="midVert"> - &nbsp</span>
                                <label class="minMax">
                                    <asp:DynamicControl Mode="Edit" ID="WeightMaxTextBox" runat="server" DataField="WeightMax" ValidationGroup="editDilution" />
                                    <span class="describe">(&ge;max)</span>
                                </label>
                            </div>
                        </li>
                        <li>
                            <div class="fieldLabel">Age Range:</div>
                            <div class="fieldInputs">
                                <span class="minMax">
                                    <asp:DynamicControl Mode="Edit" ID="AgeMinMonthsTextBox" runat="server" 
                                        DataField="AgeMinMonths" ValidationGroup="editDilution" CssClass="ageMonths"/>
                                </span>
                                <span class="describe">(&le;min)</span>
                                <span class="midVert"> - &nbsp</span>
                                <span class="minMax">
                                    <asp:DynamicControl Mode="Edit" ID="AgeMaxMonthsTextBox" runat="server" 
                                        DataField="AgeMaxMonths" ValidationGroup="editDilution" CssClass="ageMonths"/>
                                </span>
                                <span class="describe">(&ge;max)</span>
                            </div>
                        </li>
                        <li>
                            <div class="fieldLabel">Dilution Method:</div>
                            <div class="fieldInputs">
                                <span class="midVert">
                                    <asp:DropDownList ID="DilutionMethodDropDown" runat="server"
                                        DataTextField="Description" OnDataBinding="DilutionMethodDropDown_DataBinding"
                                        DataValueField="DilutionMethodId" CssClass="DilutionDropDown" 
                                        SelectedValue='<%# Bind("DilutionMethodId") %>' />
                                </span>
                            </div>
                        </li>
                        <asp:PlaceHolder ID="variableTimeSpecific" runat="server" >
                            <li>
                                <div class="fieldLabel">Dose Range:</div>
                                <div class="fieldInputs">
                                    <label class="minMax">
                                        <asp:DynamicControl Mode="Edit" ID="rateMinDC" DataField="RateMin" runat="server" ValidationGroup="editDilution" />
                                        <span class="describe">(min)</span>
                                    </label>
                                    <span class="midVert"> - &nbsp</span>
                                    <label class="minMax">
                                        <asp:DynamicControl Mode="Edit" ID="rateMaxDC" DataField="RateMax" runat="server" ValidationGroup="editDilution" />
                                        <span class="describe">(max)</span>
                                    </label>
                                </div>
                            </li>
                            <li>
                                <div class="fieldLabel"><asp:Label runat="server" ID="volumeLabel" AssociatedControlID="volumeDC" >Final Volume:</asp:Label></div>
                                <div class="fieldInputs">
                                    <asp:DynamicControl Mode="Edit" ID="volumeDC" DataField="Volume" runat="server" ValidationGroup="editDilution" CssClass="singleInput"/>
                                    <span class="units"> mL</span>
                                </div>
                            </li>
                        </asp:PlaceHolder>
                        <li>
                            <div class="fieldLabel">Dose Units:</div>
                            <div class="fieldInputs">
                                <span class="midVert">
                                    <asp:DropDownList ID="prefixDropDown" runat="server" 
                                        DataSourceID="SiPrefixesObjDataSrc" DataTextField="Value" 
                                        DataValueField="Key" 
                                        SelectedValue='<%# Bind("SiPrefixVal") %>'>
                                    </asp:DropDownList>
                                    <asp:Label ID="unitLabel" runat="server"></asp:Label>
                                    <asp:Label ID="IsPerKg" runat="server" CssClass="IsPerKg">/kg</asp:Label>
                                        per 
                                </span>
                                <div class="radioVert">
                                    <asp:RadioButton ID="IsPerMinRadio" runat="server" 
                                        Checked='<%# Bind("IsPerMin") %>' Text="minute" GroupName="timeUnitRadioGroup" CssClass="timeUnitRadioGroup"/>
                                    <asp:RadioButton ID="perHourRadio" runat="server" 
                                        Text="hour" GroupName="timeUnitRadioGroup" CssClass="timeUnitRadioGroup"/>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="fieldLabel">Reference Page:</div>
                            <div class="fieldInputs">
                                <asp:Label ID="refHref" runat="server"  CssClass="hrefDescription"/>
                                <asp:DynamicControl Mode="Edit" ID="refPgDC" DataField="ReferencePage" runat="server" ValidationGroup="editDilution" CssClass="longTB" />
                            </div>                       
                        </li>
                        <asp:PlaceHolder ID="fixedTimeSpecific" runat="server" >

                        </asp:PlaceHolder>
                        <%-- 
                        <li>
                            Round to (Significant Figures):
                            <asp:DynamicControl Mode="Edit" ID="RoundSigFigsTextBox" runat="server" 
                                DataField="RoundSigFigs" ValidationGroup="editDilution" />
                        </li>
                        --%>
                        <li>
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" ValidationGroup="editDilution"
                                Text="Update" />
                            <asp:Button ID="DeleteInfusionButton" runat="server" CommandName="Delete" Text="Delete" CausesValidation="false"/>
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" CausesValidation="false"
                                Text="Cancel" />
                        </li>
                    </ul>
                </fieldset>
            </li>
        </EditItemTemplate>
        <EmptyDataTemplate>
            No data was returned.
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <li class="insert">
                <fieldset><legend>Insert new Infusion rules for specific patient age and weight</legend>
                    <ul class="templateBlock">
                        <li>
                            <asp:HiddenField ID="InsertHiddenDrugId" runat="server" Value='<%# Bind("InfusionDrugId") %>' />
                            <div class="fieldLabel">Weight Range <span class="unit">(Kg)</span>:</div>
                            <div class="fieldInputs">
                                <label class="minMax">
                                    <asp:DynamicControl Mode="Insert" ID="WeightMinTextBox" runat="server" DataField="WeightMin" ValidationGroup="insertDilution" />
                                    <span class="describe">(&gt;min)</span>
                                </label>
                                <span class="midVert"> - &nbsp;</span>
                                <label class="minMax">
                                    <asp:DynamicControl Mode="Insert" ID="WeightMaxTextBox" runat="server" DataField="WeightMax" ValidationGroup="insertDilution" />
                                    <span class="describe">(&le;max)</span>
                                </label>
                            </div>
                        </li>
                        <li>
                            <div class="fieldLabel">Age Range:</div>
                            <div class="fieldInputs">
                                <span class="minMax">
                                    <asp:DynamicControl Mode="Insert" ID="AgeMinMonthsTextBox" runat="server" 
                                        DataField="AgeMinMonths" ValidationGroup="insertDilution" CssClass="ageMonths"/>
                                </span>
                                <span class="describe">(&le;min)</span>
                                <span class="midVert"> - &nbsp</span>
                                <span class="minMax">
                                    <asp:DynamicControl Mode="Insert" ID="AgeMaxMonthsTextBox" runat="server" 
                                        DataField="AgeMaxMonths" ValidationGroup="insertDilution" CssClass="ageMonths"/>
                                </span>
                                <span class="describe">(&ge;max)</span>
                            </div>
                        </li>
                        <li>
                            <div class="fieldLabel">Dilution Method:</div>
                            <div class="fieldInputs">
                                <span class="midVert">
                                    <asp:DropDownList ID="DilutionMethodDropDown" runat="server" 
                                        DataTextField="Description" OnDataBinding="DilutionMethodDropDown_DataBinding"
                                        DataValueField="DilutionMethodId" CssClass="DilutionDropDown" 
                                        SelectedValue='<%# Bind("DilutionMethodId") %>' />
                                </span>
                            </div>
                        </li>
                            <asp:PlaceHolder ID="variableTimeSpecific" runat="server" >
                                <li>
                                    <div class="fieldLabel">Dose Range:</div>
                                    <div class="fieldInputs">
                                        <label class="minMax">
                                            <asp:DynamicControl Mode="Insert" ID="rateMinDC" DataField="RateMin" runat="server" ValidationGroup="insertDilution" />
                                            <span class="describe">(min)</span>
                                        </label>
                                        <span class="midVert"> - &nbsp</span>
                                        <label class="minMax">
                                            <asp:DynamicControl Mode="Insert" ID="rateMaxDC" DataField="RateMax" runat="server" ValidationGroup="insertDilution" />
                                            <span class="describe">(max)</span>
                                        </label>
                                    </div>
                                </li>
                            <li>
                                <div class="fieldLabel"><asp:Label runat="server" ID="volumeLabel" AssociatedControlID="volumeDC" >Final Volume:</asp:Label></div>
                                <div class="fieldInputs">
                                    <asp:DynamicControl Mode="Edit" ID="volumeDC" DataField="Volume" runat="server" CssClass="singleInput"  ValidationGroup="editDilution" />
                                    <span class="units"> mL</span>
                                </div>
                            </li>
                            </asp:PlaceHolder>
                        <li>
                            <div class="fieldLabel">Dose Units:</div>
                            <div class="fieldInputs">
                                <span class="midVert">
                                    <asp:DropDownList ID="prefixDropDown" runat="server" 
                                        DataSourceID="SiPrefixesObjDataSrc" DataTextField="Value" 
                                        DataValueField="Key" 
                                        SelectedValue='<%# Bind("SiPrefixVal") %>'>
                                    </asp:DropDownList>
                                    <asp:Label ID="unitLabel" runat="server"></asp:Label>
                                    <asp:Label ID="IsPerKg" runat="server" CssClass="IsPerKg">/kg</asp:Label>
                                     per 
                                </span>
                                <div class="radioVert">
                                    <asp:RadioButton ID="IsPerMinRadio" runat="server" 
                                        Checked='<%# Bind("IsPerMin") %>' Text="minute" GroupName="timeUnitRadioGroup" CssClass="timeUnitRadioGroup"/>
                                    <asp:RadioButton ID="perHourRadio" runat="server" 
                                        Text="hour" GroupName="timeUnitRadioGroup" CssClass="timeUnitRadioGroup" />
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="fieldLabel">Reference Page:</div>
                            <div class="fieldInputs">
                                <asp:Label ID="refHref" runat="server" CssClass="hrefDescription"/>
                                <asp:DynamicControl Mode="Insert" ID="refPgDC" DataField="ReferencePage" runat="server" ValidationGroup="editDilution" CssClass="longTB" />
                            </div>                       
                        </li>
                        <asp:PlaceHolder ID="fixedTimeSpecific" runat="server" >

                        </asp:PlaceHolder>
                        <li>
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                                Text="Insert" ValidationGroup="insertDilution" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                                Text="Cancel" CausesValidation="false" />
                        </li>
                    </ul>
                </fieldset>
            </li>
        </InsertItemTemplate>
        <ItemTemplate>
            <li class="stdItem">
                <ul class="templateBlock">
                    <li>
                        <asp:HiddenField ID="hiddenDilutionId" runat="server" Value='<%# Eval("InfusionDilutionId") %>' />
                        <span class="fieldLabel">Weight Range:</span>
                        <asp:Label ID="WeightMinLabel" runat="server" Text='<%# Eval("WeightMin") %>' />
                        -
                        <asp:Label ID="WeightMaxLabel" runat="server" Text='<%# Eval("WeightMax") %>' />
                        Kg
                    </li>
                    <li>
                        <span class="fieldLabel">Age Range:</span>
                        <asp:Label ID="AgeMinMonthsLabel" runat="server" 
                            Text='<%# Eval("AgeMinMonths") %>' CssClass="ageMonths" />
                        -
                        <asp:Label ID="AgeMaxMonthsLabel" runat="server" 
                            Text='<%# Eval("AgeMaxMonths") %>' CssClass="ageMonths" />
                    </li>
                    <li>
                        <span class="fieldLabel">Dilution Method:</span>
                        <asp:Label ID="DilutionMethodIDLabel" runat="server" />
                    </li>
                    <asp:PlaceHolder ID="variableTimeSpecific" runat="server">
                        <li>
                            <span class="fieldLabel">Dose Range:</span>
                            <asp:Label ID="rateMinLabel" runat="server" />
                            -
                            <asp:Label ID="rateMaxLabel" runat="server"  />&nbsp;<asp:Label ID="rangeUnitLabel" runat="server"  />
                        </li>
                        <li>
                            <span class="fieldLabel">Final Volume:</span>
                            <asp:Label ID="volumeLabel" runat="server"  />
                        </li>
                    </asp:PlaceHolder>
                        <li>
                            <span class="fieldLabel">Reference Page:</span>
                            <asp:PlaceHolder ID="refPgLabel" runat="server" />                      
                        </li>
                    <asp:PlaceHolder ID="fixedTimeSpecific" runat="server" >
                    </asp:PlaceHolder>
                    <li>
                        <asp:Button ID="EditInfusionButton" runat="server" CommandName="Edit" Text="Edit..." ValidationGroup="editDilution"/>
                    </li>
                    <li>
                        <span class="concOptions">Infusions:</span>
                        <asp:ObjectDataSource ID="objConcentrations" runat="server" 
                            TypeName="PICUdrugs.BLL.InfusionBL" 
                            InsertMethod="InsertConcentration"
                            DeleteMethod="DeleteConcentration" UpdateMethod="UpdateConcentration"
                            OldValuesParameterFormatString="orig{0}" ConflictDetection="CompareAllValues" 
                            OnUpdated="General_CRUD" OnInserted="General_CRUD" OnDeleted="General_CRUD">                      
                            <SelectParameters>                         
                                <asp:Parameter Name="infDilutionId" Type="Int32"/>                      
                            </SelectParameters>                   
                        </asp:ObjectDataSource>
                        <asp:ListView ID="InfusionConcLV" runat="server" DataSourceID="objConcentrations"
                            ItemPlaceholderId="itemPlaceHolder1" InsertItemPosition="LastItem" DataKeyNames="InfusionConcentrationId"
                            OnInit="InfusionConcLV_init" OnItemCreated="InfusionConcLV_itemCreated"
                            ViewStateMode="Disabled" OnDataBound="InfusionConcLV_allDataBound">
                            <EditItemTemplate>
                                <tr class="edit">
                                    <td>
                                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                                            Text="Update" ValidationGroup="editConcentration" />
                                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                                            Text="Cancel" CausesValidation="false" />
                                    </td>
                                    <asp:PlaceHolder runat="server" ID="variableTimeSpecific">
                                        <td>
                                            <asp:DropDownList ID="DoseCatDDL" runat="server" 
                                                    OnDataBinding="DoseCatDDL_DataBinding" DataTextField="category" 
                                                    DataValueField="DoseCatId" SelectedValue='<%# Bind("DoseCatId") %>'
                                                    AppendDataBoundItems="true">
                                                <asp:ListItem Value="">Not Set</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </asp:PlaceHolder>
                                    <td>
                                        <asp:HiddenField runat="server" ID="InfusionDilutionId" Value='<%# Bind("InfusionDilutionId") %>'/>
                                        <asp:HiddenField runat="server" ID="InfusionConcentrationId" Value='<%# Bind("InfusionConcentrationId") %>'/>
                                        <span runat="server" id="balanceConc" class="balanceValidators"></span>
                                        <asp:DynamicControl Mode="Edit" ID="ConcentrationDynamicControl" runat="server" 
                                            DataField="Concentration" ValidationGroup="editConcentration" CssClass="concField"/>
  
                                    </td>
                                    <asp:PlaceHolder runat="server" ID="fixedTimeSpecific">
                                        <td>
                                            <asp:PlaceHolder runat="server" ID="balanceVol" >
                                                <span class="balanceValidators"></span>
                                            </asp:PlaceHolder>
                                            <asp:DynamicControl Mode="Edit" ID="volumeDynamicControl" runat="server"
                                                DataField="Volume" ValidationGroup="editConcentration" CssClass="volumeField"/>
                                        </td>
                                        <td>
                                            <span class="balanceValidators"></span>
                                            <asp:DynamicControl Mode="Edit" ID="rateDynamicControl" runat="server" 
                                                DataField="Rate" ValidationGroup="editConcentration" CssClass="rateField"/>                               
                                        </td>
                                        <td>
                                            <span class="balanceValidators"></span>
                                            <asp:DynamicControl Mode="Edit" ID="stopTimeDynamicControl" runat="server" 
                                                DataField="StopMinutes" ValidationGroup="editConcentration" CssClass="stopTimeField"/>                                    
                                        </td>
                                    </asp:PlaceHolder>
                                </tr>
                            </EditItemTemplate>
                            <EmptyDataTemplate>
                                <tr>
                                    <td>
                                        No data was returned.</td>
                                </tr>
                            </EmptyDataTemplate>
                            <InsertItemTemplate>
                                <tr class="insert">
                                    <td>
                                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert"
                                            Text="Insert" CausesValidation="true"/>
                                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                                            Text="Clear" CausesValidation="false"/>
                                    </td>
                                    <asp:PlaceHolder runat="server" ID="variableTimeSpecific">
                                        <td>
                                            <asp:DropDownList ID="DoseCatDDL" runat="server" 
                                                    OnDataBinding="DoseCatDDL_DataBinding" DataTextField="category" 
                                                    DataValueField="DoseCatId" SelectedValue='<%# Bind("DoseCatId") %>'
                                                    AppendDataBoundItems="true">
                                                <asp:ListItem Value="">Not Set</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </asp:PlaceHolder>
                                    <td>
                                        <asp:HiddenField runat="server" ID="InsertInfusionDilutionId" Value='<%# Bind("InfusionDilutionId") %>' ViewStateMode="Enabled"/>
                                        <span runat="server" id="balanceConc" class="balanceValidators"></span>
                                        <asp:DynamicControl Mode="Insert" ID="ConcentrationDynamicControl" runat="server" 
                                            DataField="Concentration" CssClass="concField"/>

                                    </td>
                                    <asp:PlaceHolder runat="server" ID="fixedTimeSpecific">
                                        <td>
                                            <asp:PlaceHolder runat="server" ID="balanceVol" >
                                                <span class="balanceValidators"></span>
                                            </asp:PlaceHolder>
                                            <asp:DynamicControl Mode="Insert" ID="volumeDynamicControl" runat="server" 
                                                DataField="Volume" CssClass="volumeField"/>
                                        </td>
                                        <td>
                                            <span class="balanceValidators"></span>
                                            <asp:DynamicControl Mode="Insert" ID="rateDynamicControl" runat="server" 
                                                DataField="Rate" CssClass="rateField"/>                               
                                        </td>
                                        <td>
                                            <span class="balanceValidators"></span>
                                            <asp:DynamicControl Mode="Insert" ID="stopTimeDynamicControl" runat="server" 
                                                DataField="StopMinutes" CssClass="stopTimeField"/>                                    
                                        </td>
                                    </asp:PlaceHolder>
                                </tr>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" CausesValidation="false"/>
                                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" ValidationGroup="editConcentration"/>
                                    </td>
                                    <asp:PlaceHolder runat="server" ID="variableTimeSpecific">
                                        <td>
                                            <asp:Label ID="DoseCatLabel" runat="server" />
                                        </td>
                                    </asp:PlaceHolder>
                                    <td>
                                        <asp:DynamicControl Mode="ReadOnly" ID="ConcentrationDynamicControl" runat="server" 
                                            DataField="Concentration" CssClass="concField"/>
                                    </td>
                                    <asp:PlaceHolder runat="server" ID="fixedTimeSpecific">
                                        <td>
                                            <asp:DynamicControl Mode="ReadOnly" ID="volumeDynamicControl" runat="server" NullDisplayText="auto"
                                                DataField="Volume" CssClass="volumeField"/>
                                        </td>
                                        <td>
                                            <asp:DynamicControl Mode="ReadOnly" ID="rateDynamicControl" runat="server" 
                                                DataField="Rate"  CssClass="rateField"/>                               
                                        </td>
                                        <td>
                                            <asp:DynamicControl Mode="ReadOnly" ID="stopTimeDynamicControl" runat="server" 
                                                DataField="StopMinutes" CssClass="stopTimeField"/>                                    
                                        </td>
                                    </asp:PlaceHolder>
                                </tr>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <table class="doseCatTable">
                                    <thead>
                                    <tr>
                                        <th>
                                        </th>
                                        <asp:PlaceHolder runat="server" ID="variableTimeSpecific">
                                            <th>Dose</th>
                                        </asp:PlaceHolder>
                                        <th><span class="concField">1ml/h=</span>
                                            <span class="drugAdded" style="display:none;">Add</span></th>
                                        <asp:PlaceHolder runat="server" ID="fixedTimeSpecific">
                                            <th>
                                                diluted to</th>
                                            <th class="rateTH">
                                                Rate</th>
                                            <th>
                                                Stop @</th>
                                        </asp:PlaceHolder>
                                    </tr>
                                    <tr class="subTH">
                                        <th>
                                        </th>
                                        <asp:PlaceHolder runat="server" ID="variableTimeSpecificSH">
                                            <th>Category</th>
                                        </asp:PlaceHolder>
                                        <th><asp:Label runat="server" ID="concUnits" ViewStateMode="Disabled" CssClass="concField"/>
                                            <asp:Label runat="server" ID="drugUnits" ViewStateMode="Disabled" CssClass="drugAdded" />
                                        </th>
                                        <asp:PlaceHolder runat="server" ID="fixedTimeSpecificSH">
                                            <th>
                                                <asp:Label runat="server" ID="DilutionUnits" ViewStateMode="Disabled" /></th>
                                            <th class="rateTH">
                                                <asp:Label runat="server" ID="rateUnits" ViewStateMode="Disabled" CssClass="rateUnits"/></th>
                                            <th>
                                                (mins)</th>
                                        </asp:PlaceHolder>                   
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
                        <li runat="server" ID="itemPlaceholder" />
                </ul>
                <div style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF;">
                </div>
        </LayoutTemplate>
    </asp:ListView>
</asp:Content>
<asp:Content ID="MyScripts" ContentPlaceHolderId="masterScripts" runat="server">
    <script src="<%# ResolveUrl("~/Scripts/editInfusion.js")%>" type="text/javascript"></script>
</asp:Content>