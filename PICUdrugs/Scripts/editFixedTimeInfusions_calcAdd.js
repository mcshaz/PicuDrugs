(function ($) {
    function HrMin(timeInMins) {
        this.set(timeInMins);
        return this;
    };
    HrMin.prototype.set = function (timeInMins) {
        var time = parseInt(timeInMins);
        if (isNaN(time)) {
            this.min = '';
            this.hr = '';
            this.totalMins = '';
            this.isValid = false;
        } else {
            this.totalMins = time;
            this.min = time % 60;
            this.hr = Math.floor(time / 60);
            this.isValid = true;
        }
        return this;
    };
    HrMin.prototype.subtract = function (mins) {
        if (this.isValid) {
            this.set(this.totalMins - ((mins instanceof HrMin) ? mins.totalMins : mins));
        }
        return this;
    };
    HrMin.prototype.timeDif = function (mins) {
        if (this.isValid) {
            return new HrMin(Math.abs(this.totalMins - ((mins instanceof HrMin) ? mins.totalMins : mins)));
        }
    };
    HrMin.prototype.toString = function () {
        return ((this.hr == 0) ? "" : (this.hr + "h")) + ((this.min == 0) ? "" : (this.min + "m"));
    };
    function RowCollection() {
        this.row = [];
    };
    RowCollection.prototype.updateDurations = function () {
        if (this.rowCopy == null || this.rowCopy.length != this.row.length)
            this.rowCopy = this.row.slice();
        this.rowCopy.sort(CompareTimes);
        for (var i = this.rowCopy.length - 1; i >= 0; i--) {
            var duratn = new HrMin(this.rowCopy[i].stopTimeEl.value);
            if (i > 0) duratn.subtract(new HrMin(this.rowCopy[i - 1].stopTimeEl.value));
            $(this.rowCopy[i].duratnEl).text(duratn.toString());
            if (this.rowCopy[i].entireVolEl && this.rowCopy[i].calcDuratn != duratn.totalMins) {
                //duration has changed, check if entire vol checkbox also needs to change
                this.rowCopy[i].calcDuratn = duratn.totalMins;
                entireVolCheck(this.rowCopy[i], this.isPerHr);
            };
        }
    };
    //infrastructure defined
    var entireVolInfo = "Calculate rate so as to give volume specified over duration specified. For tick-box to be active, rate must be empty.";
    var stopWidth;
    $('.doseCatTable').each(function (tableNo) {
        var tableData = new RowCollection(), //give neccesary methods to update other fields in the same row when a field is changed
            cumDrugLength = 0,
            cumConcLength = 0,
            appendStr,
            $concRadios,
            //add radio buttons above table
            radioHtm = [],
            $table = $(this);

        radioHtm[0] = '<span><label><input type="radio" name="concOption_' + tableNo.toString() + '" ';
        radioHtm[1] = 'checked="checked" value="conc"';
        radioHtm[2] = '/>'; // moving class to div
        radioHtm[3] = 'Display final concentration';
        radioHtm[4] = '</label></span>';
        appendStr = radioHtm.join('');
        radioHtm[1] = 'value="drug"';
        radioHtm[3] = 'Display amount of drug to be added';
        appendStr = '<div class="radioVert">' + appendStr + radioHtm.join('') + '</div>';
        $concRadios = $(appendStr).insertBefore(this)
                                        .find('input')
                                        .on('click', { $assdTable: $(this) }, drugAdd_click);
        tableData.drugRadio = $concRadios[1];

        $table.children('thead').children('tr').each(function (rowNo) {
            var $row = $(this);
            $row.append('<th>' + (rowNo === 0 ? 'Duration' : '') + '</th>');
            if (rowNo === 0) {
                $row.children('.rateTH:first')
                    .append(String.format('<label class="entireCheck" title="{0}"><input type="checkbox" checked="checked" disabled="disabled" />entire vol.</label>', entireVolInfo));
            } else {
                var rateUnits = $row.find('.rateUnits:first').text();
                tableData.calculate = dilutionFormulas(currentDrug.prefix, rateUnits);
                tableData.isPerHr = !rateIsPerMin(rateUnits);
                $row.find('.concField:first').after('<span class="drugAdded">' + tableData.calculate.drugUnitName + '</span>')
            }
        });
        $table.children('tbody').children('tr').each(function (rowNo) {
            var $row = $(this),
                $conc,
                conc,
                $drugAdd,
                $vol,
                $rate,
                $entireVol,
                $stopTime,
                $hrMins,
                stopHrMin,
                drugCalc,
                $duratn = $('<td><span class="duratnField"></span></td>')
                            .appendTo(this)
                            .children();
            if ($row.children('td:nth(1)').find('input').length) { //2nd cell of current row has an input
                $row.find('span').each(function () {
                    var $span = $(this),
                        className = /\w*Field\b/.exec($span.attr('class')),
                        $inpt = $span.find('input:first'),
                        setupStop = function () {
                            $stopTime = $inpt;
                            $stopTime.hide();
                            if (!stopWidth) stopWidth = $stopTime.width() / 2;
                            $hrMins = $(String.format('<span class="stopHrMin"><label><input class="stopHr" style="width:{0}px"/>h</label><label><input class="stopMin" style="width:{0}px"/>m</label></span>', stopWidth))
                                        .insertBefore($stopTime)
                                        .find('input');
                        };
                    className = (className === null) ? '' : className[0];
                    //move attr onto inputs
                    $span.removeClass(className);
                    $inpt.addClass(className);
                    //create and define elements

                    switch (className) {
                        case 'concField':
                            $conc = $inpt;
                            $drugAdd = $(String.format('<input class="drugAdded" style="width:{0}px" />', $conc.width()))
                                            .insertBefore($conc);
                            break;
                        case 'volumeField':
                            $vol = $inpt;
                            break;
                        case 'rateField':
                            $rate = $inpt;
                            $entireVol = $(String.format('<input type="checkbox" title="{0}" disabled="disabled" />', entireVolInfo))
                                        .insertAfter($rate);
                            break;
                        case 'stopTimeField':
                            setupStop();
                            break;
                    }
                });
                //finish row itteration - now fill elements with values & bind handlers

                //change to seperate hour minute textBox
                stopHrMin = new HrMin($stopTime.val());
                $hrMins[0].value = stopHrMin.hr;
                $hrMins[1].value = stopHrMin.min;

                tableData.row[rowNo] = {
                    isInputRow: true,
                    stopTimeEl: $stopTime[0],
                    hrEl: $hrMins[0],
                    minEl: $hrMins[1],
                    duratnEl: $duratn[0],
                    calcDuratn: null,
                    rateEl: $rate[0],
                    volEl: $vol[0],
                    concEl: $conc[0],
                    entireVolEl: $entireVol[0],
                    drugAddEl: $drugAdd[0]
                };
                $hrMins.on('keyup', { rowNo: rowNo, tableData: tableData }, row_altered);
                    
                //drug added or conc
                drugCalc = tableData.calculate.drugFromConc($conc.val(), $vol.val(), myFormat);
                cumDrugLength += drugCalc.length;
                $drugAdd.val(drugCalc);
                cumConcLength += $conc.val().length;

                //set handlers
                $conc.add($drugAdd)
                    .add($vol)
                    .add($rate)
                    .on('keyup', { rowNo: rowNo, tableData: tableData }, row_altered);
                $entireVol.on('click', { rowData: tableData.row[rowNo], isPerHr: tableData.isPerHr }, entireVol_click);

            } else { //non data entry row
                $(this).find('span').each(function () {
                    var $span = $(this),
                        className = /\w*Field\b/.exec($span.attr('class')),
                        stopTime;
                    className = (className === null) ? '' : className[0];
                    switch (className) {
                        case 'concField':
                            $conc = $span;
                            $drugAdd = $('<span class="drugAdded"></span>')
                                .insertBefore(this);
                            break;
                        case 'volumeField':
                            $vol = $span;
                            break;
                        case 'rateField':
                            $rate = $span;
                            $entireVol = $(String.format('<input type="checkbox" disabled="disabled" title="{0}" />', entireVolInfo))
                                    .insertAfter($rate);
                            break;
                        case 'stopTimeField':
                            $stopTime = $span;
                            stopTime = new HrMin($stopTime.text());
                            $stopTime.val(stopTime.totalMins);
                            $stopTime.text(stopTime.toString());
                            break;
                    }
                });
                //finished itterating through single non data entry row
                tableData.row[rowNo] = {
                        isInputRow: false,
                        stopTimeEl: $stopTime[0],
                        duratnEl: $duratn[0],
                        calcDuratn: null,
                        rateEl: $rate[0],
                        volEl: $vol[0],
                        concEl: $conc[0],
                        entireVolEl: $entireVol[0],
                        drugAddEl: $drugAdd[0]
                    };
                conc = $conc.text();
                drugCalc = tableData.calculate.drugFromConc(conc, $vol.text(), myFormat);
                cumDrugLength += drugCalc.length;
                $drugAdd.text(drugCalc);
                //perform calc first, then round rounding
                conc = myFormat(conc);
                cumConcLength += conc.length;
                $conc.text(conc);
                $rate.text(myFormat($rate.text()));
            }
        });

        //itteration through all rows finished - use click event handler to hide either drug added or concentration, whichever rounds better
        if (cumDrugLength===0 || cumConcLength < (2 * cumDrugLength)) {
            $concRadios.first().click();
        } else {
            $concRadios.last()
                .attr('checked', 'checked')
                .click();
        }
        tableData.updateDurations();
    });
    function CompareTimes(param1, param2) {
        var first = parseInt(param1.stopTimeEl.value);
        var second = parseInt(param2.stopTimeEl.value);
        if (isNaN(first)) first = -1;
        if (isNaN(second)) second = -1;
        return (first - second);
    };
    var uniqueId = 0;
    function getUniqueId() {
        return "runtimeID_" + uniqueId++;
    };
    function row_altered(e) {
        var tableObj = e.data.tableData,
            thisRow = tableObj.row[e.data.rowNo];
        if (this === thisRow.hrEl || this === thisRow.minEl) {
            var min = parseInt(thisRow.minEl.value || 0);
            var hr = parseInt(thisRow.hrEl.value || 0);
            if (min >= 60) {
                hr = hr + Math.floor(min / 60);
                thisRow.hrEl.value = hr;
                min = min % 60;
                thisRow.minEl.value = min;
            }
            thisRow.stopTimeEl.value = (hr * 60) + min;
            tableObj.updateDurations();
        } else {
            if (this === thisRow.drugAddEl || this === thisRow.concEl || this === thisRow.volEl) {
                if (tableObj.drugRadio.checked) {
                    thisRow.concEl.value = tableObj.calculate.concFromDrug(thisRow.drugAddEl.value, thisRow.volEl.value);
                } else {
                    thisRow.drugAddEl.value = tableObj.calculate.drugFromConc(thisRow.concEl.value, thisRow.volEl.value, myFormat);
                }
            }
        }
        entireVolCheck(thisRow, e.data.tableData.isPerHr);
        entireVol_set(thisRow);
    };
    function entireVolCheck(argObj, isPerHr) {
        var rate = parseFloat(argObj.isInputRow ? argObj.rateEl.value : $(argObj.rateEl).text());
        argObj.entireVolEl.checked = Math.abs(rate - calcRate4Vol(argObj, isPerHr)) < 1e-5;
    };
    function calcRate4Vol(argObj, isPerHr) {
        var conc, vol, rate;
        if (argObj.isInputRow) {
            conc = parseFloat(argObj.concEl.value);
            vol = parseFloat(argObj.volEl.value);
        } else {
            conc = parseFloat($(argObj.concEl).text());
            vol = parseFloat($(argObj.volEl).text());
        }
        // conc * vol * (?perHr:60) / duratn
        rate = (conc * vol * (isPerHr ? 60 : 1) / argObj.calcDuratn);
        return isNaN(rate) ? '' : rate;
    };
    function drugAdd_click(e) {
        if (this.checked == (this.value == 'conc')) {
            e.data.$assdTable.find('.concField').show();
            e.data.$assdTable.find('.drugAdded').hide();
        } else {
            e.data.$assdTable.find('.concField').hide();
            e.data.$assdTable.find('.drugAdded').show();
        }
    };
    function entireVol_click(e) {
        if (this.checked) {
            e.data.rowData.rateEl.value = myFormat(calcRate4Vol(e.data.rowData, e.data.isPerHr));
            e.data.rowData.entireVolEl.disabled = true;
        }
    };
    function myFormat(inptNo) {
        if (isNaN(inptNo)) return '';
        inptNo=parseFloat(inptNo);
        return parseFloat(inptNo.toPrecision(13)).toString();
    }
    function entireVol_set(argObj) {
        argObj.entireVolEl.disabled = (isNaN(parseFloat(argObj.concEl.value)) || isNaN(parseFloat(argObj.volEl.value)) || isNaN(parseFloat(argObj.stopTimeEl.value)) || !isNaN(parseFloat(argObj.rateEl.value)));
    };
    /*
    var urlParams = {};
    (function () {
        var e,
            a = /\+/g,  // Regex for replacing addition symbol with a space
            r = /([^&=]+)=?([^&]*)/g,
            d = function (s) { return decodeURIComponent(s.replace(a, " ")); },
            q = window.location.search.substring(1);

        while (e = r.exec(q))
            urlParams[d(e[1])] = d(e[2]);
    })();
    */
    function dilutionFormulas(drugUnits, infRate) {
        var prefixArr = ["", "milli", "micro", "nano", "pico"],
            measures = /[^a-zA-Z]*([a-zA-Z]+)*(gram|unit|mole|joule|litre)/i,
            prefixFromUnit = function (unit) {
                var prefix = measures.exec(unit);
                if (prefix.length === 0) { return false; }
                prefix = prefix[1] || "";
                return -3 * ($.inArray(prefix, prefixArr));
            },
            argToNumeric = function (arg) {
                var numVal;
                numVal = parseInt(arg, 10);
                if (isNaN(numVal)) {
                    numVal = prefixFromUnit(numVal);
                }
                return numVal;
            },
            timeFactor = rateIsPerMin(infRate) ? 60 : 1,
            drugDilRatio,
            infUnits = prefixFromUnit(infRate);
        drugUnits = argToNumeric(drugUnits);
        drugDilRatio = Math.pow(10, drugUnits - infUnits);
        return {
            drugUnitName: prefixArr[parseInt(-1*drugUnits/3)] + measures.exec(infRate)[2],
            drugFromConc: function (conc, vol, formatFunc) {
                var returnVal;
                conc = parseFloat(conc);
                vol = parseInt(vol);
                returnVal = (conc * vol * timeFactor) / (drugDilRatio);
                if (typeof formatFunc === 'function') {
                    returnVal = formatFunc.call(null, returnVal)
                }
                return returnVal;
            },
            concFromDrug: function (drug, vol, formatFunc) {
                var returnVal;
                drug = parseFloat(drug);
                vol = parseInt(vol);
                returnVal = (drug * drugDilRatio) / (vol * timeFactor)
                if (typeof formatFunc === 'function') {
                    returnVal = formatFunc.call(null, returnVal)
                }
                return returnVal;
            }
        }
    };
    function rateIsPerMin(arg) {
        return /(per\s+|\/)[mM]in/.test(arg)
    };
})(jQuery);