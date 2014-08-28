; (function () {
    var wtData = uKWeightData(),
        centileAnswerThisSubmit;
    
    pic.el('male', 'MainContent_genderRadio_0').el('female', 'MainContent_genderRadio_1').el('yrs', 'MainContent_ptAgeYrs').el('months', 'MainContent_ptAgeMonths').el('days', 'MainContent_ptAgeDays').el('DOB', 'MainContent_ptDOB').el('WtOrAgeVal', 'MainContent_dobOrAgeValidator').el('DOBvalidator', 'MainContent_ptDOBRngValidator').el('weight', 'MainContent_ptWeight').el('guessCB', 'MainContent_weightEstimate').el('DOBval', 'MainContent_ptDOBRngValidator').el('medianWeightBtn').el('NHI', 'MainContent_ptNHI').el('centileVal', 'MainContent_centileValidator').el('wardList', 'MainContent_wardList').el('drugJSON', 'MainContent_drugJSON').el('bolus', 'MainContent_chartTypeRadio_0').el('list', 'MainContent_chartTypeRadio_1').el('choose', 'MainContent_chartTypeRadio_2').el('monthVal', 'MainContent_ptMonthsVal').el('gestation', 'MainContent_WeeksGestation').el('centileText', 'MainContent_centileText').el('upperCentileValue', 'MainContent_upperCentileValue').el('lowerCentileValue', 'MainContent_lowerCentileValue').el('isToChangeCookie'); pic.el.chooseLbl = pic.el.choose.parentNode.getElementsByTagName('label')[0]; pic.centileValue = {}; pic.centileValue.hardMin = 1E-10; pic.centileValue.softMin = 1; pic.centileValue.softMax = 99; pic.centileValue.hardMax = 99.9999999; pic.centileValue.set = {}; pic.centileValue.set.age = new pic.construct.Age(null, null, null); pic.centileValue.set.weight = null; pic.centileValue.set.isMale = null; pic.el('drugDiv', 'drugSelect').el('concDiv').el('drugName', 'selectDrug').el('cancelConc').el('cancelDrug', 'cancelList').el('concTable').el('drugList').el('chosenDrug');
    function asCentileString(centileRange) {
        if (centileRange instanceof NumericRange) {
            if(typeof centileRange.min == 'undefined') {
                if (typeof centileRange.max == 'undefined') {
                    return '';
                }
                return pic.page.getCentileText(centileRange.max);
            }
            if (centileRange.max == 'undefined' || Math.round(centileRange.min) == Math.round(centileRange.max)) {
                return pic.page.getCentileText(centileRange.min);
            }
            return pic.page.getCentileText(centileRange.min) + '-' + pic.page.getCentileText(centileRange.max);;
        }
        return pic.page.getCentileText(centileRange);
    }
    function setWt4Age() {
        var wt = parseFloat(pic.el.weight.value),
            daysOfAgeRng = new pic.construct.Age(pic.el.yrs.value, pic.el.months.value, pic.el.days.value).asAgeDaysRange(),
            gest = (parseInt(pic.el.gestation.value) || 40),
            ageRngToCentileRng = function(rng, isMale){
                if (rng.min == rng.max) {
                    return new pic.construct.NumericRange(wtData.cumSnormForAge(wt,rng.min,isMale,gest)*100);
                };
                return new pic.construct.NumericRange(wtData.cumSnormForAge(wt,rng.max,isMale,gest)*100, wtData.cumSnormForAge(wt,rng.min,isMale,gest)*100);
            }
        if (!isNaN(wt) && daysOfAgeRng) {
            if (pic.el.male.checked) {
                setWt4ageInputs(ageRngToCentileRng(daysOfAgeRng, true))
            } else if (pic.el.female.checked) {
                setWt4ageInputs(ageRngToCentileRng(daysOfAgeRng, false))
            } else {
                setWt4ageInputs({
                    male:ageRngToCentileRng(daysOfAgeRng, true),
                    female:ageRngToCentileRng(daysOfAgeRng, false)
                });
            }
        } else {
            pic.el.upperCentileValue.value = "";
            pic.el.lowerCentileValue.value = "";
            pic.el.centileText.value = "";
        }
    };
    function setWt4ageInputs(result) {
        var centile, maleStr, femaleStr,
            centileRngAsString = function (rng) {
                var min = Math.round(rng.min),
                    max = Math.round(rng.max)
                if (min == max || max <= 1) {
                    return pic.page.getCentileText(rng.min) + " centile";
                }
                if (min >= 99) {
                    return pic.page.getCentileText(rng.max) + " centile";
                }
                if (min == 0) { min = "<1"; }
                if (max == 100) { max = ">99"; }
                return "centile " + min + '-' + max;
            };
        if (result.male) {
            maleStr = centileRngAsString(result.male);
            femaleStr = centileRngAsString(result.female);
            pic.el.centileText.value = (maleStr == femaleStr)
                ? "\u2642 & \u2640 " + maleStr
                :String.format("\u2642{0},\u2640{1}", maleStr, femaleStr);
            result = new pic.construct.NumericRange(result.male.min, result.female.max)
        } else {
            pic.el.centileText.value = centileRngAsString(result);
        }
        pic.el.lowerCentileValue.value = result.min;
        pic.el.upperCentileValue.value = result.max;
        pic.page.setCentileClass(result);
    };
    function getElementsByClassAndTag(className, tagName) {
        var returnVar=[],
            i = 0, el,
            divs = (document.getElementsByClassName)
                ?document.getElementsByClassName(className)
                : document.getElementsByTagName(tagName);
        tagName = tagName.toUpperCase();
        for (; i < divs.length; i++) {
            el = divs[i];
            if (el.tagName.toUpperCase() == tagName && pic.util.hasClass(el, className)) {
                returnVar.push(el);
            }
        }
        return returnVar;
    }
    function isReportTypeChanged() {
        var reportCookie = docCookies.getItem("report");
        return (reportCookie == "list" && pic.el.bolus.checked) || (reportCookie == "bolus" && pic.el.list.checked)
    }


    pic.extend('vals', {
        centileValClient: function (source, args) {
            if (pic.el.lowerCentileValue.value == "" || !args.IsValid) { return; }
            if (centileAnswerThisSubmit===true || centileAnswerThisSubmit===false) {
                args.IsValid = centileAnswerThisSubmit;
                return;
            }
            var centile = new pic.construct.NumericRange(pic.el.lowerCentileValue.value, pic.el.upperCentileValue.value),
                errMsg = function () {
                    var centileToUse = (centile.min>50)?centile.max:centile.min,
                        inverseCentile = Math.round(100 / (centileToUse > 50 ? (100 - centileToUse) : centileToUse)),
                        formatSt = String.format("Theoretically, only 1 in every {0} healthy {1} of the same age weigh {2}",
                                      '{0}',
                                      (pic.el.male.checked || (!pic.el.female.checked && (centileToUse  < 50))) ? "males" : "females",
                                      centileToUse > 50 ? "more" : "less");
                    return {
                        html: String.format(formatSt,
                                    (inverseCentile >= 1000000) ? pic.util.largeNumberToWords(inverseCentile, true) : pic.util.seperator(inverseCentile)),
                        text: String.format(formatSt,
                                    (inverseCentile >= 1000000) ? pic.util.largeNumberToWords(inverseCentile, false) : pic.util.seperator(inverseCentile))
                    };
                };
            if (centile.min <= pic.centileValue.hardMin || centile.max >= pic.centileValue.hardMax) {
                source.errormessage = "Weight for age error: " + errMsg().html;
                args.IsValid = false;
            }
            else if (centile.min <= pic.centileValue.softMin || centile.max >= pic.centileValue.softMax) {
                var msg = errMsg();
                args.IsValid = centileAnswerThisSubmit = confirm(msg.text + " - are you SURE weight and age data are correct?");
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
                    pic.page.concChosen(selectedDrug, 0);
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
            var validatesOK, median, totalDays;
            if ((pic.el.yrs.value == "" && pic.el.months.value == "" && pic.el.days.value == "")) { pic.page.updateAge(); } //forseeable if postback
            validatesOK = pic.vals.validationManager('age', 'gender').setAnchorName('Error_Summary').validate();
            //use ClientValidation as this will not allow month to be ommited if 0 year old
            if (validatesOK && !(pic.el.yrs.value == "" && pic.el.months.value == "" && pic.el.days.value == "")) {
                if (pic.el.yrs.value == "") { pic.el.yrs.value = 0; }
                if (pic.el.months.value == "") {
                    pic.el.months.value = (pic.el.days.value == "") ? 6 : 0;
                }
                if (pic.el.days.value == "") { pic.el.days.value = "0"; }
                totalDays = new pic.construct.Age(pic.el.yrs.value, pic.el.months.value, pic.el.days.value).asAgeDaysRange().midPoint();
                median = wtData.lMSForAge(totalDays, pic.el.male.checked, parseInt(pic.el.gestation.value)).m;
                pic.el.weight.value = Math.round(median);
                pic.el.guessCB.checked = true;
                //guessCB.disabled = true;
                setWt4ageInputs(new pic.construct.NumericRange(50));
            }
        },
        validateOnSubmit: pic.vals.validationManager('age', '', 'centile').setAnchorName('Error_Summary').setErrClassName('validationError'),
        bolusOrList_Click: function () {
            pic.page.validateOnSubmit.remove('age');
            pic.el.wardList.disabled = false;
            pic.el.drugDiv.style.display = "none";
            if (isReportTypeChanged()) {
                getElementsByClassAndTag('changeCookie', 'div').forEach(function (el) { pic.util.removeClass(el, 'hidden'); });
            } else if (docCookies.getItem("ward") == pic.el.wardList.value) {
                pic.el.isToChangeCookie.checked = false;
                getElementsByClassAndTag('changeCookie', 'div').forEach(function (el) { pic.util.addClass(el, 'hidden'); });
            }
        },
        wardList_Change: function () {
            if (docCookies.getItem("ward") != pic.el.wardList.value) {
                getElementsByClassAndTag('changeCookie', 'div').forEach(function (el) { pic.util.removeClass(el, 'hidden'); });
            } else if (!isReportTypeChanged()) {
                pic.el.isToChangeCookie.checked = false;
                getElementsByClassAndTag('changeCookie', 'div').forEach(function (el) { pic.util.addClass(el, 'hidden'); });
            }
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
                i = 0;
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
            var midCentile = centile.midPoint();
            if (midCentile != null && midCentile < pic.centileValue.softMin || midCentile > pic.centileValue.softMax) {
                pic.el.centileText.className = "errorPoint";
            } else {
                pic.el.centileText.className = "normalCentile";
            }
        }
    });
    pic.util.addEvent(window, 'load', function () {
        var allInputs = Array.prototype.filter.call(document.getElementsByTagName('input'), function (el) { return !el.type || !(el.type == 'submit' || el.type == 'hidden')}),
            i = 0;
        pic.util.addEvent(allInputs, 'change', function (e) {
            pic.page.validateOnSubmit.validateElement(this);
        });
        pic.page.setCentileClass(new pic.construct.NumericRange(pic.el.lowerCentileValue.value, pic.el.upperCentileValue.value));

        pic.el.chooseLbl.appendChild(pic.el.drugName);

        ValidatorHookupControlID(pic.el.yrs.id, pic.el.WtOrAgeVal);
        ValidatorHookupControlID(pic.el.months.id, pic.el.WtOrAgeVal);

        pic.util.addEvent(pic.el.medianWeightBtn, 'click', pic.page.getMedianWt);
        pic.util.addEvent(pic.el.yrs, 'blur', function () {
            pic.page.validateOnSubmit.validateElement(pic.el.months);
            setWt4Age.call(this);
        });
        pic.util.addEvent([pic.el.yrs, pic.el.months, pic.el.days], 'change', pic.page.emptyDOB);
        pic.util.addEvent([pic.el.weight,pic.el.gestation,pic.el.DOB] , 'blur', setWt4Age);
        pic.util.addEvent([pic.el.male,pic.el.female], 'click', setWt4Age);
        pic.util.addEvent(pic.el.DOB, 'blur', pic.page.updateAge);
        pic.util.addEvent([pic.el.months, pic.el.days], 'blur', function () {
            pic.page.zeroAgeLeft.call(this);
            pic.page.baseAgeIntervals.call(this);
            setWt4Age.call(this);
        });
        pic.util.addEvent(document.getElementsByTagName('form')[0], 'submit', function (evt) {
            centileAnswerThisSubmit = null;
            var Ok = pic.page.validateOnSubmit.validate(); // Page_IsValid &&
            if (Ok) {
                if (pic.el.isToChangeCookie.checked) {
                    docCookies.setItem("ward", pic.el.wardList.value, Infinity);
                    if (pic.el.bolus.checked) {
                        docCookies.setItem("report", pic.el.bolus.value, Infinity);
                    } else if (pic.el.list.checked) {
                        docCookies.setItem("report", pic.el.list.value, Infinity);
                    }
                }
            } else {
                evt.preventDefault();
            }
        });
        pic.util.addEvent(pic.el.bolus, 'click', pic.page.bolusOrList_Click);
        pic.util.addEvent(pic.el.list, 'click', pic.page.bolusOrList_Click);
        pic.util.addEvent(pic.el.wardList, 'change', pic.page.wardList_Change);
        pic.util.addEvent(pic.el.choose, 'click', pic.ajax.choose_click);
        pic.util.addEvent(pic.el.cancelDrug, 'click', pic.page.cancelDrug);
        if (pic.el.bolus.checked) { pic.page.validateOnSubmit.remove('age'); }

        if (pic.el.drugJSON.value) {
            pic.page.displaySelectedDrug(pic.el.drugJSON);
        }
        if (!docCookies.hasItem("ward")) {
            pic.el.isToChangeCookie.checked = true;
        }
        pic.page.bolusOrList_Click();
        pic.page.wardList_Change();
        if (typeof (Sys) !== 'undefined') Sys.Application.notifyScriptLoaded();
    });
})();