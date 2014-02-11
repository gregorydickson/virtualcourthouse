﻿
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
					input.val($(this).val());
					var len = input.val().length;
					input[0].focus();
					input[0].setSelectionRange(len, len);
		            
                	popBoxContainer.children().keydown(function (e) {
                    	if (e == null) { // ie
                        	keycode = event.keyCode;
                    	} else { // mozilla
                        	keycode = e.which;
                    	}

                    	if (keycode == 9 ) { // tab so close and go to related documents
                        	$(this).parent().hide();
                        	$(this).parent().prev().hide();
                        	change = true;
                    	}
						if (keycode ==13 ) { //return so create a new line
                        	$(this).parent().hide();
                        	$(this).parent().prev().hide();
                        	change = true;
						}
					
                	});

                	popBoxContainer.children().blur(function () {

                    	if (change) {

                        	$(this).parent().hide();
                        	$(this).parent().prev().hide();
                        	$(this).parent().prev().prev().val($(this).val().replace(/\n/g, options.newlineString));
                    	}
                	});
				}
            });

        });

    };

})(jQuery);
