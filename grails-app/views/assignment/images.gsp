<%@ page import="net.rcenergy.Image" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="infinity">
	</head>
	<body>
		

		<div id='list-view'></div>        

		<script>
		var imagesCount = ${assignmentInstance.images.size()};
		var imagesIdStart = ${assignmentInstance.images[0].id};
		</script>
	</body>
</html>