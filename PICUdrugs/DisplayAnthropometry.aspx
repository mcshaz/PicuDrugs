<%@ PreviousPageType VirtualPath="~/EnterPtAnthropometry.aspx" %>
<%@ Page Title="Anthropometry" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DisplayAnthropometry.aspx.cs" Inherits="PICUdrugs.DisplayAnthropometry" %>
<asp:Content ID="Content1" ContentPlaceHolderId="MasterScripts" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderId="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderId="headings" runat="server">
    <h2>Anthropometry</h2>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderId="MainContent" runat="server" EnableViewState="false">
<fieldset id="resultSet">
    <legend>Age: <asp:Literal runat="server" ID="age"></asp:Literal></legend>
    <asp:PlaceHolder runat="server" ID="weightDetails">
        <div class="display-label">
            Weight:
        </div>
        <div class="display-field">
            <asp:Literal runat="server" ID="weight"></asp:Literal> <span class="unit">kg</span>
            <span class="centileDetail">(equates to <span class="centileValue"><asp:Literal runat="server" ID="weightCentile"></asp:Literal></span>)</span>
        </div>
        <div class="display-label">
            Basal Metabolic Rate:
        </div>
        <div class="display-field">
            <asp:Literal runat="server" ID="bmr"></asp:Literal><span class="unit"> kcal/day</span> <span class="explanation">(Schofield estimation)</span>
        </div>
    </asp:PlaceHolder>
    <asp:PlaceHolder runat="server" ID="LengthDetails">
        <div class="display-label">
            Length:
        </div>
        <div class="display-field">
            <asp:Literal runat="server" ID="length"></asp:Literal> <span class="unit">cm</span>
            <span class="centileDetail">(equates to <span class="centileValue"><asp:Literal runat="server" ID="lengthCentile"></asp:Literal></span>)</span>
            <div>If this patient were to be on the same centile for weight as they are for height, they would weigh 
                <asp:Literal runat="server" ID="weightByLength"></asp:Literal> <span class="unit">kg</span>
            </div>
        </div>
    </asp:PlaceHolder>
    <asp:PlaceHolder runat="server" ID="HeightAndLengthDetails">
        <div class="display-label">
            Body Mass Index:
        </div>
        <div class="display-field">
            <asp:PlaceHolder runat="server" ID="BmiPlaceholder">
                <asp:Literal runat="server" ID="bmi"></asp:Literal> <span class="unit">kg/m<sup>2</sup></span>
                <span class="centileDetail">(equates to <span class="centileValue"><asp:Literal runat="server" ID="bmiCentile"></asp:Literal></span>)</span>
            </asp:PlaceHolder>        
        </div>
        <div class="display-label">
            Surface Area:
        </div>
        <div class="display-field">
            <asp:Literal runat="server" ID="bsa"></asp:Literal> <span class="unit">m<sup>2</sup></span>
        </div>
        <div class="display-label">
            Estimated Lean Body Mass
        </div>
        <div class="display-field">
            <asp:Literal runat="server" ID="lbm"></asp:Literal> <span class="unit">kg</span><span class="explanation">* by method of <asp:Literal runat="server" ID="lbmReference"></asp:Literal></span>
        </div>
    </asp:PlaceHolder>
</fieldset>
</asp:Content>
