//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace PICUdrugs.DAL
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    public partial class VariableTimeDilution : IInfusionDilution
    {
        [Key]
        public int InfusionDilutionId { get; set; }
        [ForeignKey("InfusionDrug")]
        public int InfusionDrugId { get; set; }
        [ForeignKey("DilutionMethod")]
        public int DilutionMethodId { get; set; }
        [ForeignKey("SiPrefix")]
        public int SiPrefixVal { get; set; }
        public Nullable<int> Volume { get; set; }
        public double WeightMin { get; set; }
        public double WeightMax { get; set; }
        public int AgeMinMonths { get; set; }
        public int AgeMaxMonths { get; set; }
        public double RateMin { get; set; }
        public double RateMax { get; set; }
        public bool IsPerMin { get; set; }
        public string ReferencePage { get; set; }
        [NotMapped]
        public string InfusionUnits { get; set; }
    
        public virtual DilutionMethod DilutionMethod { get; set; }
        public virtual InfusionDrug InfusionDrug { get; set; }
        public virtual SiPrefix SiPrefix { get; set; }
        public virtual ICollection<VariableTimeConcentration> VariableTimeConcentrations { get; set; }
    }
}