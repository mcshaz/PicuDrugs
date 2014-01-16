$(document).ready(function() {
    //topmenu
    var $displaySpan = $('.displayDetails'),
        $nextDiv = $displaySpan.next('div');
    if ($nextDiv.hasClass("readOnlyMode")) { $nextDiv.hide(); }
    $('.displayDetails').on('click', function () {
        if ($nextDiv.is(':visible')) {
            $nextDiv.fadeOut();
            $displaySpan.removeClass('selectedMenuItem');
        } else {
            $nextDiv.fadeIn();
            $displaySpan.addClass('selectedMenuItem');
        }
    });
});