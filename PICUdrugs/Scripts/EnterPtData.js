pic.extend('vals', {
    centileValClient: function (source, args) {
        var centile = parseFloat(pic.el.centileValue.value),
            errMsg = function () {
                var isMale = pic.el.male.checked || (!pic.el.female.checked && pic.page.guessMale(centile)),
                    inverseCentile = Math.round(100 / (centile > 50 ? (100 - centile) : centile)),
                    formatSt = String.format("Theoretically, only 1 in every {0} healthy {1} of the same age weigh {2}",
                                  '{0}',
                                  isMale ? "males" : "females",
                                  centile > 50 ? "more" : "less");
                return {
                    html: String.format(formatSt,
                                (inverseCentile >= 1000000) ? pic.util.largeNumberToWords(inverseCentile, true) : pic.util.seperator(inverseCentile)),
                    text: String.format(formatSt,
                                (inverseCentile >= 1000000) ? pic.util.largeNumberToWords(inverseCentile, false) : pic.util.seperator(inverseCentile))
                };
            };
        if (isNaN(centile)) {
            return false;
        }
        if (centile <= pic.el.centileValue.hardMin || centile >= pic.el.centileValue.hardMax) {
            source.errormessage = "Weight for age error: " + errMsg().html;
            args.IsValid = false;
        }
        else if (centile <= pic.el.centileValue.softMin || centile >= pic.el.centileValue.softMax) {
            var msg = errMsg();
            args.IsValid = confirm(msg.text + " - are you SURE weight and age data are correct?");
            if (!args.IsValid) { source.errormessage = "Weight for age error: " + msg.html; }
        } else {
            args.IsValid = true;
        }
    }
});
pic.ajax = {
    drugChosen: function (selectedDrug) {
        if (selectedDrug) {
            delete selectedDrug['__type'];
            if (selectedDrug.AvailableAmpules.length > 1) {
                pic.page.createConcTable(selectedDrug);
            } else {
                pic.page.concChosen(selectedDrug,0);
            }
        } else {
            pic.page.cancelDrug();
        }
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
        var li,
            i;
        pic.util.ajaxWait('off');
        for (i = 0; i < drugs.length; i++) {
            li = document.createElement('li');
            li.innerHTML = '<label><input type="radio" name="drugListItem" />' + drugs[i].DrugName + '</label>';
            pic.util.addEvent(li.firstChild.firstChild, 'click', pic.util.partial(pic.ajax.drugChosen, drugs[i]));
            pic.el.drugList.appendChild(li);
        }
        pic.el.drugDiv.style.display = "block";
    }
} //end AJAX get & callback methods
pic.extend("page", {
    getMedianWt: function () {
        var validatesOK, median;
        if ((pic.el.yrs.value == "" && pic.el.months.value == "" && pic.el.days.value == "")) { pic.page.updateAge(); } //forseeable if postback
        validatesOK = pic.vals.validationManager('age', 'gender').setAnchorName('Error_Summary').validate();
        //use ClientValidation as this will not allow month to be ommited if 0 year old
        if (validatesOK && !(pic.el.yrs.value == "" && pic.el.months.value == "" && pic.el.days.value == "")) {
            if (pic.el.yrs.value == "") { pic.el.yrs.value = 0; }
            if (pic.el.months.value == "") {
                pic.el.months.value = (pic.el.days.value == "") ? 6 : 0;
            }
            if (pic.el.days.value == "") { pic.el.days.value = 0; }
            median = statData.medianWtForAge({ years: parseInt(pic.el.yrs.value), months: parseInt(pic.el.months.value), days: parseInt(pic.el.days.value), isMale: pic.el.male.checked });
            pic.el.weight.value = Math.round(pic.el.male.checked?median.male:median.female) ;
            pic.el.guessCB.checked = true;
            //guessCB.disabled = true;
            pic.page.setWt4ageInputs(0);
        }
    },
    setWt4Age: function () {
        var daysOfAge, zVals;
        if (pic.el.yrs.value != "" && pic.el.months.value != "" && pic.el.weight.value != "" &&
            (pic.el.months.value > 0 || pic.el.yrs.value > 0 || pic.el.days.value != "")) {
            //note not checking change of days <0 months as makes v. little difference
            daysOfAge = pic.el.days.value == "" ? 0 : parseInt(pic.el.days.value);
            zVals = statData.zWtForAge({
                weight: parseFloat(pic.el.weight.value), years: parseInt(pic.el.yrs.value), months: parseInt(pic.el.months.value),
                days: daysOfAge
            });
            if (pic.el.male.checked) {
                pic.page.setWt4ageInputs(zVals.male)
            } else if (pic.el.female.checked) {
                pic.page.setWt4ageInputs(zVals.female)
            } else {
                //display both
                pic.page.setWt4ageInputs(zVals);
            }
        } else {
            pic.el.centileValue.value = "";
            pic.el.centileText.value = "";
        }
    },
    guessMale: function(centile) {
        return centile<50; //ie if small for age, check against male
    },
    setWt4ageInputs: function (result) {
        var centile;
        if (result.male) {
            var maleCentile = 100 * pic.math.cumSnorm(result.male),
                femaleCentile = 100 * pic.math.cumSnorm(result.female);
            pic.el.centileText.value = String.format("centiles \u2642{0},\u2640{1}", pic.page.getCentileText(maleCentile), pic.page.getCentileText(femaleCentile));
            if (pic.page.guessMale(maleCentile)) { 
                result = result.male;
                centile = maleCentile;
            } else {
                result = result.female;
                centile = femaleCentile;
            }
        } else {
            centile = 100 * pic.math.cumSnorm(result);
            pic.el.centileText.value = pic.page.getCentileText(centile) + " centile";
        }
        pic.el.centileValue.value = centile;
        pic.page.setCentileClass(centile);
    },
    validateOnSubmit: pic.vals.validationManager('age', '', 'centile').setAnchorName('Error_Summary'),
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
    createConcTable: function (currentDrug) {
        var tr,
            concArray = currentDrug.AvailableAmpules,
            i=0;
        pic.el.chosenDrug.innerHTML = currentDrug.drugName;
        pic.el.concTable.innerHTML = '<tr><td>select</td><th>Drug</th><th>Volume</th><th>Concentration</th></tr>';
        for (; i < concArray.length; i++) {
            tr = document.createElement('tr');
            tr.innerHTML = String.format('<td><input type="radio" name="concRadio" /></td><td>{0}{1}</td><td>{2}mL</td><td>{3}{1}/mL</td>',
                                            concArray[i].Concentration * concArray[i].Volume,
                                            currentDrug.Units,
                                            concArray[i].Volume,
                                            concArray[i].Concentration);
            pic.util.addEvent(tr.firstChild.firstChild, 'click', pic.util.partial(pic.page.concChosen, currentDrug, i));
            pic.el.concTable.appendChild(tr);
        }
        pic.util.addEvent(pic.el.cancelConc, 'click', pic.util.partial(pic.page.concChosen, currentDrug, null));
        pic.el.concDiv.style.display = "block";
    },
    concChosen: function (currentDrug, ampuleIndex) {
        var userSelectedInfusion = {  //note caps - C# object returned to ecma
            DrugId: currentDrug.DrugId,
            AmpuleConc: currentDrug.AvailableAmpules[ampuleIndex].Concentration,
            DrugName: currentDrug.DrugName
        };
        pic.el.drugJSON.value = JSON.stringify(userSelectedInfusion);
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
        newText = (drugInfo && drugInfo.DrugName) ? (drugInfo.DrugName + " (click to change)") : "(choose from list...)";
        pic.util.setText(pic.el.drugName, newText);
        pic.el.drugName.style.textDecoration = "underline"
    },
    getCentileText: function (centile) {
        if (isNaN(centile)) return false;
        if (centile < 1) {
            return "<1st";
        } else if (centile > 99) {
            return ">99th";
        }
        return pic.math.intWithSuffix(centile);
    },
    setCentileClass: function (centile) {
        if (centile < pic.el.centileValue.softMin || centile > pic.el.centileValue.softMax) {
            pic.el.centileText.className = "errorPoint";
        } else {
            pic.el.centileText.className = "normalCentile";
        }
    }
});
pic.util.addEvent(window,'load', function () {
    var centile = parseFloat(pic.el.centileValue.value);
    if (!isNaN(centile)) {
        pic.page.setCentileClass(centile);
    }

    pic.el.chooseLbl.appendChild(pic.el.drugName);
    pic.el.centileText.disabled = true;

    ValidatorHookupControlID(pic.el.yrs.id, pic.el.WtOrAgeVal);
    ValidatorHookupControlID(pic.el.months.id, pic.el.WtOrAgeVal);

    pic.util.addEvent(pic.el.medianWeightBtn, 'click', pic.page.getMedianWt);
    pic.util.addEvent(pic.el.yrs, 'blur', pic.page.setWt4Age);
    pic.util.addEvent(pic.el.months, 'blur', pic.page.setWt4Age);
    pic.util.addEvent(pic.el.days, 'blur', pic.page.setWt4Age);
    pic.util.addEvent(pic.el.yrs, 'change', pic.page.emptyDOB);
    pic.util.addEvent(pic.el.months, 'change', pic.page.emptyDOB);
    pic.util.addEvent(pic.el.days, 'change', pic.page.emptyDOB);
    pic.util.addEvent(pic.el.weight, 'blur', pic.page.setWt4Age);
    pic.util.addEvent(pic.el.male, 'click', pic.page.setWt4Age);
    pic.util.addEvent(pic.el.female, 'click', pic.page.setWt4Age);
    pic.util.addEvent(pic.el.DOB, 'blur', pic.page.updateAge);
    pic.util.addEvent(pic.el.DOB, 'blur', pic.page.setWt4Age);
    pic.util.addEvent(pic.el.months, 'blur', pic.page.zeroAgeLeft);
    pic.util.addEvent(pic.el.days, 'blur', pic.page.zeroAgeLeft);
    pic.util.addEvent(pic.el.months, 'blur', pic.page.baseAgeIntervals);
    pic.util.addEvent(pic.el.days, 'blur', pic.page.baseAgeIntervals);
    pic.util.addEvent(document.getElementsByTagName('form')[0], 'submit', function (evt) {
        var Ok = pic.page.validateOnSubmit.validate(); // Page_IsValid &&
        pic.el.centileText.disabled = !Ok;
        if (Ok) {
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
    pic.util.addEvent(pic.el.bolus, 'click', pic.page.bolus_click);
    pic.util.addEvent(pic.el.list, 'click', pic.page.list_click);
    pic.util.addEvent(pic.el.choose, 'click', pic.ajax.choose_click);
    pic.util.addEvent(pic.el.cancelDrug, 'click', pic.page.cancelDrug);
    if (pic.el.bolus.checked) { pic.page.validateOnSubmit.remove('age'); }
    
    if (pic.el.drugJSON.value) {
        pic.page.displaySelectedDrug(pic.el.drugJSON);
    }
    if (typeof (Sys) !== 'undefined') Sys.Application.notifyScriptLoaded();
});
