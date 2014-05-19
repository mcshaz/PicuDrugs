using PICUdrugs.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace PICUdrugs.ViewModels
{
    public class UserData
    {
        public string UserName { get; set; }
        public string Email { get; set; }
        public bool IsWardAdmin { get; set; }
        public bool IsSiteAdmin { get; set; }
        public bool IsDrugAdmin { get; set; }
        public DateTime Created { get; set; }
        public string Centre { get; set; }
    }
}