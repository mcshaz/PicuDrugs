using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
//for ip adress as below
using System.Net;
//remove after debugging
using System.Diagnostics;

namespace PICUdrugs.Utils
{
    /// <summary>
    /// A utility class for all PICU drug calculations
    /// </summary>
    /// 
    public static partial class Formulas
    {
        public const double MinVariableWeight = 30;
        public const double MaxVolume = 60;

        /// <summary>
        /// Calculate the drawing up Volume for Volume variable (fixed drug additive) Infusions
        /// </summary>
        /// <param name="ptWeight">Patient weight in Kg</param>
        /// <returns>mL of diluent</returns>
        public static double DilutionVolumeMls(double ptWeight)
        {
            const double volConvFact = 1e4 / 3;
            if (ptWeight < MinVariableWeight)
            {
                throw new Exception("ptWeight < " + Formulas.MinVariableWeight);
            }

            //calculate Volume
            double returnVal = (volConvFact / ptWeight);
            if (returnVal > MaxVolume) returnVal = returnVal / 2;
            return returnVal;
        }
        public static string UppercaseWords(string value)
        {
            //http://www.dotnetperls.com/uppercase-first-letter
            char[] array = value.ToCharArray();
            // Handle the first letter in the string.
            if (array.Length >= 1)
            {
                if (char.IsLower(array[0]))
                {
                    array[0] = char.ToUpper(array[0]);
                }
            }
            // Scan through the letters, checking for spaces.
            // ... Uppercase the lowercase letters following spaces.
            for (int i = 1; i < array.Length; i++)
            {
                if (array[i - 1] == ' ')
                {
                    if (char.IsLower(array[i]))
                    {
                        array[i] = char.ToUpper(array[i]);
                    }
                }
            }
            return new string(array);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="ptAge">Age of patient</param>
        /// <param name="ptWeight">Weight of patient</param>
        /// <param name="isMale"> 0=female | 1=male</param>
        /// <returns>Centile of weight for age and sex</returns>
        public static string LogSiToString(int logVal)
        {
            switch (logVal)
            {
                case -12:
                    return "pico";
                case -9:
                    return "nano";
                case -6:
                    return "micro";
                case -3:
                    return "milli";
                default:
                    return "";
            }
        }
        public static string UnitString(int logVal, string unitName, out bool pleuralise)
        {
            pleuralise = false;
            if (unitName == "gram") 
            { 
                switch (logVal)
                {
                    case 0:
                        return "g";
                    case -3:
                        return "mg";
                    default:
                        break;
                }
            }
            else if (unitName == "mole" && logVal == -3)
            {
                return "mmol";
            }
            pleuralise = true;
            return LogSiToString(logVal) + unitName;
        }
        public static char LogSiToChar(int logVal)
        {
            switch (logVal)
            {
                case -12:
                    return 'p';
                case -9:
                    return 'n';
                case -6:
                    return 'µ';
                case -3:
                    return 'm';
                default:
                    return ' ';
            }
        }
        public static string GetExceptionMessages(Exception e)
        {
            StringBuilder returnVal = new StringBuilder(600);
            StringBuilder nbsps = new StringBuilder(72);
            do
            {
                returnVal.Append(nbsps.ToString() + e.Message + "<br/>");
                nbsps.Append("&nbsp;&nbsp;&nbsp;&nbsp;");
                e = e.InnerException;
            } while (e != null);
            return returnVal.ToString();
        }
        public static string FirstNonEmptyString(string string1, string string2)
        {
            if (!String.IsNullOrEmpty(string1)) return string1;
            if (!String.IsNullOrEmpty(string2)) return string2;
            return ""; // return (string2==null)?string.empty:string2
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="mins">integer denoting total minutes</param>
        /// <param name="hrFormat">string.Format -> {0} is no of hrs</param>
        /// <param name="minFormat">string.Format -> {1} is no of minutes</param>
        /// <returns>eg - 3h15m</returns>
        public static string MinsToString(int mins, string hrFormat = "{0} hour", string seperator = " ", string minFormat = "{0} min", bool pluralise = true, bool hideZero=true)
        {
            int hrs = mins / 60;
            mins = mins - (hrs * 60);
            if (hrs != 1 && pluralise) { hrFormat += "s"; }
            if (mins != 1 && pluralise) { minFormat += "s"; }

            return (hideZero && hrs == 0 ? null : string.Format(hrFormat, hrs)) + seperator + (hideZero && mins == 0 ? null : string.Format(minFormat, mins));
        }
        public static int[] CommaStringToArray(string strComma)
        {
            if (strComma == "" || strComma == null) return new int[0];
            string[] strArray;

            strArray = strComma.Split(new char[] { ',' });
            int[] intArray = new int[strArray.Length];

            for (int i = 0; i < strArray.Length; i++)
            {
                intArray[i] = int.Parse(strArray[i]);
            }
            return intArray;
        }
        public static int ClosestValue(double val, int[] list)
        {
            Array.Sort(list);
            int i = list.Length;
            if (i==0) {throw new ArgumentException("list must have a length > 0");}
            if (val < list[0]) {return list[0];}
            double dif=0;
            while (--i>=0 && (dif = (double)list[i] - val)>0 ){}
            if (dif == 0 || i >= list.Length - 1 || val - (double)list[i + 1] < dif) { return list[i]; }
            return list[i + 1];  
        }
    }
    public class NumericRange
    {
        private double? _lowerBound;
        public double LowerBound
        {
            get { return _lowerBound.Value; }
            set
            {
                if (value < 0 || (_upperBound.HasValue && value > _upperBound.Value)) { throw new Exception("lowerBound must be 0 or greater and less than maxRate"); }
                else { _lowerBound = value; }
            }
        }
        private double? _upperBound;
        public double UpperBound
        {
            get { return _upperBound.Value; }
            set
            {
                if (value < 0 || (_lowerBound.HasValue && value < _lowerBound.Value)) {
                    throw new Exception("upperBound must be greater than both 0 and minRate"); 
                }
                else { _upperBound = value; }
            }
        }
        public override string ToString()//this overide exists because default value confuses string.format Method
        {
            return ToString(2);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="precision"></param>
        /// <param name="rounding"></param>
        /// <param name="seperator">default = en dash</param>
        /// <returns></returns>
        public string ToString(int precision, Rounding rounding = Rounding.ToPrecision, string seperator = "–") //  + u200A hairwidth space ' '
        {
            if (!_lowerBound.HasValue) return "";
            if (rounding == Rounding.ToPrecision)
            {

                if (!_upperBound.HasValue || _lowerBound.Value == _upperBound.Value) return _lowerBound.Value.ToPrecision(precision).ToString(); //.(fixedString);
                return _lowerBound.Value.ToPrecision(precision).ToString() + seperator + _upperBound.Value.ToPrecision(precision).ToString();
                //return _lowerBound.Value.ToString(fixedString) + seperator + _upperBound.Value.ToString(fixedString);
            }
            else
            {
                string fixedString = "0." + new string('0', precision);
                if (!_upperBound.HasValue || _lowerBound.Value == _upperBound.Value) return _lowerBound.Value.ToString(fixedString);
                return _lowerBound.Value.ToString(fixedString) + seperator + _upperBound.Value.ToString(fixedString);
            }
            // return string.Format("{0:0.####} - {1:0.####}", _minRate, _maxRate);
        }
        public enum Rounding { FixedDecimalPlaces, ToPrecision }
        public string AsDrawingUpVolume(string seperator = "–")
        {
            if (!_lowerBound.HasValue) return "";

            if (!_upperBound.HasValue || _lowerBound.Value == _upperBound.Value) return _lowerBound.Value.AsDrawingUpVolume().ToString(); //.(fixedString);
            return _lowerBound.Value.AsDrawingUpVolume().ToString() + seperator + _upperBound.Value.AsDrawingUpVolume().ToString();
        }
    }
    public class ChildAge
    {
        private readonly int _years;
        private readonly int _months;
        private readonly int? _days;
        private readonly DateTime? _dob;
        public DateTime? Dob { get { return _dob; } }
        public ChildAge(int years, int months, int? days)
        {
            if (years < 0 || months < 0 || days < 0)
            {
                throw new Exception("years, months and days must all be positive");
            }
            _days = days;
            _months = months;
            _years = years;
            if (_days.HasValue && _days > 28)
            {
                DateTime countBack = DateTime.Today.AddMonths(-1);
                int DaysInMonth = DateTime.DaysInMonth(countBack.Year, countBack.Month);
                while (_days.Value >= DaysInMonth)
                {
                    _days -= DaysInMonth;
                    _months++;
                    countBack = countBack.AddMonths(-1);
                    DaysInMonth = DateTime.DaysInMonth(countBack.Year, countBack.Month);
                }
            }
            if (_months > 12)
            {
                _years = _years + (int)(_months / 12);
                _months = _months % 12;
            }
        }
        public ChildAge(string years, string months, string days) : this(Convert.ToInt32("0" + years), Convert.ToInt32("0" + months), Convert.ToInt32("0" + days))
        {
            if (String.IsNullOrWhiteSpace(years) && String.IsNullOrWhiteSpace(months) && String.IsNullOrWhiteSpace(days))
            {
                throw new Exception("years, months and days cannot be all null, empty or whitepace");
            }
        }
        public ChildAge(DateTime DOB)
        {
            DateTime now = DateTime.Today;
            DateTime Bday = (DateTime)DOB;
            if (Bday > now) throw new Exception("DOB must not be AFTER current system date");
            _years = now.Year - Bday.Year;
            _months = now.Month - Bday.Month;
            _days = now.Day - Bday.Day;
            if (_months < 0) _months += 12;
            if (_days < 0)
            {
                _days += DateTime.DaysInMonth(now.Year, now.AddMonths(-1).Month);
                if (_months == 0)
                {
                    _months = 11;
                    _years--;
                }
                else { _months--; }
            }
            if (Bday > now.AddYears(-_years)) _years--;
            _dob = DOB;
        }
        public override string ToString()
        {
            if (!_days.HasValue) return string.Format("{0} years {1} months", _years, _months);
            return string.Format("{0} years {1} months {2} days", _years, _months, _days);
        }
        public string ToShortString()
        {
            return string.Format("{0} y {1} m", _years, _months);
        }
        public bool IsDays { get { return _days.HasValue; } } //??maybe better to simply return Nullable int instead of these 2 funtions
        public int Days
        {
            get
            {
                if (_days.HasValue) return _days.Value;
                throw new Exception("days property requested without first being set");
            }
        }
        public int Months { get { return _months; } }
        public int Years { get { return _years; } }
        public int TotalMonths { get { return (12 * _years) + _months; } }
    }
    public static class DnsInfo
    {
        public static string LocalIP()
        {
            //Local IP Address    
            string hostName = Dns.GetHostName();    
            IPHostEntry localIp = Dns.GetHostEntry(hostName);     
            return localIp.AddressList[1].ToString();   
        }
        public static string RemoteIP(System.Web.UI.UserControl currentPage)
        {
            // Remote IP Address   
            string remoteIp = currentPage.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (String.IsNullOrEmpty(remoteIp))
            {
                remoteIp = currentPage.Request.ServerVariables["REMOTE_ADDR"];
            }
            return remoteIp;
        }
        public static string DnsToDebug(System.Web.UI.UserControl currentPage)
        {
            string resultStr = "UserHostAddress:" + currentPage.Request.UserHostAddress + "<br/>";
            resultStr += "UserHostName:" + currentPage.Request.UserHostName + "<br/>";
            resultStr += "localIP:" + LocalIP() + "<br/>";
            resultStr += "remoteIP:" + RemoteIP(currentPage) + "<br/>";
            return resultStr;
        }
        public static bool ADHBrequest(System.Web.UI.UserControl currentPage)
        {
            return false;
        }

    }
}