
namespace PICUdrugs.DAL
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    
    public class BolusDrug
    {
        [Key]
        public int BolusDrugId { get; set; }
        [StringLength(256, MinimumLength = 3, ErrorMessage = "Drug name must be between 3 and 256 characters long")]
        [Required(ErrorMessage = "Drug name must be provided")]
        public string DrugName { get; set; }
        [Range(0, 100000, ErrorMessage = "Concentration must be between 0 and 100 000 [units of measure] per mL")]
        public double? Conc_ml { get; set; }
        [StringLength(15, ErrorMessage = "Units must be less than 16 characters long")]
        [Required(ErrorMessage = "units must be provided")]
        public string Units { get; set; }
        [Range(0, 1000000, ErrorMessage = "Maximum adult dose must be between 0 and 1 000 000 [units of measure]")]
        public double AdultMax { get; set; }
        [Range(0, 1000000, ErrorMessage = "Minimum dose must be between 0 and 1 000 000 [units of measure]")]
        public double Min { get; set; }
    
        public virtual ICollection<BolusDose> BolusDoses { get; set; }
        public virtual ICollection<BolusSortOrdering> BolusSortOrderings { get; set; }
    }
}
