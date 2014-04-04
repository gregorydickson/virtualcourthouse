<%@ page import="net.rcenergy.Document" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="audit">
		<g:set var="entityName" value="${message(code: 'document.label', default: 'Document')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		
	</head>
	<body>
		<div class="fixed">
			<nav class="top-bar" data-topbar>
			  <ul class="title-area">
			    <li class="name">
			      <h1><a href="#">Virtual Courthouse</a></h1>
			    </li>
			    <li class="toggle-topbar menu-icon"><a href="#">Menu</a></li>
			  </ul>

			  <section class="top-bar-section">
			    

			    <!-- Left Nav Section -->
			    <ul class="left">
			      <li><g:link controller="document" action="index" >Document List</g:link></li>
			    </ul>
			  </section>
			</nav>
		</div>


		<g:each in="${documentInstanceList}" status="i" var="documentInstance">
			<form  id="auditDocumentNumber${i}">
				<fieldset class="form" id="auditDocumentNumber${i}">
					<g:render template="form" model="${[documentInstance: documentInstance]}"/>
				</fieldset>
			</form>
	   </g:each>
	   
	</body>
</html>
