<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PasswordRecovery.aspx.cs" Inherits="PICUdrugs.personalAccount.PasswordRecovery" %>
<asp:Content ID="Content1" ContentPlaceHolderId="HeadContent" runat="server">
<style type="text/css">.pwdEl{margin-left:auto;margin-right:auto}</style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderId="MainContent" runat="server">
        <asp:PasswordRecovery ID="PasswordRecovery1" runat="server" BackColor="#EFF3FB" 
            BorderColor="#B5C7DE" BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" 
            Font-Names="Verdana" Font-Size="0.8em" CssClass="pwdEl" OnVerifyingUser="PasswordRecovery1_VerifyingUser"  >
            <SubmitButtonStyle BackColor="White" BorderColor="#507CD1" BorderStyle="Solid" 
                BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98" />
            <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
            <MailDefinition BodyFileName="~/App_Data/passwordRecover.txt" 
                Subject="Your password for the PICU drug calculator." IsBodyHtml="true">
            </MailDefinition>
            <SuccessTextStyle Font-Bold="True" ForeColor="#507CD1" />
            <TextBoxStyle Font-Size="0.8em" />
            <TitleTextStyle BackColor="#507CD1" Font-Bold="True" Font-Size="0.9em" 
                ForeColor="White" />
        </asp:PasswordRecovery>
</asp:Content>
