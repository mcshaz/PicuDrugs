pic.extend("vals", {
    lenthOrWtValClient: function (source, args) {
        args.isValid = (pic.el.ptLength.value.trim() !="" || pic.el.weight.value.trim() != "");
    }
});

window.onload = function () {
    $addHandler(pic.el.yrs, 'change', pic.page.emptyDOB);
    $addHandler(pic.el.months, 'change', pic.page.emptyDOB);
    $addHandler(pic.el.days, 'change', pic.page.emptyDOB);
    $addHandler(pic.el.DOB, 'blur', pic.page.updateAge);
    $addHandler(pic.el.months, 'blur', pic.page.zeroAgeLeft);
    $addHandler(pic.el.days, 'blur', pic.page.zeroAgeLeft);
    $addHandler(pic.el.months, 'blur', pic.page.baseAgeIntervals);
    $addHandler(pic.el.days, 'blur', pic.page.baseAgeIntervals);
}