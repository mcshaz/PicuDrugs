﻿using System;
using System.Collections.Generic;
using System.Linq;
using PICUdrugs.Utils;
using System.Text.RegularExpressions;
using System.ComponentModel.DataAnnotations;
using PICUdrugs.BLL;
namespace PICUdrugs.DAL
{
    public enum SelectedChart {bolusOnly,bolusPlusInfusion,singleInfusion,noneSelected}
    public class PatientDrugChartDetails
    {
        public ChildAge Age { get; set; }
        public readonly string Date = DateTime.Today.ToLongDateString();
        public string Name { get; set; }
        public string NHI { get; set; }
        [Range(FieldConst.minWeight, FieldConst.maxWeight)]
        public double ActualWeight { get; set; }
        public double WorkingWeight { get { return (ActualWeight > FieldConst.maxWeight ? FieldConst.maxWeight : ActualWeight); } }
        public string Centile { get; set; }
        public int WardId { get; set; }
        public bool? IsMale { get; set; }
        public bool WeightEstimate { get; set; }
    }
    public class LinkReference
    {
        public string Name { get; set; }
        public string HyperLink { get; set; }
    }
    public class SingleDrugModel
    {
        public string DrugName { get; set; }
        public LinkReference Reference { get; set; }
        public string Route { get; set; }
        public string Note { get; set; }
        public string DilutionFluid { get; set; }
        public string AmpuleConcentration { get; set; }
        public IEnumerable<FixedDurationInfusion> InfusionData { get; set; }
    }
    public class PatientSpecificDrugData : IDisposable
    {
        private readonly PatientDrugChartDetails _ptDetail;
        private readonly DataContext _db;
        public PatientSpecificDrugData(DataContext picuDrugEntities, PatientDrugChartDetails patientDetails)
        {
            _ptDetail = patientDetails;
            _db = picuDrugEntities;
        }
        public PatientSpecificDrugData(PatientDrugChartDetails patientDetails) :this(new DataContext(), patientDetails)
        {
        }
        public Ward GetWard()
        {
            return (from w in _db.Wards
                    where w.WardId==_ptDetail.WardId
                    select w).FirstOrDefault();
        }
        public IEnumerable<StandardInfusion> StandardInfusions()
        {
            return new pVariableTimeInfusions(_db).GetRowData(_ptDetail.WardId, _ptDetail.WorkingWeight, _ptDetail.Age.TotalMonths)
                .Select(dil => new StandardInfusion(
                    weight: _ptDetail.WorkingWeight,
                    Concentration: dil.Concentration,
                    Volume: dil.Volume,
                    InfusionPrefix: dil.DilutionPrefix,
                    ampPrefix: dil.AmpulePrefix,
                    unitMeasure: dil.Measure,
                    IsPerKg: dil.IsPerKg,
                    IsPerMin: dil.IsPerMin,
                    IsVaryConcentration: dil.IsVaryConcentration,
                    IsVaryVolume: dil.IsVaryVolume,
                    neat: dil.IsNeat,
                    minDoseRate: dil.RateMin,
                    maxDoseRate: dil.RateMax)
                    {
                        DrugName = dil.Fullname,
                        SubHeader = Formulas.FirstNonEmptyString(dil.Category, dil.Abbrev),
                        Note = dil.Note,
                        Href = (dil.HrefBase == null || dil.HrefLink == null) ? null : (dil.HrefBase.ReferenceBase(true) + dil.HrefLink)
                    });
        }
        public IEnumerable<BolusDrugListItem> EmergencyBoluses()
        {
            var returnList = GetBolusSortOrdering(_ptDetail.WardId, _ptDetail.WorkingWeight);
            var defibSettings = (from j in _db.DefibJoules
                     where j.DefibModel.Wards.Any(w => w.WardId == _ptDetail.WardId)
                     select j.Joules).ToArray();
            /*(from w in _db.Wards.Include("DefibModel").Include("DefibModel.DefibJoules")
                where w.WardId == _ptDetail.WardId
                select w.DefibModel).FirstOrDefault();
             var defibSettings = b.DefibJoules.Select(j => j.Joules).ToArray();*/

            foreach (var eb in returnList)
            {
                if (eb.IsHeader) { continue;  }
                if (eb.DoseUnits == "J")
                {
                    eb.SetWeight(_ptDetail.WorkingWeight, defibSettings);
                }
                else { eb.SetWeight(_ptDetail.WorkingWeight); }
            }
            return returnList;
        }
        public Ett ETT()
        {
            if (_ptDetail.Age == null) { return null; }
            return PatientCalculations.ETT(_ptDetail.Age.TotalMonths, _ptDetail.WorkingWeight);
        }
        private FixedTimeDilution GetDilution(int drugId)
        {
            return (from d in _db.FixedTimeDilutions
                        .Include("DilutionMethod")
                        .Include("InfusionDrug")
                        .Include("InfusionDrug.SiUnit")
                        .Include("InfusionDrug.DrugReferenceSource")
                        .Include("InfusionDrug.InfusionDiluent")
                        .Include("InfusionDrug.DrugRoute")
                     where d.InfusionDrugId == drugId
                         && d.AgeMinMonths <= _ptDetail.Age.TotalMonths && d.AgeMaxMonths >= _ptDetail.Age.TotalMonths
                         && d.WeightMin < _ptDetail.WorkingWeight && d.WeightMax >= _ptDetail.WorkingWeight
                     select d).First();
        }
        public IEnumerable<FixedDurationInfusion> FixedDurationInfusion(int drugId, double ampConc = 0)
        {
            return FixedDurationInfusion(drugId, GetDilution(drugId) ,ampConc);
        }
        public IEnumerable<FixedDurationInfusion> FixedDurationInfusion(int drugId,FixedTimeDilution Dilution ,double ampConc = 0)
        {
            var concList = (from c in _db.FixedTimeConcentrations
                            where c.InfusionDilutionId==Dilution.InfusionDilutionId
                            orderby c.StopMinutes
                            select c).ToList();
            var returnList = new List<FixedDurationInfusion>(concList.Count);
            int priorStopTime = 0;
            bool hasConc = ampConc != 0;
            foreach (FixedTimeConcentration timedRow in concList)
            {
                FixedDurationInfusion calculatedRow = new FixedDurationInfusion(
                    weight: _ptDetail.WorkingWeight,
                    concentration: timedRow.Concentration,
                    volume: timedRow.Volume,
                    infusionPrefix: Dilution.SiPrefixVal,
                    ampPrefix: Dilution.InfusionDrug.SiPrefixVal,
                    unitMeasure: Dilution.InfusionDrug.SiUnit.Measure,
                    isPerKg: Dilution.DilutionMethod.IsPerKg,
                    isPerMin: Dilution.IsPerMin,
                    isVaryConcentration: Dilution.DilutionMethod.IsVaryConcentration,
                    isVaryVolume: Dilution.DilutionMethod.IsVaryVolume,
                    isNeat: Dilution.DilutionMethod.IsNeat,
                    doseRate: timedRow.Rate,
                    minsDuration: timedRow.StopMinutes - priorStopTime,
                    ampConcentration:ampConc);
                if (hasConc) calculatedRow.AmpuleConcentration = ampConc;
                calculatedRow.StartTime = priorStopTime;
                priorStopTime = timedRow.StopMinutes;
                calculatedRow.DiluentFluid = Dilution.InfusionDrug.InfusionDiluent.DiluentType;
                returnList.Add(calculatedRow);
            }
            return returnList;
        }
        public SingleDrugModel FixedInfusion(UserSelectedInfusion.SelectedInfusion drug)
        {
            return FixedInfusion(drug.DrugId, drug.AmpuleConc);
        }
        public SingleDrugModel FixedInfusion(int DrugId, Double AmpConcentration)
        {
            var Dilution = GetDilution(DrugId);
            var returnVal = new SingleDrugModel
            {
                InfusionData = FixedDurationInfusion(DrugId, Dilution, AmpConcentration),
                DrugName = Dilution.InfusionDrug.Fullname,
                DilutionFluid = Dilution.InfusionDrug.InfusionDiluent.DiluentType,
                Route =  Dilution.InfusionDrug.DrugRoute.Description,
                Note = Dilution.InfusionDrug.Note,
                AmpuleConcentration = String.Format("{0} {1}/mL",AmpConcentration,Dilution.InfusionDrug.DrugUnits())
            };
            if (Dilution.InfusionDrug.DrugReferenceSource != null && Dilution.ReferencePage!=null)
            {
                //need to add reference page to reference description if it is a page number, and to Hyperlink if it is .pdf | .doc | .htm
                Regex browserCompatible = new Regex(FieldConst.fileTypeRegEx);
                if (browserCompatible.IsMatch(Dilution.ReferencePage))
                {
                    returnVal.Reference = new LinkReference
                    {
                        Name = Dilution.InfusionDrug.DrugReferenceSource.ReferenceDescription,
                        HyperLink = Dilution.InfusionDrug.DrugReferenceSource.ReferenceBase(true) + Dilution.ReferencePage
                    };
                }
                else
                {
                    returnVal.Reference = new LinkReference { Name = Dilution.InfusionDrug.DrugReferenceSource.ReferenceDescription + Dilution.ReferencePage };
                }
            }
            return returnVal;
        }
        public IEnumerable<BolusDrugListItem> GetBolusSortOrdering(int WardId, double weight)
        {
            var records = (from s in _db.BolusSortOrdering
                           where s.WardId == WardId
                           select new { Header = s.SectionHeader, Drug = s.BolusDrug, Dose = s.BolusDrug.BolusDoses.FirstOrDefault(d => d.WeightMin < weight && d.WeightMax >= weight) }).ToList();
            var returnVal = new List<BolusDrugListItem>(records.Count);
            foreach (var r in records)
            {
                if (r.Dose != null)
                {
                    returnVal.Add(new BolusDrugListItem
                    {
                        IsHeader = false,
                        RowTitle = r.Drug.DrugName,
                        Route = r.Drug.Route,
                        AmpuleConcentration = r.Drug.AmpuleConcentration,
                        DosePerKg = new NumericRange
                        {
                            LowerBound = r.Dose.MinDosePerKg,
                            UpperBound = r.Dose.MaxDosePerKg,
                        },
                        AdultMax = r.Drug.AdultMax,
                        DoseUnits = r.Drug.Units,
                        Conc_ml = r.Drug.Conc_ml
                    });
                }
                else
                {
                    returnVal.Add(new BolusDrugListItem
                    {
                        IsHeader = true,
                        RowTitle = r.Header,
                    });
                }
            }
            return returnVal;
        }
        //disposing
        private bool disposedValue = false;
        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    _db.Dispose();
                }
            }
            this.disposedValue = true;
        }
        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
    }
}