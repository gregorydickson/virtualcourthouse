<%@ page import="net.rcenergy.Assignment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'assignment.label', default: 'Assignment')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#edit-assignment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="edit-assignment" class="content scaffold-edit" role="main">
			<h1>SET COUNTY</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${assignmentInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${assignmentInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:assignmentInstance, action:'create']" method="POST" >
				<g:hiddenField name="version" value="${assignmentInstance?.version}" />
				<fieldset class="form">
				<div class="fieldcontain ${hasErrors(bean: assignmentInstance, field: 'reviewer', 'error')} required">
					<label for="district"> COUNTY
					</label>
					<g:select id="district" name="district.id" from="${net.rcenergy.District.list()}" optionKey="id" required="" value="${assignmentInstance?.district?.id}" class="many-to-one" />
				</div>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="create" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
