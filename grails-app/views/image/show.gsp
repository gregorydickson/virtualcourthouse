
<%@ page import="net.rcenergy.Image" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="image">
		<g:set var="entityName" value="${message(code: 'image.label', default: 'Image')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		
		<div id="show-image wrapper" class="content scaffold-show" role="main">
	
			<ol class="property-list image">
			
				<g:if test="${imageInstance?.image}">
					<span>
		                <a id="in" href="#">+</a>
		                <a id="out" href="#">-</a>
		                <a id="fit" href="#">fit</a>
		                <a id="orig" href="#">orig</a>
		                <a id="update" href="#">update</a>
				    </span>
					<div id="viewer" class="viewer"></div>

				</g:if>
			
				<g:if test="${imageInstance?.bookNumber}">
				<li class="fieldcontain">
					<span id="bookNumber-label" class="property-label"><g:message code="image.bookNumber.label" default="Book Number" /></span>
					
						<span class="property-value" aria-labelledby="bookNumber-label"><g:fieldValue bean="${imageInstance}" field="bookNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${imageInstance?.dateLoaded}">
				<li class="fieldcontain">
					<span id="dateLoaded-label" class="property-label"><g:message code="image.dateLoaded.label" default="Date Loaded" /></span>
					
						<span class="property-value" aria-labelledby="dateLoaded-label"><g:formatDate date="${imageInstance?.dateLoaded}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${imageInstance?.documents}">
				<li class="fieldcontain">
					<span id="documents-label" class="property-label"><g:message code="image.documents.label" default="Documents" /></span>
					
						<g:each in="${imageInstance.documents}" var="d">
						<span class="property-value" aria-labelledby="documents-label"><g:link controller="document" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${imageInstance?.pageNumber}">
				<li class="fieldcontain">
					<span id="pageNumber-label" class="property-label"><g:message code="image.pageNumber.label" default="Page Number" /></span>
					
						<span class="property-value" aria-labelledby="pageNumber-label"><g:fieldValue bean="${imageInstance}" field="pageNumber"/></span>
					
				</li>
				</g:if>
			
			</ol>
			
		</div>
	</body>
</html>
