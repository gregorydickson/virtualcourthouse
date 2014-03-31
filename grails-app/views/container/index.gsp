
<%@ page import="net.rcenergy.Container" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'container.label', default: 'Container')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<sec:ifAllGranted roles="ROLE_INDEXER">INDEXER</sec:ifAllGranted>
			<sec:ifAllGranted roles="ROLE_REVIEWER">REVIEWER</sec:ifAllGranted>
			<sec:ifAllGranted roles="ROLE_SUPERVISOR">SUPERVISOR</sec:ifAllGranted>
			<sec:ifAllGranted roles="ROLE_ADMIN">ADMIN</sec:ifAllGranted>
		<div id="list-container" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="container.district.label" default="District" /></th>
					
						<th><g:message code="container.supervisor.label" default="Supervisor" /></th>
					
						<g:sortableColumn property="complete" title="${message(code: 'container.complete.label', default: 'Complete')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${containerInstanceList}" status="i" var="containerInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${containerInstance.id}">${fieldValue(bean: containerInstance, field: "district")}</g:link></td>
					
						<td>${fieldValue(bean: containerInstance, field: "supervisor")}</td>
					
						<td><g:formatBoolean boolean="${containerInstance.complete}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${containerInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
