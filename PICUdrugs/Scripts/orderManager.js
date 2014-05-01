$(document).ready(function () {
    var $lists = $('.listOrder'),
        $submitBtns = $('input').filter('[id^=submit]'),
        $bolusList,
        submitRegX = /included/i,
        infusionRegX = /infusion/i;
    zebra($lists);
    $(".clickHandle").on('click', function () {
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
        })
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
function sendSortingUpdate(e) {
    var sortOrder = buildSortingArray(e.data.$list, e.data.isInfusionList, e.data.isInfusionList ? 17 : 19),
        wardIntVal = parseInt($('select').filter('[id$=DptDropDownList]:first').val()),
        $updateOutcome = $(this).siblings('.updateStatus:first'),
        $waitUpdate,
        that = this,
        tokenField = $("input[name$='RequestVerificationToken']")[0],
        tokenObject = {};
    if (!sortOrder || isNaN(wardIntVal) || !tokenField) { return false; }
    $waitUpdate = $('<div id="waitUpdating">Please wait updating...</div>').appendTo('Body');
    tokenObject[tokenField.name] = tokenField.value
    $.ajax({
        type: "POST",
        url: document.URL + (e.data.isInfusionList ? '/UpdateInfusionOrder' : '/UpdateBolusOrder'),
        data: JSON.stringify({ wardId: wardIntVal, drugIdlist: sortOrder }),
        headers: tokenObject ,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function () {
            $waitUpdate.remove();
            that.disabled = true;
            $updateOutcome.removeClass('errorUpdating').text('Successfully updated:' + Date().toString());
        },
        error: function (result) {
            var fullDetails = '(' + result.status + " : " + result.statusText + ')'
            alert("Unable to update:" + fullDetails);
            $waitUpdate.remove();
            $('#updatingOrderProgress').addClass('errorUpdating').text('Update failed:' + Date().toString() + ' ' + fullDetails);
        }
    });
}
