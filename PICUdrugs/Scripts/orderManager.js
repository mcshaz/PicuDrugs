﻿; (function ($) {
    $(document).ready(function () {
        var $lists = $('.listOrder'),
            $submitBtns = $('input').filter('[id^=submit]'),
            $bolusList,
            submitRegX = /included/i,
            infusionRegX = /infusion/i,
            $cloneBolusBtn = $("#MainContent_cloneBolusGo"),
            $cloneBolusSelect = $("#MainContent_cloneBolusSelect");
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
                var mce = tinyMCE.get('bolusHeader'),
                    $mceBody = $(mce.getBody()),
                    $validator = $("#bolusHeaderVal"),
                    displayError = function(msg)
                    {
                        $validator.text('*' + msg);
                        $mceBody.addClass('error')
                        $validator.show();
                    },
                    txt = mce.getContent(),
                    li, regexFromStr, regexToStr;
                
                if (isNaN(parseInt(txt))) {
                    //add new li
                    li = document.createElement('li');
                    li.className = "bolusSubHeader";
                    regexFromStr = '<!--\\s*pagebreak\\s*-->';
                    regexToStr = '-- pagebreak --'
                    li.innerHTML = txt.replace(new RegExp('<\\s*(\\w+)\\s*>[\\r\\n\\s]*'+regexFromStr+'[\\r\\n\\s]*</\\s*\\1\\s*>',"gi"),regexToStr)
                        .replace(new RegExp(regexFromStr, "gi"), regexToStr);
                    if (li.innerHTML == "ETT size") {
                        displayError("'ETT size' is a protected term to denote calculation of ett size");
                        return;
                    }
                    if (li.innerHTML.length > 512) {
                        displayError("The header is too long");
                        return;
                    }

                    $bolusList.append(li);
                    //cleanup
                    $bolusList.find('.empty').remove()
                    $validator.hide();
                    mce.setContent('');
                    $mceBody.removeClass('error');
                    //prepare for submit
                    document.getElementById("submitBolusSort").disabled = false;
                
                } else {
                    displayError("Sub-headers cannot be a number");
                }
            });
        }
        $cloneBolusSelect.on('click', function (e) {
            e.stopPropagation();
        });
        $cloneBolusBtn.on("click", function (e) {
            var that = this;
            e.stopPropagation();
            ajaxShowWait();
            $.ajax({
                type: "POST",
                url: document.URL + '/CloneWardBoluses',
                data: JSON.stringify({ cloneFromId: $cloneBolusBtn.data("cloneFrom"), cloneToId: $cloneBolusSelect.val() }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function () {
                    ajaxSuccess.call(that);
                    $cloneBolusBtn.prop("disabled", true);
                    $cloneBolusSelect.children(':selected').remove();
                },
                error: ajaxError
            });
        })
        tinymce.init({
            selector: "#bolusHeader",
            // consider in future charmap spellchecker
            plugins: [
                    "pagebreak textcolor"
            ],
            toolbar1: "bold italic underline forecolor | fontselect fontsizeselect | alignleft aligncenter alignright | outdent indent | pagebreak | styleselect removeformat",
            //doctype:"<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Strict//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd'>",
            menubar: false,
            forced_root_block : 'div',
            width: "100%",
            content_css: "/Content/ChartHeader.css",
            style_formats: [
                { title: 'Row Header', selector: 'div', classes: 'RowHeader' },
                { title: 'Concentration', inline: 'span', classes: "concentration" },
                { title: 'Route', inline: 'span', classes: "route" }
            ]
        });
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
            return el.getAttribute("data-id") || el.innerHTML.replace(/-- pagebreak --/g, '<!-- pagebreak -->'); //wont work if id of 0 is used
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
                ajaxSuccess.call(that);
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
        $(this).siblings('.updateStatus:first').removeClass('errorUpdating').text('Successfully updated:' + Date().toString());
    };
    function ajaxError(result) {
        var fullDetails = '(' + result.status + " : " + result.statusText + ')'
        alert("Unable to update:" + fullDetails);
        $("#waitUpdating").remove();
        $('#updatingOrderProgress').addClass('errorUpdating').text('Update failed:' + Date().toString() + ' ' + fullDetails);
    }
})(jQuery);