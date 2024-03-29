<%@ page import="net.rcenergy.Container" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'container.label', default: 'Container')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#edit-container" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="edit-container" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${containerInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${containerInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:containerInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${containerInstance?.version}" />
				<fieldset class="form">
					<g:hiddenField name="version" value="${containerInstance?.version}" />
				<div class="fieldcontain ${hasErrors(bean: containerInstance, field: 'assignments', 'error')} ">
					<label for="assignments">
						<g:message code="container.assignments.label" default="Assignments" />
					</label>
					<g:select name="assignments" from="${assignmentInstanceList}" multiple="true" keys="${assignmentInstanceList?.id}" style="height:500px;" size="5" value="${containerInstance?.assignments?.id}" class="many-to-many"/>
				</div>
				<fieldset class="buttons">
					<g:actionSubmit name="save" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
