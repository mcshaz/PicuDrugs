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
    
    public partial class DrugAmpuleConcentration
    {
        public int AmpuleConcentrationId { get; set; }
        public int InfusionDrugId { get; set; }
        public double Concentration { get; set; }
        public Nullable<double> Volume { get; set; }
    
        public virtual InfusionDrug InfusionDrug { get; set; }
    }
}
