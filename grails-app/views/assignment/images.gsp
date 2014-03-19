<%@ page import="net.rcenergy.Image" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="infinity">
	</head>
	<body>
		

		<div id='list-view' class="list-view"></div>        

		<script>
		var imagesCount = ${assignmentInstance.images.size()};
		var imagesIdStart = ${assignmentInstance.images[0].id};
		<%   
			def imageIdList = []
			assignmentInstance.images.eachWithIndex() {obj, i -> imageIdList.add(obj.id)};
		%>
		var imageIdList = ${imageIdList};
        				
		</script>
	</body>
</html>