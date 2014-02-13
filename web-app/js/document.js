(function ($) {
    $.fn.popBox = function (options) {

        var defaults = {
            height: 600,
            width: 600,
            newlineString: "<br/>"
        };
        var options = $.extend(defaults, options);


        return this.each(function () {

            obj = $(this);

            var inputName = 'popBoxInput' + obj.attr("Id");
            var labelValue = $("label[for=" + obj.attr('id') + "]").text();

            obj.after('<div class="popBox-holder"></div><div class="popBox-container"><label style="display: none;" for="' + inputName + '">' + labelValue + '</label> <textarea id="' + inputName + '" name="' + inputName + '" class="popBox-input uppercase" /></div>');

            obj.on('keyup', function (e) {
				var code = e.keyCode || e.which;
        		if (code != 9) {
                	$(this).next(".popBox-holder").show();
                	var popBoxContainer = $(this).next().next(".popBox-container");
                	var change = true;
                	popBoxContainer.children('.popBox-input').css({ height: options.height, width: options.width });
                	popBoxContainer.show();

	                var winH = $(window).height();
	                var winW = $(window).width();
	                var objH = popBoxContainer.height();
	                var objW = popBoxContainer.width();
	                var left = (winW / 2) - (objW / 2);
	                var top = (winH / 2) - (objH / 2);

	                popBoxContainer.css({ position: 'fixed', margin: 0, top: (top > 0 ? top : 0) + 'px', left: (left > 0 ? left : 0) + 'px' });
					var input = popBoxContainer.children('.popBox-input');
					//copy the input field to the pop up box
					input.val($(this).val());
					//set the cursor to the end of the text
					var len = input.val().length;
					input[0].focus();
					input[0].setSelectionRange(len, len);
		            
                	popBoxContainer.children().keyup(function (e) {
                    	if (e == null) { 
                        	keycode = event.keyCode;
                    	} else { 
                        	keycode = e.which;
                    	}
                    	if (keycode == 9 ) { // tab out of box so close and go to next section
                        	$(this).parent().hide();
                        	$(this).parent().prev().hide();
                        	change = true;
                    	}
						if (keycode ==13 ) { //return so create a new line in this section
							console.log("popup detected a return");
                        	$(this).parent().hide();
                        	$(this).parent().prev().hide();
                        	change = true;
							if(obj.hasClass('sec-twn-rge')) {
								
								console.log("AddnewSecTwnRge from Popup Box");
								addNewLineSecTwnRge();
							} 
							
						}
                	});

                	popBoxContainer.children().blur(function () {

                    	if (change) {
							
                        	$(this).parent().hide();
                        	$(this).parent().prev().hide();
                        	$(this).parent().prev().prev().val($(this).val());
							
                    	}
                	});
				}
            });

        });

    };

})(jQuery);


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

function eventHandlerSecTwnRge(e) {
	var code = e.keyCode || e.which;
     if (code == 13) {
		
		
		console.log("IN EVENT HANDER: Adding New Line Section Twn Range");
		
		addNewLineSecTwnRge()
		
        return false;
     }
}

function addNewLineSecTwnRge() {
	var sec_twn_rge_div = $('#section_township_range_wrapper');
    var l = $(".section").size() + 1;
    var new_item = addNewInputSecTwnRge(l);
    $(new_item).appendTo(sec_twn_rge_div);
	var the_input = new_item.find(".section");
	new_item.find('.popout').popBox();
    the_input.focus();
    the_input.select();
	$(new_item).find('.uppercase').on('keyup', function () {
		this.value = this.value.toUpperCase()
	});
	console.log("Adding New Line Section Twn Range");
	$(the_input).on('keyup', decorateSecTwnRange);
    return false;
}
function addNewInputSecTwnRge(l) {
	return $('<div class="a_section_township_range row"><div class="form-paragraph large-2 columns"><label>SECTION</label><input type="text" id="section" name="section[' + (l-1) + ']" class="section sec-twn-rge" size="400" /></div><div class="form-paragraph large-1 columns"><label>TOWNSHIP #</label><input type="text" id="townshipNumber" name="townshipNumber[' + (l-1) + ']" class="sec-twn-rge"/></div><div class="form-paragraph large-2 columns"><label>TOWNSHIP DIRECTION</label><input type="text" id="townshipDirection" name="townshipDirection[' + (l-1) + ']" class="uppercase township sec-twn-rge"/></div><div class="form-paragraph large-2 columns"><label>Range Number</label><input type="text" id="rangeNumber" class="rangeNumber[' + (l-1) + '] sec-twn-rge"/></div><div class="form-paragraph large-2 columns"><label>RANGE DIRECTION</label><input type="text" id="rangeDirection" name="rangeDirection[' + (l-1) + ']" class="uppercase range sec-twn-rge"/></div><div class="form-paragraph large-1 columns"><label>Acre</label><input type="text" id="acre" name="sec-twn-rge-acre[' + (l-1) + ']" class="acre sec-twn-rge"/></div><div class="form-paragraph large-1 columns"><label>Assessor #</label><input type="text" id="assessorNumber" name="sec-twn-rge-assessorNumber[' + (l-1) + ']" class="uppercase township sec-twn-rge"/></div><div class="form-paragraph large-1 columns"><label>Metes & Bounds</label><input type="text"  id="MetesBoundsTextArea' + l + '" name="sec-twn-rge-metesBounds[' + (l-1) + ']"  class="uppercase popout focusme sec-twn-rge" /></div></div>');
}
//START DOCUMENT READY FUNCTION
$( document ).ready(function() {
	//Initialize foundation
	$(document).foundation();
	$(document).foundation('reveal',{	
	    opened: function(){
	       $(this).find(".focusme").first().focus();
	    },
		closed: function(){
			
		}
	});
	//setup all the typeahead dropdowns with chosen.js
	$(".chosen-select").chosen();
	//make the first drop down have focus using chosen.js message
	$("#BookType").trigger('chosen:activate');
	$("#MetesBoundsTextArea1").popBox();
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
	//create new related documents fileds dynamically
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