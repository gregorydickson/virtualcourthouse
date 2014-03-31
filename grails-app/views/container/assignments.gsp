<%@ page import="net.rcenergy.Container" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'container.label', default: 'Container')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				
			</ul>
		</div>
		<div id="edit-container" class="content scaffold-edit" role="main">
			<h1>Add Assignments to Container</h1>
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
			<g:form action="update" >
				<g:hiddenField name="id" value="${containerInstance?.id}" />
				<div class="fieldcontain ${hasErrors(bean: containerInstance, field: 'assignments', 'error')} ">
					<label for="assignments">
						<g:message code="container.assignments.label" default="Assignments" />
					</label>
					<g:select name="assignments" from="${assignmentInstanceList}" multiple="true" keys="${assignmentInstanceList.id}" style="height:500px;" size="5" value="${containerInstance?.assignments*.id}" class="many-to-many"/>
				</div>
				<fieldset class="buttons">
					<g:actionSubmit name="save" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
