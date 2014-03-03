<!DOCTYPE html>
<!--[if IE 9]><html class="lt-ie10" lang="en" > <![endif]-->
<html class="no-js" lang="en" >
	<head>
		<meta charset="utf-8">
		
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'normalize.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'foundation.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery-ui.css')}" type="text/css">
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
		<g:javascript src="foundation.abide.js"/>
		<g:javascript src="foundation.reveal.js"/>
		<g:javascript src="foundation.topbar.js"/>
		<g:javascript src="foundation.tab.js"/>
		<g:javascript src="jqueryui-1.10.4.js"/>
		<g:javascript src="jquery.key.js"/>
		<g:javascript src="form2js.js"/>

		
		<%-- Application Javascript --%>
		<script>

		var booktypeJSON = [
		<g:each var="BookType" in="${net.rcenergy.BookTypes.list()}">
		{
			"id": "${BookType.id}",
			"value": "${BookType.bookType}"
		},</g:each>
		]; 
		var instrumenttypeJSON = [
		<g:each var="InstrumentType" in="${net.rcenergy.InstrumentTypes.list()}">
		{
			"id": "${InstrumentType.id}",
			"value": "${InstrumentType.instrumentType}"
		},</g:each>
		]; 
		var citiesJSON = [
		<g:each var="City" in="${net.rcenergy.City.list()}">
		{
			"id": "${City.id}",
			"value": "${City.name}"
		},</g:each>
		];
		var subdivisionsJSON = [
		<g:each var="Subdivision" in="${net.rcenergy.Subdivision.list()}">
		{
			"city": "${Subdivision.city.name}",
			"id": "${Subdivision.id}",
			"value": "${Subdivision.name}"
		},</g:each>
		];
		</script>
		<g:javascript src="popup.js"/>
		<g:javascript src="document.js"/>
	</body>
</html>
