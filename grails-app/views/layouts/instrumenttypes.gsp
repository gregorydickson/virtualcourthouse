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
		
		<r:layoutResources />
		<g:javascript src="jquery.js"/>
		<g:javascript src="foundation.js"/>

		<script>
		$( document ).ready(function() {
			console.log("regging the func tions");
			$('#ajax').click(function(){
				var postJSON = $( "#instrumentTypes" ).serialize();
				
				console.log("postJSON is " + JSON.stringify(postJSON));
				$.ajax({
				    
					url:"${g.createLink(controller:'instrumentTypes',action:'create.json')}",
					type: "POST",
				    dataType: 'json',
					//contentType: 'application/json',
				    data: postJSON ,
				    success: function(json) {
				        console.log("success the AJAX" + JSON.stringify(json) + "post: " + JSON.stringify(postJSON))
				    },
				    error: function(request, status, error) {
				        console.log("ERROR Request: " + JSON.stringify(request) + "post: " + JSON.stringify(postJSON) + "ERROR: " + error)
				    },
				    complete: function() {
				    }
				});
			});
		});
		</script>
	</body>
</html>
