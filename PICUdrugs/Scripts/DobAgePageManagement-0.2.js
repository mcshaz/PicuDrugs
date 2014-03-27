pic.extend("page", {
    baseAgeIntervals: function () {
        if (this.value != "") {
            var currentAge = new pic.construct.Age(pic.el.yrs.value, pic.el.months.value, pic.el.days.value);
            pic.el.yrs.value = currentAge.years;
            pic.el.months.value = currentAge.months;
            pic.el.days.value = currentAge.days;
        }
    },
    updateAge: function () {
        var DOB, ptAge;
        ValidatorValidate(pic.el.DOBvalidator);
        if (pic.el.DOBvalidator.isvalid) {
            DOB = Date.parseLocale(pic.el.DOB.value);
            if (DOB instanceof Date) {
                ptAge = pic.util.ageFromDOB(DOB);
                pic.el.yrs.value = ptAge.years;
                pic.el.months.value = ptAge.months;
                pic.el.days.value = ptAge.days;
            }
        }
    },
    zeroAgeLeft: function () {
        if (this.value != "") {
            if ((this == pic.el.months || this == pic.el.days) && pic.el.yrs.value == "") pic.el.yrs.value = 0;
            if (this == pic.el.days && pic.el.months.value == "") pic.el.months.value = 0;
        }
    },
    emptyDOB: function () {
        pic.el.DOB.value = "";
    }
});
pic.extend('vals', {
    validFullAge: function () {
        return !(pic.el.months.value.trim() === "" && (parseInt(pic.el.yrs.value) < 1 || pic.el.DOB.value.trim() === ""));
    },
    validAge: function () {
        return !(pic.el.yrs.value.trim() === "" && pic.el.DOB.value.trim() === "");
    },
    dobOrFullAgeValClient: function (source, args) {
        args.IsValid = pic.vals.validFullAge();
    },
    dobOrAgeValClient: function (source, args) {
        args.IsValid = pic.vals.validAge();
    },
    monthsValClient: function (source, args) {
        args.IsValid = (pic.el.yrs.value.trim() !== "0" || pic.el.months.value.trim() !== "");
    }
});