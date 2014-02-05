<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Northwest Land"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'normalize.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'foundation.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'app.css')}" type="text/css">
		
		<g:layoutHead/>
		<g:javascript src="modernizr.js"/>
		<r:layoutResources />
	</head>
	<body>
		
		<g:layoutBody/>	
		<g:javascript src="jquery.js"/>
		<g:javascript src="foundation.js"/>
		<r:layoutResources />
		
		

		<script>
		$( document ).ready(function() {
			$('#ajaxit').click(function(){
				console.log('ajaxit');
				console.log("postJSON is " + JSON.stringify($('#instrumentTypes').serializeArray()));
				jQuery.ajax({type:'POST',
					data:jQuery('#instrumentTypes').serializeArray(),
					dataType: 'json',
				 	url:'${g.createLink(controller:'instrumentTypes',action:'save.json')}',
				 	success:function(data,textStatus){
					 alert("saved record");
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
	
	
		//END Document ready function
		});
		</script>
	</body>
</html>
