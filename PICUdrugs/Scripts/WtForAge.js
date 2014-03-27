(function () { //a bit of a hack not to break the API
    var wtData = uKWeightData();
    function argsToDays(args) {
        if (args.dob) {
            return daysOfAge(args.dob);
        }
        return daysOfAge(args.years, args.months, args.days);
    };
    window.statData = { 
        zWtForAge: function (args/* {ageInDays, weight,isMale} */) {
            var ageDays = argsToDays(args);
            if (typeof (args.isMale) === 'undefined') {
                return {
                    male: wtData.zForAge(args.weight, ageDays,true,args.gestation),
                    female: wtData.zForAge(args.weight, ageDays,false,args.gestation)
                }
            }
            return wtData.zForAge(args.weight, ageDays, args.isMale, args.gestation);
        },
        medianWtForAge: function (args/*{years, months, days} OR {DOB} & {gestation}*/) {
            var ageDays = argsToDays(args);
            return { male: wtData.lMSForAge(ageDays, true, args.gestation).m, female: wtData.lMSForAge(ageDays, false, args.gestation).m }
        }
    }
})();