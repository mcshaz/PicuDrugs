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

    public partial class InfusionDrug : IDateModified
    {
        [Key]
        public int InfusionDrugId { get; set; }
        public string Fullname { get; set; }
        public string Abbrev { get; set; }
        [ForeignKey("SiPrefix")]
        public int SiPrefixVal { get; set; }
        [ForeignKey("SiUnit")]
        public int SiUnitId { get; set; }
        [ForeignKey("InfusionDiluent")]
        public int InfusionDiluentId { get; set; }
        public string Note { get; set; }
        [ForeignKey("DrugReferenceSource")]
        public int? DrugReferenceId { get; set; }
        [ForeignKey("DrugRoute")]
        public int? RouteId { get; set; }
        public bool IsTitratable { get; set; }
        [ForeignKey("SpecificWard")]
        public int? SpecificWardId { get; set; }
        public DateTime DateModified { get; set; }

        public virtual Ward SpecificWard { get; set; }
        public virtual DrugReferenceSource DrugReferenceSource { get; set; }
        public virtual DrugRoute DrugRoute { get; set; }
        public virtual ICollection<FixedTimeDilution> FixedTimeDilutions { get; set; }
        public virtual InfusionDiluent InfusionDiluent { get; set; }
        public virtual SiPrefix SiPrefix { get; set; }
        public virtual SiUnit SiUnit { get; set; }

        public virtual ICollection<DrugAmpuleConcentration> DrugAmpuleConcentrations { get; set; }
        public virtual ICollection<InfusionSortOrdering> InfusionSortOrderings { get; set; }
        public virtual ICollection<VariableTimeDilution> VariableTimeDilutions { get; set; }
    }
}
