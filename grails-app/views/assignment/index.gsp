
<%@ page import="net.rcenergy.Assignment"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'assignment.label', default: 'Assignment')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<a href="#list-assignment" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>
			<li><g:link class="create" action="create">
					<g:message code="default.new.label" args="[entityName]" />
				</g:link></li>
		</ul>
	</div>
	<div id="list-assignment" class="content scaffold-list" role="main">
		<h1>
			<g:message code="default.list.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<sec:ifLoggedIn>
			Logged IN
			</sec:ifLoggedIn>
			<br><br>
			UserName:<sec:loggedInUserInfo field="username"/>
			<br>
			<br>
			<sec:ifNotLoggedIn>
			<g:link controller='login' action='auth'>Login</g:link>
			</sec:ifNotLoggedIn>
			<sec:ifAllGranted roles="ROLE_INDEXER">I AM AN INDEXER</sec:ifAllGranted>
			<sec:loggedInUserInfo field="username"/>
		<table>
			<thead>
				<tr>

					<th><g:message code="assignment.indexer.label" default="Indexer" /></th>
					
					<th><g:message code="assignment.reviewer.label" default="Reviewer" /></th>

					<th>COUNTY</th>
					
					<th>WORK ASSIGNMENT</th>
				</tr>
			</thead>
			<tbody>
				<g:each in="${assignmentInstanceList}" status="i"
					var="assignmentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
							<td>
								${fieldValue(bean: assignmentInstance.indexer, field: "username")}
							</td>
							
							<td>
								${fieldValue(bean: assignmentInstance.reviewer, field: "username")}
							</td>
							
							<td>
								${fieldValue(bean: assignmentInstance.district, field: "name")}
							</td>
							<td>
								<g:link action="work" id="${assignmentInstance.id}">
									Work Assignment															
								</g:link>
							</td>

					</tr>
				</g:each>
			</tbody>
		</table>
		<div class="pagination">
			<g:paginate total="${assignmentInstanceCount ?: 0}" />
		</div>
	</div>
</body>
</html>
