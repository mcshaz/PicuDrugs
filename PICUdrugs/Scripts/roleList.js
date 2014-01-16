var showWardManager = function () {
    if (arguments[0] === true && !this.checked) {
        $(this).siblings('div').hide();
    } else if (this.checked) {
        $(this).siblings('div').slideDown('fast');
    } else {
        $(this).siblings('div').slideUp('fast');
    }
},
$roleCBs,
CBValHandlerSet = false;
$(document).ready(function () {
    var $showCB = $('input[name$=wardAdmin]'),
        onclick = $showCB.attr('onclick'),
        roleCBsAutoPostBack = (onclick && onclick.indexOf('__doPostBack') > -1);
    $roleCBs = $showCB.add('input[name$=websiteAdmin]').add('input[name$=drugAdmin]');
    //if autoPostBack, will all be handled on page load, and so click event handler not required
    if (!roleCBsAutoPostBack) {
        $showCB.on('click', showWardManager);
    }
    showWardManager.call($showCB[0],true);
});
var valOneChecked = function (source, args) {
    var IsValid = false;
    $roleCBs.each(function () {
        if (this.checked) {
            IsValid = true;
            return false;
        }
    });
    if (!IsValid & !CBValHandlerSet) {
        var valGrp = source.validationGroup;
        $roleCBs.on('change', function () {
            Page_ClientValidate(valGrp);
        });
        CBValHandlerSet = true;
    }
    args.IsValid = IsValid;
};