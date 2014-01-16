using System.Web.Profile;
using System.Web.Security;
using PICUdrugs.DAL;
using System.Linq;

namespace PICUdrugs.Utils
{
    public class UserProfile : ProfileBase
    {
        public static UserProfile GetUserProfile(string username)
        {
            return Create(username) as UserProfile;
        }
        public static UserProfile GetUserProfile() 
        { 
            return Create(Membership.GetUser().UserName) as UserProfile; 
        }
        [SettingsAllowAnonymous(false)]
        public int? WardId 
        { 
            get 
            {
                var returnVar = (int?)base.GetPropertyValue("WardId");
                if (returnVar == int.MinValue)
                {
                    return null;
                }
                return returnVar;
            } 
            set 
            {
                if (value == null)
                {
                    value = int.MinValue;
                }
                base.SetPropertyValue("WardId",value);
                base.Save();
            } 
        }
        public Ward GetWardManaged()
        {
            int? id = WardId;
            if (!id.HasValue) return null;
            WardRepository dptSortRepository = new WardRepository();
            return dptSortRepository.GetDptByWardId(id.Value);
        }
        public void SetWardManaged(Ward ward) 
        {
                WardId = ward.WardId;
        }
    }
    public class UserWardDetails
    {
        public UserWardDetails(string userName)
        {
            Roles= System.Web.Security.Roles.GetRolesForUser(userName);
            HomeWardId = UserProfile.GetUserProfile(userName).WardId;
        }
        public string[] Roles {get; private set;}
        public int? HomeWardId {get; private set;}
        public bool HasEditPermission(int WardId) 
        {
            return (Roles.Contains("drugAdmin") || (Roles.Contains("wardAdmin") && HomeWardId == WardId));
        }
    }
}