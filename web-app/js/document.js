function sumRowsContainingValues(rows){
	var numberOfRows = 0;
	$.each(rows, function(){
		var children = $(this).children();
		$.each(children, function(){
			if( $(this).find(":input").val() != "" ) {
			        numberOfRows = numberOfRows + 1;
					return false;
			}
		});
	});
	return numberOfRows;
}

function sumLegalDescriptionRows(){
	var numberOfRows = 0;
	//find all the rows in Sec/Twn/Range
	var sectionTownshipRangeRows = $('.a_section_township_range');
	//check to see if they are empty rows
	numberOfRows = sumRowsContainingValues(sectionTownshipRangeRows);
	//find all the rows in City/Sub/Block/Lot
	var citySubBlockLotRows = $('.a_city_sub_block_lot');
	//check to see if they are empty rows
	var rowsToAdd = sumRowsContainingValues(citySubBlockLotRows);
	numberOfRows = numberOfRows + rowsToAdd;
	//find all the rows in Tax/Map/Parcel
	var taxMapParcelRows = $('.a_tax_map_parcel');
	//check to see if they are empty rows
	rowsToAdd = sumRowsContainingValues(taxMapParcelRows);
	numberOfRows = numberOfRows + rowsToAdd;
	//find all the rows in survey abstract
	var surveyAbstractRows = $('.a_survey_abstract');
	//check to see if they are empty rows
	rowsToAdd = sumRowsContainingValues(surveyAbstractRows);
	numberOfRows = numberOfRows + rowsToAdd;
	//update the rows div
	var string = numberOfRows.toString();
	$('#rowsTotal').text(string);
}

function sumAcres(){
	var acres = $(".acre");
	var num = new Number();
	var string;
	$.each(acres, function(){
		if($(this).val() != "")
		{
			num = num + parseFloat($(this).val(),10);
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


function addNewInputGrantor(i) {
    return $('<p class="form-paragraph"><input class="grantor uppercase" type="text"  id="grantor" name="grantor" value="" /> </p>');
}
function addNewInputGrantee(j) {
    return $('<p class="form-paragraph"><input  class="grantee uppercase" type="text" id="grantee" name="grantee"  value="" /> </p>');
}
//TODO: refactor this to copy the existing row in the DOM
function addNewInputRelatedDocuments(k) {
	//The book type options have to be rendered in the .gsp page as we do not have them in the 
	// document.js file since this file is not parsed by the server.
	// This function call grabs them from a function in the create.gsp file so we can add them
	// to a related documents new line select field.
    var optionsString = getBookTypeOptions();
	return $('<div class="a_related_document"><div class="form-paragraph large-2 columns"><label>Book Type</label><input type="text" id="relatedDocumentBookType' + k + '" name="related-documents-book-type[' + (k-1) + ']"  class="related-documents relatedDocumentBookType" ></div><div class="form-paragraph large-2 columns"><label>Book Number</label><input class="related-documents" name="related-documents-book-number[' + (k-1) + ']" type="text" /></div><div class="form-paragraph large-2 columns"><label>Page #</label><input class="related-documents" name="related-documents-page-number[' + (k-1) + ']" type="text"   /></div><div class="form-paragraph large-6 columns"><label>Instrument #</label><input class="related-documents" name="related-documents-instrument-number[' + (k-1) + ']" type="text"  /></div></div>');
}
function decorateSecTwnRange(e){
	sumLegalDescriptionRows();
	var elements = $(this).parent().parent().find('.sec-twn-rge');
	$.each(elements, function(){
		$(this).on('keyup',eventHandlerSecTwnRge);
	});
	console.log("DECORATE SECTION TWN RANGE");
}
function decorateCtySubBlkLot(){
	sumLegalDescriptionRows();
	var elements = $(this).parent().parent().find('.city-sub-block-lot');
	$.each(elements, function(){
		$(this).on('keyup',eventHandlerCtySubBlkLot);
	});
	console.log("DECORATE  City Sub Blk Lot");
}
function decorateTaxMapParcel(){
	sumLegalDescriptionRows();
	var elements = $(this).parent().parent().find('.tax-map-parcel');
	$.each(elements, function(){
		$(this).on('keyup',eventHandlerTaxMapParcel);
	});
	console.log("DECORATE TAX Map Parcel");
}
function decorateSurveyAbstract(){
	sumLegalDescriptionRows();
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
	
	console.log("Adding New Line Section Twn Range");
	$(new_item).one('keyup', decorateCtySubBlkLot);
	sumLegalDescriptionRows();
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
	
	console.log("Adding New Line CITY SUB BLK LOT");
	$(new_item).one('keyup', decorateSecTwnRange);
	sumLegalDescriptionRows();
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
	
	console.log("Adding New Line TAX MAP PARCEL");
	$(new_item).one('keyup', decorateTaxMapParcel);
	sumLegalDescriptionRows();
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
	
	console.log("Adding New Line Survey Abstract");
	$(new_item).one('keyup', decorateSurveyAbstract);
	sumLegalDescriptionRows();
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
	


	
	//#################### JQUERY AUTOCOMPLETE
	
	
	$("#BookType").autocomplete({
		position: { my : "left top", at: "left bottom", of: "#BookType" },
		autofocus: "true",
		minLength: 1,
		change: function (event, ui) {
			if (ui.item === null) {
				$(this).val('');
				$('#BookType').val('');
			}
		},
		select: function(event, ui) {
		            // feed hidden id field
		            $("#BookType.id").val(ui.item.id);
		        },
		source: booktypeJSON

	});
	$("#relatedDocumentBookType1").autocomplete({

		autofocus: "true",
		minLength: 1,
		change: function (event, ui) {
			if (ui.item === null) {
				$(this).val('');
				$('#relatedDocumentBookType1').val('');
			}
		},
		
		source: booktypeJSON

	});
    
	//################### END JQUERY AUTOCOMPLETE

	// START - SAVE DOCUMENT VIA AJAX WITH JSON
	$.key('ctrl+j', function(){
		console.log('ajaxit');
		console.log("postJSON is " + JSON.stringify($('#create_doc_form').serializeArray()));
		jQuery.ajax({type:'POST',
			data:jQuery('#create_doc_form').serializeArray(),
			dataType: 'json',
		 	url:'/virtualcourthouse/document/save.json',
		 	success:function(data,textStatus){
			 alert("Saved Document");
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
	
	$(".dateformat").keyup(function(){
		if ($(this).val().length == 2){
			$(this).val($(this).val() + "/");
		}else if ($(this).val().length == 5){
			$(this).val($(this).val() + "/");
		}
	});

	//setup certain fields to pop up a textbox for input
	$(".popout").popBox();
	//Navigate the images table with Ctrl+ arrow keys
	var rows = $('.data-row');
	var add_to_table = $('#images-assigned');
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
				var new_window = window.open(href, 'imageWindow');
				new_window.blur();
				doc_window.focus();
				break;
			case 'up-arrow':
				console.log("goin up");
				var newActiveRowIndex = (index - 1);
				rows.removeClass('selected');
				var a_row = rows.eq(newActiveRowIndex);
				a_row.addClass('selected');
				var the_cell = a_row.find('.imageLinkCell');
				var anchor = the_cell.find("a");
				var href = $(anchor).attr('href');
				var doc_window = window.self;
				var new_window = window.open(href, 'imageWindow');
				new_window.blur();
				doc_window.focus();
				break;
			case 'left-arrow':
				console.log("left arrow SAVE AND REMOVE");
				the_row = rows.eq(index);
				var highlight_next_row = index + 1;
				rows.removeClass('selected');
				var newActiveRowIndex = (index + 1);
				rows.removeClass('selected');
				var a_row = rows.eq(newActiveRowIndex);
				a_row.addClass('selected');
				var the_cell = a_row.find('.imageLinkCell');
				var anchor = the_cell.find("a");
				var href = $(anchor).attr('href');
				var doc_window = window.self;
				var new_window = window.open(href, 'imageWindow');
				new_window.blur();
				doc_window.focus();
				//TODO: save the data in a data model
				var clone = the_row.clone();
				clone.appendTo(add_to_table);
				$(the_row).remove();
				rows = $('.data-row');
				break;
			case 'right-arrow':
				console.log("right arrow SAVE AND LEAVE");
				
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
	$('body'.on('keyup', '.grantee', function (e) {
		var code = e.keyCode || e.which;
		if (code == 13) {
			var new_item = addNewInputGrantee(i);

			$(new_item).appendTo(grantee_div);
			var the_input = new_item.find(">:first-child");
			
			the_input.focus();
			the_input.select();

			return false;
		}
	});
	//end handle grantees
	/** create new related documents lines dynamically
		by registering an event on the instrument number 
	line to capture a return event and create a new line			*/
    $('body').on('keyup','.related-documents', function (e) {
        var code = e.keyCode || e.which;
        if (code == 13) {
			var related_documents_div = $('#related_documents_wrapper');
		    var k = $(".relatedDocumentBookType").size() + 1;
            var new_item = addNewInputRelatedDocuments(k);
            $(new_item).appendTo(related_documents_div);
			var the_input = new_item.find(".relatedDocumentBookType");
			the_input.focus();
			the_input.select();
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
	$('body').on('keyup','.uppercase', function(){
	    this.value = this.value.toUpperCase();
	});
	//END change fields to uppercase

//END of Document Ready code
});