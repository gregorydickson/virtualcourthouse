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
		<g:javascript src="foundation.reveal.js"/>
		<g:javascript src="foundation.tab.js"/>
		<g:javascript src="zurb5-multiselect.js"/>
		<g:javascript src="chosen.jquery.js"/>
		<g:javascript src="jquery.key.js"/>
		<script>
		function getBookTypeOptions(){
			var returnString = '<g:each var="BookType" in="${net.rcenergy.BookTypes.list()}"><option value="${BookType.id}" > ${BookType.bookType}</option></g:each>';
			return returnString;
		}
		</script>
		<g:javascript src="document.js"/>
	</body>
</html>
