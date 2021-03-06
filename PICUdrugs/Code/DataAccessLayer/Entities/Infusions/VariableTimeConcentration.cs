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
    
    public partial class VariableTimeConcentration : IDateModified
    {
        [Key]
        public int InfusionConcentrationId { get; set; }
        [ForeignKey("DoseCat")]
        public Nullable<int> DoseCatId { get; set; }
        [ForeignKey("VariableTimeDilution")]
        public int InfusionDilutionId { get; set; }
        public double Concentration { get; set; }
        public DateTime DateModified { get; set; }

        public virtual DoseCat DoseCat { get; set; }
        public virtual VariableTimeDilution VariableTimeDilution { get; set; }
    }
}
