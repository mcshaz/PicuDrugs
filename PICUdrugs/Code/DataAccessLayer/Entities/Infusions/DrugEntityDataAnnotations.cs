using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
//using System.Web.DynamicData;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using PICUdrugs.Utils;
//using Foolproof;

namespace PICUdrugs.DAL
{
    public static class FieldConst
    {
        public const double minVolume = 1;
        public const double maxVolume = 1000;
        public const string volErr = "Dilution Volume must be between 1 and 1000 mL";
        public const double maxWeight = 100;
        public const double minWeight = 0;
        public const string wtErr = "Weight must be between 0 and 100 Kg";
        public const double maxAge = 1200;
        public const double minAge = 0;
        public const string ageErr = "Age must be between 0 and 100yo (1200 months)";
        public const double maxRate = 10001;
        public const double minRate = 0;
        public const string rateErr = "Rate must be between 0 and 10 000";
        public const double maxStop = 10080;
        public const double minStop = 1;
        public const string stopErr = "Time to stop Infusion must be 1 and 7 days (10 080 minutes)";
        public const string fileTypeRegEx = @"(\.pdf|\.html?|\.docx?)[\w#=?]*$";
        public const string remoteHostsRegEx = @"ahsl\d\d?";
        //define regular expressions for input - acceptable input = '\\'|('file://' + '\\' | +/-localhost + '///' then ahsl? 
        public const string inputFileRegEx = @"^(file:[/\\]+(localhost)?)?[/\\]*("+remoteHostsRegEx+@"[\w \./\\%+]+)$";
        public const string filePathRegEx = @"^\\{2}"+remoteHostsRegEx+@"[\w \\\.#=+]+?$"; //currently allowing space at the end & trimming this off in BLL - technically could potentially have different regex server & client
        public const string urlRegEx = @"^(https?)://([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?$";
        public const string hyperlinkRegEx = "(" + urlRegEx + ")|(" + filePathRegEx + ")";
        public const string urlOrPathRegEx = "(" + urlRegEx + ")|(" + inputFileRegEx + ")";
        public const double maxJoules = 360;
    }
    public class InfusionDilutionMetaData
    {
        [Range(FieldConst.minWeight, FieldConst.maxWeight, ErrorMessage = FieldConst.wtErr)]
        public int WeightMin { get; set; }
        [Range(FieldConst.minWeight, FieldConst.maxWeight, ErrorMessage = FieldConst.wtErr)]
        //[GreaterThan("WeightMin")]
        public int WeightMax { get; set; }
        [Range(FieldConst.minAge, FieldConst.maxAge, ErrorMessage = FieldConst.ageErr)]
        public int AgeMinMonths { get; set; }
        [Range(FieldConst.minAge, FieldConst.maxAge, ErrorMessage = FieldConst.ageErr)]
        //[GreaterThan("AgeMinMonths")]
        public int AgeMaxMonths { get; set; }
        [Required(ErrorMessage = "Must be either per minute or per hour")]
        public Boolean IsPerMin { get; set; }
    }

    public class FixedTimeDilutionMetaData : InfusionDilutionMetaData
    {
        [StringLength(100)]
        public string ReferencePage { get; set; }
    }
    public class InfusionConcentrationMetaData
    {
        [Range(0.001, 1001, ErrorMessage = "Concentration must be between 0.001 and 1000")]
        public double Concentration { get; set; }
    }
    [MetadataType(typeof(FixedTimeConcentrationMetaData))]
    public partial class FixedTimeConcentration: IInfusionConcentration
    {
    }
    public class FixedTimeConcentrationMetaData : InfusionConcentrationMetaData
    {
        [Range(FieldConst.minVolume, FieldConst.maxVolume, ErrorMessage = FieldConst.volErr)]
        public int Volume { get; set; }
        [Range(FieldConst.minStop, FieldConst.maxStop, ErrorMessage = FieldConst.stopErr)]
        public int StopMinutes { get; set; }
        [Range(FieldConst.minRate, FieldConst.maxRate, ErrorMessage = FieldConst.rateErr)]
        public double Rate { get; set; }
    }
    [MetadataType(typeof(InfusionConcentrationMetaData))]
    public partial class VariableTimeConcentration : IInfusionConcentration
    {
    }
    [MetadataType(typeof(InfusionDrugMetaData))]
    public partial class InfusionDrug
    {
    }
    public class InfusionDrugMetaData
    {
        [StringLength(50,MinimumLength=3,ErrorMessage="Drug name must be between 3 and 50 characters long")]
        [Required(ErrorMessage = "Drug name must be provided")]
        public string Fullname { get; set; }
        [StringLength(24, MinimumLength = 3, ErrorMessage = "Abbreviation must be between 3 and 24 characters long")]
        public string Abbrev { get; set; }
        [Required(ErrorMessage="Must be either IsTitratable or loading type of Infusion")]
        public Boolean IsTitratable {get; set;}
    }
    [MetadataType(typeof(DrugReferenceMetaData))]
    public partial class DrugReferenceSource
    {
    }
    public class DrugReferenceMetaData
    {
        [StringLength(15,MinimumLength=3, ErrorMessage = "Reference abbreviation must be between 3 and 15 characters long")]
        [Required(ErrorMessage = "Reference abbreviation must be provided")]
        public string Abbrev { get; set; }
        [StringLength(50, MinimumLength = 5, ErrorMessage = "Reference description must be between 5 and 50 characters long")]
        [Required(ErrorMessage = "Reference description must be provided")]
        public string ReferenceDescription { get; set; }
//        [RegularExpression(FieldConst.hyperlinkRegEx,
//            ErrorMessage = @"Hyperlink must be either a valid web address or a network file link which is valid in a web browser (beginning with file:\\ahsl?\). drive letters are not allowed.")]
        [StringLength(100, ErrorMessage = "Hyperlink must be <100 characters long")]
        public string Hyperlink { get; set; }
    }
    [MetadataType(typeof(DrugAmpuleConcMetaData))]
    public partial class DrugAmpuleConcentration
    {
    }
    public class DrugAmpuleConcMetaData
    {
        [Range(1e-3, 250, ErrorMessage = "Drug ampule Volume must be between 0.001 and 1000 mL")]
        public double Volume { get; set; }
        [Range(1e-3, 10000, ErrorMessage = "Drug ampule Concentration must be between 0.001 and 10 000 [drug units]/mL")]
        public double Concentration { get; set; }
    }
    [MetadataType(typeof(BolusDoseMetaData))]
    public partial class BolusDose
    {
    }
    public class BolusDoseMetaData
    {
        [Range(FieldConst.minWeight, FieldConst.maxWeight, ErrorMessage = FieldConst.wtErr)]
        public int WeightMin { get; set; }
        [Range(FieldConst.minWeight, FieldConst.maxWeight, ErrorMessage = FieldConst.wtErr)]
        //[GreaterThan("WeightMin")]
        public int WeightMax { get; set; }
        [Range(0, 100000, ErrorMessage = "Dose per kg must be between 0 and 100 000 [units of measure]" )]
        public int MinDosePerKg { get; set; }
        [Range(0, 100000, ErrorMessage = "Dose per kg must be between 0 and 100 000 [units of measure]")]
        public int MaxDosePerKg { get; set; }
    }
    [MetadataType(typeof(DefibModelMetaData))]
    public partial class DefibModel
    {
    }
    public class DefibModelMetaData
    {
        [StringLength(50, MinimumLength = 2)]
        [Required]
        [Display(Name = "Model Name")]
        public string Name { get; set; }
    }
    [MetadataType(typeof(DefibJouleMetaData))]
    public partial class DefibJoule
    {
    }
    public class DefibJouleMetaData
    {
        [Required]
        [Range(0, FieldConst.maxJoules)]
        public string Joules { get; set; }
    }
}


