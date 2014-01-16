$(document).ready(function(){
    var now = new Date();
    $('.dateValue').text(now.format('dddd, mmmm d, yyyy'));
});
// a global month names array
var gsMonthNames = new Array(
	'January',
	'February',
	'March',
	'April',
	'May',
	'June',
	'July',
	'August',
	'September',
	'October',
	'November',
	'December'
); 
// a global day names array
var gsDayNames = new Array(
	'Sunday',
	'Monday',
	'Tuesday',
	'Wednesday',
	'Thursday',
	'Friday',
	'Saturday'
); 
// the date format prototype
Date.prototype.format = function (f) {
    if (!this.valueOf())
        return ' ';

    var d = this;

    return f.replace(/(yyyy|mmmm|mmm|mm|dddd|ddd|dd|d|hh|nn|ss|a\/p)/gi,
        function ($1) {
            switch ($1.toLowerCase()) {
                case 'yyyy': return d.getFullYear();
                case 'mmmm': return gsMonthNames[d.getMonth()];
                case 'mmm': return gsMonthNames[d.getMonth()].substr(0, 3);
                case 'mm': return (d.getMonth() + 1).zf();
                case 'dddd': return gsDayNames[d.getDay()];
                case 'ddd': return gsDayNames[d.getDay()].substr(0, 3);
                case 'dd': return d.getDate().zf();
                case 'd': return d.getDate();
                case 'hh': return ((h = d.getHours() % 12) ? h : 12).zf();
                case 'nn': return d.getMinutes().zf();
                case 'ss': return d.getSeconds().zf();
                case 'a/p': return d.getHours() < 12 ? 'a' : 'p';
            }
        }
    );
}
Number.prototype.zf = function () {
    var returnVal = this.toString();
    return returnVal.length > 1 ? returnVal : ("0" + returnVal);
}