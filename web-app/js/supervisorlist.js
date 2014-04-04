//START DOCUMENT READY FUNCTION
$( document ).ready(function() {
	//Initialize foundation
	$(document).foundation();
	//#################### JQUERY AUTOCOMPLETE
	
	$(".assignsupervisor").change(function(e) {
  		var supervisorid = $(".assignsupervisor option:selected").attr('value');
  		console.log("supervisorid " + supervisorid );
  		$(":checked").attr("value",supervisorid);
	});

	

//END of Document Ready code
});