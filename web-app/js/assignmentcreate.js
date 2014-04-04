var win;

function popup(url, winName, xOffset, yOffset) {
	var x = (window.screenX || window.screenLeft || 0) + (xOffset || 0);
	var y = (window.screenY || window.screenTop || 0) + (yOffset || 0);
  	return	window.open(url,winName,"toolbar=yes, scrollbars=yes, resizable=yes, top="+y+", left="+x+", width=1200, height=1800");
}


//START DOCUMENT READY FUNCTION
$( document ).ready(function() {
	//Initialize foundation
	$(document).foundation();
	$('body').one('click','.imageselect', function () {
		var url = "/virtualcourthouse/district/images/" + districtId;
		win = popup(url, 'imagelist', 900, 0);
    });
	
	
//END of Document Ready code
});