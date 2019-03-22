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
    
    public partial class FixedTimeConcentration : IDateModified
    {
        [Key]
        public int InfusionConcentrationId { get; set; }
        [ForeignKey("FixedTimeDilution")]
        public int InfusionDilutionId { get; set; }
        public double Concentration { get; set; }
        public Nullable<int> Volume { get; set; }
        public int StopMinutes { get; set; }
        public double Rate { get; set; }
        public DateTime DateModified { get; set; }

        public virtual FixedTimeDilution FixedTimeDilution { get; set; }
    }
}
