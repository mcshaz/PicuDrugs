using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PICUdrugs.DAL
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;

    public partial class DataContext : DbContext
    {
        public DataContext()
            : base("name=DataContext")
        {
        }
        /*
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
        }
        */
        public virtual DbSet<BolusDose> BolusDoses { get; set; }
        public virtual DbSet<BolusDrug> BolusDrugs { get; set; }
        public virtual DbSet<BolusSortOrdering> BolusSortOrdering { get; set; }
        public virtual DbSet<CdcBmiForAge> CdcBmiForAges { get; set; }
        public virtual DbSet<CdcLengthForAge> CdcLengthForAges { get; set; }
        public virtual DbSet<CdcWeightForAge> CdcWeightForAges { get; set; }
        public virtual DbSet<DefibJoule> DefibJoules { get; set; }
        public virtual DbSet<DefibModel> DefibModels { get; set; }
        public virtual DbSet<DilutionMethod> DilutionMethods { get; set; }
        public virtual DbSet<DoseCat> DoseCats { get; set; }
        public virtual DbSet<DrugAmpuleConcentration> DrugAmpuleConcentrations { get; set; }
        public virtual DbSet<DrugReferenceSource> DrugReferenceSources { get; set; }
        public virtual DbSet<DrugRoute> DrugRoutes { get; set; }
        public virtual DbSet<FixedTimeConcentration> FixedTimeConcentrations { get; set; }
        public virtual DbSet<FixedTimeDilution> FixedTimeDilutions { get; set; }
        public virtual DbSet<InfusionDiluent> InfusionDiluents { get; set; }
        public virtual DbSet<InfusionDrug> InfusionDrugs { get; set; }
        public virtual DbSet<InfusionSortOrdering> InfusionSortOrderings { get; set; }
        public virtual DbSet<SiPrefix> SiPrefixes { get; set; }
        public virtual DbSet<SiUnit> SiUnits { get; set; }
        public virtual DbSet<VariableTimeConcentration> VariableTimeConcentrations { get; set; }
        public virtual DbSet<VariableTimeDilution> VariableTimeDilutions { get; set; }
        public virtual DbSet<Ward> Wards { get; set; }
    }
}