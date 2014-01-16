//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace PICUdrugs.Code.DataAccessLayer
{
    using System;
    using System.Collections.Generic;
    
    public partial class VariableTimeDilution
    {
        public VariableTimeDilution()
        {
            this.VariableTimeConcentrations = new HashSet<VariableTimeConcentration>();
        }
    
        public int InfusionDilutionId { get; set; }
        public int InfusionDrugId { get; set; }
        public int DilutionMethodId { get; set; }
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
    
        public virtual DilutionMethod DilutionMethod { get; set; }
        public virtual DilutionMethod DilutionMethod1 { get; set; }
        public virtual InfusionDrug InfusionDrug { get; set; }
        public virtual SiPrefix SiPrefix { get; set; }
        public virtual ICollection<VariableTimeConcentration> VariableTimeConcentrations { get; set; }
    }
}