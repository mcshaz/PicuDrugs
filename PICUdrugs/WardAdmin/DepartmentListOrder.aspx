﻿<%@ MasterType VirtualPath="~/Site.Master" %>
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
        <uc:WardManager runat="server" AutoPostBack="true" ID="WardList" DefaultToCurrentUserWard="true" />
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
                            <span runat="server" visible='<%# Eval("SpecificWard") !=null %>' class="specificWard">
                                <%# Eval("SpecificWard") %>
                            </span>
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
                <input id="submitInfusionSort" type="button" value="Submit" class="submitOrder" disabled="disabled"/>
                <span class="updateStatus"></span>
            </div>
        </div>
        <asp:ListView ID="remainingInfusionsLV" runat="server" >
            <ItemTemplate>
                <li class="stdItem" runat="server" data-id='<%# Eval("Id") %>'>
                    <%# Eval("DrugName") %>
                    <span runat="server" visible='<%# Eval("SpecificWard") !=null %>' class="specificWard">
                        <%# Eval("SpecificWard") %>
                    </span>
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
        <h4 class="clickHandle">Emergency bolus drugs <span class="dragInstruction">(drag and drop between lists)</span> <label runat="server" id="cloneBolusLabel">Clone These To: <asp:DropDownList runat="server" id="cloneBolusSelect" /></label><asp:Button text="go" id="cloneBolusGo" runat="server" OnClick="CloneBolusGo_Click"/><span class="updateStatus"></span></h4>
        <div id="bolusListAndSubmit" class="druglist">
            <div id="includedBoluses">
                <h5>Used:</h5>  
                <asp:ListView ID="bolusSortOrderLV" runat="server" >
                    <ItemTemplate>
                    <li class='<%# Eval("Id") == null ? "stdItem bolusSubHeader":"stdItem" %>' runat="server" data-id='<%# Eval("Id") %>' >
                        <%# Eval("DrugName") %>
                        <span runat="server" class="specificWard" visible='<%# Eval("SpecificWard") !=null %>' >
                            <%# Eval("SpecificWard") %>
                        </span>
                    </li>
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
            </div>
            <div id="submitBolusOps" class="submitOps"  runat="server">
                <div id="freeText">
                    <label for="bolusHeader">Subheaders: </label>
                    <input type="text" id="bolusHeader" runat="server" class="rich"/>
                    <input type="button" id="addBolusHeader" value="Add" />
                    <div class="error" id="bolusHeaderVal"></div>
                </div>
                <input id="submitBolusSort" type="button" value="Submit" class="submitOrder" disabled="disabled"/>
                <span class="updateStatus"></span>
            </div>
        </div>
        <div id="unusedBolus" class="druglist">
            <h5>Unused:</h5>
            <asp:ListView ID="remainingBolusLV" runat="server" >
                <ItemTemplate>
                    <li class='<%# Eval("Id") == null ? "stdItem bolusSubHeader":"stdItem" %>' runat="server" data-id='<%# Eval("Id") %>' >
                        <%# Eval("DrugName") %>
                        <span runat="server" class="specificWard" visible='<%# Eval("SpecificWard") !=null %>' >
                            <%# Eval("SpecificWard") %>
                        </span>
                    </li>
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
<asp:Content ID="MyScripts" ContentPlaceHolderId="MasterScripts" runat="server">
    <asp:ScriptManagerProxy runat="server" EnableViewState="false">
        <CompositeScript>
            <Scripts>
                <asp:ScriptReference Path="~/Scripts/orderManager.js" />
            </Scripts>
        </CompositeScript>
    </asp:ScriptManagerProxy>
</asp:Content>