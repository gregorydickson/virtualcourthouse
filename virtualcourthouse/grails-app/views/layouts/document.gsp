<!DOCTYPE html>
<!--[if IE 9]><html class="lt-ie10" lang="en" > <![endif]-->
<html class="no-js" lang="en" >
	<head>
		<meta charset="utf-8">
		<title><g:layoutTitle default="Northwest Land"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'normalize.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'foundation.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'zurb5-multiselect.css')}" type="text/css">
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
		<script>
		$( document ).ready(function() {

		    $("#create_doc_form").attr("data-abide", "foundation-form");
			console.log("added data-abide");
			$(document).foundation({
				abide: {
					live_validate: true
					
				}
				
			});
			console.log("live validate true");
			$("#BookType").focus();
			
		});
		</script>
	</body>
</html>
