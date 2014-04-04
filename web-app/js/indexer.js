//START DOCUMENT READY FUNCTION
$( document ).ready(function() {
	$('body').on('click','.data-row', function () {
		var url = "/virtualcourthouse/assignment/images/" + $('#assignmentId').attr('value');
		win = popup(url, 'imagelist', 900, 0);
    });

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
				updateImagesCount();
				win.close();
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
					var unique_id = $.gritter.add({
						// (string | mandatory) the heading of the notification
						title: 'ERROR IN SAVING DOCUMENT',
						// (string | mandatory) the text inside the notification
						text: "ERROR: " + errorThrown,
						// (string | optional) the image to display on the left
						image: '',
						// (bool | optional) if you want it to fade out on its own or just sit there
						sticky: false,
						// (int | optional) the time you want it to be alive for before fading out
						time: '2000'
					});
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
	
	
});