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
    tinymce.init({
        selector: "textarea.rich",
        // consider in future charmap spellchecker
        plugins: [
                "pagebreak textcolor"
        ],
        block_formats:"Heading 1=h1;Heading 2=h2;Heading 3=h3;Paragraph=p",
        toolbar1: "bold italic underline forecolor | formatselect | fontselect fontsizeselect",
        //doctype:"<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Strict//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd'>",
        menubar: false,
        forced_root_block : false,
        width:"100%",
        content_css: "/Content/ChartHeader.css"
        /*
        style_formats: [
                { title: 'Bold text', inline: 'b' },
                { title: 'Red text', inline: 'span', styles: { color: '#ff0000' } },
                { title: 'Red header', block: 'h1', styles: { color: '#ff0000' } },
                { title: 'Example 1', inline: 'span', classes: 'example1' },
                { title: 'Example 2', inline: 'span', classes: 'example2' },
                { title: 'Table styles' },
                { title: 'Table row 1', selector: 'tr', classes: 'tablerow1' }
        ],
        */
    });
});