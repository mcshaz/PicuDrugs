using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text.RegularExpressions;
using PICUdrugs.DAL;
using System.ComponentModel.DataAnnotations;
using DBToJSON.SqlEntities;
using DBToJSON.SqlEntities.Infusions;

namespace PICUdrugs.BLL
{
    public class ReferenceModel
    {

        [RegularExpression(FieldConst.urlOrPathRegEx,
            ErrorMessage = @"Hyperlink must be either a valid web address or a network file link (ahsl#). drive letters are not allowed.")]
        [StringLength(100, ErrorMessage = "Hyperlink must be <100 characters long")]
        public string Hyperlink { get; set; }
        [StringLength(15, MinimumLength = 3, ErrorMessage = "Reference abbreviation must be between 3 and 15 characters long")]
        [Required(ErrorMessage = "Reference abbreviation must be provided")]
        public string Abbrev { get; set; }
        [StringLength(50, MinimumLength = 5, ErrorMessage = "Reference description must be between 5 and 50 characters long")]
        [Required(ErrorMessage = "Reference description must be provided")]
        public string ReferenceDescription { get; set; }
        public int DrugReferenceId { get; set; }
    }
    public enum ReferenceType { Http, File, Text }
    public static class ReferenceExtensions
    {
        public static string EncodeHyperLink(string userInput)
        {
            if (string.IsNullOrWhiteSpace(userInput))
            {
                return null;
            }
            var returnVar = userInput.Trim().Replace(" ", "%20");
            if (!(returnVar.Length >= 5 && returnVar.Substring(0, 5) == "http:"))
            {
                var fileRegEx = new Regex(FieldConst.inputFileRegEx);
                var components = fileRegEx.Split(returnVar);
                returnVar = @"file://" + components[components.Length-2].Replace('\\','/');
            }
            if (returnVar[returnVar.Length - 1] == '/') { return returnVar; }
            var fileTypeRegEx = new Regex(FieldConst.fileTypeRegEx);
            if (fileTypeRegEx.IsMatch(returnVar)) { return returnVar; }
            return returnVar + '/';
        }
        public static DrugReferenceSource MapToRecord(this ReferenceModel model)
        {
            return new DrugReferenceSource
            {
                Abbrev = model.Abbrev.TrimEnd(),
                DrugReferenceId = model.DrugReferenceId,
                Hyperlink = EncodeHyperLink(model.Hyperlink),
                ReferenceDescription = model.ReferenceDescription.TrimEnd()
            };
        }
        public static ReferenceModel MapToModel(this DrugReferenceSource src)
        {
            return new ReferenceModel
            {
                Abbrev = src.Abbrev,
                DrugReferenceId = src.DrugReferenceId,
                Hyperlink = src.Hyperlink,
                ReferenceDescription = src.ReferenceDescription
            };
        }
        public static string ReferenceBase(this DrugReferenceSource src, bool asLocalhost=false)
        {
            //string src.ReferencePage
            if (string.IsNullOrEmpty(src.Hyperlink)) //assume no hyperliink = reference to text
            {
                return src.ReferenceDescription + " ";
            }
            return ReferenceBase(src.Hyperlink, asLocalhost);
        }
        public static string ReferenceBase(this string href, bool asLocalhost=false)
        {
            if (asLocalhost && href.Length >= 5 && href.Substring(0, 5) == "file:") { href = "file:///" + href.Substring(5); }
            int slashPos = href.LastIndexOf('/');
            if (slashPos == -1)
            {
                return href + '/';
            }
            return href.Substring(0, slashPos + 1);
        }
        public static ReferenceType GetProtocol(string hyperlink)
        {
            if (hyperlink.Length < 5) { return ReferenceType.Text; }
            switch (hyperlink.Substring(0, 5))
            {
                case "http:":
                    return ReferenceType.Http;
                case "file:":
                    return ReferenceType.File;
                default:
                    return ReferenceType.Text; 
            }
            
        }
        public static ReferenceType Location(this DrugReferenceSource src)
        {
            return GetProtocol(src.Hyperlink);
        }
        public static string NTFSpath(this DrugReferenceSource src)
        {
            if (GetProtocol(src.Hyperlink) != ReferenceType.File) { return null; }
            //file:// = 7 letters
            return @"\\" + src.Hyperlink.Substring(7).Replace('/', '\\').Replace("%20"," "); 
        }
    }
}