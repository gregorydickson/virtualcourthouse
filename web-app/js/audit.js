function compareElements(compareThis, toThis) {
	var compare = true;
	if (!compareThis || toThis.length != compareThis.length) {
		compare = false;
		return compare;
	}
	jQuery.each(compareThis, function(index, value) {
		if ($(compareThis[index]).attr("value") != $(toThis[index]).attr("value")) {
			compare = false;
			return compare;
		} 
	});
	return compare;
}


$( document ).ready(function() {

	if($("#auditDocumentNumber0 #fileDate").attr("value") != $("#auditDocumentNumber1 #fileDate").attr("value")) {
		$("#auditDocumentNumber1 .file-date-wrapper").addClass("selected");
	}
	if($("#auditDocumentNumber0 #instrumentDate").attr("value") != $("#auditDocumentNumber1 #instrumentDate").attr("value")) {
		$("#auditDocumentNumber1 .instrument-date-wrapper").addClass("selected");
	}
	var one = $("#auditDocumentNumber0 .grantor");
	var two = $("#auditDocumentNumber1 .grantor");
	if(compareElements(one, two) == false){
		$("#auditDocumentNumber1 .grantors_wrapper").addClass("selected");
	}
	
	one = $("#auditDocumentNumber0 .grantee");
	two = $("#auditDocumentNumber1 .grantee");
	if(compareElements(one, two) == false){
		$("#auditDocumentNumber1 .grantees_wrapper").addClass("selected");
	}
	
	one = $("#auditDocumentNumber0 .sec-twn-rge");
	two = $("#auditDocumentNumber1 .sec-twn-rge");
	if(compareElements(one, two) == false){
		$("#auditDocumentNumber1 .section_township_range_wrapper").addClass("selected");
	}
	
	one = $("#auditDocumentNumber0 .city-sub-block-lot");
	two = $("#auditDocumentNumber1 .city-sub-block-lot");
	if(compareElements(one, two) == false){
		$("#auditDocumentNumber1 .city_sub_block_lot_wrapper").addClass("selected");
	}
	
	one = $("#auditDocumentNumber0 .tax-map-parcel");
	two = $("#auditDocumentNumber1 .tax-map-parcel");
	if(compareElements(one, two) == false){
		$("#auditDocumentNumber1 .tax_map_parcel_wrapper").addClass("selected");
	}
	
	one = $("#auditDocumentNumber0 .survey-abstract");
	two = $("#auditDocumentNumber1 .survey-abstract");
	if(compareElements(one, two) == false){
		$("#auditDocumentNumber1 .survey_abstract_wrapper").addClass("selected");
	}
	one = $("#auditDocumentNumber0 .related-documents");
	two = $("#auditDocumentNumber1 .related-documents");
	if(compareElements(one, two) == false){
		$("#auditDocumentNumber1 .related_documents_wrapper").addClass("selected");
	}
	
	one = $("#auditDocumentNumber0 .willNumber");
	two = $("#auditDocumentNumber1 .willNumber");
	if(compareElements(one, two) == false){
		$("#auditDocumentNumber1 .will-number-wrapper").addClass("selected");
	}
	one = $("#auditDocumentNumber0 .notes");
	two = $("#auditDocumentNumber1 .notes");
	if(compareElements(one, two) == false){
		$("#auditDocumentNumber1 .notes-wrapper").addClass("selected");
	}
	one = $("#auditDocumentNumber0 .imageIdAssigned");
	two = $("#auditDocumentNumber1 .imageIdAssigned");
	if(compareElements(one, two) == false){
		$("#auditDocumentNumber1 .images-assigned").addClass("selected");
	}
});
