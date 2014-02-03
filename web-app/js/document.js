function eventHandlerGrantor(e) {
    var code = e.keyCode || e.which;
    if (code == 13) {           
       var i = $(".grantor").size() + 1;
       var a_new_field = addNewInputGrantor(i);
       var div = $('#grantors_wrapper');
       $(a_new_field).on('keyup', eventHandlerGrantor);
       $(a_new_field).appendTo(div);
       var the_input = a_new_field.find(">:first-child");
       the_input.focus();
       the_input.select();
       return false;
    }
}
function eventHandlerGrantee(e) {
    var code = e.keyCode || e.which;
    if (code == 13) {           
       var i = $(".grantee").size() + 1;
       var a_new_field = addNewInputGrantee(i);
       var div = $('#grantees_wrapper');
       $(a_new_field).on('keyup', eventHandlerGrantee);
       $(a_new_field).appendTo(div);
       var the_input = a_new_field.find(">:first-child");
       the_input.focus();
       the_input.select();
       return false;
    }
}
function eventHandlerRelatedDocuments(e) {
    var code = e.keyCode || e.which;
    if (code == 13) {           
		var i = $(".a_related_document").size() + 1;
		console.log("related documents size is " + i);
		var a_new_field = addNewInputRelatedDocuments(i);
		var div = $('#related_documents_wrapper');
		$(a_new_field).on('keyup', eventHandlerRelatedDocuments);
		$(a_new_field).appendTo(div);
		$(".chosen-select").chosen();
		var relatedDocumenBookTypeIdString = '#relatedDocumentBookType' + i
		console.log('string for book type id lookup: ' +relatedDocumenBookTypeIdString);
		$(relatedDocumenBookTypeIdString).trigger('chosen:activate');
		//deal with list overflow
		//$(".chosen-select").on("chosen:showing_dropdown", function () { 
		//	$(".related-doc-panel").css("overflow", "visible");
		//});
		//$(".chosen-select").on("chosen:hiding_dropdown", function () {
		//	$(".related-doc-panel").css("overflow", "");
		//});
        return false;
    }
}
function eventHandlerSecTwnRge(e) {
	var code = e.keyCode || e.which;
     if (code == 13) {
		var sec_twn_rge_div = $('#section_township_range_wrapper');
		var l = $(".section").size() + 1;
		console.log('adding new line - new number for the line is: ' + l);
        var new_item = addNewInputSecTwnRge(l);
        $(new_item).on('keyup', eventHandlerSecTwnRge);
        $(new_item).appendTo(sec_twn_rge_div);
		var the_input = new_item.find(".section");
        the_input.focus();
        the_input.select();
        return false;
     }
}
function addNewInputGrantor(i) {
    return $('<p class="form-paragraph"><input class="grantor" type="text"  id="grantor' + i + '"  value="" /> </p>');
}
function addNewInputGrantee(j) {
    return $('<p class="form-paragraph"><input  class="grantee" type="text" id="grantee' + j + '"  value="" /> </p>');
}
function addNewInputRelatedDocuments(k) {
	//The book type options have to be rendered in the .gsp page so we do not have them in the 
	// document.js file since this file is not parsed by the server.
	// so this function call grabs them from a function in the create.gsp file so we can add them
	// to a related documents new line select field.
    var optionsString = getBookTypeOptions();
	return $('<div class="a_related_document"><div class="form-paragraph large-2 columns"><label>Book Type</label><select id="relatedDocumentBookType' + k + '"  required="" class="relatedDocumentBookType chosen-select" >' + optionsString + '</select></div><div class="form-paragraph large-2 columns"><label>Book Number</label><input class="related-documents-book-number" type="text" id="relatedDocumentBookNumber' + k + '" value="" /></div><div class="form-paragraph large-2 columns"><label>Page #</label><input class="related-documents-page-number" type="text" id="relatedDocumentPageNumber' + k + '" value="" /></div><div class="form-paragraph large-6 columns"><label>Instrument #</label><input class="related-documents-instrument-number" type="text" id="relatedDocumentInstrumentNumber' + k + '" value="" /></div></div>');
}
function addNewInputSecTwnRge(l) {
	return $('<div class="a_section_township_range"><div class="form-paragraph large-1 columns"><label>Section</label><input type="text" id="section'+ l +'" class="section" /></div><div class="form-paragraph large-1 columns"><label>Township</label><input type="text" id="township'+ l +'" class="township"/></div><div class="form-paragraph large-2 columns"><label>Range</label><input type="text" id="range'+ l +'" class="range"/></div><div class="form-paragraph large-8 columns"><label>Metes & Bounds</label><input type="text" id="sec-twn-rge-metes-bounds'+ l +'" class="sec-twn-rge-metes-bounds" size="200"/></div></div>');
}
//JQuery Document ready funtion that registers the functions to add fields, 
// starts foundation
$( document ).ready(function() {
	$(document).foundation();
	$(".chosen-select").chosen();
	$("#BookType").trigger('chosen:activate');
	//handle grantors
    var grantor_div = $('#grantors_wrapper');
    var i = $(".grantor").size() + 1;
    $('#grantor1').on('keyup', function (e) {
		var code = e.keyCode || e.which;
        if (code == 13) {
            var new_item = addNewInputGrantor(i);
            $(new_item).on('keyup', eventHandlerGrantor);
            $(new_item).appendTo(grantor_div);
            var the_input = new_item.find(">:first-child");
            the_input.focus();
            the_input.select();
            i++;
            return false;
        }
    });
	//end handle grantors
    //handle grantees
    var grantee_div = $('#grantees_wrapper');
    var j = $(".grantee").size() + 1;
    $('#grantee1').on('keyup', function (e) {
        var code = e.keyCode || e.which;
        if (code == 13) {
            var new_item = addNewInputGrantee(i);
            $(new_item).on('keyup', eventHandlerGrantee);
            $(new_item).appendTo(grantee_div);
            var the_input = new_item.find(">:first-child");
            the_input.focus();
            the_input.select();
            j++;
            return false;
        }
    });
	//end handle grantees
	//handle related documents
    $('#relatedDocumentInstrumentNumber1').on('keyup', function (e) {
        var code = e.keyCode || e.which;
        if (code == 13) {
			var related_documents_div = $('#related_documents_wrapper');
		    var k = $(".relatedDocumentBookType").size() + 1;
            var new_item = addNewInputRelatedDocuments(k);
            $(new_item).on('keyup', eventHandlerRelatedDocuments);
            $(new_item).appendTo(related_documents_div);
			$(".chosen-select").chosen();
			var relatedDocumenBookTypeIdString = '#relatedDocumentBookType' + k;
			$(relatedDocumenBookTypeIdString).trigger('chosen:activate');
			//$(".chosen-select").on("chosen:showing_dropdown", function () { 
			//	$(".related-doc-panel").css("overflow", "visible");
			//});
			//$(".chosen-select").on("chosen:hiding_dropdown", function () {
			//	$(".related-doc-panel").css("overflow", "");
			//});
            k++;
            return false;
        }
    });
	//end handle related documents
	//Start Legal Description
	$('#sec-twn-rge-metes-bounds1').on('keyup', function (e) {
        var code = e.keyCode || e.which;
        if (code == 13) {
			var sec_twn_rge_div = $('#section_township_range_wrapper');
		    var l = $(".section").size() + 1;
            var new_item = addNewInputSecTwnRge(l);
            $(new_item).on('keyup', eventHandlerSecTwnRge);
            $(new_item).appendTo(sec_twn_rge_div);
			var the_input = new_item.find(".section");
            the_input.focus();
            the_input.select();

            l++;
            return false;
        }
    });
	//END Legal Description
	
//END of Document Ready code
});