<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="indexer">
		<g:set var="entityName" value="${message(code: 'document.label', default: 'Document')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		
	</head>
	<body>
		<div class="fixed">
			<nav class="top-bar" data-topbar>
			  <ul class="title-area">
			    <li class="name">
			      <h1><a href="/virtualcourthouse/x">Virtual Courthouse</a></h1>
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
			          <li><a href="/virtualcourthouse/assignment/index">Assignment List</a></li>
			          <li><a href="/virtualcourthouse/document/index">Unsubmitted Docs</a></li>
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
