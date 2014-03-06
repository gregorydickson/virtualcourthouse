$( document ).ready(function() {
	// check the grantors
	//var one = $("#auditDocumentNumber0 :input");
	//var two = $("#auditDocumentNumber1 :input");
	var one = form2js('auditDocumentNumber0','.',true)
	var two = form2js('auditDocumentNumber1','.',true)
	jQuery.each(one, function(index, value){
		console.log("value loop 1: " + value);
	});
	jQuery.each(two, function(index, value){
		console.log("value loop 2: " + value);
	});
	
	console.log("ME IS IQUAL: " + _.isEqual(one, two));
});
	// END - SAVE DOCUMENT VIA AJAX WITH JSON