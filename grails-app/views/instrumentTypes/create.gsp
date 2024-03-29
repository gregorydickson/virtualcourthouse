<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="instrumenttypes">
		<g:set var="entityName" value="${message(code: 'instrumentTypes.label', default: 'InstrumentTypes')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-instrumentTypes" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-instrumentTypes" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${instrumentTypesInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${instrumentTypesInstance}" var="error">
				<li> <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<form data-abide="ajax" id="instrumentTypes">
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				
				<input type="button" id="ajaxit" value="AJAXIT">
			</form>
		</div>

	</body>

</html>
