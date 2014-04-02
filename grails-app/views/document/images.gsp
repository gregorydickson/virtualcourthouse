<%@ page import="net.rcenergy.Image" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="documentimages">
	</head>
	<body>
		

		<div id='list-view' class="list-view"></div>        

		<script>
		
		<%   
			def imageIdList = []
			def listSize
			def firstId
			
			documentInstance.images.eachWithIndex() {obj, i -> imageIdList.add(obj.id)};
			firstId = documentInstance.images[0].id
			listSize = documentInstance.images.size()
			
		%>
		var imagesCount = ${listSize};
		var imagesIdStart = ${firstId};
		
		var imageIdList = ${imageIdList};
        				
		</script>

	</body>
</html>