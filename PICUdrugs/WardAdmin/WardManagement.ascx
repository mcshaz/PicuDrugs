<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WardManagement.ascx.cs" Inherits="PICUdrugs.websiteAdmin.WardManagement" %>
 <asp:ObjectDataSource ID="allDpts" runat="server" 
    SelectMethod="GetDepartments" TypeName="PICUdrugs.BLL.WardBL" 
    DataObjectTypeName="PICUdrugs.DAL.Ward">
 </asp:ObjectDataSource>

<asp:ObjectDataSource ID="allDefibs" runat="server" 
    SelectMethod="GetDefibs" TypeName="PICUdrugs.BLL.DefibBL"
    DataObjectTypeName="PICUdrugs.DAL.defibModel">
 </asp:ObjectDataSource>

 <asp:ObjectDataSource ID="SelectedDptObjDataSrc" runat="server"
    SelectMethod="GetDepartmentByWardId" TypeName="PICUdrugs.BLL.WardBL"  OnDeleted="General_CRUD"
    DataObjectTypeName="PICUdrugs.DAL.Ward" DeleteMethod="DeleteWard" InsertMethod="InsertWard" UpdateMethod="UpdateWard"
    ConflictDetection="CompareAllValues" OldValuesParameterFormatString="orig{0}" OnInserted="General_CRUD"  OnUpdated="General_CRUD" >
     <SelectParameters>
         <asp:ControlParameter ControlId="DptDropDownList" Name="dptId" PropertyName="SelectedValue" Type="Int32" />
     </SelectParameters>
</asp:ObjectDataSource>

<div class="modelDetails">
    <div class="selectedDdl">
        Department: 
        <asp:DropDownList ID="DptDropDownList" runat="server" ViewStateMode="Enabled"
            DataSourceID="allDpts" DataTextField="abbrev" OnPreRender="DptDropDownList_PreRender"
            DataValueField="WardId" AutoPostBack="true" OnSelectedIndexChanged="DptDropDownList_SelectedIndexChanged" />
    </div>
    <div class="crudOps">
        <span class="displayDetails">Details</span>
        <div runat="server" id="hiddenDetails" enableviewstate="false">
            <div class="dptDetails selectedMenuItem">
                    <asp:DetailsView ID="DptDetailView" runat="server" DataSourceID="SelectedDptObjDataSrc" GridLines="None" OnPreRender="DptDetailViewPreRender"
                       AutoGenerateRows="False" DataKeyNames="WardId" OnItemCommand="DptDetailView_ItemCommand">
                        <Fields>
                            <asp:DynamicField DataField="Fullname" HeaderText="Name" HeaderStyle-CssClass="detailLabel" ValidationGroup="wardDetails"/>
                            <asp:DynamicField DataField="Abbrev" HeaderText="Abbreviation" HeaderStyle-CssClass="detailLabel" ValidationGroup="wardDetails"/>
                            <asp:TemplateField HeaderText="Defibrillator" HeaderStyle-CssClass="detailLabel">
		                        <ItemTemplate>
			                        <%#Eval("DefibModel.Name")%>
		                        </ItemTemplate>
		                        <InsertItemTemplate>
			                        <asp:DropDownList ID="DefibList" datasourceid="allDefibs" ValidationGroup="wardDetails"
				                        datatextfield="Name" DataValueField="Id" 
				                        SelectedValue='<%# Bind("DefibId") %>' runat="server"/>
		                        </InsertItemTemplate>
		                        <EditItemTemplate>
			                        <asp:DropDownList ID="DefibList" datasourceid="allDefibs" ValidationGroup="wardDetails"
				                        datatextfield="Name" DataValueField="Id" 
				                        SelectedValue='<%# Bind("DefibId") %>' runat="server"/>
		                        </EditItemTemplate>
	                        </asp:TemplateField>
                            <asp:TemplateField HeaderText="Bolus Chart Header" HeaderStyle-CssClass="detailLabel">
                    	        <ItemTemplate>
			                        <%#Eval("BolusChartHeader")%>
		                        </ItemTemplate>
		                        <InsertItemTemplate>
			                        <asp:TextBox ID="BolusChartHeader" TextMode="MultiLine" ValidationGroup="wardDetails" CssClass="rich"
				                        Text='<%# Bind("BolusChartHeader") %>' runat="server"/>
		                        </InsertItemTemplate>
		                        <EditItemTemplate>
			                        <asp:TextBox ID="BolusChartHeader" TextMode="MultiLine" ValidationGroup="wardDetails" CssClass="rich"
				                        Text='<%# Bind("BolusChartHeader") %>' runat="server"/>
		                        </EditItemTemplate>
                            </asp:TemplateField> 
                            <asp:DynamicField DataField="PaddingInCm" HeaderText="Bolus Drug Padding (cm)" HeaderStyle-CssClass="detailLabel" ValidationGroup="wardDetails" />
                            <asp:CheckBoxField DataField="IsLive" HeaderText="Is Live" HeaderStyle-CssClass="detailLabel"/>
                            <asp:CommandField ButtonType="Link" ValidationGroup="wardDetails" CausesValidation="true" 
                                ShowCancelButton="true" ShowDeleteButton="true" ShowEditButton="true" ShowInsertButton="true" />
                        </Fields>
                    </asp:DetailsView>
                    <asp:ValidationSummary runat="server" ID="WardValSummary" CssClass="validationError" EnableClientScript="true" Enabled="true" 
                        ShowSummary="true" ValidationGroup="wardDetails" />
                </div>
        </div>
    </div>
</div>
