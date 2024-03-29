
<%@ page import="net.rcenergy.USState" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'USState.label', default: 'USState')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-USState" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-USState" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list USState">
			
				<g:if test="${USStateInstance?.districts}">
				<li class="fieldcontain">
					<span id="districts-label" class="property-label"><g:message code="USState.districts.label" default="Districts" /></span>
					
						<g:each in="${USStateInstance.districts}" var="d">
						<span class="property-value" aria-labelledby="districts-label"><g:link controller="district" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${USStateInstance?.layout}">
				<li class="fieldcontain">
					<span id="layout-label" class="property-label"><g:message code="USState.layout.label" default="Layout" /></span>
					
						<span class="property-value" aria-labelledby="layout-label"><g:fieldValue bean="${USStateInstance}" field="layout"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${USStateInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="USState.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${USStateInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:USStateInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${USStateInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
