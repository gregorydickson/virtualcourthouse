$( document ).ready(function() {
	// CTRL J is save/update
	// CTRL K is save/submit the review
	$.key('ctrl+k', function(){
		console.log("Update a Review");
		var objectGraph = form2js('create_doc_form','.',true)
		console.log("postJSON is " + JSON.stringify(objectGraph));
		jQuery.ajax({type:'POST',
			data: JSON.stringify(objectGraph),
			dataType: 'json',
			contentType:'application/json',
			url:'/virtualcourthouse/document/submitDocumentReviewer',
			success:function(data,textStatus){
				resetDOM();
				var unique_id = $.gritter.add({
					title: 'SUBMITTED REVIEW',
					text: "SUBMITTED DOCUMENT FOR REVIEW ID: " + data.id,
					image: '',
					sticky: false,
					time: '2000',
				});
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
	$.key('ctrl+j', function(){
		console.log('ajaxit');
		var objectGraph = form2js('create_doc_form','.',true)
		console.log("postJSON is " + JSON.stringify(objectGraph));
		console.log("Saving a New Document");
		jQuery.ajax({type:'POST',
			data: JSON.stringify(objectGraph),
			dataType: 'json',
			contentType:'application/json',
			url: '/virtualcourthouse/document/updateDocumentReviewer',
			success:function(data,textStatus){
				var unique_id = $.gritter.add({
					title: 'SAVED REVIEW',
					text: "Saved Document ID: " + data.id,
					image: '',
					sticky: false,
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

		
	});
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
				//add the image id to a hidden field
				var imageID = the_row.find('.imageId').text();
				var trimmedImageID = $.trim(imageID);
				addImageToDocument(trimmedImageID);
				var the_cell = a_row.find('.imageLinkCell');
				var anchor = the_cell.find("a");
				var href = $(anchor).attr('href');
				var doc_window = window.self;
				var new_window = window.open(href, 'imageWindow');
				new_window.blur();
				doc_window.focus();
				var clone = the_row.clone();
				clone.appendTo(add_to_table);
				$(the_row).remove();
				rows = $('.data-row');
				break;
			case 'right-arrow':
				console.log("right arrow SAVE AND LEAVE");
				//TODO: have the image add to the list but leave it in the assignment list
			}
		}
	});
});
	// END - SAVE DOCUMENT VIA AJAX WITH JSON