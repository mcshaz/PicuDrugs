String.format = function () {
    var s = arguments[0];
    for (var i = 0; i < arguments.length - 1; i++) {
        var reg = new RegExp("\\{" + i + "\\}", "gm");
        s = s.replace(reg, arguments[i + 1]);
    }
    return s;
};
(function ($) {
    $.fn.hasAncestor = function (selector) {
        return !!(this.filter(function () {
            return $(this).closest(selector).length;
        }).length);
    };
    function MnthYr(months, years) {
        var that = this,
            setInvalid = function () {
                this.isValid = false;
                this.years = '';
                this.months = '';
            }
        if (!(months || years)) {
            setInvalid();
            return;
        }
        months = parseInt(months || 0, 10);
        years = parseInt(years || 0, 10);
        if (isNaN(months) || isNaN(years)) {
            setInvalid();
        } else {
            this.isValid = true;
            this.years = years + Math.floor(months / 12);
            this.months = months % 12;
        }
    };
    MnthYr.prototype.toString = function () {
        if (!this.isValid) return '';
        if (this.years === 0) return (this.months === 0) ? '0' : (this.months.toString() + ' months');
        if (this.months === 0) return this.years.toString() + ' years';
        return this.years.toString() + ' years & ' + this.months.toString() + ' months';
    };
    MnthYr.prototype.totalMonths = function () {
        return this.months + (this.years * 12);
    };
    //necessary prototypes built - now search through list
    var smallWidth,
        calculateWidth = function (el) { return; },
        labelName = serial_maker().set_prefix('jsLbl');
    $('.dilutionDropDown')
        .on('change', setDefaultFieldsByDilutionMethod)
        .each(setDefaultFieldsByDilutionMethod);
    $('li.stdItem:even:not(.edit)').removeClass('stdItem').addClass('alternateListItem');
    $('.doseCatTable tbody tr:nth-child(odd)').not('.edit').addClass('alternateItem');
    $('.singleInput').each(function () {
        $(this).find('input:first')
            .appendTo(this);
    });
    $('.ageMonths').each(function () {
        var $t = $(this),
            $el = $t.children('input:first');
        //yrId, mthId,
        if ($el.length > 0) {
            var isInsert = $t.hasAncestor('.insert'),
                yrEl, 
                mthEl, 
                $yrMnth,
                age,
                inptClass;
            if (!isInsert) { age = new MnthYr($el.val()); }
            //yrId = labelName.gensym();
            //mthId = labelName.gensym();
            if (!smallWidth) { smallWidth = $el.width() * 0.75; }
            inptClass = $el.attr('class');
            $yrMnth = $(String.format('<label><input type="text" class="{0}" width="{1}" value="{2}"/>yr</label> <label><input type="text" class="{3}" width="{1}" value="{4}"/>mth</label>',
                                        inptClass + " years",
                                        smallWidth,
                                        isInsert ? "" :age.years,
                                        inptClass + " months",
                                        isInsert ? "":age.months ));
            $el.hide(); //hide the validation controls and the input

            $t.closest('span.minMax')
            //.addClass('below')
                    .prepend($yrMnth)
                    .next('.describe')
                    .addClass('below');
            $yrMnth = $yrMnth.find('input');
            yrEl = $yrMnth[0];
            mthEl = $yrMnth[1];
            $yrMnth.on('change', { yrEl: yrEl, mnthEl: mthEl, $ageEl: $el }, mthOrYr_change);
        } else {
            $t.text(new MnthYr($t.text()).toString());
        }
    });
    //further infrastructure
    var oldDilutionVol = '';
    function setDefaultFieldsByDilutionMethod() {
        var indexVal = parseInt($(this).val());
        if (dilMethod[indexVal].isPerKg) {
            $(this).closest('.templateBlock').find('span.perKg').show();
        } else {
            $(this).closest('.templateBlock').find('span.perKg').hide();
        }
        if (dilMethod[indexVal].varyVolume) {
            var $volInput = $(this).closest('.templateBlock').find('.volume:input');
            oldDilutionVol = $.trim($volInput.val());
            $volInput.val('');
            $volInput.attr('disabled', 'disabled');
        } else {
            var $volInput = $(this).closest('.templateBlock').find('input.volume');
            $volInput.removeAttr('disabled');
            if (oldDilutionVol == '') { oldDilutionVol = 50 };
            if ($.trim($volInput.val()) == '') { $volInput.val(oldDilutionVol) };
        }
    };
    function mthOrYr_change(e) {
        var ageData = new MnthYr(e.data.mnthEl.value, e.data.yrEl.value);
        e.data.$ageEl.val(ageData.totalMonths()); //intentionally return NaN if error in input
        e.data.$ageEl.change();
    };
    function serial_maker() {
        //Douglas Crockford
        //Javascript the good parts
        var prefix = '',
            seq = 0,
            returnObj = {
                set_prefix: function (p) {
                    prefix = String(p);
                    return returnObj;
                },
                set_seq: function (s) {
                    seq = s;
                    return returnObj;
                },
                gensym: function () {
                    var result = prefix + seq;
                    seq++;
                    return result;
                }
            };
        return returnObj;
    };
})(jQuery);
