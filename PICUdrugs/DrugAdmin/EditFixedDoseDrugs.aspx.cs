using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.DynamicData;
using PICUdrugs.DAL;
using PICUdrugs.BLL;
using PICUdrugs.Utils;
using DBToJSON.SqlEntities.BolusDrugs;

namespace PICUdrugs.drugAdmin
{
    public partial class EditFixedDoseDrugs : System.Web.UI.Page
    {
        private int[] rowsToShow;
        private BolusBL persistentRef;
        private const string unitCSSclass = "subTH";
        protected void Page_Init(object sender, EventArgs e)
        {
            Master.AddJQuery();
            Master.AddTinyMce();
            FixedDrugLV.EnableDynamicData(typeof(FixedDrug));
            if (Page.IsPostBack)
            {
                //need to find element in postback data
                string rowVals = Page.Request.Form.Get(rowsToDisplayInsert.UniqueID);
                rowsToShow = Formulas.CommaStringToArray(rowVals);
            }
            else
            {
                rowsToShow = new int[0];
            }
        }
        protected void FixedDrugLV_ItemCreated(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                ListViewDataItem dataItem = (ListViewDataItem)e.Item;
                FixedDrug drug = (FixedDrug)dataItem.DataItem;
                if (drug == null) return;
                ObjectDataSource infConcObjDataSrc = e.Item.FindControl("FixedDoseObjDataSource") as ObjectDataSource;
                if (infConcObjDataSrc != null)
                {
                    Parameter parameter = infConcObjDataSrc.SelectParameters[0];
                    parameter.DefaultValue = drug.FixedDrugId.ToString();
                }
                int rowSpan = drug.FixedDoses.Count;
                LinkButton showInsert = (LinkButton)e.Item.FindControl("allowInsert");
                if (rowSpan == 0 || rowsToShow.Contains(dataItem.DataItemIndex))
                {
                    //show insert row
                    rowSpan++;
                    ListView embeddedLV = (ListView)e.Item.FindControl("FixedDoseLV");
                    if (embeddedLV != null)
                    {
                        embeddedLV.InsertItemPosition = InsertItemPosition.LastItem;
                        //hide insert button
                        showInsert.Visible = false;
                    }
                }
                else if (showInsert!=null)
                {
                    showInsert.OnClientClick = string.Format("addNumber({0},'{1}')",
                                                            dataItem.DataItemIndex,
                                                            rowsToDisplayInsert.ClientID);
                }
                if (rowSpan > 1)
                {
                    ListViewItem thisRow = (ListViewItem)e.Item;
                    setRowSpan(thisRow, rowSpan);
                }
            }
        }
        protected void FixedDoseLV_init(object sender, EventArgs e)
        {
            ListView thisLV = (ListView)sender;
            thisLV.EnableDynamicData(typeof(FixedDose));
        }
        protected void FixedDose_allDataBound(object sender, EventArgs e)
        {
            ListView embeddedLV = (ListView)sender;
            ListViewItem containerDataItem = (ListViewItem)embeddedLV.NamingContainer;
            if (embeddedLV.InsertItem != null)
            {
                HiddenField innerDrugIdField = (HiddenField)embeddedLV.InsertItem.FindControl("FixedDrugId");
                HiddenField outerDrugIdField = (HiddenField)containerDataItem.FindControl("FixedDrugId");
                innerDrugIdField.Value = outerDrugIdField.Value;
            }
            FixedDrug drug = (FixedDrug)containerDataItem.DataItem;
            if (drug==null) return;
            if (embeddedLV.InsertItem != null)
            {
                if (drug.FixedDoses.Count == 0)
                {
                    //hide opening tr on insert row
                    PlaceHolder rowstart = (PlaceHolder)embeddedLV.InsertItem.FindControl("rowStart");
                    rowstart.Visible = false;
                    //disable cancel
                    LinkButton cancelBtn = (LinkButton)embeddedLV.InsertItem.FindControl("cancelInsert");
                    cancelBtn.CommandName = "Cancel";
                    cancelBtn.Text = "Clear";
                }
                else
                {
                    LinkButton cancelBtn = (LinkButton)embeddedLV.InsertItem.FindControl("cancelInsert");
                    cancelBtn.OnClientClick = string.Format("deleteNumber({0},'{1}')",
                                                                containerDataItem.DataItemIndex,
                                                                rowsToDisplayInsert.ClientID);
                }
            }
        }
        private void setRowSpan(Control rowItem, int rowSpan)
        {
            foreach (Control ctr in rowItem.Controls)
            {
                System.Web.UI.HtmlControls.HtmlTableCell td = ctr as System.Web.UI.HtmlControls.HtmlTableCell;
                if (td != null)
                {
                    td.RowSpan = rowSpan;
                }
            }
        }
        protected void FixedDoseLV_ItemBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                ListViewDataItem dataItem = (ListViewDataItem)e.Item;
                if (dataItem.DisplayIndex == 0)
                {
                    PlaceHolder row = (PlaceHolder)e.Item.FindControl("rowStart");
                    row.Visible = false;
                }
            }
        }
        protected void FixedDoseLV_Inserted(Object sender, ListViewInsertedEventArgs e)
        {
            if (e.AffectedRows > 0)
            {
                //either hideInsert or alter Insertitem - not both!!
                ListView doseLV = (ListView)sender;
                ListViewItem containingDataItem = (ListViewItem)doseLV.NamingContainer;
                int indx = Array.IndexOf(rowsToShow, containingDataItem.DataItemIndex);
                if (indx > -1)
                {
                    List<int> tempRows = new List<int>(rowsToShow.Length);
                    tempRows.AddRange(rowsToShow);
                    tempRows.RemoveAt(indx);
                    rowsToShow = tempRows.ToArray();
                    rowsToDisplayInsert.Value = string.Join(",",rowsToShow.Select(x => x.ToString()).ToArray());
                }
                //e.KeepInInsertMode = false;
                setRowSpan(containingDataItem, doseLV.Items.Count() + 2); //1 for the new row & 1 for the insert
            }
            else
            {
                e.KeepInInsertMode = true;
            }
        }
        protected void FixedDoseLV_Deleted(Object sender, ListViewDeletedEventArgs e)
        {
            if (e.AffectedRows > 0)
            {
                ListView doseLV = (ListView)sender;
                ListViewItem containerRow = (ListViewItem)doseLV.NamingContainer;
                int rowSpan = doseLV.Items.Count() - 1 + (rowsToShow.Contains(containerRow.DataItemIndex)?1:0);
                if (rowSpan <= 0)
                {
                    rowSpan = 1;
                }
                setRowSpan(containerRow, rowSpan); // ? sould use convert.toint32?
            }
        }
        protected void General_CRUD(object sender, ObjectDataSourceStatusEventArgs e)
        {
            Exception outerExcept = e.Exception;
            if (outerExcept != null)
            {
                var overlappingAgeWtValidator = new CustomValidator();
                overlappingAgeWtValidator.IsValid = false;
                if (outerExcept is BLexception)
                {
                    overlappingAgeWtValidator.ErrorMessage = "Cannot update as the following rule would be broken: " + outerExcept.InnerException.Message;
                }
                else
                {
                    overlappingAgeWtValidator.ErrorMessage = "Database rules prevented changes: " + Formulas.GetExceptionMessages(outerExcept);
                }
                Page.Validators.Add(overlappingAgeWtValidator);
                e.ExceptionHandled = true;
                e.AffectedRows = 0;
            }
            else
            {
                e.AffectedRows = 1;
            }
        }
        protected void FixedDrugObjDataSource_ObjCreated(object sender, ObjectDataSourceEventArgs e)
        {
            persistentRef = e.ObjectInstance as BolusBL;
        }

        protected void FixedDoseObjDataSource_ObjCreating(object sender, ObjectDataSourceEventArgs e)
        {
            if (persistentRef != null)
            {
                e.ObjectInstance = persistentRef;
            }
        }
        /*
        protected void showInsert_click(object sender, EventArgs e)
        {
            LinkButton thisBtn = (LinkButton)sender;
            ListViewDataItem listRow = (ListViewDataItem)thisBtn.NamingContainer;
            thisBtn.Visible = false;
            int rowSpan = 0;
            foreach (Control ctrl in listRow.Controls)
            {
                System.Web.UI.HtmlControls.HtmlTableCell td = ctrl as System.Web.UI.HtmlControls.HtmlTableCell;
                if (td != null)
                {
                    if (rowSpan == 0)
                    {
                        rowSpan = td.RowSpan == -1 ? 2 : td.RowSpan + 1;
                    }
                    td.RowSpan = rowSpan;
                }
                    
            }
            ListView nestedLV = (ListView)listRow.FindControl("FixedDoseLV");
            nestedLV.InsertItemPosition = InsertItemPosition.LastItem;
        }
        protected void cancelInsert_click(object sender, EventArgs e)
        {
            //find outerRow
            LinkButton thisBtn = (LinkButton)sender;
            ListViewDataItem outerListRow = (ListViewDataItem)thisBtn.NamingContainer.NamingContainer.NamingContainer; // nestedLVdataItem -> nestedLV ->outerLVdataItem
            int rowSpan = 0;
            foreach (Control ctrl in outerListRow.Controls)
            {
                System.Web.UI.HtmlControls.HtmlTableCell td = ctrl as System.Web.UI.HtmlControls.HtmlTableCell;
                if (td != null)
                {
                    if (rowSpan == 0)
                    {
                        rowSpan = td.RowSpan <= 1 ? 1 : td.RowSpan -1;
                    }
                    td.RowSpan = rowSpan;
                }
            }
            ListView nestedLV = (ListView)outerListRow.FindControl("FixedDoseLV");
            nestedLV.InsertItemPosition = InsertItemPosition.None;
            LinkButton showInsert = (LinkButton)outerListRow.FindControl("allowInsert");
            showInsert.Visible = true;
        }
        */
    }
}