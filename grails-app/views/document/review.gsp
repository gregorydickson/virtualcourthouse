<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="review">
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
			    <!-- Right Nav Section -->
			    <ul class="right">
			      <li class="active"><a href="#">Right Button Active</a></li>
			      <li class="has-dropdown">
			        <a href="#">Right Button with Dropdown</a>
			        <ul class="dropdown">
			          <li><a href="#">First link in dropdown</a></li>
			        </ul>
			      </li>
			    </ul>

			    <!-- Left Nav Section -->
			    <ul class="left">
			      <li><a href="#">Left Nav Button</a></li>
			    </ul>
			  </section>
			</nav>
		</div>
	
		
		<form  id="create_doc_form" data-abide="ajax">
			<fieldset class="form">
				<g:render template="form"/>
			</fieldset>
			
		</form>
		
	</body>
</html>
