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
    
    public partial class DrugReferenceSource : IDateModified
    {
        [Key]
        public int DrugReferenceId { get; set; }
        public string ReferenceDescription { get; set; }
        public string Abbrev { get; set; }
        public string Hyperlink { get; set; }
        public DateTime DateModified { get; set; }

        public virtual ICollection<InfusionDrug> InfusionDrugs { get; set; }
    }
}
