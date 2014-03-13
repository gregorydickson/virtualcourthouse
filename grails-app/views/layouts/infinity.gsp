<%@ page import="net.rcenergy.Image" %>
<!DOCTYPE html>
<!--[if IE 9]><html class="lt-ie10" lang="en" > <![endif]-->
<html class="no-js" lang="en" >
	<head>
		<meta charset="utf-8">
		
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'images.css')}" type="text/css">

		<g:layoutHead/>
		<%-- 3rd Party Javascript --%>
		<g:javascript src="jquery.js"/>
		<g:javascript src="infinity.js"/>


	</head>
	<body>
		
		<g:layoutBody/>
			

		<r:layoutResources />
		
		<script>
		var imagesCount = ${Image.count()}
		</script>

		<%-- Application Javascript --%>
		<g:javascript src="scrollimages.js"/>

	</body>
</html>
