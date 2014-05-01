<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CurrentDrugList.aspx.cs" Inherits="PICUdrugs.CurrentDrugList" %>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
        <link href="<%# ResolveUrl("~/Content/CurrentDrugList.css")%>" rel="stylesheet" type="text/css"/>
        <!--[if lt IE 9]><link href="<%# ResolveUrl("~/Content/nonCss3CurrentDrugs.css")%>" rel="stylesheet" type="text/css"/><![endif]-->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="headings" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <h4>
        List of infusion calculations available on this site
    </h4>
    <p>
        The drug calculator is available <asp:HyperLink runat="server" ID="ToCalculator" NavigateUrl="~/EnterPtData.aspx" >here</asp:HyperLink>
    </p>
    <div id="infusionInfo">
        <div id="bolusDrugs">
            <asp:Literal runat="server" ID="bolusGrid" Text="Resusitation Drugs &amp; Emergency Boluses"/>
        </div>
        <div id="titratableInfusions">
            <asp:Literal runat="server" ID="titratableInfusionGrid" Text="Standard Infusions"/>
        </div>
        <div id="individualInfusions">
            <h5>
                Individually Selected Infusions:
            </h5>
            <asp:ListView ID="selectDrugList" runat="server">
                <LayoutTemplate>
                    <ul id="selectDrugs">
                        <li runat="server" ID="itemPlaceholder" />
                    </ul>
                </LayoutTemplate>
                <ItemTemplate>
                    <li>
                         <asp:Hyperlink runat="server" ID="calculateDrug" NavigateUrl='<%#DataBinder.Eval(Container,"DataItem.EncodedName","~/EnterPtData.aspx?infusion={0}")%>' Text='<%#DataBinder.Eval(Container,"DataItem.Name")%>' />
                    </li>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </div>
</asp:Content>
<asp:Content ID="MyScripts" ContentPlaceHolderId="masterScripts" runat="server">
    <script type="text/javascript" src="<%# ResolveUrl("~/Scripts/PICUdrugUtils-0.4.js")%>"></script>
    <script type="text/javascript">
        pic.util.addEvent(window, 'load', function () {
            var bolus = document.getElementById('bolusDrugs'),
                titrate = document.getElementById('titratableInfusions'),
                individual = document.getElementById('individualInfusions'),
                originalMargin = individual.style.marginTop,
                heightDif = bolus.offsetHeight - titrate.offsetHeight,
                adjustHeight = function () {
                    if (bolus.offsetTop == titrate.offsetTop && bolus.offsetLeft == individual.offsetLeft) {
                        individual.style.marginTop = heightDif + 'px';
                    } else {
                        individual.style.marginTop = originalMargin;
                    }
                };
            if (bolusDrugs.offsetWidth < individual.offsetWidth || heightDif >= 0) { return; }
            adjustHeight();
            pic.util.addEvent(window, 'resize', adjustHeight);
        });
    </script>
</asp:Content>