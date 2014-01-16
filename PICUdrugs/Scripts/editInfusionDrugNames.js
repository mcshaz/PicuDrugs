function clientFullnameVal(source, args) {
    // var fullname = document.getElementById('MainContent_GridView1_fullnameText_0'); trim(fullname.value);
    var validateText = trim(args.Value);
    if (validateText.length == 0) {
        args.isValid = false
        source.erormessage = "Cannot be empty!"
    } else {
        
    }
}
function trim(text) {
    var start = 0;
    while (text.charAt(start)==" "){
        start++;
    }
    var end = text.length -1;
    while(text.charAt(end)==" "){
        end--;
    }
    return text.substring(start, end+1)
}