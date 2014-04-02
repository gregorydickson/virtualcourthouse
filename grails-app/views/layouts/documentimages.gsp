<%@ page import="net.rcenergy.Image" %>
<!DOCTYPE html>
<!--[if IE 9]><html class="lt-ie10" lang="en" > <![endif]-->
<html class="no-js" lang="en" >
	<head>
		<meta charset="utf-8">
		
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'foundation.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'app.css')}" type="text/css">

		<g:layoutHead/>
		<%-- 3rd Party Javascript --%>
		<g:javascript src="jquery.js"/>
		<g:javascript src="infinity.js"/>
		<g:javascript src="documentimages.js"/>


	</head>
	<body>
		
		<g:layoutBody/>
			

		
		
		

		<%-- Application Javascript --%>
		
		<r:layoutResources />
	</body>
</html>
