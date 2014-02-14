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

		<g:javascript src="jquery.ui.core.js"/>
		<g:javascript src="jquery.ui.widget.js"/>
		<g:javascript src="jquery.ui.mouse.js"/>
		<g:javascript src="jquery.iviewer.js"/>

		
		<%-- Application Javascript --%>
		<script>
        var $ = jQuery;
        $(document).ready(function(){


              var iv1 = $('#viewer').iviewer({
                   src: '${createLink(controller: 'image', action: 'viewImage', id: imageInstance.id)}'
                   
              });
			  
			 
			  //$('#viewer').iviewer('center');
			  
              $("#in").click(function(){ iv1.iviewer('zoom_by', 1); });
              $("#out").click(function(){ iv1.iviewer('zoom_by', -1); });
              $("#fit").click(function(){ iv1.iviewer('fit'); });
              $("#orig").click(function(){ iv1.iviewer('set_zoom', 100); });
              $("#update").click(function(){ iv1.iviewer('update_container_info'); });

         
        });
		</script>

	</body>
</html>
