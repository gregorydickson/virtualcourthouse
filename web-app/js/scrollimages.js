$(document).ready(function() {
			init();
});

//
//Initial loader for Infinity.js.
//
init=function(){
  var mainList = $('#list-view');                //Get the container
  listView = new infinity.ListView(mainList, {  //Inititalize infinity
        lazy: function() {                      //With the lazy load callback
        	$(this).find('.pic').each(function() {  
        		var $ref = $(this);
            $ref.attr('src', $ref.attr('data-original')); //Set the img source from a string hard coded into the data-original attribute.
        });
        }
    });
  mainList.data('listView', listView); //Use jQuery Data to set our list to the element .
  load(imagesCount); //Load the number of images in the imagesCount
}
//
//Master append function.
//
load=function(num){
	var mainList = $('#list-view');
	for (var i =  num- 1; i >= 0; i--) {
		var html='<div> <h1>Document ' +(i+1)+'</h1><br><img class="pic" data-original="/virtualcourthouse/image/viewImage/'+ i +'" style="width: 1070px; height: 1655px;" ></img></div>'
		mainList.data('listView').append( html )
		//console.log('loading: i = '+ i);
	};
}
//
//Simple logic to check when the page bottom is reached. Sourced from main example at: http://airbnb.github.io/infinity/demo-on.html
// 
var updateScheduled = false;
function onscreen($el) {
	var viewportBottom = $(window).scrollTop() + $(window).height();
	return $el.offset().top <= viewportBottom;
}
$(window).on('scroll', function() {
	if(!updateScheduled) {
		setTimeout(function() {
			var spinner=$(".spinner")
			if(onscreen(spinner)) 
      load(300); //if we are at the page bottom add 300 more images!
  updateScheduled = false;
}, 500);
		updateScheduled = true;
	}
});
