$(document).ready(function () {
    $('.stdItem:even').removeClass('stdItem').addClass('alternateItem');
    $('tr:even').children('.doseFields').removeClass('doseFields').addClass('altDose');
    tinymce.init({
        selector: "span.rich input",
        // consider in future charmap spellchecker
        plugins: [
                "textcolor"
        ],
        toolbar1: "bold italic underline forecolor superscript | fontselect fontsizeselect | alignleft aligncenter alignright | outdent indent| styleselect removeformat",
        //doctype:"<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Strict//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd'>",
        menubar: false,
        forced_root_block: false,
        width: "100%",
        content_css: "/Content/ChartHeader.css",
        style_formats: [
            { title: 'Concentration', inline: 'span', classes: "concentration" },
            { title: 'Route', inline: 'span', classes: "route" },
            { title: 'Note', inline: 'span', classes: "note" }
        ]
    });
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