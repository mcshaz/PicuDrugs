<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="About.aspx.cs" Inherits="PICUdrugs.Pages.About" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderId="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderId="MainContent">
    <h2>
        About this service</h2>
    <p class="preList">
        This service was designed and is maintained by the Paediatric Intensive Care Unit (PICU) primarily for the purposes of: 
    </p>
        <ul class="inlineList">
            <li>The care of critically ill children prior to transfer to Starship Intensive Care.</li>
            <li>Resuscitation charts to facilitate rapid dose calculations during an emergency in a Ward or emergency department.</li>
       </ul>
    <p class="postList">
        For information about limitations of the protocols and dose calculators available online, please read our <a href="//www.adhb.govt.nz/picu/GuidelinesAndProtocols.htm">disclaimer</a>.
    </p>
    <p>
        Information regarding how the Infusions are calculated can be found on our <a href="//www.adhb.govt.nz/picu/Protocols/protocols.htm">protocol</a> page, in particular the Infusion charts for <a href="//www.adhb.govt.nz/picu/Protocols/Paediatric%20Drug%20Infusion%20Chart.pdf">less than 30Kg</a> and <a href="//www.adhb.govt.nz/picu/Protocols/Adult%20Drug%20Infusion%20Chart.pdf">over 30 Kg</a>.
    </p>
    <p>
        For information about contacting the on-call intensivist to discuss a case, please <a href="//www.adhb.govt.nz/picu/GuidelinesAndProtocols.htm">click here</a>.
    </p>
    <p class="preList">
        The project was designed and is maintained by Brent McSharry (paediatric intensivist, Starship Hospital). He can be contacted <a href="mailto:brentm@adhb.govt.nz">by email</a> if you would like to: 
    </p>
       <ul class="inlineList">
            <li>Report a problem.</li>
            <li>Suggest any improvements or additions.</li>
            <li>Set up a similar project for your own institution - the source code is available under a <a href="http://www.gnu.org/licences/gpl-3.0.txt">GNU General Public Licence, Version 3</a> on <a href="https://github.com/mcshaz/PicuDrugs">GitHub</a>, with the centile calculation engine (in C# and JavaScript) available in as part of a seperate open source project (<a href="https://github.com/mcshaz/BlowTrial/tree/master/StatsForAge">BLOWtrial</a> - an RCT of BCG and oral polio vaccine in low birth weight infants). <a href="Administrators%20Guide%20to%20the%20Starship%20PICU%20Drug%20Calculator.pdf">Administrators' Instructions</a> are included to help you assertain if the project may be suitable.</li>
            <li>Register as a department administrator, allowing you to choose which Infusions and resuscitation drugs to display in which order for your own institution.</li>
       </ul>
    <p>
        Thank you very much to those who assisted in this project, in particular Andrew Grady (software developer from healthAlliance), and Mark Ashcroft (software architect and Brent's neighbour).
    </p>
</asp:Content>
