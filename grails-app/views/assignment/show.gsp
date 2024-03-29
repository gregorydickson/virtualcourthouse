
<%@ page import="net.rcenergy.Assignment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'assignment.label', default: 'Assignment')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-assignment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-assignment" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list assignment">
			
				<g:if test="${assignmentInstance?.images}">
				<li class="fieldcontain">
					<span id="images-label" class="property-label"><g:message code="assignment.images.label" default="Images" /></span>
					
						<g:each in="${assignmentInstance.images}" var="i">
						<span class="property-value" aria-labelledby="images-label"><g:link controller="user" action="show" id="${i.id}">${i?.displayString}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${assignmentInstance?.indexer}">
				<li class="fieldcontain">
					<span id="indexer-label" class="property-label"><g:message code="assignment.indexer.label" default="Indexer" /></span>
					
						<span class="property-value" aria-labelledby="indexer-label"><g:link controller="user" action="show" id="${assignmentInstance?.indexer?.id}">${assignmentInstance?.indexer?.username}</g:link></span>
					
				</li>
				</g:if>
				
				<g:if test="${assignmentInstance?.reviewer}">
				<li class="fieldcontain">
					<span id="reviewer-label" class="property-label"><g:message code="assignment.reviewer.label" default="Reviewer" /></span>
					
						<span class="property-value" aria-labelledby="reviewer-label"><g:link controller="reviewer" action="show" id="${assignmentInstance?.reviewer?.id}">${assignmentInstance?.reviewer?.username}</g:link></span>
					
				</li>
				</g:if>
				
			
			</ol>
			<g:form url="[resource:assignmentInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">				
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
