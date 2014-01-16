pic.extend('vals', {
    centileValClient: function (source, args) {
        if (!pic.el.centileValue.value) {
            return false;
        }
        if (pic.el.centileValue.value <= pic.el.centileValue.hardMin || pic.el.centileValue.value >= pic.el.centileValue.hardMax) {
            args.IsValid = false;
        }
        else if (pic.el.centileValue.value <= pic.el.centileValue.softMin || pic.el.centileValue.value >= pic.el.centileValue.softMax) {
            args.IsValid = confirm(String.format("The weight is {0} for age ({1} standard deviations from the mean) - do you wish to continue?",
                pic.el.centileText.value, (pic.el.Zscore.value).toPrecision(2)));
        } else {
            args.IsValid = true;
        }
    }
});
pic.ajax = {
    getMedianWt: function () {
        var validatesOK;
        if ((pic.el.yrs.value == "" && pic.el.months.value == "" && pic.el.days.value == "")) { pic.page.updateAge(); } //forseeable if postback
        validatesOK = pic.vals.validationManager('age', 'gender').setAnchorName('Error_Summary').validate();
        //use ClientValidation as this will not allow month to be ommited if 0 year old
        if (validatesOK && !(pic.el.yrs.value == "" && pic.el.months.value == "" && pic.el.days.value == "")) {
            if (pic.el.yrs.value == "") pic.el.yrs.value = 0;
            if (pic.el.months.value == "") {
                pic.el.months.value = (pic.el.days.value == "") ? 6 : 0;
            }
            if (pic.el.days.value == "") pic.el.days.value = 0;
            PageMethods.MedianWtAge(parseInt(pic.el.yrs.value), parseInt(pic.el.months.value), parseInt(pic.el.days.value), pic.el.male.checked, pic.ajax.medianWtCallback);
        }
    },
    medianWtCallback: function (result) {
        pic.el.weight.value = Math.round(result);
        pic.el.guessCB.checked = true;
        //guessCB.disabled = true;
        pic.ajax.setWt4ageCallback(0);
    },
    currentDrug: {},
    drugChosen: function (selectedDrug) {
        if (selectedDrug) {
            delete selectedDrug['__type'];
            pic.ajax.currentDrug = selectedDrug;
            pic.util.ajaxWait('on');
            PageMethods.GetAmpuleConcentrations(selectedDrug.drugId, pic.ajax.concListReturned);
        } else { pic.page.cancelDrug(); }
    },
    concListReturned: function (concArray) {
        //possible options for concArray
        //0 - leave currentDrug object with null for concentration
        //1 - set concentration property
        //2+- fill and display table to allow user to choose  
        pic.util.ajaxWait('off');
        switch (concArray.length) {
            case (0):
                pic.page.concChosen(pic.ajax.currentDrug /*, false */);
                break;
            case (1):
                pic.page.concChosen(pic.ajax.currentDrug, concArray[0]);
                break;
            default:
                pic.page.createConcTable(pic.ajax.currentDrug, concArray);
                break;
        }
    },
    setWt4age: function () {
        var valChangeSinceSet, daysOfAge;
        if (pic.el.yrs.value != "" && pic.el.months.value != "" && pic.el.weight.value != "" &&
            (pic.el.months.value > 0 || pic.el.yrs.value > 0 || pic.el.days.value != "") && (pic.el.male.checked || pic.el.female.checked)) {
            //note not checking change of days <0 months as makes v. little difference
            if (valChangeSinceSet = (pic.el.centileValue.set.weight != pic.el.weight.value || pic.el.centileValue.set.years != pic.el.yrs.value ||
                    pic.el.centileValue.set.months != pic.el.months.value || pic.el.centileValue.set.isMale != pic.el.male.checked)) {
                pic.el.centileText.value = "";
                pic.el.centileValue.value = "";
            }
            if (!pic.el.centileValue.value || valChangeSinceSet) {
                daysOfAge = pic.el.days.value == "" ? 0 : parseInt(pic.el.days.value);
                PageMethods.ZWt4Age(parseFloat(pic.el.weight.value), parseInt(pic.el.yrs.value), parseInt(pic.el.months.value),
                    daysOfAge, pic.el.male.checked, pic.ajax.setWt4ageCallback);
            }
        }
    },
    setWt4ageCallback: function (result) {
        var centileFromZ = 100 * pic.math.cumSnorm(result);
        pic.el.centileValue.value = centileFromZ;
        pic.el.Zscore.value = result;
        pic.page.setCentile(pic.el.centileText, centileFromZ);
        pic.el.centileValue.set.weight = parseFloat(pic.el.weight.value);
        pic.el.centileValue.set.years = parseInt(pic.el.yrs.value);
        pic.el.centileValue.set.months = parseInt(pic.el.months.value);
        if (pic.el.days != "") { pic.el.centileValue.set.days = parseInt(pic.el.days.value); }
        pic.el.centileValue.set.isMale = pic.el.male.checked;
    },
    choose_click: function () {
        pic.page.validateOnSubmit.add('age');
        pic.el.wardList.disabled = true;
        if (pic.el.drugDiv.getElementsByTagName('li').length === 0) {
            pic.util.ajaxWait('on');
            PageMethods.GetSingleInfusions(pic.ajax.createDrugList);
        } else {
            pic.el.drugDiv.style.display = "block";
        }
    },
    // return from AJAX drugs = {drugId, drugName, null /*available Concentrations array - to be filled after selection*/}
    createDrugList: function (drugs) {
        var $li,
            i;
        pic.util.ajaxWait('off');
        for (i = 0; i < drugs.length; i++) {
            $li = document.createElement('li');
            $li.innerHTML = '<label><input type="radio" name="drugListItem" />' + drugs[i].drugName + '</label>';
            $addHandler($li.firstChild.firstChild, 'click', pic.util.partial(pic.ajax.drugChosen, drugs[i]));
            pic.el.drugList.appendChild($li);
        }
        pic.el.drugDiv.style.display = "block";
    }
} //end AJAX get & callback methods
pic.extend("page", {
    validateOnSubmit: pic.vals.validationManager('', 'weight', 'centile', 'age').setAnchorName('Error_Summary'),
    bolus_click: function () {
        pic.page.validateOnSubmit.remove('age');
        pic.el.wardList.disabled = false;
        pic.el.drugDiv.style.display = "none";
    },
    list_click: function () {
        pic.page.validateOnSubmit.add('age');
        pic.el.wardList.disabled = false;
        pic.el.drugDiv.style.display = "none";
    },
    cancelDrug: function () {
        pic.el.drugJSON.value = "";
        pic.page.displaySelectedDrug(); //passing without args will return ... notation
        pic.el.drugDiv.style.display = "none";
        pic.el.concDiv.style.display = "none";
        pic.el.list.checked = true;
    },
    createConcTable: function (currentDrug, concArray) {
        var $tr,
            i;
        pic.el.chosenDrug.innerHTML = currentDrug.drugName;
        pic.el.concTable.innerHTML = '<tr><td>select</td><th>Drug</th><th>Volume</th><th>Concentration</th></tr>';
        for (i = 0; i < concArray.length; i++) {
            $tr = document.createElement('tr');
            $tr.innerHTML = String.format('<td><input type="radio" name="concRadio" /></td><td>{0}{1}</td><td>{2}mL</td><td>{3}{1}/mL</td>',
                                            concArray[i].concentration * concArray[i].volume,
                                            concArray[i].units,
                                            concArray[i].volume,
                                            concArray[i].concentration);
            $addHandler($tr.firstChild.firstChild, 'click', pic.util.partial(pic.page.concChosen, currentDrug, concArray[i]));
            pic.el.concTable.appendChild($tr);
        }
        $addHandler(pic.el.cancelConc, 'click', pic.util.partial(pic.page.concChosen, currentDrug, null));
        pic.el.concDiv.style.display = "block";
    },
    concChosen: function (currentDrug, concObj) {
        if (concObj && concObj.Concentration) { currentDrug.ampuleConc = concObj.Concentration; } //note caps - C# object returned to ecma
        pic.el.drugJSON.value = JSON.stringify(currentDrug);
        pic.page.displaySelectedDrug(currentDrug);
        pic.el.drugDiv.style.display = "none";
        pic.el.concDiv.style.display = "none";
    },
    displaySelectedDrug: function (drugInfo) {
        var newText;
        //drugInfo will either be an input element containing a JSON string, or the drugInfo object itself
        if (drugInfo && drugInfo.tagName && drugInfo.tagName.toUpperCase() === 'INPUT') {
            if (pic.el.drugJSON.value === "") {
                drugInfo = null;
            } else {
                drugInfo = JSON.parse(pic.el.drugJSON.value);
            }
        }
        newText = (drugInfo && drugInfo.drugName) ? (drugInfo.drugName + " (click to change)") : "(choose from list...)";
        pic.util.setText(pic.el.drugName, newText);
        pic.el.drugName.style.textDecoration = "underline"
    },
    setCentile: function (el, centile) {
        if (isNaN(centile)) return false;
        var textValue = "";
        if (centile < 1) {
            textValue = "<1st";
        } else if (centile > 99) {
            textValue = ">99th";
        } else {
            textValue = pic.math.intWithSuffix(centile);
        }
        textValue += " centile";
        pic.page.setCentileClass(el, centile);
        el.value = textValue;
    },
    setCentileClass: function (el, centile) {
        if (centile < pic.el.centileValue.softMin || centile > pic.el.centileValue.softMax) {
            el.className = "errorPoint";
        } else {
            el.className = "normalCentile";
        }
    }
});
window.onload = function () {
    var centile = parseFloat(pic.el.centileValue.value);
    if (!isNaN(centile)) {
        pic.page.setCentileClass(pic.el.centileText, centile);
    }
    pic.el('drugDiv', 'drugSelect')
        .el('concDiv')
        .el('drugName', document.getElementById("selectDrug"))
        .el('cancelConc')
        .el('cancelDrug', 'cancelList')
        .el('concTable')
        .el('drugList')
        .el('chosenDrug');

    pic.el.chooseLbl.appendChild(pic.el.drugName);
    pic.el.centileText.disabled = true;

    ValidatorHookupControlID(pic.el.yrs.id, pic.el.WtOrAgeVal);
    ValidatorHookupControlID(pic.el.months.id, pic.el.WtOrAgeVal);

    $addHandler(pic.el.medianWeightBtn, 'click', pic.ajax.getMedianWt);
    $addHandler(pic.el.yrs, 'blur', pic.ajax.setWt4age);
    $addHandler(pic.el.months, 'blur', pic.ajax.setWt4age);
    $addHandler(pic.el.days, 'blur', pic.ajax.setWt4age);
    $addHandler(pic.el.yrs, 'change', pic.page.emptyDOB);
    $addHandler(pic.el.months, 'change', pic.page.emptyDOB);
    $addHandler(pic.el.days, 'change', pic.page.emptyDOB);
    $addHandler(pic.el.weight, 'blur', pic.ajax.setWt4age);
    $addHandler(pic.el.male, 'click', pic.ajax.setWt4age);
    $addHandler(pic.el.female, 'click', pic.ajax.setWt4age);
    $addHandler(pic.el.DOB, 'blur', pic.page.updateAge);
    $addHandler(pic.el.DOB, 'blur', pic.ajax.setWt4age);
    $addHandler(pic.el.months, 'blur', pic.page.zeroAgeLeft);
    $addHandler(pic.el.days, 'blur', pic.page.zeroAgeLeft);
    $addHandler(pic.el.months, 'blur', pic.page.baseAgeIntervals);
    $addHandler(pic.el.days, 'blur', pic.page.baseAgeIntervals);
    $addHandler(document.getElementsByTagName('form')[0], 'submit', function (evt) {
        var OK = pic.page.validateOnSubmit.validate();
        pic.el.centileText.disabled = !OK;
        if (OK) {
            pic.util.setCookie("ward", pic.el.wardList.value, 260000); //~6 months in minutes
            if (pic.el.bolus.checked) {
                pic.util.setCookie("report", pic.el.bolus.value, 260000);
            } else if (pic.el.list.checked) {
                pic.util.setCookie("report", pic.el.list.value, 260000);
            }
        } else {
            evt.preventDefault();
        }
    });
    $addHandler(pic.el.bolus, 'click', pic.page.bolus_click);
    $addHandler(pic.el.list, 'click', pic.page.list_click);
    $addHandler(pic.el.choose, 'click', pic.ajax.choose_click);
    $addHandler(pic.el.cancelDrug, 'click', pic.page.cancelDrug);
    if (pic.el.bolus.checked) { pic.page.validateOnSubmit.remove('age'); }
    
    if (pic.el.drugJSON.value) {
        pic.page.displaySelectedDrug(pic.el.drugJSON);
    }
    if (typeof (Sys) !== 'undefined') Sys.Application.notifyScriptLoaded();
};
