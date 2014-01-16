$(document).ready(function () {
    $('.stdItem:even').removeClass('stdItem').addClass('alternateItem');
    $('tr:even').children('.doseFields').removeClass('doseFields').addClass('altDose');
});
var addNumber = function (num, ctrl) {
    var ctrlVals;
    if (typeof (ctrl.tagName) === 'undefined') {
        ctrl = document.getElementById(ctrl);
    }
    if (typeof (num) !== 'string') {
        num = num.toString()
    }
    ctrlVals = ctrl.value;
    ctrlVals = (ctrlVals === "") ? [] : ctrl.value.split(",");
    if (ctrlVals.indexOf(num) === -1) {
        ctrlVals.push(num);
        ctrl.value = ctrlVals.join(",");
    }
}
var deleteNumber = function (num, ctrl) {
    var ctrlVals, indx;
    if (typeof (ctrl.tagName) === 'undefined') {
        ctrl = document.getElementById(ctrl);
    }
    if (typeof (num) !== 'string') {
        num = num.toString()
    }
    ctrlVals = ctrl.value;
    ctrlVals = (ctrlVals === "") ? [] : ctrl.value.split(",");
    indx = ctrlVals.indexOf(num);
    if (indx > -1) {
        ctrlVals.splice(indx, 1);
        ctrl.value = ctrlVals.join(",");
    }
}