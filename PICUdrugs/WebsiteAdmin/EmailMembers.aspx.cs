using PICUdrugs.DAL;
using PICUdrugs.Utils;
using PICUdrugs.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PICUdrugs.WebsiteAdmin
{
    public partial class EmailMembers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ((SiteMaster)Page.Master).AddJQuery();
            MembershipList.DataSource = GetUserData();
            MembershipList.DataBind();
        }
        private static IEnumerable<UserData> GetUserData()
        {
            IDictionary<int, string> allWardNames;
            using (var repo = new WardRepository())
            {
                allWardNames = repo.GetDepartmentNames();
            }
            allWardNames.Add(0,string.Empty); // a bit of a hack, fortunately will throw if 0 is ever used

            string[] wardAdmins = Roles.GetUsersInRole("wardAdmin");
            string[] drugAdmins = Roles.GetUsersInRole("drugAdmin");
            string[] siteAdmins = Roles.GetUsersInRole("websiteAdmin");

            return Membership.GetAllUsers().Cast<MembershipUser>()
                .Select(m => new UserData
                {
                    UserName = m.UserName,
                    Email = m.Email,
                    Created = m.CreationDate,
                    Centre = allWardNames[UserProfile.GetUserProfile(m.UserName).WardId ?? 0],
                    IsDrugAdmin = drugAdmins.Contains(m.UserName),
                    IsSiteAdmin = siteAdmins.Contains(m.UserName),
                    IsWardAdmin = wardAdmins.Contains(m.UserName)
                }).ToList();
        }
    }
}