<!DOCTYPE html>
<!--[if IE 9]><html class="lt-ie10" lang="en" > <![endif]-->
<html class="no-js" lang="en" >
	<head>
		<meta charset="utf-8">
		
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'normalize.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'foundation.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'zurb5-multiselect.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'chosen.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'app.css')}" type="text/css">
		<g:layoutHead/>
		<g:javascript src="modernizr.js"/>
		
		<r:layoutResources />
	</head>
	<body>
		
		<g:layoutBody/>
			

		<r:layoutResources />
		
		
		<g:javascript src="jquery.js"/>
		<g:javascript src="foundation.js"/>
		<g:javascript src="foundation.abide.js"/>
		<g:javascript src="zurb5-multiselect.js"/>
		<g:javascript src="chosen.jquery.js"/>
		<script>
		function addNewInputGrantor(i) {
		    return $('<p><input class="grantor" type="text"  id="grantor' + i + '" size="50" value="" /> </p>');
		}
		function addNewInputGrantee(j) {
		    return $('<p><input  class="grantee" type="text" id="grantee' + j + '" size="50" value="" /> </p>');
		}
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

		});
		</script>
	</body>
</html>
