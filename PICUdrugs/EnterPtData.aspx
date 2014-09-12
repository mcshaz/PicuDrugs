<%@ Page Title="Patient Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" 
    CodeBehind="EnterPtData.aspx.cs" Inherits="PICUdrugs.Pages.EnterPtData" %>

<asp:Content ID="Content1" ContentPlaceHolderId="HeadContent" runat="server">
    <link href="<%# ResolveUrl("~/Content/EnterPtData-0.5.css")%>" rel="stylesheet" type="text/css"/>
</asp:Content>
<asp:Content ID="Cotent2" ContentPlaceHolderId="headings" runat="server">
    <h2>Drug Doses</h2>
</asp:Content>
<asp:Content ID="FormContent" ContentPlaceHolderId="MainContent" runat="server">
    <asp:ScriptManager ID="PICUScriptManager" runat="server" EnablePageMethods="true" EnableScriptGlobalization="true">
    </asp:ScriptManager>
    <a id="TopOfForm" ></a>
    <fieldset id="ptDataEntry">

        <asp:HiddenField runat="server" ID="drugJSON" />
        <div class="editor-label">
            <asp:Label ID="Label1" runat="server" >Type of Chart</asp:Label>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="chartTypeRadio" CssClass="errorPoint" ErrorMessage="please select the type of chart" Display="Dynamic" >*</asp:RequiredFieldValidator>
        </div>
        <div class="editor-field">
            <asp:RadioButtonList ID="chartTypeRadio" runat="server" CssClass="radioList">
                <asp:ListItem text="Emergency drugs only" Value="bolus" />
                <asp:ListItem text="Emergency drugs + list of common infusions" Value="list" />
                <asp:ListItem text="Additional Infusions <span ID='selectDrug'>(choose from list...)</span>" Value="choose"></asp:ListItem>
            </asp:RadioButtonList>
        </div>

        <div class="editor-label">
            <label for="MainContent_wardList">Ward</label>
        </div>
        <div class="editor-field">
            <asp:DropDownList ID="wardList" runat="server" OnDataBinding="wardList_DataBinding"
                DataTextField="Fullname" DataValueField="WardId">
            </asp:DropDownList>
        </div>

        <div class="editor-label changeCookie hidden">
            <label for="MainContent_wardList">Remember Selection</label>
        </div>
        <div class="editor-field changeCookie hidden">
            <input id="isToChangeCookie" type="checkbox" />
            <span class="explanation">Make this selection the new default chart?</span>
        </div>

        <div class="editor-label">
            <label for="MainContent_ptName">First + Last Name</label>
        </div>
        <div class="editor-field">
            <asp:TextBox ID="ptName" runat="server" CssClass="textBox"></asp:TextBox>
        </div>

        <div class="editor-label">
            <label for="MainContent_ptNHI">NHI</label>
            <asp:RegularExpressionValidator ID="NHIregExVal" runat="server" CssClass="errorPoint" ErrorMessage="please enter 3 letters followed by 4 numbers, or leave blank" 
                    ControlToValidate="ptNHI" ValidationExpression="[a-zA-Z]{3}[0-9]{4}" Display="Dynamic">*</asp:RegularExpressionValidator>
        </div>
        <div class="editor-field">
            <asp:TextBox ID="ptNHI" runat="server" CssClass="UCASE textBox"></asp:TextBox>
        </div>

        <div class="editor-label">
            <label for="MainContent_ptWeight">Weight</label>
            <asp:CustomValidator ID="centileValidator" runat="server" ErrorMessage="Weight out of extremes of range for age"  CssClass="errorPoint"
                ClientValidationFunction="pic.vals.centileValClient" OnServerValidate="centileValidator_ServerValidate" Display="Dynamic" ValidationGroup="centile">*</asp:CustomValidator>
            <asp:RequiredFieldValidator ID="ptWeightRqdValidator" runat="server" ControlToValidate="ptWeight" CssClass="errorPoint"
                ErrorMessage="You must enter a weight" Display="Dynamic">*</asp:RequiredFieldValidator>
            <asp:RangeValidator ID="ptWeightRngValidator" runat="server" CssClass="errorPoint"
                ControlToValidate="ptWeight" ErrorMessage="Weight must be between 0.3 & 400 kg" Display="Dynamic" MinimumValue="0.3" MaximumValue="400">*</asp:RangeValidator>
        </div>
        <div class ="editor-field">
            <asp:TextBox ID="ptWeight" runat="server" CssClass="textBox" type="number" step="any" min="0"/><span class="unit"> Kg</span>
            <input id="medianWeightBtn" type="button" value="Median Weight"/>
            <asp:HiddenField runat="server" ID="upperCentileValue" />
            <asp:HiddenField runat="server" ID="lowerCentileValue" />
            <asp:TextBox ID="centileText" runat="server" CssClass="normalCentile" ></asp:TextBox>
        </div>
        <div class="minor-label">
            <label id="weightEstimateLbl" for="MainContent_weightEstimate" >(estimated weight only)</label>
        </div>
        <div class ="minor-field">
            <asp:CheckBox ID="weightEstimate" runat="server" />
        </div>

        <div class="editor-label">
            <label  for="MainContent_ptDOB">DOB</label>
            <asp:RangeValidator ID="ptDOBRngValidator" runat="server"  CssClass="errorPoint"
                ControlToValidate="ptDOB" Display="Dynamic">*</asp:RangeValidator>
            <div class="option-seperator">(or)</div>
        </div>
        <div class ="editor-field">
            <asp:TextBox ID="ptDOB" runat="server" CssClass="textBox"></asp:TextBox>
        </div>

        <div class="editor-label">
            <label for="MainContent_ptAgeYrs">Age</label>
            <asp:RangeValidator ID="ptAgeRngValidator" runat="server" ControlToValidate="ptAgeYrs" CssClass="errorPoint"
                ErrorMessage="Years out of range" Display="Dynamic">*</asp:RangeValidator>
            <asp:CustomValidator ID="ptMonthsVal" runat="server" ControlToValidate="ptAgeMonths" ValidateEmptyText="true"
                OnServerValidate="MonthsValServer" ClientValidationFunction="pic.vals.monthsValClient"  CssClass="errorPoint"
                ErrorMessage="Please enter age in months" Display="Dynamic">*</asp:CustomValidator>
            <asp:RangeValidator ID="ptMonthRngValidator" runat="server" 
                ControlToValidate="ptAgeMonths" ErrorMessage="Months out of range"  CssClass="errorPoint"
                MaximumValue="72" MinimumValue="0" Type="Integer" Display="Dynamic">*</asp:RangeValidator>
            <asp:CustomValidator ID="dobOrAgeValidator" runat="server"
                OnServerValidate="DobOrAgeValServer" ClientValidationFunction="pic.vals.dobOrAgeValClient"  CssClass="errorPoint"
                ErrorMessage="Please enter age or DOB" ValidationGroup="age" Display="Dynamic">*</asp:CustomValidator>
            <asp:RangeValidator ID="ptDaysRngValidator" runat="server" 
                ControlToValidate="ptAgeDays" ErrorMessage="Days out of range"  CssClass="errorPoint"
                MaximumValue="72" MinimumValue="0" Type="Integer" Display="Dynamic">*</asp:RangeValidator>
        </div>
        <div class ="editor-field">
            <asp:TextBox ID="ptAgeYrs" runat="server" CssClass="textBox" type="number" min="0"></asp:TextBox>
            <span class="unit">Years</span>
            <asp:TextBox ID="ptAgeMonths" runat="server" CssClass="textBox" type="number" min="0"></asp:TextBox>
            <span class="unit">Months</span>
            <asp:TextBox ID="ptAgeDays" runat="server" CssClass="textBox" type="number" min="0"></asp:TextBox>
            <span class="unit">Days</span>
        </div>

        <div class="editor-label">
            <asp:Label ID="Label2" runat="server" >Gender</asp:Label>
            <asp:RequiredFieldValidator ID="genderSelectedVal" ControlToValidate="genderRadio" runat="server"  CssClass="errorPoint"
                ErrorMessage="Please select a gender" ValidationGroup="gender" Display="Dynamic">*</asp:RequiredFieldValidator>
        </div>
        <div class="editor-field">
            <asp:RadioButtonList ID="genderRadio" runat="server" CssClass="radioList">
                <asp:ListItem value="male" text="Male" />
                <asp:ListItem Value="female" text="Female" />
            </asp:RadioButtonList>
        </div>

       <div class="editor-label">
            <asp:Label ID="Label3" runat="server" >Gestation at Birth</asp:Label>
            <asp:RangeValidator ID="GestationRangeValidator" ControlToValidate="WeeksGestation" runat="server"  CssClass="errorPoint"
                 MinimumValue="23" MaximumValue="43" ValidationGroup="gender" Display="Dynamic">*</asp:RangeValidator>
        </div>
        <div class="editor-field">
            <asp:TextBox runat="server" ID="WeeksGestation" Text="40" type="number" min="0" CssClass="textBox"/>
            <span class="unit">Weeks</span>
        </div>

        <div class="editor-label">
        </div>
        <asp:Button ID="Submit" runat="server" 
            Text="Submit" CausesValidation="true" OnClick="Submit_Click" />

        <div id="valSummaries">
            <a id="Error_Summary"></a>
            <asp:ValidationSummary ID="ValidationSummaryMain" runat="server" cssClass="errorDescription" ShowSummary="true"/>
            <asp:ValidationSummary ID="ValidationSummaryAge" runat="server" ValidationGroup="age" cssClass="errorDescription" ShowSummary="true"/>
            <asp:ValidationSummary ID="ValidationSummaryGender" runat="server" ValidationGroup="gender" cssClass="errorDescription" ShowSummary="true"/>
            <asp:ValidationSummary ID="ValidationSummaryCentile" runat="server" ValidationGroup="centile" cssClass="errorDescription" ShowSummary="true"/>
        </div>
    </fieldset>

    <div id="departmentNotes">
        <p>
            We are always looking for motivated and appropriately experienced registrars to spend 6 to 12 months working with us in <a title="About Starship PICU" href="http://www.adhb.govt.nz/picu/">Starship PICU</a>. 
            Registrars have come from all over the world to be a part of our team.
        </p>
        <p>
            If you are interested or have queries about when positions are available 
            (or when might be a good time to integrate a Starship PICU run into your training pathway), 
            please <a href="mailto:contactpicu@adhb.govt.nz?Subject=Enquiry%20regarding%20Starship%20registrar%20positions">send us an email</a>.
        </p>

    </div>
    <div id="drugSelect">
        <span class="drugListHeader">Please select a drug or click <span id="cancelList" class="cancelDialog">Cancel</span> to close this window.</span>
        <div id="listScroll"><ul id="drugList"></ul></div>
        <div id="concDiv"><span class="drugListHeader">Please select the appropriate ampule Concentration for <span id="chosenDrug"></span> or click <span id="cancelConc" class="cancelDialog" >Cancel</span> to close this window.</span>
        <table class="tabData"><tbody id="concTable"></tbody></table>
        </div>
    </div>
</asp:Content>
<asp:Content ID="MyScripts" ContentPlaceHolderId="masterScripts" runat="server">
    <script src="/Scripts/json2.min.js" type="text/javascript"></script>
    <script src="/Scripts/PICUdrugUtils-0.5.js" type="text/javascript"></script>
    <script src="/Scripts/DobAgePageManagement-0.2.js" type="text/javascript"></script>
    <script src="/Scripts/EnterPtData-0.5.js" type="text/javascript"></script>
</asp:Content>

