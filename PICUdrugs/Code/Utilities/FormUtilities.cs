using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace PICUdrugs.Utils
{
    public class FixedLists
    {
        public class SiPrefixes
        {
            public SiPrefixes()
            {
                allPrefixes = new Dictionary<int, string>();
                allPrefixes.Add(0, "(none)");
                allPrefixes.Add(-3, "milli");
                allPrefixes.Add(-6, "micro");
                allPrefixes.Add(-9, "nano");
                allPrefixes.Add(-12, "pico");
            }
            public Dictionary<int, string> allPrefixes;
        }
    }

    public static class FormUtilities
    {
        public static Dictionary<int, string> SiPrefixesList()
        {
            return SiPrefixesList(0);
        }
        public static Dictionary<int,string> SiPrefixesList(int excludeAbove=0)
        {
            Dictionary<int, string> returnCollection = new Dictionary<int, string>();
            //using intentional fall through - wait, c# doesn't allow this *%$#%&!^
            switch(excludeAbove) {
                case 0:
                    returnCollection[0] = "(none)";
                    goto case -3;
                case -3:
                    returnCollection[-3] = "milli";
                    goto case -6;
                case -6:
                    returnCollection[-6] = "micro";
                    goto case -9;
                case -9:
                    returnCollection[-9] = "nano";
                    goto case -12;
                case -12:
                    returnCollection[-12] = "pico";
                break;
            default:
                throw new Exception("excluded value incorrect - no values available");
        }
            return returnCollection;
        }
    }
}