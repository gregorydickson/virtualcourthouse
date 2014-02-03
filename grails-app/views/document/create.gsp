<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="document">
		<g:set var="entityName" value="${message(code: 'document.label', default: 'Document')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		
	</head>
	<body>
		<div class="fixed">
			<nav class="top-bar" data-topbar>
			  <ul class="title-area">
			    <li class="name">
			      <h1><a href="${createLink(uri: '/')}">Virtual Courthouse</a></h1>
			    </li>
			  </ul>
			  <ul class="left">
				<li>
			      <g:message code="default.create.label" args="[entityName]" />
			    </li>
			  </ul>
			  <ul class="right">
				<li class="has-form">
				  <g:link class="button" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link>
				</li>
			  </ul>
			</nav>
		</div>
	
		<div class="row">
			<div class="12-medium columns">
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${documentInstance}">
				<ul class="errors" role="alert">
					<g:eachError bean="${documentInstance}" var="error">
					<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
					</g:eachError>
				</ul>
			</g:hasErrors>
			</div>
		</div>
		<form action="/virtualcourthouse/document/save" method="post" class="custom create_doc_form" id="create_doc_form" data-abide="ajax">
			<fieldset class="form">
				<g:render template="form"/>
			</fieldset>
			<fieldset class="buttons">
				<g:submitButton name="Save Document" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
			</fieldset>
		</form>
		
	</body>
</html>
