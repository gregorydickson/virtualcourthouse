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
       var i = $(".related-documents").size() + 1;
       var a_new_field = addNewInputGrantee(i);
       var div = $('#related_documents_wrapper');
       $(a_new_field).on('keyup', eventHandlerRelatedDocuments);
       $(a_new_field).appendTo(div);
       var the_input = a_new_field.find(">:first-child");
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
    var optionsString = getBookTypeOptions();
	return $('<div class="a_related_document"><div class="form-paragraph large-2 columns"><label>Book Type</label><select id="relatedDocumentBookType' + k + '"  required="" class="relatedDocumentBookType chosen-select" >' + optionsString + '</select></div><div class="form-paragraph large-2 columns"><label>Book Number</label><input class="related-documents-book-number" type="text" id="relatedDocumentBookNumber' + k + '" value="" /></div><div class="form-paragraph large-2 columns"><label>Page #</label><input class="related-documents-page-number" type="text" id="relatedDocumentPageNumber' + k + '" value="" /></div><div class="form-paragraph large-6 columns"><label>Instrument #</label><input class="related-documents-instrument-number" type="text" id="relatedDocumentInstrumentNumber' + k + '" value="" /></div></div>');
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
        console.log("GRANTOR KEYUP");
		var code = e.keyCode || e.which;
        if (code == 13) {
			console.log("GRANTOR RETURN");
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
	var related_documents_div = $('#related_documents_wrapper');
    var k = $(".relatedDocumentBookType").size() + 1;
    $('#relatedDocumentInstrumentNumber1').on('keyup', function (e) {
        var code = e.keyCode || e.which;
        if (code == 13) {
            var new_item = addNewInputRelatedDocuments(i);
            $(new_item).on('keyup', eventHandlerRelatedDocuments);
            $(new_item).appendTo(related_documents_div);
			$(".chosen-select").chosen();
			var newFocus = $('#relatedDocumentBookType2');
			console.log(newFocus);
            newFocus.focus();
            newFocus.select();
            k++;
            return false;
        }
    });
});