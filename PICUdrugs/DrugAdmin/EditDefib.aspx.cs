using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PICUdrugs.BLL;
using PICUdrugs.DAL;
using PICUdrugs.Utils;

namespace PICUdrugs.drugAdmin
{
    public partial class editDefib : System.Web.UI.Page
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            ModelDetailView.EnableDynamicData(typeof(DefibModel));
            JoulesListView.EnableDynamicData(typeof(DefibJoule));
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.AddJQuery();
        }
        protected void General_CRUD(object sender, ObjectDataSourceStatusEventArgs e)
        {
            Exception outerExcept = e.Exception;
            if (outerExcept != null)
            {
                var customVal = new CustomValidator();
                customVal.IsValid = false;
                if (outerExcept is BLexception)
                {
                    customVal.ErrorMessage = "Cannot update as the following rule would be broken: " + outerExcept.InnerException.Message;
                }
                else
                {
                    customVal.ErrorMessage = "Database rules prevented changes: " + PICUdrugs.Utils.Formulas.GetExceptionMessages(outerExcept);
                }
                Page.Validators.Add(customVal); //?val summary - WardValSummary
                e.ExceptionHandled = true;
            }
            else if (((ObjectDataSourceView)sender).DataObjectTypeName == selectedDefib.DataObjectTypeName)
            {
                DefibDropDownList.DataBind();
                var model = e.ReturnValue as DefibModel;
                if (model != null) { DefibDropDownList.SelectedValue = model.Id.ToString(); }
            }
        }
        protected void ModelDetailViewPreRender(object sender, EventArgs e)
        {
            if (ModelDetailView.CurrentMode == DetailsViewMode.ReadOnly)
            {
                hiddenDetails.Attributes["class"] = "readOnlyMode";
            }
        }
        protected void JoulesDataBound(object sender, EventArgs e)
        {
            HiddenField defibId = (HiddenField)JoulesListView.InsertItem.FindControl("DefibModelId");
            if (defibId != null && defibId.Value == "")
            {
                defibId.Value = DefibDropDownList.SelectedValue;
            }
        }
    }
}