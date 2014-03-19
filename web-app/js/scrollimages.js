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
		var html='<br><div><h1 class="imagechooser" id="' +imageIdList[i]+'" value="' +imageIdList[i]+'">ADD IMAGE ' +imageIdList[i]+'</h1><img class="pic" data-original="/virtualcourthouse/image/viewImage/'+ imageIdList[i] +'" style="width: 1070px; height: 1655px;" ></img></div>'
		divForList.data('listView').append( html )

	};
  var imagesChosen = [];
  $('.imagechooser').on('click', function (e) {
    console.log("Clicked on image TITLE");

    var imageid = $(this).attr('value');
    if($.inArray( imageid, imagesChosen ) > -1)
    {
      $(this).removeClass('selected');
      window.opener.removeImageId(imageid);
      console.log("remove images ids image list window");
      imagesChosen.pop(imageid);

    } else {
      $(this).addClass('selected');
      window.opener.setImageId(imageid);
      console.log("set images ids image list window");
      imagesChosen.push(imageid);
    }
    
    
    return false;
  });
  
});

