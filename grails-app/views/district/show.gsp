
<%@ page import="net.rcenergy.District" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'district.label', default: 'District')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-district" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-district" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list district">
			
				<g:if test="${districtInstance?.books}">
				<li class="fieldcontain">
					<span id="books-label" class="property-label"><g:message code="district.books.label" default="Books" /></span>
					
						<g:each in="${districtInstance.books}" var="b">
						<span class="property-value" aria-labelledby="books-label"><g:link controller="book" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${districtInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="district.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${districtInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${districtInstance?.usstate}">
				<li class="fieldcontain">
					<span id="usstate-label" class="property-label"><g:message code="district.usstate.label" default="Usstate" /></span>
					
						<span class="property-value" aria-labelledby="usstate-label"><g:link controller="USState" action="show" id="${districtInstance?.usstate?.id}">${districtInstance?.usstate?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:districtInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${districtInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
