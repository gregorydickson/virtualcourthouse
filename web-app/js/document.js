function sumAcres(){
	var acres = $(".acre");
	var num = new Number();
	var string;
	$.each(acres, function(){
		if($(this).val() != "")
		{
			num = num + parseInt($(this).val(),10);
		}
	});
	string = num.toString();
	string = string.replace(/^0+/, '');
	$('#acresTotal').text(string);
}

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
	return $('<div class="a_related_document"><div class="form-paragraph large-2 columns"><label>Book Type</label><select id="relatedDocumentBookType' + k + '" name="related-documents-book-type[' + (k-1) + ']" required="" class="relatedDocumentBookType chosen-select" >' + optionsString + '</select></div><div class="form-paragraph large-2 columns"><label>Book Number</label><input class="related-documents" name="related-documents-book-number[' + (k-1) + ']" type="text" /></div><div class="form-paragraph large-2 columns"><label>Page #</label><input class="related-documents" name="related-documents-page-number[' + (k-1) + ']" type="text"   /></div><div class="form-paragraph large-6 columns"><label>Instrument #</label><input class="related-documents" name="related-documents-instrument-number[' + (k-1) + ']" type="text"  /></div></div>');
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
	console.log("DECORATE  City Sub Blk Lot");
}
function decorateTaxMapParcel(){
	var elements = $(this).parent().parent().find('.tax-map-parcel');
	$.each(elements, function(){
		$(this).on('keyup',eventHandlerTaxMapParcel);
	});
	console.log("DECORATE TAX Map Parcel");
}
function decorateSurveyAbstract(){
	var elements = $(this).parent().parent().find('.survey-abstract');
	$.each(elements, function(){
		$(this).on('keyup',eventHandlerSurveyAbstract);
	});
	console.log("DECORATE Survey Abstract");
}
function eventHandlerSurveyAbstract(e){
	var code = e.keyCode || e.which;
     if (code == 13) {
		console.log("IN EVENT HANDER: Survey Abstract");
		addNewLineSurveyAbstract()
        return false;
     }
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
function eventHandlerTaxMapParcel(e){
	var code = e.keyCode || e.which;
     if (code == 13) {
		console.log("IN EVENT HANDER: Adding New Line TAX MAP PARCEL");
		addNewLineTaxMapParcel()
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
	$(new_item).find('.acre').on('blur',sumAcres);
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
	$(new_item).find('.acre').on('blur',sumAcres);
	$(new_item).find('.uppercase').on('keyup', function () {
		this.value = this.value.toUpperCase()
	});
	console.log("Adding New Line CITY SUB BLK LOT");
	$(the_input).on('keyup', decorateSecTwnRange);
    return false;
}
function addNewLineTaxMapParcel() {
	var div = $('#tax_map_parcel_wrapper');
    var i = $(".district").size() + 1;
    var new_item = addNewInputTaxMapParcel(i);
    $(new_item).appendTo(div);
	var the_input = new_item.find(".district");
	new_item.find('.popout').popBox();
    the_input.focus();
    the_input.select();
	$(new_item).find('.acre').on('blur',sumAcres);
	$(new_item).find('.uppercase').on('keyup', function () {
		this.value = this.value.toUpperCase()
	});
	console.log("Adding New Line TAX MAP PARCEL");
	$(the_input).on('keyup', decorateTaxMapParcel);
    return false;
}
function addNewLineSurveyAbstract(){
	var div = $('#survey_abstract_wrapper');
    var i = $(".survey").size() + 1;
    var new_item = addNewInputSurveyAbstract(i);
    $(new_item).appendTo(div);
	var the_input = new_item.find(".survey");
	new_item.find('.popout').popBox();
    the_input.focus();
    the_input.select();
	$(new_item).find('.acre').on('blur',sumAcres);
	$(new_item).find('.uppercase').on('keyup', function () {
		this.value = this.value.toUpperCase()
	});
	console.log("Adding New Line Survey Abstract");
	$(the_input).on('keyup', decorateSurveyAbstract);
    return false;
}
function addNewInputSurveyAbstract(i){
	return $('<div class="a_survey_abstract row"><div class="form-paragraph large-2 columns"><label>Survey</label><input type="text" size="400" name="survey[' + (i-1) + ']" class="survey uppercase survey-abstract"/></div><div class="form-paragraph large-1 columns"><label>Abstract</label><input type="text" name="abstract[' + (i-1) + ']" class="uppercase survey-abstract"/></div><div class="form-paragraph large-2 columns"><label>Block</label><input type="text" name="survey-abstract-block[' + (i-1) + ']" class="uppercase survey-abstract" /></div><div class="form-paragraph large-2 columns"><label>Lot</label><input type="text" name="survey-abstract-lot[' + (i-1) + ']" class="uppercase survey-abstract" /></div><div class="form-paragraph large-2 columns"><label>Sec</label><input type="text" name="survey-abstract-section[' + (i-1) + ']" class="uppercase survey-abstract" /></div><div class="form-paragraph large-1 columns"><label>Acre</label><input type="text" name="survey-abstract-acre[' + (i-1) + ']" id="survey-abstract-acre" class="uppercase survey-abstract"/></div><div class="form-paragraph large-1 columns"><label>Assessor #</label><input type="text" name="survey-abstract-assessorNumber[' + (i-1) + ']" class="uppercase survey-abstract"/></div><div class="form-paragraph large-1 columns"><label>Metes & Bounds</label><input type="text"  id="survey-abstract-metes-bounds" name="survey-abstract-metesBounds[0]"  class="uppercase popout survey-abstract" /></div></div>');
}
function addNewInputTaxMapParcel(i){
	return $('<div class="a_tax_map_parcel row"><div class="form-paragraph large-3 columns"><label>Dis/Twn</label><input type="text" size="400" id="district" name="district[' + (i-1) + ']" class="district uppercase tax-map-parcel"/></div><div class="form-paragraph large-2 columns"><label>Tax</label><input type="text" name="tax[' + (i-1) + ']" class="uppercase tax-map-parcel"/></div><div class="form-paragraph large-2 columns"><label>Map</label><input type="text" name="map[' + (i-1) + ']" class="uppercase tax-map-parcel" /></div><div class="form-paragraph large-2 columns"><label>Parcel</label><input type="text" name="parcel[' + (i-1) + ']" class="uppercase tax-map-parcel" /></div><div class="form-paragraph large-1 columns"><label>Acre</label><input type="text" name="tax-map-parcel-acre[' + (i-1) + ']" id="tax-map-parcel-acre" class="tax-map-parcel"/></div><div class="form-paragraph large-1 columns"><label>Assessor #</label><input type="text" id="tax-map-parcel-assessorNumber" name="tax-map-parcel-assessorNumber[' + (i-1) + ']" class="uppercase tax-map-parcel"/></div><div class="form-paragraph large-1 columns"><label>Metes & Bounds</label><input type="text"  id="tax-map-parcel-metes-bounds" name="tax-map-parcel-metesBounds[' + (i-1) + ']"  class="uppercase popout tax-map-parcel" /></div></div>');
}
//TODO: refactor this to just copy the existing DOM row and replace the id numbers
function addNewInputSecTwnRge(l) {
	return $('<div class="a_section_township_range row"><div class="form-paragraph large-2 columns"><label>SECTION</label><input type="text" id="section" name="section[' + (l-1) + ']" class="uppercase section sec-twn-rge" size="400" /></div><div class="form-paragraph large-1 columns"><label>TOWNSHIP #</label><input type="text" id="townshipNumber" name="townshipNumber[' + (l-1) + ']" class="uppercase sec-twn-rge"/></div><div class="form-paragraph large-2 columns"><label>TOWNSHIP DIRECTION</label><input type="text" id="townshipDirection" name="townshipDirection[' + (l-1) + ']" class="uppercase township sec-twn-rge"/></div><div class="form-paragraph large-2 columns"><label>Range Number</label><input type="text" id="rangeNumber" class="uppercase rangeNumber[' + (l-1) + '] sec-twn-rge"/></div><div class="form-paragraph large-2 columns"><label>RANGE DIRECTION</label><input type="text" id="rangeDirection" name="rangeDirection[' + (l-1) + ']" class="uppercase range sec-twn-rge"/></div><div class="form-paragraph large-1 columns"><label>Acre</label><input type="text" id="acre" name="sec-twn-rge-acre[' + (l-1) + ']" class="acre sec-twn-rge"/></div><div class="form-paragraph large-1 columns"><label>Assessor #</label><input type="text" id="assessorNumber" name="sec-twn-rge-assessorNumber[' + (l-1) + ']" class="uppercase township sec-twn-rge"/></div><div class="form-paragraph large-1 columns metesBounds"><label>Metes & Bounds</label><input type="text"  id="MetesBoundsTextArea' + l + '" name="sec-twn-rge-metesBounds[' + (l-1) + ']"  class="uppercase popout focusme sec-twn-rge" /></div></div>');
}
function addNewCitySubBlkLot(i) {
	return $('<div class="a_city_sub_block_lot row"><div class="form-paragraph large-2 columns"><label>City</label><input type="text" id="city" name="city['+ (i-1) +']" size="400" class="city uppercase city-sub-block-lot"/></div><div class="form-paragraph large-2 columns"><label>Sub</label><input type="text" size="400" id="sub" name="sub['+ (i-1) +']"class="uppercase city-sub-block-lot" /></div><div class="form-paragraph large-1 columns"><label>Block</label><input type="text" size="400" id="block" name="block['+ (i-1) +']" class="uppercase city-sub-block-lot" /></div><div class="form-paragraph large-1 columns"><label>Lot</label><input type="text" name="lot['+ (i-1) +']" id="lot" class="uppercase city-sub-block-lot" /></div><div class="form-paragraph large-1 columns"><label>Acre</label><input type="text" name="city-sub-blk-lot-acre['+ (i-1) +']" id="city-sub-blk-lot-acre" class="acre uppercase city-sub-block-lot"/></div><div class="form-paragraph large-3 columns"><label>Assessor #</label><input type="text" id="assessorNumber" id="city-sub-block-lot-assessorNumber"name="city-sub-block-lot-assessorNumber['+ (i-1) +']" class="uppercase city-sub-block-lot"/></div><div class="form-paragraph large-2 columns"><label>Metes & Bounds</label><input type="text"  id="city-sub-block-lot-metes-bounds" name="city-sub-block-lot-metesBounds['+ (i-1) +']"  class="uppercase popout city-sub-block-lot" /></div></div>');
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
	
	//Navigate the images table with arrow keys
	var rows = $('.data-row');
	var mapKeysToNavigationStrings = {
	    38: 'up-arrow',
	    40: 'down-arrow',
	    37: 'left-arrow',
	    39: 'right-arrow'
	};
	$(document).on('keyup', function (e) {
		console.log("working");
		var direction = mapKeysToNavigationStrings[e.which];
		var active = $('.selected');
		var index = rows.index(active);
		if(e.ctrlKey==1){
			switch(direction) {
			case 'down-arrow':
				console.log("goin downtown");
				var newActiveRowIndex = (index + 1);
				rows.removeClass('selected');
				var a_row = rows.eq(newActiveRowIndex);
				a_row.addClass('selected');
				var the_cell = a_row.find('.imageLinkCell');
				var anchor = the_cell.find("a");
				var href = $(anchor).attr('href');
				var doc_window = window.self;
				window.open(href, 'imageWindow');
				doc_window.blur();
				setTimeout(doc_window.focus, 0);
				break;
            
			case 'up-arrow':
				console.log("goin up");
				var newActiveRowIndex = (index - 1);
				rows.removeClass('selected').eq(newActiveRowIndex).addClass('selected');
				var a_row = rows.eq(newActiveRowIndex);
				a_row.addClass('selected');
				var the_cell = a_row.find('.imageLinkCell');
				var anchor = the_cell.find("a");
				var href = $(anchor).attr('href');
				var doc_window = window.self;
				window.open(href, 'imageWindow');
				doc_window.blur();
				setTimeout(doc_window.focus, 0);
				break;
			}
		}
	});
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
    $('.related-documents').on('keyup', function (e) {
        var code = e.keyCode || e.which;
        if (code == 13) {
			var related_documents_div = $('#related_documents_wrapper');
		    var k = $(".relatedDocumentBookType").size() + 1;
            var new_item = addNewInputRelatedDocuments(k);
            $(new_item).find('.related-documents').on('keyup', eventHandlerRelatedDocuments);
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
	//
	$('.sec-twn-rge').on('keyup', eventHandlerSecTwnRge);
	$('.city-sub-block-lot').on('keyup',eventHandlerCtySubBlkLot);	
	$('.tax-map-parcel').on('keyup',eventHandlerTaxMapParcel);
	$('.survey-abstract').on('keyup',eventHandlerSurveyAbstract);
	$('.acre').on('blur',sumAcres);
	//change fields to uppercase
	$('.uppercase').keyup(function(){
	    this.value = this.value.toUpperCase();
	});
	//END change fields to uppercase

//END of Document Ready code
});