using DBToJSON;
using DBToJSON.SqlEntities.Enums;
using DBToJSON.SqlEntities.Infusions;
using PICUdrugs.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PICUdrugs.DAL
{
    public class DropDownItemsRepository
    {
        public class SiUnitDDD
        {
            public SiUnit SiUnitId { get; set; }
            public string Measure { get; set; }
        }
        public DropDownItemsRepository()
        {
            if (_drugRoutes == null)
            {
                using (DrugSqlContext db = new DrugSqlContext())
                {
                    _drugRoutes = db.DrugRoutes.ToList();
                    _infusionDiluents = db.InfusionDiluents.ToList();
                }
                _siUnits = Enum.GetValues(typeof(SiUnit)).Cast<SiUnit>().Select(u => new SiUnitDDD {
                    SiUnitId = u, Measure = u.ToString()
                }).ToList();
            }
        }
        static IEnumerable<DrugRoute> _drugRoutes;
        static IEnumerable<InfusionDiluent> _infusionDiluents;
        static IEnumerable<SiUnitDDD> _siUnits;
        public IEnumerable<DrugRoute> GetDrugRoutes()
        {
            return _drugRoutes;
        }
        public IEnumerable<InfusionDiluent> GetInfusionDiluents()
        {
            return _infusionDiluents;
        }
        public IEnumerable<SiUnitDDD> GetSiUnits()
        {
            return _siUnits;
        }
    }
}