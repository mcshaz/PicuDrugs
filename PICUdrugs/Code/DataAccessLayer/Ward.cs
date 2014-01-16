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
    
    public partial class Ward
    {
        public Ward()
        {
            this.BolusSortOrderings = new HashSet<BolusSortOrdering>();
            this.InfusionSortOrderings = new HashSet<InfusionSortOrdering>();
        }
    
        public int WardId { get; set; }
        public string Abbrev { get; set; }
        public string Fullname { get; set; }
        public int DefibId { get; set; }
    
        public virtual ICollection<BolusSortOrdering> BolusSortOrderings { get; set; }
        public virtual DefibModel DefibModel { get; set; }
        public virtual ICollection<InfusionSortOrdering> InfusionSortOrderings { get; set; }
    }
}
