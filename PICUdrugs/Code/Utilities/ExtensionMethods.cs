﻿using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Text.RegularExpressions;
using PICUdrugs.BLL;
using System.Text;

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
            return ToPrecision(d, sigFigures, out int unneededRoundingPosition);
        }
        /// <summary>
        /// As per ToPrecison, but will round the next digit after The precision to 0.5 if it lies >0.25 & <0.75
        /// </summary>
        /// <param name="value"></param>
        /// <param name="sigFigures"></param>
        /// <returns></returns>
        public static double ToPrecisionAndHalf(this double d, int sigFigures)
        {
            var newVal = ToPrecision(d, sigFigures, out int roundingPosition);
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
        public static string RemoveWhitespace(this string input)
        {
            return new string(input.Where(c => !Char.IsWhiteSpace(c)).ToArray());
        }
        public static string RemoveNonAlphaNumeric(this string input)
        {
            return new string(input.Where(c => Char.IsLetterOrDigit(c)).ToArray());
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

            double roundedValue = ToPrecision(d, sigFigures, out int roundingPosition);

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
        public static string AsCentileString(this NumericRange rng, bool asHtml=false,string centileText = "centile")
        {
            double min = Math.Round(rng.LowerBound);
            double max = Math.Round(rng.UpperBound);
            if (min == max || max<=1) { return StatisticalDataExtensions.CentileToString(rng.LowerBound, asHtml,' ' + centileText); }
            if (max >= 99) { return StatisticalDataExtensions.CentileToString(rng.UpperBound, asHtml, ' ' + centileText); }
            string minStr = (min == 0) ? "<1" : min.ToString("0");
            string maxStr = (max == 100) ? ">99" : max.ToString("0");
            return centileText + ' ' + minStr + '-' + maxStr;
        }
        /// <summary>
        /// faster than select().toarray();
        /// </summary>
        /// <typeparam name="TSource"></typeparam>
        /// <typeparam name="TResult"></typeparam>
        /// <param name="source"></param>
        /// <param name="predicate"></param>
        /// <returns></returns>
        public static TResult[] Map<TSource,TResult>(this TSource[] source, Func<TSource,TResult> predicate)
        {
            TResult[] result = new TResult[source.Length];
            for (int i=0;i<source.Length;i++)
            {
                result[i] = predicate(source[i]);
            }
            return result;
        }
        /// <summary>
        /// When an object has a property which is an ascending integer between 1...n, will create a new array, placing each item in
        /// position of integer-1. faster than orderby().toarray
        /// </summary>
        /// <typeparam name="TSource"></typeparam>
        /// <typeparam name="TResult"></typeparam>
        /// <param name="source"></param>
        /// <param name="predicate"></param>
        /// <returns></returns>
        public static T[] IndexBy<T>(this T[] source, Func<T,int> predicate)
        {
            T[] result = new T[source.Length];
            for (int i = 0; i < source.Length; i++)
            {
                result[predicate(source[i])-1] = source[i];
            }
            return result;
        }
        ///<summary>Finds the index of the first item matching an expression in an enumerable.</summary>
        ///<param name="items">The enumerable to search.</param>
        ///<param name="predicate">The expression to test the items against.</param>
        ///<returns>The index of the first matching item, or -1 if no items match.</returns>
        public static int FindIndex<T>(this IEnumerable<T> items, Func<T, bool> predicate)
        {
            int index = 0;
            foreach (var item in items)
            {
                if (predicate(item)) return index;
                index++;
            }
            return -1;
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

        //http://stackoverflow.com/questions/12261344/fastest-search-method-in-stringbuilder
        public static bool Contains(this StringBuilder haystack, string needle)
        {
            return haystack.IndexOf(needle) != -1;
        }
        public static int IndexOf(this StringBuilder haystack, string needle)
        {
            if (haystack == null || needle == null)
                throw new ArgumentNullException();
            if (needle.Length == 0)
                return 0;//empty strings are everywhere!
            if (needle.Length == 1)//can't beat just spinning through for it
            {
                char c = needle[0];
                for (int idx = 0; idx != haystack.Length; ++idx)
                    if (haystack[idx] == c)
                        return idx;
                return -1;
            }
            int m = 0;
            int i = 0;
            int[] T = KMPTable(needle);
            while (m + i < haystack.Length)
            {
                if (needle[i] == haystack[m + i])
                {
                    if (i == needle.Length - 1)
                        return m == needle.Length ? -1 : m;//match -1 = failure to find conventional in .NET
                    ++i;
                }
                else
                {
                    m = m + i - T[i];
                    i = T[i] > -1 ? T[i] : 0;
                }
            }
            return -1;
        }
        private static int[] KMPTable(string sought)
        {
            int[] table = new int[sought.Length];
            int pos = 2;
            int cnd = 0;
            table[0] = -1;
            table[1] = 0;
            while (pos < table.Length)
                if (sought[pos - 1] == sought[cnd])
                    table[pos++] = ++cnd;
                else if (cnd > 0)
                    cnd = table[cnd];
                else
                    table[pos++] = 0;
            return table;
        }
    }
}