namespace PICUdrugs.DAL
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    
    public partial class Ward
    {
        [Key]
        public int WardId { get; set; }
        [StringLength(16, MinimumLength=3)]
        public string Abbrev { get; set; }
        [StringLength(50, MinimumLength = 3)]
        public string Fullname { get; set; }
        [ForeignKey("DefibModel")]
        public int DefibId { get; set; }
        public bool IsLive {get; set;}
        [Display(Name="Padding (cm)"),Range(0,2, ErrorMessage="Padding must be between 0 and 2cm")]
        public double PaddingInCm { get; set; }
        [StringLength(50, MinimumLength = 3)]
        public string BolusChartHeader { get; set; }
    
        public virtual ICollection<BolusSortOrdering> BolusSortOrderings { get; set; }
        public virtual DefibModel DefibModel { get; set; }
        public virtual ICollection<InfusionSortOrdering> InfusionSortOrderings { get; set; }
    }
}
