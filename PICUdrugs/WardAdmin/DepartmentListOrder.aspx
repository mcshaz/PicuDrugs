<%@ MasterType VirtualPath="~/Site.Master" %>
<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DepartmentListOrder.aspx.cs" Inherits="PICUdrugs.WardAdmin.DepartmentListOrder" %>
<%@ Register Src="~/WardAdmin/WardManagement.ascx" TagPrefix="uc" TagName="WardManager" %>
<asp:Content ID="Content1" ContentPlaceHolderId="HeadContent" runat="server">
    <link href="<%# ResolveUrl("~/Content/departmentListOrder.css")%>" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderId="headings" runat="server">
    <h2>Infusion List Order</h2>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderId="MainContent" runat="server" ViewStateMode="Disabled">
    <asp:Literal runat="server" ID="AntiforgeryToken" />
    <div id="WardDetails">
        <uc:WardManager runat="server" AutoPostBack="true" ID="WardList" />
    </div>
    <div id="InfusionOrder" class="orderGroup">
        <h4 class="clickHandle">Infusions <span class="dragInstruction">(drag and drop between lists)</span></h4>
        <div id="InfusionListAndSubmit" class="druglist">
            <div id="includedInfusions">
                <h5>Used:</h5>
                <asp:ListView ID="InfusionSortOrderLV" runat="server" >
                    <ItemTemplate>
                        <li class="stdItem" runat="server" data-id='<%# Eval("Id") %>'>
                            <%# Eval("DrugName") %>
                        </li>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <ol ID="includedInfusionList" runat="server" class="listOrder">
                            <li runat="server" ID="itemPlaceholder" />
                        </ol>
                    </LayoutTemplate>
                    <EmptyDataTemplate>
                        <ol id="includedInfusionList" class="listOrder empty">
                            <li class="empty">empty</li>
                        </ol>
                    </EmptyDataTemplate>
                </asp:ListView>
            </div>
            <div id="submitInfusionOps" class="submitOps" runat="server">
                <input id="submitInfusionSort" type="button" value="Submit" disabled="disabled"/>
                <div class="updateStatus"></div>
            </div>
        </div>
        <asp:ListView ID="remainingInfusionsLV" runat="server" >
            <ItemTemplate>
                <li class="stdItem" runat="server" data-id='<%# Eval("Id") %>'>
                    <%# Eval("DrugName") %>
                </li>
            </ItemTemplate>
            <LayoutTemplate>
                <div id="unusedInfusions" class="druglist">
                    <h5>Unused:</h5>
                    <ul id="unusedList" runat="server" class="listOrder">
                        <li runat="server" ID="itemPlaceholder" />
                    </ul>
                </div>
            </LayoutTemplate>
            <EmptyDataTemplate>
                <div id="includedInfusions">
                    <h5>Used:</h5>
                    <ol id="unusedInfusions" class="listOrder empty">
                        <li class="empty">empty</li>
                    </ol>
                </div>        
            </EmptyDataTemplate>
        </asp:ListView>
    </div>
    <div id="bolusOrder" class="orderGroup">
        <h4 class="clickHandle">Emergency bolus drugs <span class="dragInstruction">(drag and drop between lists)</span></h4>
        <div id="bolusListAndSubmit" class="druglist">
            <div id="includedBoluses">
                <h5>Used:</h5>  
                <asp:ListView ID="bolusSortOrderLV" runat="server" OnItemDataBound="bolusLV_itemDataBound">
                    <ItemTemplate>
                        <li  ID="bolusItem" class="stdItem" runat="server" />
                    </ItemTemplate>
                    <LayoutTemplate>
                        <ol ID="includedBolusList" runat="server" class="listOrder">
                            <li runat="server" ID="itemPlaceholder" />
                        </ol>
                    </LayoutTemplate>
                    <EmptyDataTemplate>
                        <ol id="includedBolusList" class="listOrder empty">
                            <li class="empty">empty</li>
                        </ol> 
                    </EmptyDataTemplate>
                </asp:ListView>
                <span class="note" >*note - endotracheal size is automatically added as the last item.</span>
            </div>
            <div id="submitBolusOps" class="submitOps"  runat="server">
                <div id="freeText">
                    <label for="bolusHeader">Subheaders: </label>
                    <input type="text" id="bolusHeader" runat="server"/>
                    <input type="button" id="addBolusHeader" value="Add" />
                    <div class="error" id="bolusHeaderVal"></div>
                </div>
                <input id="submitBolusSort" type="button" value="Submit" disabled="disabled"/>
                <div class="updateStatus"></div>
            </div>
        </div>
        <div id="unusedBolus" class="druglist">
            <h5>Unused:</h5>
            <asp:ListView ID="remainingBolusLV" runat="server" OnItemDataBound="bolusLV_itemDataBound">
                <ItemTemplate>
                    <li  ID="bolusItem" class="stdItem" runat="server" />
                </ItemTemplate>
                <LayoutTemplate>
                    <ul ID="unusedList" runat="server" class="listOrder">
                        <li runat="server" ID="itemPlaceholder" />
                    </ul>
                </LayoutTemplate>
                <EmptyDataTemplate>
                    <ul id="unusedList" class="listOrder">
                        <li class="empty" >Empty</li>
                    </ul>
                </EmptyDataTemplate>
            </asp:ListView>
        </div>
    </div>
</asp:Content>
<asp:Content ID="MyScripts" ContentPlaceHolderId="masterScripts" runat="server">
    <script src="<%# ResolveUrl("~/Scripts/orderManager.js")%>" type="text/javascript"></script>
</asp:Content>