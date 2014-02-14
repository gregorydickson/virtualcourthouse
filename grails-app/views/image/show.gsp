
<%@ page import="net.rcenergy.Image" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="image">
		<g:set var="entityName" value="${message(code: 'image.label', default: 'Image')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-image" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-image" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list image">
			
				<g:if test="${imageInstance?.image}">
				<li class="fieldcontain">
					<span id="image-label" class="property-label"><g:message code="image.image.label" default="Image" /></span>
					<img src="${createLink(controller: 'image', action: 'viewImage', id: imageInstance.id)}" />
				</li>
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
			<g:form url="[resource:imageInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${imageInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
