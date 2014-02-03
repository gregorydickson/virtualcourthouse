
<%@ page import="net.rcenergy.Document" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'document.label', default: 'Document')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-document" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-document" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list document">
			
				<g:if test="${documentInstance?.bookNumber}">
				<li class="fieldcontain">
					<span id="bookNumber-label" class="property-label"><g:message code="document.bookNumber.label" default="Book Number" /></span>
					
						<span class="property-value" aria-labelledby="bookNumber-label"><g:fieldValue bean="${documentInstance}" field="bookNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${documentInstance?.childDocument}">
				<li class="fieldcontain">
					<span id="childDocument-label" class="property-label"><g:message code="document.childDocument.label" default="Child Document" /></span>
					
						<g:each in="${documentInstance.childDocument}" var="c">
						<span class="property-value" aria-labelledby="childDocument-label"><g:link controller="document" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${documentInstance?.fileDate}">
				<li class="fieldcontain">
					<span id="fileDate-label" class="property-label"><g:message code="document.fileDate.label" default="File Date" /></span>
					
						<span class="property-value" aria-labelledby="fileDate-label"><g:formatDate date="${documentInstance?.fileDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${documentInstance?.images}">
				<li class="fieldcontain">
					<span id="images-label" class="property-label"><g:message code="document.images.label" default="Images" /></span>
					
						<g:each in="${documentInstance.images}" var="i">
						<span class="property-value" aria-labelledby="images-label"><g:link controller="image" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${documentInstance?.instrumentDate}">
				<li class="fieldcontain">
					<span id="instrumentDate-label" class="property-label"><g:message code="document.instrumentDate.label" default="Instrument Date" /></span>
					
						<span class="property-value" aria-labelledby="instrumentDate-label"><g:formatDate date="${documentInstance?.instrumentDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${documentInstance?.instrumentNumber}">
				<li class="fieldcontain">
					<span id="instrumentNumber-label" class="property-label"><g:message code="document.instrumentNumber.label" default="Instrument Number" /></span>
					
						<span class="property-value" aria-labelledby="instrumentNumber-label"><g:fieldValue bean="${documentInstance}" field="instrumentNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${documentInstance?.instrumentType}">
				<li class="fieldcontain">
					<span id="instrumentType-label" class="property-label"><g:message code="document.instrumentType.label" default="Instrument Type" /></span>
					
						<span class="property-value" aria-labelledby="instrumentType-label"><g:link controller="instrumentTypes" action="show" id="${documentInstance?.instrumentType?.id}">${documentInstance?.instrumentType?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${documentInstance?.pageNumber}">
				<li class="fieldcontain">
					<span id="pageNumber-label" class="property-label"><g:message code="document.pageNumber.label" default="Page Number" /></span>
					
						<span class="property-value" aria-labelledby="pageNumber-label"><g:fieldValue bean="${documentInstance}" field="pageNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${documentInstance?.parentDocument}">
				<li class="fieldcontain">
					<span id="parentDocument-label" class="property-label"><g:message code="document.parentDocument.label" default="Parent Document" /></span>
					
						<g:each in="${documentInstance.parentDocument}" var="p">
						<span class="property-value" aria-labelledby="parentDocument-label"><g:link controller="document" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:documentInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${documentInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
