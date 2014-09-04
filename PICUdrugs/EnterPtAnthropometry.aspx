<%@ Page Title="Height & Weight" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" 
    CodeBehind="EnterPtAnthropometry.aspx.cs" Inherits="PICUdrugs.Pages.EnterPtAnthropometry" %>

<asp:Content ID="Content1" ContentPlaceHolderId="HeadContent" runat="server">
    <link href="<%# ResolveUrl("~/Content/EnterPtData-0.5.css")%>" rel="stylesheet" type="text/css"/>
</asp:Content>
<asp:Content ID="Cotent2" ContentPlaceHolderId="headings" runat="server">
    <h2>Tools for calculating height, weight and BMI centiles</h2>
</asp:Content>
<asp:Content ID="FormContent" ContentPlaceHolderId="MainContent" runat="server">
    <asp:ScriptManager ID="PICUScriptManager" runat="server" EnablePageMethods="true" EnableScriptGlobalization="true">
    </asp:ScriptManager>

    <fieldset id="ptDataEntry">

        <div class="editor-label">
            <label for="MainContent_ptWeight">Weight</label>
            <asp:RangeValidator ID="ptWeightRngValidator" runat="server" CssClass="errorPoint"
                ControlToValidate="ptWeight" ErrorMessage="Weight must be between 0.3 & 400 kg" Display="Dynamic" MinimumValue="0.3" MaximumValue="400">*</asp:RangeValidator>
        </div>
        <div class ="editor-field">
            <asp:TextBox ID="ptWeight" runat="server" CssClass="textBox" type="number" step="any" min="0"></asp:TextBox><span class="unit"> Kg</span>
        </div>

        <div class="editor-label">
            <label  for="MainContent_ptDOB">DOB</label>
            <asp:RangeValidator ID="ptDOBRngValidator" runat="server"  CssClass="errorPoint"
                ControlToValidate="ptDOB" Type="Date" Display="Dynamic">*</asp:RangeValidator>
            <div class="option-seperator">(or)</div>
        </div>
        <div class ="editor-field">
            <asp:TextBox ID="ptDOB" runat="server" CssClass="textBox"></asp:TextBox>
        </div>

        <div class="editor-label">
            <label for="MainContent_ptAgeYrs">Age</label>
            <asp:RangeValidator ID="ptAgeRngValidator" runat="server" ControlToValidate="ptAgeYrs" CssClass="errorPoint"
                ErrorMessage="Years out of range" Display="Dynamic">*</asp:RangeValidator>
            <asp:RangeValidator ID="ptMonthRngValidator" runat="server" 
                ControlToValidate="ptAgeMonths" ErrorMessage="Months out of range"  CssClass="errorPoint"
                MaximumValue="72" MinimumValue="0" Type="Integer" Display="Dynamic">*</asp:RangeValidator>
            <asp:RangeValidator ID="ptDaysRngValidator" runat="server" 
                ControlToValidate="ptAgeDays" ErrorMessage="Days out of range"  CssClass="errorPoint"
                MaximumValue="72" MinimumValue="0" Type="Integer" Display="Dynamic">*</asp:RangeValidator>
            <asp:CustomValidator ID="DobOrAgeValidator" runat="server" 
                OnServerValidate="DobOrAgeValServer" ClientValidationFunction="pic.vals.dobOrFullAgeValClient"  CssClass="errorPoint"
                ErrorMessage="Please enter age (including months) or DOB"  Display="Dynamic">*</asp:CustomValidator>
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
                ErrorMessage="Please select a gender" Display="Dynamic">*</asp:RequiredFieldValidator>
        </div>
        <div class="editor-field">
            <asp:RadioButtonList ID="genderRadio" runat="server" CssClass="radioList">
                <asp:ListItem value="male" text="Male" />
                <asp:ListItem Value="female" text="Female" />
            </asp:RadioButtonList>
        </div>

        <div class="editor-label">
            <asp:Label ID="Label1" runat="server" AssociatedControlId="ptLength">Height/Length*</asp:Label>
            <asp:RangeValidator ID="ptLengthRangeValidator" runat="server" CssClass="errorPoint"
                ControlToValidate="ptLength" ErrorMessage="Length out of range"  Display="Dynamic" Type="Double" MinimumValue="30" MaximumValue="220">*</asp:RangeValidator>
            <asp:CustomValidator ID="LengthOrWeightValidator" runat="server" 
                OnServerValidate="LengthOrWeightValServer" ClientValidationFunction="pic.vals.lenthOrWtValClient"  CssClass="errorPoint"
                ErrorMessage="Please enter at least one of length or weight"  Display="Dynamic">*</asp:CustomValidator>
        </div>
        <div class="editor-field">
            <asp:TextBox ID="ptLength" runat="server" CssClass="textBox"></asp:TextBox><span class="unit"> Cm</span>
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
            OnClick="Submit_Click" Text="Submit" 
            CausesValidation="true"/>

        <div id="valSummaries">
            <a id="Error_Summary"></a>
            <asp:ValidationSummary ID="ValidationSummaryMain" runat="server" cssClass="errorDescription"/>
        </div>
    </fieldset>
    <p>*Height is required if using calculator to assist in estimating appropriate weight or lean body mass to use in drug calculations for obese patients.</p>
</asp:Content>
<asp:Content ID="MyScripts" ContentPlaceHolderId="masterScripts" runat="server">
    <script src="<%# ResolveUrl("~/Scripts/DobAgePageManagement-0.2.js")%>" type="text/javascript"></script>
    <script src="<%= ResolveUrl("Scripts/EnterAnthropometry.js")%>" type="text/javascript"></script>
</asp:Content>