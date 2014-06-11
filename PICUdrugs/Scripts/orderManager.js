$(document).ready(function () {
    var $lists = $('.listOrder'),
        $submitBtns = $('input').filter('[id^=submit]'),
        $bolusList,
        submitRegX = /included/i,
        infusionRegX = /infusion/i,
        $cloneBolusBtn = $("#MainContent_cloneBolus");
    zebra($lists);
    $(".clickHandle").on('click', function (e) {
        $(this).nextAll().slideToggle();
    });
    if ($submitBtns.length) {
        $lists.each(function () {
            var $this = $(this),
                $boundingDiv = $this.closest('div.orderGroup'),
                $submitBtn = $boundingDiv.find($submitBtns),
                isSubmitList = submitRegX.test(this.id),
                $assdList = $boundingDiv.find('ol,ul').not(this);
            $this.sortable({
                connectWith: $assdList,
                placeholder: 'ui-state-highlight',
                receive: function (event, ui) { adopt($this); },
                remove: function (event, ui) { orphan($this); },
                update: function (event, ui) { zebra($this); if (isSubmitList) { $submitBtn[0].disabled = false; } }
            }).disableSelection();
            if (isSubmitList) {
                var isInfusion = infusionRegX.test(this.id);
                $submitBtn.on('click', { $list: $this, isInfusionList: isInfusion }, sendSortingUpdate);
                if (!isInfusion) { $bolusList = $this; }
            }
        });
        $("#addBolusHeader").on("click", function () {
            var $inpt = $("#bolusHeader"),
                txt = $inpt.val();
                $validator = $("#bolusHeaderVal");
            if (isNaN(parseInt(txt))) {
                $bolusList.find('.empty').remove()
                $validator.hide();
                $inpt.val("");
                $bolusList.append('<li class="bolusSubHeader" data-id="' + txt + '">' + txt + '</li>');
                $inpt.removeClass('error');
                document.getElementById("submitBolusSort").disabled = false;
            } else {
                $validator.text("*Sub-headers cannot be a number");
                $inpt.addClass('error')
                $validator.show();
            }
        });
    }
    $cloneBolusBtn.on("click", function (e) {
        e.stopPropagation();
        ajaxShowWait();
        $.ajax({
            type: "POST",
            url: document.URL + '/CloneWardBoluses',
            data: JSON.stringify({ cloneFromId: $cloneBolusBtn.data("cloneFrom"), cloneToId: $cloneBolusBtn.data("cloneTo") }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function () {
                ajaxSuccess();
                $cloneBolusBtn.prop("disabled", true);
            },
            error: ajaxError
        });
    })
});
//list sorting
function zebra($which) {
    $which.each(function () {
        $(this).children('li').each(function (index) {
            if (index % 2) {
                $(this).removeClass('alternateItem').addClass('stdItem');
            } else {
                $(this).removeClass('stdItem').addClass('alternateItem');
            }
        });
    });
}
function adopt($which) {
    $which.children('.empty').remove();
}
function orphan($which) {
  if ($which.children().length == 0) {
      $which.append($('<li class="empty alternateItem">empty</li>'));
  }
}
function buildSortingArray($list, toInt, maxInfusions) {
    var $selectedDrugs = $list.children(), //w3c spec states only li are valid children
        noOfDrugs = $selectedDrugs.length;
    if (noOfDrugs == 1 && $selectedDrugs.first().hasClass("empty")) {
        return [];
    } else if (noOfDrugs > maxInfusions) {
        var answer = confirm('only ' + maxInfusions + ' drugs will fit on 1 page - do you wish to continue?');
        if (!answer) {
            return false;
        }
    }
    if (toInt) {
        return $.map($selectedDrugs, function (el) {
            return parseInt(el.getAttribute("data-id"));
        })
    }
    return $.map($selectedDrugs, function (el) {
        return el.getAttribute("data-id");
    })
}
function GetAntiForgeryToken() {
    var tokenField = $("input[type='hidden'][name$='RequestVerificationToken']");
    if (tokenField.length == 0) { return null; }
    else {
        return {
            name: tokenField[0].name,
            value: tokenField[0].value
        };
    }
};
$.ajaxPrefilter(function (options, localOptions, jqXHR) {
    var token;
    if (options.type.toLowerCase() !== 'get') {
        token = GetAntiForgeryToken();
        if (!token.name) { throw new ReferenceError("Cannot find antiforgery token"); }
        /*
        if (options.data.indexOf(token.name) === -1) {
            options.data = options.data + '&' + token.name + '=' + token.value;
        }
        */
        jqXHR.setRequestHeader(token.name, token.value);
    }
});
function sendSortingUpdate(e) {
    var sortOrder = buildSortingArray(e.data.$list, e.data.isInfusionList, e.data.isInfusionList ? 17 : 19),
        wardIntVal = parseInt($('select').filter('[id$=DptDropDownList]:first').val()),
        $updateOutcome = $(this).siblings('.updateStatus:first'),
        that = this;
    if (!sortOrder || isNaN(wardIntVal)) { return false; }
    ajaxShowWait();
    $.ajax({
        type: "POST",
        url: document.URL + (e.data.isInfusionList ? '/UpdateInfusionOrder' : '/UpdateBolusOrder'),
        data: JSON.stringify({ wardId: wardIntVal, drugIdlist: sortOrder }),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function () {
            ajaxSuccess();
            that.disabled = true;
        },
        error: ajaxError
    });
};
function ajaxShowWait() {
    $('<div id="waitUpdating">Please wait updating...</div>').appendTo('Body');
}
function ajaxSuccess() {
    $("#waitUpdating").remove();
    $updateOutcome.removeClass('errorUpdating').text('Successfully updated:' + Date().toString());
};
function ajaxError(result) {
    var fullDetails = '(' + result.status + " : " + result.statusText + ')'
    alert("Unable to update:" + fullDetails);
    $("#waitUpdating").remove();
    $('#updatingOrderProgress').addClass('errorUpdating').text('Update failed:' + Date().toString() + ' ' + fullDetails);
}
