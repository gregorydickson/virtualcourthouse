$( document ).ready(function() {
	$('body').on('click','.data-row', function () {
		var url = "/virtualcourthouse/document/images/" + $('#documentId').attr('value');
		win = popup(url, 'imagelist', 900, 0);
    });


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
	

});
	// END - SAVE DOCUMENT VIA AJAX WITH JSON