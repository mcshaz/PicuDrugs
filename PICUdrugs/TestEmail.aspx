<%@ Page Title="Test Email" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="TestEmail.aspx.cs" Inherits="PICUdrugs2013.TestEmail" %>

<asp:Content ID="FormContent" ContentPlaceHolderId="MainContent" runat="server">

    <asp:TextBox ID="email" runat="server" TextMode="Email"></asp:TextBox>
    <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />
    
    <asp:Literal ID="ResultLiteral" runat="server"></asp:Literal>
    
</asp:content>
