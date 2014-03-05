//START DOCUMENT READY FUNCTION
$( document ).ready(function() {
	// START - SAVE DOCUMENT VIA AJAX WITH JSON
	// CTRL J is save/update
	// CTRL K is save/submit to review
	$.key('ctrl+k', function(){
		console.log("FINALIZE a Document");
		var objectGraph = form2js('create_doc_form','.',true)
		console.log("postJSON is " + JSON.stringify(objectGraph));
		jQuery.ajax({type:'POST',
			data: JSON.stringify(objectGraph),
			dataType: 'json',
			contentType:'application/json',
			url:'/virtualcourthouse/document/submitDocumentIndexer',
			success:function(data,textStatus){
				resetDOM();
				var unique_id = $.gritter.add({
					// (string | mandatory) the heading of the notification
					title: 'SUBMITTED DOCUMENT',
					// (string | mandatory) the text inside the notification
					text: "SUBMITTED DOCUMENT FOR REVIEW ID: " + data.id,
					// (string | optional) the image to display on the left
					image: '',
					// (bool | optional) if you want it to fade out on its own or just sit there
					sticky: false,
					// (int | optional) the time you want it to be alive for before fading out
					time: '2000'
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
		if($('#documentId').val() == "")
		{
			console.log("Saving a New Document");
			jQuery.ajax({type:'POST',
				data: JSON.stringify(objectGraph),
				dataType: 'json',
				contentType:'application/json',
				url: '/virtualcourthouse/document/createDocumentIndexer',
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
		var direction = mapKeysToNavigationStrings[e.which];
		var active = $('.selected');
		var index = rows.index(active);
		if(e.ctrlKey==1){
			console.log("Ctrl Key Pushed - Checking Arrow Keys");
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
				updateImagesCount();
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
				updateImagesCount();
				break;
			case 'left-arrow':
				console.log("left arrow SAVE AND REMOVE");
				//find the currently selected image
				the_row = rows.eq(index);
				var highlight_next_row = index + 1;
				rows.removeClass('selected');
				var newActiveRowIndex = (index + 1);
				rows.removeClass('selected');
				var a_row = rows.eq(newActiveRowIndex);
				a_row.addClass('selected');
				//add the image id to a hidden field
				var imageID = the_row.find('.imageId').text();
				//save the image id to a hidden field for submit
				var trimmedImageID = $.trim(imageID);
				addImageToDocument(trimmedImageID);
				//find the link and open the image in a window
				var the_cell = a_row.find('.imageLinkCell');
				var anchor = the_cell.find("a");
				var href = $(anchor).attr('href');
				var doc_window = window.self;
				var new_window = window.open(href, 'imageWindow');
				new_window.blur();
				doc_window.focus();
				//copy the image row to the assigned table
				the_row.removeClass("data-row");
				the_row.addClass("image-assigned-row");
				var clone = the_row.clone();
				clone.appendTo(add_to_table);
				$(the_row).remove();
				rows = $('.data-row');
				updateImagesCount();
				break;
			case 'right-arrow':
				console.log("right arrow SAVE AND LEAVE");
				//TODO: have the image add to the list but leave it in the assignment list
				the_row = rows.eq(index);
				//add the image id to a hidden field
				var imageID = the_row.find('.imageId').text();
				//save the image id to a hidden field for submit
				var trimmedImageID = $.trim(imageID);
				addImageToDocument(trimmedImageID);
				//find the link and open the image in a window
				var the_cell = the_row.find('.imageLinkCell');
				var anchor = the_cell.find("a");
				var href = $(anchor).attr('href');
				var doc_window = window.self;
				var new_window = window.open(href, 'imageWindow');
				new_window.blur();
				doc_window.focus();
				//copy the image row to the assigned table
				var clone = the_row.clone();
				clone.removeClass("data-row");
				clone.removeClass('selected');
				clone.addClass("image-assigned-row");
				clone.appendTo(add_to_table);
				updateImagesCount();
				break;
			}
		}
	});
});