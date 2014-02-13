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


function addNewInputGrantor(i) {
    return $('<p class="form-paragraph"><input class="grantor" type="text"  id="grantor" name="grantor" value="" /> </p>');
}
function addNewInputGrantee(j) {
    return $('<p class="form-paragraph"><input  class="grantee" type="text" id="grantee" name="grantee"  value="" /> </p>');
}
//TODO: refactor this to copy the existing row in the DOM
function addNewInputRelatedDocuments(k) {
	//The book type options have to be rendered in the .gsp page as we do not have them in the 
	// document.js file since this file is not parsed by the server.
	// This function call grabs them from a function in the create.gsp file so we can add them
	// to a related documents new line select field.
    var optionsString = getBookTypeOptions();
	return $('<div class="a_related_document"><div class="form-paragraph large-2 columns"><label>Book Type</label><select id="relatedDocumentBookType' + k + '"  required="" class="relatedDocumentBookType chosen-select" >' + optionsString + '</select></div><div class="form-paragraph large-2 columns"><label>Book Number</label><input class="related-documents-book-number" type="text" id="relatedDocumentBookNumber' + k + '" value="" /></div><div class="form-paragraph large-2 columns"><label>Page #</label><input class="related-documents-page-number" type="text" id="relatedDocumentPageNumber' + k + '" value="" /></div><div class="form-paragraph large-6 columns"><label>Instrument #</label><input class="related-documents-instrument-number" type="text" id="relatedDocumentInstrumentNumber' + k + '" value="" /></div></div>');
}
function decorateSecTwnRange(e){
	var elements = $(this).parent().parent().find('.sec-twn-rge');
	$.each(elements, function(){
		$(this).on('keyup',eventHandlerSecTwnRge);
	});
	console.log("DECORATE SECTION TWN RANGE");
}
function decorateCtySubBlkLot(){
	var elements = $(this).parent().parent().find('.city-sub-block-lot');
	$.each(elements, function(){
		$(this).on('keyup',eventHandlerCtySubBlkLot);
	});
	console.log("DECORATE SECTION TWN RANGE");
}
function eventHandlerCtySubBlkLot(e){
	var code = e.keyCode || e.which;
     if (code == 13) {
		console.log("IN EVENT HANDER: Adding New Line CITY SUB BLK LOT");
		addNewLineCtySubBlkLot()
        return false;
     }
}
function eventHandlerSecTwnRge(e) {
	var code = e.keyCode || e.which;
     if (code == 13) {
		console.log("IN EVENT HANDER: Adding New Line Section Twn Range");
		addNewLineSecTwnRge()
        return false;
     }
}
function addNewLineCtySubBlkLot(){
	var div = $('#city_sub_block_lot_wrapper');
    var l = $(".city").size() + 1;
    var new_item = addNewCitySubBlkLot(l);
    $(new_item).appendTo(div);
	var the_input = new_item.find(".city");
	new_item.find('.popout').popBox();
    the_input.focus();
    the_input.select();
	$(new_item).find('.uppercase').on('keyup', function () {
		this.value = this.value.toUpperCase()
	});
	console.log("Adding New Line Section Twn Range");
	$(the_input).on('keyup', decorateCtySubBlkLot);
    return false;
}
function addNewLineSecTwnRge() {
	var div = $('#section_township_range_wrapper');
    var i = $(".section").size() + 1;
    var new_item = addNewInputSecTwnRge(i);
    $(new_item).appendTo(div);
	var the_input = new_item.find(".section");
	new_item.find('.popout').popBox();
    the_input.focus();
    the_input.select();
	$(new_item).find('.uppercase').on('keyup', function () {
		this.value = this.value.toUpperCase()
	});
	console.log("Adding New Line CITY SUB BLK LOT");
	$(the_input).on('keyup', decorateSecTwnRange);
    return false;
}


//TODO: refactor this to just copy the existing DOM row and replace the id numbers
function addNewInputSecTwnRge(l) {
	return $('<div class="a_section_township_range row"><div class="form-paragraph large-2 columns"><label>SECTION</label><input type="text" id="section" name="section[' + (l-1) + ']" class="uppercase section sec-twn-rge" size="400" /></div><div class="form-paragraph large-1 columns"><label>TOWNSHIP #</label><input type="text" id="townshipNumber" name="townshipNumber[' + (l-1) + ']" class="uppercase sec-twn-rge"/></div><div class="form-paragraph large-2 columns"><label>TOWNSHIP DIRECTION</label><input type="text" id="townshipDirection" name="townshipDirection[' + (l-1) + ']" class="uppercase township sec-twn-rge"/></div><div class="form-paragraph large-2 columns"><label>Range Number</label><input type="text" id="rangeNumber" class="uppercase rangeNumber[' + (l-1) + '] sec-twn-rge"/></div><div class="form-paragraph large-2 columns"><label>RANGE DIRECTION</label><input type="text" id="rangeDirection" name="rangeDirection[' + (l-1) + ']" class="uppercase range sec-twn-rge"/></div><div class="form-paragraph large-1 columns"><label>Acre</label><input type="text" id="acre" name="sec-twn-rge-acre[' + (l-1) + ']" class="acre sec-twn-rge"/></div><div class="form-paragraph large-1 columns"><label>Assessor #</label><input type="text" id="assessorNumber" name="sec-twn-rge-assessorNumber[' + (l-1) + ']" class="uppercase township sec-twn-rge"/></div><div class="form-paragraph large-1 columns metesBounds"><label>Metes & Bounds</label><input type="text"  id="MetesBoundsTextArea' + l + '" name="sec-twn-rge-metesBounds[' + (l-1) + ']"  class="uppercase popout focusme sec-twn-rge" /></div></div>');
}
function addNewCitySubBlkLot(i) {
	return $('<div class="a_city_sub_block_lot row"><div class="form-paragraph large-2 columns"><label>City</label><input type="text" id="city" name="city['+ (i-1) +']" size="400" class="city uppercase city-sub-block-lot"/></div><div class="form-paragraph large-2 columns"><label>Sub</label><input type="text" size="400" id="sub" name="sub['+ (i-1) +']"class="uppercase city-sub-block-lot" /></div><div class="form-paragraph large-1 columns"><label>Block</label><input type="text" size="400" id="block" name="block['+ (i-1) +']" class="uppercase city-sub-block-lot" /></div><div class="form-paragraph large-1 columns"><label>Lot</label><input type="text" name="lot['+ (i-1) +']" id="lot" class="uppercase city-sub-block-lot" /></div><div class="form-paragraph large-1 columns"><label>Acre</label><input type="text" name="acre['+ (i-1) +']" id="city-sub-blk-lot-acre" class="acre uppercase city-sub-block-lot"/></div><div class="form-paragraph large-3 columns"><label>Assessor #</label><input type="text" id="assessorNumber" id="city-sub-block-lot-assessorNumber"name="city-sub-block-lot-assessorNumber['+ (i-1) +']" class="uppercase city-sub-block-lot"/></div><div class="form-paragraph large-2 columns"><label>Metes & Bounds</label><input type="text"  id="city-sub-block-lot-metes-bounds" name="city-sub-block-lot-metesBounds['+ (i-1) +']"  class="uppercase popout city-sub-block-lot" /></div></div>');
}



//START DOCUMENT READY FUNCTION
$( document ).ready(function() {
	//Initialize foundation
	$(document).foundation();
	
	//setup all the typeahead dropdowns with chosen.js
	$(".chosen-select").chosen();
	//make the first field have focus using chosen.js message
	$("#BookType").trigger('chosen:activate');
	//setup certain fields to pop up a textbox for input
	$(".popout").popBox();
	// START - SAVE DOCUMENT VIA AJAX WITH JSON
	$.key('ctrl+j', function(){
		console.log('ajaxit');
		console.log("postJSON is " + JSON.stringify($('#create_doc_form').serializeArray()));
		jQuery.ajax({type:'POST',
			data:jQuery('#create_doc_form').serializeArray(),
			dataType: 'json',
		 	url:'/virtualcourthouse/document/save.json',
		 	success:function(data,textStatus){
			 alert("saved record");
			 console.log("RETURN JSON: " + JSON.stringify(data));
		 	},
		 	error:function(XMLHttpRequest,textStatus,errorThrown){
				console.log("ERROR: " + errorThrown);
		 	},
		    complete: function() {
				console.log("COMPLETE")
		    }
 		});
	});
	// END - SAVE DOCUMENT VIA AJAX WITH JSON
	
	//create new grantor fields dynamically
    var grantor_div = $('#grantors_wrapper');
    var i = $(".grantor").size() + 1;
    $('#grantor').on('keyup', function (e) {
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
    //create new grantee fields dynamically
    var grantee_div = $('#grantees_wrapper');
    var j = $(".grantee").size() + 1;
    $('#grantee').on('keyup', function (e) {
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
	/** create new related documents lines dynamically
		by registering an event on the instrument number 
	line to capture a return event and create a new line			*/
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
	//Start Legal Description SEC TWN RGE
	$('.sec-twn-rge').on('keyup', eventHandlerSecTwnRge);
	//END Legal Description SEC TWN RGE
	//change fields to uppercase
	$('.uppercase').keyup(function(){
	    this.value = this.value.toUpperCase();
	});
	//END change fields to uppercase

//END of Document Ready code
});