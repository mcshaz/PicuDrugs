$(document).ready(function () {
    var userName = document.getElementById(PICU.userNameId);
    $('#' + PICU.emailId).bind('keypress', function (e) {
        if (e.which === 64) {
            userName.value = this.value;
        }
    });
});