using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Text.RegularExpressions;

namespace PICUdrugs.Utils
{
    public static class ExtensionMethods
    {
        //http://stackoverflow.com/questions/158172/formatting-numbers-with-significant-figures-in-c-sharp#answer-1987721
        private static double ToPrecision(double d, int sigFigures, out int roundingPosition)
        {
            // this Method will return a rounded double value at a number of signifigant figures.
            // the sigFigures parameter must be between 0 and 15, exclusive.

            roundingPosition = 0;

            // ToDo: Might want to compare with epsilon here
            if (d == 0.0d)
            {
                return d;
            }

            if (double.IsNaN(d))
            {
                return double.NaN;
            }

            if (double.IsPositiveInfinity(d))
            {
                return double.PositiveInfinity;
            }

            if (double.IsNegativeInfinity(d))
            {
                return double.NegativeInfinity;
            }

            if (sigFigures < 1 || sigFigures > 14)
            {
                throw new ArgumentOutOfRangeException("sigFigures", d, "The sigFigures argument must be between 0 and 15 exclusive.");
            }

            // The resulting rounding position will be negative for rounding at whole numbers, and positive for decimal places.
            roundingPosition = sigFigures - 1 - (int)(Math.Floor(Math.Log10(Math.Abs(d))));

            // try to use a rounding position directly, if no scale is needed.
            // this is because the scale mutliplication after the rounding can introduce error, although 
            // this only happens when you're dealing with really tiny numbers, i.e 9.9e-14.
            if (roundingPosition > 0 && roundingPosition < 15)
            {
                return Math.Round(d, roundingPosition, MidpointRounding.AwayFromZero);
            }

            // Shouldn't get here unless we need to scale it.
            // Set the scaling value, for rounding whole numbers or decimals past 15 places
            double scale = Math.Pow(10, Math.Ceiling(Math.Log10(Math.Abs(d))));

            return Math.Round(d / scale, sigFigures, MidpointRounding.AwayFromZero) * scale;
        }

        public static double ToPrecision(this double d, int sigFigures)
        {
            int unneededRoundingPosition;
            return ToPrecision(d, sigFigures, out unneededRoundingPosition);
        }
        /// <summary>
        /// As per ToPrecison, but will round the next digit after The precision to 0.5 if it lies >0.25 & <0.75
        /// </summary>
        /// <param name="value"></param>
        /// <param name="sigFigures"></param>
        /// <returns></returns>
        public static double ToPrecisionAndHalf(this double d, int sigFigures)
        {
            int roundingPosition;
            var newVal = ToPrecision(d, sigFigures, out roundingPosition);
            var accuracy = (d - newVal) * Math.Pow(10, roundingPosition);
            if (accuracy > 0.25) { newVal += 0.5 * Math.Pow(10, -roundingPosition); }
            else if (accuracy < -0.25) { newVal -= 0.5 * Math.Pow(10, -roundingPosition); }
            return newVal;
        }
        public static double AsDrawingUpVolume(this double d)
        {
            if (d <= 0.1) { return ToPrecision(d, 2); }
            if (d <= 1) { return Math.Round(d, 2); }
            // if (d <= 3) 
            return Math.Round(d, 1); 
            //if (d <= 10) { return Math.Round(d * 5) / 5; } //nearest 0.2
            //return Math.Round(d);
        }
        public static string ToString(this double d, int sigFigures)
        {
            // this Method will round and then append zeros if needed.
            // i.e. if you round .002 to two significant figures, the resulting number should be .0020.

            var currentInfo = CultureInfo.CurrentCulture.NumberFormat;

            // ToDo: Might want to compare with epsilon here
            if (d == 0.0d)
            {
                return 0.0d.ToString(currentInfo);
            }

            if (double.IsNaN(d))
            {
                return currentInfo.NaNSymbol;
            }

            if (double.IsPositiveInfinity(d))
            {
                return currentInfo.PositiveInfinitySymbol;
            }

            if (double.IsNegativeInfinity(d))
            {
                return currentInfo.NegativeInfinitySymbol;
            }

            int roundingPosition = 0;
            double roundedValue = ToPrecision(d, sigFigures, out roundingPosition);

            // If the above rounding evaluates to zero, just return zero without padding.
            // Todo:  Might want to compare with epsilon here
            // Todo:  Consider whether it's more correct to return zero at a certain precision here (ie. .000 or zero at 3 sig figs).  For my purposes zero is zero.
            if (roundedValue == 0.0d)
            {
                return 0.0d.ToString(currentInfo);
            }

            // Check if the rounding position is positive and is not past 100 decimal places.
            // If the rounding position is greater than 100, string.format won't represent the number correctly.
            // ToDo:  What happens when the rounding position is greater than 100?
            if (roundingPosition > 0 && roundingPosition < 100)
            {
                return string.Format(currentInfo, "{0:F" + roundingPosition + "}", roundedValue);
            }

            // Shouldn't get here unless it's a whole number
            // String.format is only needed when dealing with decimals (whole numbers won't need to be padded with zeros to the right.)
            return roundedValue.ToString(currentInfo);
        }
        public static string ToJSON(this object obj, int recursionDepth = -1)
        {
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            if (recursionDepth != -1) { serializer.RecursionLimit = recursionDepth; }
            return serializer.Serialize(obj);
        }
        public static string OrdinalIndicator(int i)
        {
            if (i <= 0) { throw new ArgumentException("must be a positive integer greater than 0"); }
            var mod = i % 100;
            if (mod > 3 && mod < 21) {
                return "th";
            } else {
                switch (mod % 10)
                {
                    case 1:
                        return "st";
                    case 2:
                        return "nd";
                    case 3:
                        return "rd";
                    default:
                        return "th";
                }
            }
        }
        public static string ToRanking(this int i, bool addSupTag=false)
        {

            if (addSupTag) { return string.Format("{0}<sup>{1}</sup>", i, OrdinalIndicator(i)); }
            return i.ToString() + OrdinalIndicator(i);
        }
        public static string ToClarityString(this double d)
        {
            if (d < 10000) { return d.ToString(); }
            return d.ToString("### ### ### ###").TrimStart();
        }
        public static string Singularise(this string s) //could use the entity engine to do this, but there are no edge cases I am aware of with SI units
        {
            if (string.IsNullOrEmpty(s)) {return s;}
            int len = s.Length-1;
            char lastChar = s[len];
            if (lastChar == 's') { return s.Substring(0, len); }
            return s;
        }
        public static string SingularisePreFwdSlash(this string s)
        {
            if (string.IsNullOrEmpty(s)) {return s;}
            var pos = s.IndexOf('/');
            if (pos<2){return s;}
            return s.Substring(0,pos).Singularise() + s.Substring(pos, s.Length-pos);
        }
        /*
        public static string ToValidPath(this string path)
        {
            if (path == null) { return null; }
            path = path.Trim();
            if (path.Length <= 1) { return path; }
            bool isHttp = IsHttp(path);
            char pathSeperator = isHttp ? '/' : '\\';
            if (isHttp) {path = path.Replace(" ", "%20");}
            if (path[path.Length - 1] == pathSeperator || (new Regex(PICUdrugs.DAL.FieldConst.fileTypeRegEx)).IsMatch(path)) { return path; }
            return  path + pathSeperator;
        }
        public static string ToValidAddress(this string address, string url)
        {
            address = address.Trim();
            if (IsHttp(address))
            {
                return address.Replace(' ', '+');
            }
            return address;
        }
         * */

    }
}