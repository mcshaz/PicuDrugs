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
    public partial class editReferences : System.Web.UI.Page
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            DetailsView1.EnableDynamicData(typeof(DrugReferenceSource));
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            /*
            if (RefAbrevDDL.DataSourceObject == null) //either !postback | !enabledviewstate
            {
                //single query to attach to ddl & detailsView
                IEnumerable<DrugReferenceSource> allRefs = new referenceBL().GetReferences();
                RefAbrevDDL.DataSource = allRefs;
                RefAbrevDDL.DataBind();
                IEnumerable<DrugReferenceSource> selectedRef = (from r in allRefs
                                                          where r.DrugReferenceId == Convert.ToInt32(RefAbrevDDL.SelectedValue)
                                                          select r).ToList();
                DetailsView1.DataSource=
            }
             */
        }

        protected void reference_CRUD(object sender, ObjectDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                var overlappingAgeWtValidator = new CustomValidator();
                overlappingAgeWtValidator.IsValid = false;

                overlappingAgeWtValidator.ErrorMessage = "Update failed: " + Formulas.GetExceptionMessages(e.Exception);
                Page.Validators.Add(overlappingAgeWtValidator);
                e.ExceptionHandled = true;
            }
            else
            {
                RefAbrevDDL.DataBind();
            }
        }
        /*
        protected void DDDataSource_ObjCreated(object sender, ObjectDataSourceEventArgs e)
        {
            persistentRef = e.ObjectInstance as referenceBL;
        }

        protected void SelRefObjDataSrc_ObjCreating(object sender, ObjectDataSourceEventArgs e)
        {
            if (persistentRef!=null)
            {
                e.ObjectInstance = persistentRef;
            }
        }
         * */
    }
}
/* progrmatically bind ? how to CRUD

*/