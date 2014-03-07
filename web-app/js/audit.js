$( document ).ready(function() {
	// check the grantors
	//var one = $("#auditDocumentNumber0 :input");
	//var two = $("#auditDocumentNumber1 :input");
	var one = $("#auditDocumentNumber0 .city-sub-block-lot").not("input:hidden");
	var two = $("#auditDocumentNumber1 .city-sub-block-lot").not("input:hidden");
	console.log("GOT THE INPUT");
	jQuery.each(one, function(index, value){
		console.log("value loop 1: " + value);
		if ($(this).is( ":hidden" ) == true(
			$(one).remove(value);
			console.log("removed");
		)
	});
	jQuery.each(two, function(index, value){
		console.log("value loop 2: " + value);
	});
	
	if(_.isEqual(one, two)){
		console.log("It's equal");
	}else{
		$("#auditDocumentNumber1 .grantor-grantee").addClass("selected");
	}
});
	// END - SAVE DOCUMENT VIA AJAX WITH JSON