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
        public DropDownItemsRepository()
        {
            if (_drugRoutes == null)
            {
                using (DrugSqlContext db = new DrugSqlContext())
                {
                    _drugRoutes = db.DrugRoutes.ToList();
                    _infusionDiluents = db.InfusionDiluents.ToList();
                }
                _siUnits = Enum.GetValues(typeof(SiUnit)).Cast<SiUnit>();
            }
        }
        static IEnumerable<DrugRoute> _drugRoutes;
        static IEnumerable<InfusionDiluent> _infusionDiluents;
        static IEnumerable<SiUnit> _siUnits;
        public IEnumerable<DrugRoute> GetDrugRoutes()
        {
            return _drugRoutes;
        }
        public IEnumerable<InfusionDiluent> GetInfusionDiluents()
        {
            return _infusionDiluents;
        }
        public IEnumerable<SiUnit> GetSiUnits()
        {
            return _siUnits;
        }
    }
}