<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="assignmentcreate">
		<g:set var="entityName" value="${message(code: 'assignment.label', default: 'Assignment')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-assignment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-assignment" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
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
			<g:form url="[resource:assignmentInstance, action:'save']" >
				<fieldset class="form">
					<div class="fieldcontain ${hasErrors(bean: assignmentInstance, field: 'images', 'error')} ">
						<label for="images"> <g:message code="assignment.images.label" default="Images" />
						</label>
						<g:select class="imageselect" name="images" from="${imageInstanceList}"	multiple="multiple" optionKey="id" optionValue="displayString" size="5" value="${assignmentInstance?.images*.id}" style="height:500px;"/>
					</div>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
		
		<script>
		var districtId = ${assignmentInstance.district.id};
		</script>
	</body>
</html>
