<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OtherErrors.aspx.cs" Inherits="PICUdrugs.errors.OtherErrors" %>
<asp:Content ID="Content1" ContentPlaceHolderId="MasterScripts" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderId="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderId="headings" runat="server">
    <h2>Error - Details Hidden</h2>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderId="MainContent" runat="server">
    <p>Unfortunately, a programatic error has occured while processing your request.</p>
    <p>If you arive back at this page after checking the data on the form and trying to submit a second time, you may have to manually calculate infusions. 
        Details about contacting the Intensivist on call and the protocols on which the calculator is based can be found in the <asp:HyperLink runat="server" ID="ToAbout" NavigateUrl="~/About.aspx" >About</asp:HyperLink> page.</p>
    <p>Details of the error are hidden for security reasons. However, the error has been logged and we will attempt to fix it ASAP.</p>
    <p>We appologise for the inconvenience.</p>
    <p>The Starship PICU team</p>
</asp:Content>
