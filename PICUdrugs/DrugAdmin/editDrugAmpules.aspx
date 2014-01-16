<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="editDrugAmpules.aspx.cs" Inherits="PICUdrugs.Pages.Admin.editDrugAmpules" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<script type="text/javascript" src="/Scripts/jquery-1.7.1.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headings" runat="server">
    <h2>Edit Ampule Concentrations for</h2>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ValidationSummary ID="editAmpValidationSummary" runat="server" ValidationGroup="editAmpConc" />
    <asp:ValidationSummary ID="insertAmpValidationSummary" runat="server" ValidationGroup="insertAmpConc" />
    <asp:ObjectDataSource ID="AmpConcObjDataSrc" runat="server" SelectMethod="getAmpules"
    UpdateMethod="updateAmpule" DeleteMethod="deleteAmpule" TypeName="PICUdrugs.BLL.drugAmpuleBL"
    OnUpdated="Ampule_CRUD" OnInserted="Ampule_CRUD" DataObjectTypeName="PICUdrugs.DAL.drugAmpuleConcentration" 
    ConflictDetection="CompareAllValues" 
        OldValuesParameterFormatString="orig{0}" InsertMethod="insertAmpule" >
        <SelectParameters>
            <asp:QueryStringParameter Name="drugID" 
                QueryStringField="drugID" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="drugAmp" Type="Object" />
            <asp:Parameter Name="origDrugAmp" Type="Object" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ListView ID="DrugAmpListView" runat="server" DataSourceID="AmpConcObjDataSrc" 
        InsertItemPosition="LastItem" DataKeyNames="ampuleConcentrationID">
        <ItemTemplate>
            <tr style="background-color: #FFFFFF;color: #284775;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                        Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:HiddenField ID="ampConc" runat="server" Value='<%# Eval("ampuleConcentrationID") %>' />
                    <asp:DynamicControl runat="server" DataField="Concentration" Mode="ReadOnly" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Volume" Mode="ReadOnly" />
                </td>
            </tr>
        </ItemTemplate>
        <EditItemTemplate>
            <tr style="background-color: #999999;">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                        Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Cancel" />
                </td>
                <td>
                    <asp:HiddenField runat="server" ID="ampConc" Value='<%# Bind("ampuleConcentrationID") %>' />
                    <asp:HiddenField runat="server" ID="drugID" Value='<%# Bind("InfusionDrugID") %>' />
                    <asp:DynamicControl runat="server" DataField="Concentration" Mode="Edit" ValidationGroup="editAmpConc"/>
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Volume" Mode="Edit" ValidationGroup="editAmpConc"/>
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" 
                style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                <tr>
                    <td>
                        No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" 
                        ValidationGroup="InsertAmpConc" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Clear" />
                </td>
                <td>
                    <asp:HiddenField ID="drugID" runat="server" Value='<%# Bind("InfusionDrugID") %>' />
                    <asp:DynamicControl runat="server" DataField="Concentration" Mode="Insert" 
                        ValidationGroup="InsertAmpConc" />
                </td>
                <td>
                    <asp:DynamicControl runat="server" DataField="Volume" Mode="Insert" 
                        ValidationGroup="InsertAmpConc" />
                </td>
            </tr>
        </InsertItemTemplate>
        <LayoutTemplate>
            <table ID="itemPlaceholderContainer" runat="server" border="1" 
                style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                <tr runat="server" style="background-color: #E0FFFF;color: #333333;">
                    <th runat="server">
                    </th>
                    <th runat="server">
                        Concentration</th>
                    <th runat="server">
                        Volume</th>
                </tr>
                <tr ID="itemPlaceholder" runat="server">
                </tr>
            </table>
        </LayoutTemplate>
    </asp:ListView>
</asp:Content>
