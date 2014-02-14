<!DOCTYPE html>
<!--[if IE 9]><html class="lt-ie10" lang="en" > <![endif]-->
<html class="no-js" lang="en" >
	<head>
		<meta charset="utf-8">
		
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
		
		<%-- 3rd Party Javascript --%>
		<g:javascript src="jquery.js"/>
		<g:javascript src="foundation.js"/>
		<g:javascript src="jquery.ui.core.js"/>
		<g:javascript src="jquery.ui.widget.js"/>
		<g:javascript src="jquery.ui.mouse.js"/>
		<g:javascript src="jquery.iviewer.js"/>

		
		<%-- Application Javascript --%>


	</body>
</html>
