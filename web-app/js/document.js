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

function addNewInputGrantor() {
    return $('<p class="form-paragraph"><input class="grantor uppercase" type="text"  id="grantor" name="grantor[]" value="" /> </p>');
}
function addNewInputGrantee() {
    return $('<p class="form-paragraph"><input  class="grantee uppercase" type="text" id="grantee" name="grantee[]"  value="" /> </p>');
}
//TODO: refactor this to copy the existing row in the DOM
function addNewInputRelatedDocuments(k) {
	return $('<div class="a_related_document"><div class="form-paragraph large-2 columns"><label>Book Type</label><input type="text" id="relatedDocumentBookType" class="related-documents relatedDocumentBookType" ><input type="hidden" name="parentDocument[' + (k-1) + '].bookType" /></div><div class="form-paragraph large-2 columns"><label>Book Number</label><input class="related-documents" name="parentDocument[' + (k-1) + '].bookNumber" type="text" /></div><div class="form-paragraph large-2 columns"><label>Page #</label><input class="related-documents" name="parentDocument[' + (k-1) + '].pageNumber" type="text"   /></div><div class="form-paragraph large-6 columns"><label>Instrument #</label><input class="related-documents" name="parentDocument[' + (k-1) + '].instrumentNumber" type="text"  /></div></div>');
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
	$(the_input).autocomplete({
		autoFocus: "true",
		minLength: 0,
		delay: 0,
		change: function (event, ui) {
			if (ui.item === null) {
				$(this).val('');
			}
		},
		source: citiesJSON,
		select: function(event, ui) {
		            // feed hidden id field
		            $(this).parent().find(':hidden').attr('value',ui.item.id);
		        },
		close: function( event, ui ) {
			var cityElementString = $(this).val();
			console.log("city Selected is: " + cityElementString);
			filteredSubdivisionsJSON = $.grep(subdivisionsJSON, function (subdivision, i){
				console.log("GREPPING");
				console.log("sub : " + subdivision.value);
				return subdivision.city == cityElementString;
			});
			$(this).parent().parent().find(".subdivision").autocomplete({
				open: function( event, ui ) {
				},
				source: filteredSubdivisionsJSON,
				autoFocus:"true",
				delay:0,
				minLength:0,
				select: function(event, ui) {
				            // feed hidden id field
				            $(this).parent().find(':hidden').attr('value',ui.item.id);
				        },
				change: function (event, ui) {
					if (ui.item === null) {
						$(this).val('');
					}
				}
			});
		}
	});
    the_input.focus();
    the_input.select();
	console.log("Adding New Line Section Twn Range");
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
	console.log("Adding New Line CITY SUB BLK LOT");
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
	console.log("Adding New Line TAX MAP PARCEL");
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
	console.log("Adding New Line Survey Abstract");
	sumLegalDescriptionRows();
    return false;
}
function addNewInputSurveyAbstract(i){
	return $('<div class="a_survey_abstract row"><div class="form-paragraph large-2 columns"><label>Survey</label><input type="text" size="400" name="legalDescriptionSurveyAbstract[' + (i-1) + '].survey" class="survey uppercase survey-abstract"/></div><div class="form-paragraph large-1 columns"><label>Abstract</label><input type="text" name="legalDescriptionSurveyAbstract[' + (i-1) + '].abstract" class="uppercase survey-abstract"/></div><div class="form-paragraph large-2 columns"><label>Block</label><input type="text" name="legalDescriptionSurveyAbstract[' + (i-1) + '].block" class="uppercase survey-abstract" /></div><div class="form-paragraph large-2 columns"><label>Lot</label><input type="text" name="legalDescriptionSurveyAbstract[' + (i-1) + '].lot" class="uppercase survey-abstract" /></div><div class="form-paragraph large-1 columns"><label>Sec</label><input type="text" name="legalDescriptionSurveyAbstract[' + (i-1) + '].section" class="uppercase survey-abstract" /></div><div class="form-paragraph large-2 columns"><label>Acre</label><input type="text" name="legalDescriptionSurveyAbstract[' + (i-1) + '].acre" id="survey-abstract-acre" class="uppercase survey-abstract"/></div><div class="form-paragraph large-1 columns"><label>Assessor #</label><input type="text" name="legalDescriptionSurveyAbstract[' + (i-1) + '].assessorNumber" class="uppercase survey-abstract"/></div><div class="form-paragraph large-1 columns"><label>Metes & Bounds</label><input type="text"  id="survey-abstract-metes-bounds" name="legalDescriptionSurveyAbstract[' + (i-1) + '].metesBounds"  class="uppercase popout survey-abstract" /></div></div>');
}
function addNewInputTaxMapParcel(i){
	return $('<div class="a_tax_map_parcel row"><div class="form-paragraph large-3 columns"><label>Dis/Twn</label><input type="text" size="400" id="district" name="legalDescriptionTaxMapParcel[' + (i-1) + '].district" class="district uppercase tax-map-parcel"/></div><div class="form-paragraph large-2 columns"><label>Tax</label><input type="text" name="legalDescriptionTaxMapParcel[' + (i-1) + '].tax" class="uppercase tax-map-parcel"/></div><div class="form-paragraph large-2 columns"><label>Map</label><input type="text" name="legalDescriptionTaxMapParcel[' + (i-1) + '].map" class="uppercase tax-map-parcel" /></div><div class="form-paragraph large-1 columns"><label>Parcel</label><input type="text" name="legalDescriptionTaxMapParcel[' + (i-1) + '].parcel" class="uppercase tax-map-parcel" /></div><div class="form-paragraph large-2 columns"><label>Acre</label><input type="text" name="legalDescriptionTaxMapParcel[' + (i-1) + '].acre" id="tax-map-parcel-acre" class="tax-map-parcel"/></div><div class="form-paragraph large-1 columns"><label>Assessor #</label><input type="text" id="tax-map-parcel-assessorNumber" name="legalDescriptionTaxMapParcel[' + (i-1) + '].assessorNumber" class="uppercase tax-map-parcel"/></div><div class="form-paragraph large-1 columns"><label>Metes & Bounds</label><input type="text"  id="tax-map-parcel-metes-bounds" name="legalDescriptionTaxMapParcel[' + (i-1) + '].metesBounds"  class="uppercase popout tax-map-parcel" /></div></div>');
}
//TODO: refactor this to just clone the existing DOM row
function addNewInputSecTwnRge(l) {
	return $('<div class="a_section_township_range row"><div class="form-paragraph large-2 columns"><label>SECTION</label><input type="text" id="section" name="legalDescriptionSecTwnRge[' + (l-1) + '].section" class="uppercase section sec-twn-rge" size="400" /></div><div class="form-paragraph large-1 columns"><label>TOWNSHIP #</label><input type="text" id="townshipNumber" name="legalDescriptionSecTwnRge[' + (l-1) + '].townshipNumber" class="uppercase sec-twn-rge"/></div><div class="form-paragraph large-2 columns"><label>TOWNSHIP DIRECTION</label><input type="text" id="townshipDirection" name="legalDescriptionSecTwnRge[' + (l-1) + '].townshipDirection" class="uppercase township sec-twn-rge"/></div><div class="form-paragraph large-2 columns"><label>Range Number</label><input type="text" id="rangeNumber" class="uppercase sec-twn-rge" name="legalDescriptionSecTwnRge[' + (l-1) + '].rangeNumber "/></div><div class="form-paragraph large-1 columns"><label>RANGE DIRECTION</label><input type="text" id="rangeDirection" name="legalDescriptionSecTwnRge[' + (l-1) + '].rangeDirection" class="uppercase range sec-twn-rge"/></div><div class="form-paragraph large-2 columns"><label>Acre</label><input type="text" id="acre" name="legalDescriptionSecTwnRge[' + (l-1) + '].acre" class="acre sec-twn-rge"/></div><div class="form-paragraph large-1 columns"><label>Assessor #</label><input type="text" id="assessorNumber" name="legalDescriptionSecTwnRge[' + (l-1) + '].assessorNumber" class="uppercase township sec-twn-rge"/></div><div class="form-paragraph large-1 columns metesBounds"><label>Metes & Bounds</label><input type="text"  id="MetesBoundsTextArea' + l + '" name="legalDescriptionSecTwnRge[' + (l-1) + '].metesBounds"  class="uppercase popout focusme sec-twn-rge" /></div></div>');
}
function addNewCitySubBlkLot(i) {
	return $('<div class="a_city_sub_block_lot row"><div class="form-paragraph large-2 columns"><label>City</label><input type="text" id="city" size="400" class="city uppercase city-sub-block-lot"/><input type="hidden" name="legalDescriptionCitySubBlkLot['+ (i-1) +'].city" /></div><div class="form-paragraph large-2 columns"><label>Sub</label><input type="text" size="400" id="sub" class="uppercase city-sub-block-lot subdivision" /><input type="hidden" name="legalDescriptionCitySubBlkLot['+ (i-1) +'].subdivision" /></div><div class="form-paragraph large-1 columns"><label>Block</label><input type="text" size="400" id="block" name="legalDescriptionCitySubBlkLot['+ (i-1) +'].block" class="uppercase city-sub-block-lot" /></div><div class="form-paragraph large-1 columns"><label>Lot</label><input type="text" name="legalDescriptionCitySubBlkLot['+ (i-1) +'].lot" id="lot" class="uppercase city-sub-block-lot" /></div><div class="form-paragraph large-2 columns"><label>Acre</label><input type="text" name="legalDescriptionCitySubBlkLot['+ (i-1) +'].acre" id="city-sub-blk-lot-acre" class="acre uppercase city-sub-block-lot"/></div><div class="form-paragraph large-2 columns"><label>Assessor #</label><input type="text" id="assessorNumber" id="city-sub-block-lot-assessorNumber" name="legalDescriptionCitySubBlkLot['+ (i-1) +'].assessorNumber" class="uppercase city-sub-block-lot"/></div><div class="form-paragraph large-2 columns"><label>Metes & Bounds</label><input type="text"  id="city-sub-block-lot-metes-bounds" name="legalDescriptionCitySubBlkLot['+ (i-1) +'].metesBounds"  class="uppercase popout city-sub-block-lot" /></div></div>');
}

//START DOCUMENT READY FUNCTION
$( document ).ready(function() {
	//Initialize foundation
	$(document).foundation();

	//#################### JQUERY AUTOCOMPLETE
	$("#BookType").autocomplete({
		position: { my : "left top", at: "left bottom", of: "#BookType" },
		delay: 0,
		autoFocus: "true",
		minLength: 0,
		change: function (event, ui) {
			if (ui.item === null) {
				$(this).val('');
			}
		},
		select: function(event, ui) {
		            // feed hidden id field
		            $(this).parent().find(':hidden').attr('value',ui.item.id);
		        },
		source: booktypeJSON

	});
	$(".InstrumentType").autocomplete({
		autoFocus: "true",
		delay: 0,
		minLength: 0,
		change: function (event, ui) {
			if (ui.item === null) {
				$(this).val('');
			}
		},
		select: function(event, ui) {
		            // feed hidden id field
		            $(this).parent().find(':hidden').attr('value',ui.item.id);
		        },
		source: instrumenttypeJSON
	});
	
	$(".relatedDocumentBookType").autocomplete({
		autoFocus: "true",
		delay: 0,
		minLength: 0,
		select: function(event, ui) {
		            // feed hidden id field
		            $(this).parent().find(':hidden').attr('value',ui.item.id);
		        },
		change: function (event, ui) {
			if (ui.item === null) {
				$(this).val('');
			}
		},
		source: booktypeJSON
	});
	$(".subdivision").autocomplete({
		open: function( event, ui ) {
		},
		source: [],
		delay:0,
		minLength:0,
		change: function (event, ui) {
			if (ui.item === null) {
				$(this).val('');
			}
		}
	});
	var filteredSubdivisionsJSON;
	$(".city").autocomplete({
		autoFocus: "true",
		delay: 0,
		minLength: 0,
		select: function(event, ui) {
		            // feed hidden id field
		            $(this).parent().find(':hidden').attr('value',ui.item.id);
		        },
		change: function (event, ui) {
			if (ui.item === null) {
				$(this).val('');
			}
		},
		source: citiesJSON,
		close: function( event, ui ) {
			var cityElementString = $(this).val();
			console.log("city Selected is: " + cityElementString);
			filteredSubdivisionsJSON = $.grep(subdivisionsJSON, function (subdivision, i){
				console.log("GREPPING");
				console.log("sub : " + subdivision.value);
				return subdivision.city == cityElementString;
			});
			$(".subdivision").autocomplete({
				open: function( event, ui ) {
				},
				source: filteredSubdivisionsJSON,
				select: function(event, ui) {
				            // feed hidden id field
				            $(this).parent().find(':hidden').attr('value',ui.item.id);
				        },
				autoFocus:"true",
				delay:0,
				minLength:0,
				change: function (event, ui) {
					if (ui.item === null) {
						$(this).val('');
					}
				}
			});
		}
	});
	
	//################### END JQUERY AUTOCOMPLETE

	// START - SAVE DOCUMENT VIA AJAX WITH JSON
	$.key('ctrl+j', function(){
		console.log('ajaxit');
		var objectGraph = form2js('create_doc_form','.',true)
		console.log("postJSON is " + JSON.stringify(objectGraph));
		if($('#documentId').val() == "")
		{
			console.log("Saving a New Document");
			jQuery.ajax({type:'POST',
				data: JSON.stringify(objectGraph),
				dataType: 'json',
				contentType:'application/json',
				url:'/virtualcourthouse/document/createDocumentIndexer',
				success:function(data,textStatus){
					var unique_id = $.gritter.add({
						// (string | mandatory) the heading of the notification
						title: 'SAVED DOCUMENT',
						// (string | mandatory) the text inside the notification
						text: "Saved Document ID: " + data.id,
						// (string | optional) the image to display on the left
						image: '',
						// (bool | optional) if you want it to fade out on its own or just sit there
						sticky: false,
						// (int | optional) the time you want it to be alive for before fading out
						time: '2000',

					});
					console.log("RETURN JSON: " + JSON.stringify(data));
					$(".documentId").attr("value", data.id);
				},
				error:function(XMLHttpRequest,textStatus,errorThrown){
					console.log("ERROR: " + errorThrown);
				},
				complete: function() {
					console.log("COMPLETE")
				}
			});
		} else
		{
			console.log("UPDATING a Document");
			jQuery.ajax({type:'POST',
				data: JSON.stringify(objectGraph),
				dataType: 'json',
				contentType:'application/json',
				url:'/virtualcourthouse/document/updateDocumentIndexer',
				success:function(data,textStatus){
					var unique_id = $.gritter.add({
						// (string | mandatory) the heading of the notification
						title: 'UPDATED DOCUMENT',
						// (string | mandatory) the text inside the notification
						text: "UPDATED Document ID: " + data.id,
						// (string | optional) the image to display on the left
						image: '',
						// (bool | optional) if you want it to fade out on its own or just sit there
						sticky: false,
						// (int | optional) the time you want it to be alive for before fading out
						time: '2000',

					});
					console.log("RETURN JSON: " + JSON.stringify(data));
					$(".documentId").attr("value", data.id);
				},
				error:function(XMLHttpRequest,textStatus,errorThrown){
					console.log("ERROR: " + errorThrown);
				},
				complete: function() {
					console.log("COMPLETE")
				}
			});
		}
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
    $('body').on('keyup','.grantor', function (e) {
		var code = e.keyCode || e.which;
		if (code == 13) {
		    var grantor_div = $('#grantors_wrapper');
		    var i = $(".grantor").size() + 1;
			var new_item = addNewInputGrantor();
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
	$('body').on('keyup', '.grantee', function (e) {
		var code = e.keyCode || e.which;
		if (code == 13) {
		    var grantee_div = $('#grantees_wrapper');
		    var j = $(".grantee").size() + 1;
			var new_item = addNewInputGrantee();
			$(new_item).appendTo(grantee_div);
			var the_input = new_item.find(">:first-child");
			the_input.focus();
			the_input.select();
			return false;
		}
	});
	//end handle grantees

    $('body').on('keyup','.related-documents', function (e) {
        var code = e.keyCode || e.which;
        if (code == 13) {
			var related_documents_div = $('#related_documents_wrapper');
		    var k = $(".relatedDocumentBookType").size() + 1;
            var new_item = addNewInputRelatedDocuments(k);
            $(new_item).appendTo(related_documents_div);
			var the_input = new_item.find(".relatedDocumentBookType");
			$(the_input).autocomplete({
				autoFocus: "true",
				delay: 0,
				minLength: 0,
				change: function (event, ui) {
					if (ui.item === null) {
						$(this).val('');
					}
				},
				select: function(event, ui) {
				            // feed hidden id field
				            $(this).parent().find(':hidden').attr('value',ui.item.id);
				        },
				source: booktypeJSON
			});
			the_input.focus();
			the_input.select();
            return false;
        }
    });

	$('body').on('keyup', '.sec-twn-rge', eventHandlerSecTwnRge);
	$('body').on('keyup', '.tax-map-parcel',eventHandlerTaxMapParcel);
	$('body').on('keyup', '.survey-abstract',eventHandlerSurveyAbstract);
	$('body').on('keyup', '.city-sub-block-lot',eventHandlerCtySubBlkLot);
	$('body').on('blur', '.acre', sumAcres);
	$('body').on('keyup','.uppercase', function(){
	    this.value = this.value.toUpperCase();
	});
//END of Document Ready code
});