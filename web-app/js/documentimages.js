$(document).ready(function() {
	infinity.config.PAGE_TO_SCREEN_RATIO = 10;
	infinity.config.SCROLL_THROTTLE = 400;
	var divForList = $('#list-view');                //Get the container
  	listView = new infinity.ListView(divForList, {  //Inititalize infinity
        lazy: function() {                      //With the lazy load callback
        	$(this).find('.pic').each(function() {  
        		var $ref = $(this);
            	$ref.attr('src', $ref.attr('data-original')); //Set the img source from a string hard coded into the data-original attribute.
        	});
        }
    });
  	divForList.data('listView', listView); //Use jQuery Data to store our list on the element .
	
   
  for (var i =   0; i < imagesCount; i++) {
		var html='<div class="panel"><h1 class="imagechooser button round" data-image-id="' +imageIdList[i]+'" id="' +imageIdList[i]+'" value="' +imageIdList[i]+'"> IMAGE ' +imageIdList[i]+'</h1><img class="pic" data-image-id="' +imageIdList[i]+'" data-original="/virtualcourthouse/image/viewImage/'+ imageIdList[i] +'" style="width: 1070px; height: 1655px;" ></img><h1 class="imagechooser imagechoosertwo button round" data-image-id="' +imageIdList[i]+'" id="' +imageIdList[i]+'" value="' +imageIdList[i]+'"> IMAGE ' +imageIdList[i]+'</h1></div>'
		divForList.data('listView').append( html )

	};
  
  
});

