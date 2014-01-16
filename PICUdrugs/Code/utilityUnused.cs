public struct infusionProperties
{
    string drugName;
    string drugAbbrev;
    string doseCategory;
    double doseMin;
    double doseMax;
    string doseUnits;
    double ampAmount;
    string ampUnits;
    int syringeVol;
    double conc;
    double rateMin;
    double rateMax;
}
                return relevantDrugs.AsEnumerable()
                                        .Select(s=>new infusionProperties {drugName = s.fullname, drugAbbrev=s.abbrev, s.Category, s.ampPrefix,
                                                s.Measure,s.finalVol,
                                                s.Conc,s.infusionPrefix,s.rateMin, s.rateMax})
                                        .ToList();
                                     ///.cast<standardInfusionViews>().tolist();