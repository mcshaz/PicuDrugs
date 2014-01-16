using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PICUdrugs.DAL;

namespace PICUdrugs.Pages.Admin
{
    public partial class editDrugAmpules : System.Web.UI.Page
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            DrugAmpListView.EnableDynamicData(typeof(drugAmpuleConcentration));
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Ampule_CRUD(object sender, ObjectDataSourceStatusEventArgs e)
        {
            /*
        Exception outerExcept = e.Exception;
        if (outerExcept != null)
        {

            var overlappingAgeWtValidator = new CustomValidator();
            overlappingAgeWtValidator.IsValid = false;
            if (outerExcept.InnerException is OverlappingAgeWeightException ||
                outerExcept.InnerException is nonAscendingRangeException ||
                outerExcept.InnerException is duplicateTimeException)
            {
                overlappingAgeWtValidator.ErrorMessage = "Unable to proceed because: " + outerExcept.InnerException.Message;
            }
            else
            {
                Exception innermostExcept = outerExcept.InnerException;
                while (innermostExcept.InnerException != null) innermostExcept = innermostExcept.InnerException;

                overlappingAgeWtValidator.ErrorMessage = "Database rules prevented changes: " + innermostExcept.Message;
            }
            Page.Validators.Add(overlappingAgeWtValidator);
            e.ExceptionHandled = true;
        }
        */
        }
    }
}