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
			      <h1><a href="/virtualcourthouse/">The Edge</a></h1>
			    </li>
			    <li class="toggle-topbar menu-icon"><a href="#"></a></li>
			  </ul>

			  <section class="top-bar-section">
			    <!-- Right Nav Section -->
			    <ul class="right">
			      <li class="active"><a href="#">Help</a></li>
			      <li class="has-dropdown">
			        <a href="#">Actions</a>
			        <ul class="dropdown">
			          <li><a href="/virtualcourthouse/assignment/index">Change Assignment</a></li>
			          <li><a href="/virtualcourthouse/document/index">Document List</a></li>
			        </ul>
			      </li>
			    </ul>

			    <!-- Left Nav Section -->
			    <ul class="left">
			      <li><a href="/virtualcourthouse/logout/index">Logout</a></li>
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
