<%@ page import="net.rcenergy.Image" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="infinity">
	</head>
	<body>
		

		<div id='list-view' class="list-view"></div>        

		<script>
		
		<%   
			def imageIdList = []
			def listSize
			def firstId
			if(assignmentInstance.indexStarted == true)
			{
				assignmentInstance.imagesRemaining.eachWithIndex() {obj, i -> imageIdList.add(obj.id)};
				firstId = assignmentInstance.imagesRemaining[0].id
				listSize = assignmentInstance.imagesRemaining.size()
			} else {
				assignmentInstance.images.eachWithIndex() {obj, i -> imageIdList.add(obj.id)};
				firstId = assignmentInstance.images[0].id
				listSize = assignmentInstance.images.size()
			}
			
		%>
		var imagesCount = ${listSize};
		var imagesIdStart = ${firstId};
		
		var imageIdList = ${imageIdList};
        				
		</script>
	</body>
</html>