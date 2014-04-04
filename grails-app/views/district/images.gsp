<%@ page import="net.rcenergy.Image" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="documentimages">
	</head>
	<body>
		

		<div id='list-view'></div>        

		<script>

		var imagesIdStart = ${imageInstanceList.first().id};
		<%   
			def imageIdList = []
			imageInstanceList.eachWithIndex() {obj, i -> imageIdList.add(obj.id)};
	
		%>
		var imageIdList = ${imageIdList};

		var imagesCount = ${imageInstanceList.size()};
		
		</script>
	</body>
</html>
