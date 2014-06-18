$(document).ready(function() {
    //topmenu
    var $displaySpan = $('.displayDetails'),
        $nextDiv = $displaySpan.next('div');
    if ($nextDiv.hasClass("readOnlyMode")) { $nextDiv.hide(); }
    $displaySpan.on('click', function () {
        if ($nextDiv.is(':visible')) {
            $nextDiv.fadeOut();
            $displaySpan.removeClass('selectedMenuItem');
        } else {
            $nextDiv.fadeIn();
            $displaySpan.addClass('selectedMenuItem');
        }
    });
    var blockEls = 'p,h1,h2,h3,h4,h5,h6,pre,div,address,caption'
    tinymce.init({
        selector: "textarea.rich",
        // consider in future charmap spellchecker
        plugins: [
                "textcolor"
        ],
        block_formats:"Heading 1=h1;Heading 2=h2;Heading 3=h3;Paragraph=p",
        toolbar1: "bold italic underline forecolor | formatselect | fontselect fontsizeselect | alignleft aligncenter alignright | outdent indent | styleselect removeformat",
        //doctype:"<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Strict//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd'>",
        menubar: false,
        //forced_root_block : false,
        width:"100%",
        content_css: "/Content/ChartHeader.css",
        style_formats: [
                { title: 'Line Height:' },
                { title: '1', selector: blockEls, styles: {lineHeight: "1"} },
                { title: '1.5', selector: blockEls, styles: {lineHeight: "1.5"} },
                { title: '2', selector: blockEls, styles: {lineHeight: "2"} },
                { title: 'Margins Above/Below:' },
                { title: '6 pt', selector: blockEls, styles: {marginTop: "6pt", marginBottom: "6pt"} },
                { title: '12 pt', selector: blockEls, styles: {marginTop: "12pt", marginBottom: "12pt"} },
                { title: '18 pt', selector: blockEls, styles: {marginTop: "18pt", marginBottom: "18pt"} },
                { title: 'Border:' },
                { title: 'None', selector: blockEls, styles: {borderStyle: "none"} },
                { title: 'Thin', selector: blockEls, styles: {borderStyle: "solid", borderColor:"#000000",borderWidth:"thin"} }
        ]
    });
});