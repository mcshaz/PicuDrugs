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
    
    public partial class BolusSortOrdering
    {
        public int BolusSortOrderId { get; set; }
        public int WardId { get; set; }
        public Nullable<int> BolusDrugId { get; set; }
        public int SortOrder { get; set; }
        public string SectionHeader { get; set; }
    
        public virtual BolusDrug BolusDrug { get; set; }
        public virtual Ward Ward { get; set; }
    }
}
