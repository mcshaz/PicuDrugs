var pic = {
    el: function (name, el) {
        if (typeof name !== 'string') { throw new TypeError('name must be a string'); }
        switch (typeof el) {
            case ('undefined'):
                el = name;
                //intentional fallthrough
            case ('string'):
                this.el[name] = document.getElementById(el);
                break;
            default:
                if (!el.tagName) { throw new TypeError('el passed wrong type of object'); }
                this.el[name] = el;
                break;
        }
        return this;
    },
    extend: function (nameSpace, origObj) {
        var i,
            newProp,
            wasObj = true;
        switch (typeof nameSpace) {
            case ('object'):
                newProp = nameSpace;
                break;
            case ('string'):
                newProp = this[nameSpace];
                if (typeof newProp === 'undefined') {
                    this[nameSpace] = newProp = {};
                    wasObj = false;
                }
                break;
            default:
                throw new TypeError('nameSpace must be an object or a string');
        }
        for (i in origObj) {
            if (origObj.hasOwnProperty(i)) {
                if (wasObj && nameSpace.hasOwnProperty(i)) {
                    throw new DuplicatePropertyError(i);
                }
                newProp[i] = origObj[i];
            }
        }
    },
    vals: {
        validationManager: function () {
            // Manual client-side validation of Validator Groups 
            // an empty string('') is default - to validate controls without a validation group
            var valGroups = [''],
                anchorName,
                returnObj = { //define methods
                    set: function (/*string argument list*/) {
                        valGroups = Array.prototype.slice.call(arguments);
                        return returnObj;
                    },
                    add: function (/*string argument list*/) {
                        var i;
                        for (i = 0; i < arguments.length; i++) {
                            if (valGroups.indexOf(arguments[i]) === -1) {
                                valGroups.push(arguments[i]);
                            }
                        }
                        return returnObj;
                    },
                    remove: function (/*string argument list*/) {
                        var i = 0, n = 0;
                        for (i = 0; i < arguments.length; i++) {
                            n = valGroups.indexOf(arguments[i]);
                            if (n > -1) valGroups.splice(n, 1);
                        }
                        return returnObj;
                    },
                    setAnchorName: function (str) {
                        anchorName = str;
                        return returnObj;
                    },
                    validate: function () {
                        var i, currentGrp,
                            summariesToDisplay = [];

                        for (i = 0; i < valGroups.length; i++) {
                            if (!Page_ClientValidate(valGroups[i])) { //this will display the contents of the validator summary
                                summariesToDisplay.push(valGroups[i]);
                            }
                        }

                        if (!summariesToDisplay.length) { return true; }

                        for (i = 0; i < Page_Validators.length; i++) {
                            currentGrp = Page_Validators[i].validationGroup || '';
                            if (summariesToDisplay.indexOf(currentGrp) > -1) {
                                ValidatorValidate(Page_Validators[i]); //this will display the contents of the validator element
                            }
                        }

                        for (i = 0; i < Page_ValidationSummaries.length; i++) { //make relevant summaries visible
                            if (summariesToDisplay.indexOf(Page_ValidationSummaries[i].validationGroup || '') > -1) {
                                Page_ValidationSummaries[i].style.display = "inline"; //"none"; "inline";
                            }
                        }
                        if (anchorName) { window.location.hash = anchorName; }
                        return false;
                    }
                };
            if (arguments.length > 0) {
                returnObj.set.apply(null, arguments);
            }
            return returnObj;
        }
    }, //end of vals
    util: {
        addEvent:function (elem, type, eventHandle) {
            if (!elem) return;
            if (elem.addEventListener) {
                elem.addEventListener(type, eventHandle, false);
            } else if (elem.attachEvent) {
                elem.attachEvent("on" + type, eventHandle);
            } else {
                elem["on" + type] = eventHandle;
            }
        },
        ageFromDOB: function (ptDOB) {
            var now = new Date();
            var returnVal = pic.Construct.Age(null, null, null);
            returnVal.years = now.getFullYear() - ptDOB.getFullYear();
            returnVal.months = now.getMonth() - ptDOB.getMonth();
            returnVal.days = now.getDate() - ptDOB.getDate();
            if (returnVal.months < 0) returnVal.months += 12;
            if (returnVal.days < 0) {
                var lastMonth = new Date(now);
                lastMonth.setDate(0);
                returnVal.days += lastMonth.getDate();
                if (returnVal.months == 0) {
                    returnVal.months = 11;
                    returnVal.years--;
                }
                else { returnVal.months--; }
            }
            var birthyearNow = new Date(now);
            birthyearNow.setFullYear(now.getFullYear() - returnVal.years);
            if (ptDOB > birthyearNow) returnVal.years--;
            return returnVal;
        },
        getText: function (el) {
            var textNodeContents = [],
                chld;
            for (chld = el.firstChild; chld; chld = chld.nextSibling) {
                if (chld.nodeType == 3) { // text node
                    textNodeContents.push(chld.nodeValue);
                }
            }
            return textNodeContents.join("");
        },
        setText: function (el, txt) {
            var chld;
            if (!el || !el.nodeType) { throw new TypeError("el is not a valid element"); }
            for (chld = el.firstChild; chld; chld = chld.nextSibling) {
                if (chld.nodeType == 3) { break };
            }
            if (chld) {
                chld.nodeValue = txt;
            } else {
                el.appendChild(document.createTextNode(txt));
            }
        },
        appendText: function (el, txt) {
            var chld;
            for (chld = el.lastChild; chld; chld = chld.previousSibling) {
                if (chld.nodeType == 3) { break };
            }
            if (chld) {
                chld.nodeValue = chld.nodeValue + txt;
            } else {
                el.appendChild(document.createTextNode(txt));
            }
        },
        partial: function (func) {
            var args = Array.prototype.slice.call(arguments, 1);
            return function () {
                var allArguments = args.concat(Array.prototype.slice.call(arguments));
                return func.apply(this, allArguments);
            }
        },
        ajaxWait: function (show) {
            if (show === 'on') {
                if (!pic.el.waitUpdate) {
                    pic.el.waitUpdate = document.createElement('div');
                    pic.el.waitUpdate.setAttribute('id', 'waitUpdating')
                    pic.el.waitUpdate.innerHTML = 'Please wait retrieving values...';
                }
                document.getElementsByTagName('body')[0].appendChild(pic.el.waitUpdate);
            } else {
                document.getElementsByTagName('body')[0].removeChild(pic.el.waitUpdate);
            }
        },
        setCookie: function (name, value, minutes) {
            //taken from Murachs Javascript p 685
            if (arguments.length < 2) return;
            var name_pattern = /^[^\s,;]+$/,
                cookie = name + "=" + encodeURIComponent(value);
            if (!name_pattern.test(name)) { throw new URIError("Name argument of setCookie function invalid"); }
            if (!isNaN(minutes)) {
                var expireDate = new Date();
                expireDate.setTime(60000 * minutes + expireDate.getTime());
                cookie += "; expires=" + expireDate.toGMTString();
            }
            document.cookie = cookie + "; path=/"
        },
        seperator: function (d, seperator) {
            var parts = d.toString().split(".");
            if (typeof(seperator) == 'undefined') { seperator = " "; }
            parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, seperator);
            return parts.join(".");
        },
        log10: Math.log(10),
        largeNumberWords : ['Thousand','Million','Billion','Trillion','Quadrillion','Quintillion','Sextillion','Septillion','Octillion','Nonillion','Decillion','Undecillion','Duodecillion','Tredecillion','Quattuordecillion','Quindecillion','Sexdecillion','Septendecillion','Octodecillion','Novemdecillion','Vigintillion','Centillion'],
        largeNumberToWords: function (largeNumber, asHtml) {
            var val = parseFloat(largeNumber),
                absVal = Math.abs(val),
                wasInfinite = !isFinite(val),
                prefix = '';
            if (isNaN(val)) {throw new TypeError('"' + val + '" cannot be parsed as a number');}
            if (absVal < 10000) {
                return val.toString();
            } else if (wasInfinite) {
                val = Number.MAX_VALUE;
                absVal = Math.abs(val)
            }
            var logVal = Math.log(absVal)/pic.util.log10,
                logMultiple3 = Math.floor((logVal)/3)*3,
                returnDigits = (val /Math.pow(10, logMultiple3)).toPrecision((logVal- logMultiple3)>=2?3:2),
                lookupVal = (logMultiple3 / 3)-1;
            if (lookupVal > 21) { lookupVal = 21; }
            if (wasInfinite) {
                if (val === Number.POSITIVE_INFINITY) { prefix = (asHtml) ? '&gt;' : '>'; }
                else { prefix = (asHtml) ? '&lt;-' : '<-'; }
            }
            return prefix + returnDigits + ' ' + pic.util.largeNumberWords[lookupVal] + ' (10' + (asHtml?'<sup>':'^') + logMultiple3 + (asHtml?'</sup>)':')');
        }
    }, //end of util
    math: {
        cumSnorm: function (Zscore) {
            var ZAbs = Math.abs(Zscore),
                returnVal,
                build;
            if (ZAbs > 37) {
                return 0;
            } else {
                var Exponential = Math.exp(-Math.pow(ZAbs, 2) / 2);
                if (ZAbs < 7.07106781186547) {
                    build = 3.52624965998911E-02 * ZAbs + 0.700383064443688;
                    build = build * ZAbs + 6.37396220353165;
                    build = build * ZAbs + 33.912866078383;
                    build = build * ZAbs + 112.079291497871;
                    build = build * ZAbs + 221.213596169931;
                    build = build * ZAbs + 220.206867912376;
                    returnVal = Exponential * build;
                    build = 8.83883476483184E-02 * ZAbs + 1.75566716318264;
                    build = build * ZAbs + 16.064177579207;
                    build = build * ZAbs + 86.7807322029461;
                    build = build * ZAbs + 296.564248779674;
                    build = build * ZAbs + 637.333633378831;
                    build = build * ZAbs + 793.826512519948;
                    build = build * ZAbs + 440.413735824752;
                    returnVal = returnVal / build;
                }
                else {
                    build = ZAbs + 0.65;
                    build = ZAbs + 4 / build;
                    build = ZAbs + 3 / build;
                    build = ZAbs + 2 / build;
                    build = ZAbs + 1 / build;
                    returnVal = Exponential / build / 2.506628274631;
                }
            }
            return (Zscore < 0) ? returnVal : 1 - returnVal;
        },
        zFromParams: function(xVal, params) {
            if (params.L == 0) {
                return Math.log(xVal / params.M) / params.S;
            }
            return (Math.pow(xVal / params.M, params.L) - 1) / (params.L * params.S);
        },
        intWithSuffix: function (numericVal) {
            var suffix,
                roundedVal = Math.round(numericVal),
                mod100 = roundedVal % 100;
            if (isNaN(roundedVal)) return false;
            roundedVal = roundedVal.toString();
            if (mod100 > 3 && mod100 < 21) {
                return roundedVal + "th";
            } else {
                switch (mod100 % 10) {
                    case 1:
                        suffix = "st";
                    case 2:
                        suffix = "nd";
                    case 3:
                        suffix = "rd";
                    default:
                        suffix = "th";
                }
                return roundedVal +suffix;
            }
        }
    }, //end of math
    Construct: {
        Age: function (years, months, days) {
            if (this instanceof pic.Construct.Age) {
                this.years = parseInt(years);
                if (isNaN(this.years)) this.years = "";
                this.months = parseInt(months);
                if (isNaN(this.months)) this.months = "";
                this.days = parseInt(days);
                if (isNaN(this.days)) this.days = "";
            } else {
                return new pic.Construct.Age(years, months, days);
            }
        }
    }//end of Construct
};
pic.Construct.Age.prototype.toBaseUnits = function () {
    if (this.days > 28) {
        var now = new Date();
        var countBack = new Date(now.getFullYear(), now.getMonth(), 0);
        var DaysInMonth = countBack.getDate();
        while (this.days >= DaysInMonth) {
            this.days -= DaysInMonth;
            this.months++;
            countBack.setDate(0);
            DaysInMonth = countBack.getDate();
        }
    }
    if (this.months >= 12) {
        this.years = this.years + parseInt(this.months / 12);
        this.months = this.months % 12;
    }
};
//errors
function DuplicatePropertyError(propertyName) {
    this.name = 'DuplicatePropertyError';
    this.message = 'property ' + propertyName + ' already exists in both objects';
};
DuplicatePropertyError.prototype = new Error();
DuplicatePropertyError.prototype.constructor = DuplicatePropertyError;
if (!Array.prototype.indexOf) {
    Array.prototype.indexOf = function( elem ) {
        var i = 0,
            len = this.length;
        for ( ; i < len; i++ ) {
            if ( this[i] === elem ) {
                return i;
            }
        }
        return -1;
    }
}