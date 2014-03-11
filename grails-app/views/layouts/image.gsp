<!DOCTYPE html>
<!--[if IE 9]><html class="lt-ie10" lang="en" > <![endif]-->
<html class="no-js" lang="en" >
	<head>
		<meta charset="utf-8">
		
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.iviewer.css')}" type="text/css">

		<g:layoutHead/>

		
		<r:layoutResources />
	</head>
	<body>
		
		<g:layoutBody/>
			

		<r:layoutResources />
		
		<%-- 3rd Party Javascript --%>
		<g:javascript src="jquery.js"/>
		<g:javascript src="jqueryui-1.10.4.js"/>
		<g:javascript src="jquery.mousewheel.min.js"/>
		<g:javascript src="jquery.iviewer.js"/>
		<g:javascript src="infinity.js"/>

		
		<%-- Application Javascript --%>
		<script>
        var $ = jQuery;
        $(document).ready(function(){
          /*var iv1 = $('#viewer').iviewer({
            src: '${createLink(controller: 'image', action: 'viewImage', id: imageInstance.id)}',
			zoom: localStorage.getItem("zoom"),
			zoom_delta: 1.02,
			onZoom: function(e, newzoom){localStorage.setItem("zoom",newzoom);},
			zoom_min: 10
          }); */
			  
			          
        });
		</script>

	</body>
</html>
