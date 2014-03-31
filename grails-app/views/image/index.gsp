<%@ page import="net.rcenergy.Image" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="infinity">
	</head>
	<body>
		

		<div id='list-view'></div>        

		<script>

		var imagesIdStart = ${Image.first().id};
		<%   
			def imageIdList = []
			Image.getAll().eachWithIndex() {obj, i -> imageIdList.add(obj.id)};
		%>
		var imageIdList = ${imageIdList};

		var imagesCount = ${Image.count()};
		var imagesIdStart = 1;
		</script>
	</body>
</html>
