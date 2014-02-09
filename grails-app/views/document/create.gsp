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
	
		
		<form  id="create_doc_form" data-abide="ajax">
			<fieldset class="form">
				<g:render template="form"/>
			</fieldset>
			
		</form>
		
	</body>
</html>
