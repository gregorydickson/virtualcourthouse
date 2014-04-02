<%@ page import="net.rcenergy.Assignment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'assignment.label', default: 'Assignment')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="edit-assignment" class="content scaffold-edit" role="main">
			<h1>Assignment Workflow</h1>
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
			<g:form controller="assignment" method="POST" >
				<g:hiddenField name="version" value="${assignmentInstance?.version}" />
				<fieldset class="form">
					<input type="hidden" name="id" value="${assignmentInstance?.id}" />
					<div
						class="fieldcontain ${hasErrors(bean: assignmentInstance, field: 'indexer', 'error')}">
						<label for="indexer"> <g:message code="assignment.indexer.label"
								default="Indexer" /> 
						</label>
						<g:select id="indexer" noSelection="${['':'Assign...']}" name="indexer.id" from="${indexerInstanceList}"
							optionKey="id" optionValue="username"  value="${assignmentInstance?.indexer?.id}"
							class="many-to-one" />
						<g:actionSubmit class="save" action="assignindexer" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					</div>
					<div
						class="fieldcontain ${hasErrors(bean: assignmentInstance, field: 'reviewer', 'error')} ">
						<label for="reviewer"> <g:message code="assignment.reviewer.label"
								default="Reviewer" /> 
						</label>
						<g:select id="reviewer" noSelection="${['':'Assign...']}" name="reviewer.id" from="${reviewerInstanceList}"
							optionKey="id" optionValue="username"  value="${assignmentInstance?.reviewer?.id}"
							class="many-to-one" />
							<g:actionSubmit class="save" action="assignreviewer" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					</div>
					<div
						class="fieldcontain ${hasErrors(bean: assignmentInstance, field: 'admin', 'error')} required">
						<label > ADMIN
						</label>
						<g:select id="reviewer" noSelection="${['':'Assign...']}" name="admin.id" from="${adminInstanceList}"
							optionKey="id" optionValue="username"  value="${assignmentInstance?.admin?.id}"
							class="many-to-one" />
						<g:actionSubmit class="save" action="assignadmin" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					</div>
				</fieldset>
				

			</g:form>
		</div>
	</body>
</html>
