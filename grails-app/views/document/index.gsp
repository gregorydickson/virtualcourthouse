<%@ page import="net.rcenergy.Document" %>
<%@ page import="net.rcenergy.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'document.label', default: 'Document')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<sec:ifAllGranted roles="ROLE_SUPERVISOR">
					<li><g:link controller="assignment" action="index" >Assignment List</g:link></li>
				</sec:ifAllGranted>
			</ul>
		</div>
		<div id="list-document" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>


			<sec:ifAllGranted roles="ROLE_INDEXER">
				<table>
				<thead>
						<tr>
						
							<g:sortableColumn property="id" title="${message(code: 'document.bookNumber.label', default: 'ID')}" />
						
							<g:sortableColumn property="fileDate" title="${message(code: 'document.fileDate.label', default: 'File Date')}" />
						
							<g:sortableColumn property="instrumentDate" title="${message(code: 'document.instrumentDate.label', default: 'Instrument Date')}" />
						
							<g:sortableColumn property="instrumentNumber" title="${message(code: 'document.instrumentNumber.label', default: 'Instrument Number')}" />
						
							<th><g:message code="document.instrumentType.label" default="Instrument Type" /></th>
						
							<g:sortableColumn property="pageNumber" title="${message(code: 'document.pageNumber.label', default: 'Page Number')}" />
						
						</tr>
					</thead>
					<tbody>
					<g:each in="${documentInstanceList}" status="i" var="documentInstance">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						
							<td><g:link action="create" id="${documentInstance.id}">${fieldValue(bean: documentInstance, field: "id")}</g:link>
								</td>
						
							<td><g:formatDate date="${documentInstance.fileDate}" /></td>
						
							<td><g:formatDate date="${documentInstance.instrumentDate}" /></td>
						
							<td>${fieldValue(bean: documentInstance, field: "instrumentNumber")}</td>
						
							<td>${fieldValue(bean: documentInstance, field: "instrumentType")}</td>
						
							<td>${fieldValue(bean: documentInstance, field: "pageNumber")}</td>
						
						</tr>
					</g:each>
					</tbody>
				</table>
			</sec:ifAllGranted>

			<sec:ifAllGranted roles="ROLE_REVIEWER">
				<table>
				<thead>
						<tr>
						
							<g:sortableColumn property="id" title="${message(code: 'document.bookNumber.label', default: 'ID')}" />
						
							<g:sortableColumn property="fileDate" title="${message(code: 'document.fileDate.label', default: 'File Date')}" />
						
							<g:sortableColumn property="instrumentDate" title="${message(code: 'document.instrumentDate.label', default: 'Instrument Date')}" />
						
							<g:sortableColumn property="instrumentNumber" title="${message(code: 'document.instrumentNumber.label', default: 'Instrument Number')}" />
						
							<th><g:message code="document.instrumentType.label" default="Instrument Type" /></th>
						
							<g:sortableColumn property="pageNumber" title="${message(code: 'document.pageNumber.label', default: 'Page Number')}" />
						
						</tr>
					</thead>
					<tbody>
					<g:each in="${documentInstanceList}" status="i" var="documentInstance">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						
							<td><g:link action="review" id="${documentInstance.id}">${fieldValue(bean: documentInstance, field: "id")}</g:link>
								</td>
						
							<td><g:formatDate date="${documentInstance.fileDate}" /></td>
						
							<td><g:formatDate date="${documentInstance.instrumentDate}" /></td>
						
							<td>${fieldValue(bean: documentInstance, field: "instrumentNumber")}</td>
						
							<td>${fieldValue(bean: documentInstance, field: "instrumentType")}</td>
						
							<td>${fieldValue(bean: documentInstance, field: "pageNumber")}</td>
						
						</tr>
					</g:each>
					</tbody>
				</table>
			</sec:ifAllGranted>

			<sec:ifAllGranted roles="ROLE_SUPERVISOR">
				<table>
				<thead>
						<tr>
						
							<g:sortableColumn property="id" title="${message(code: 'document.bookNumber.label', default: 'ID')}" />
						
							<g:sortableColumn property="fileDate" title="${message(code: 'document.fileDate.label', default: 'File Date')}" />
						
							<g:sortableColumn property="instrumentDate" title="${message(code: 'document.instrumentDate.label', default: 'Instrument Date')}" />
						
							<g:sortableColumn property="instrumentNumber" title="${message(code: 'document.instrumentNumber.label', default: 'Instrument Number')}" />
						
							<th><g:message code="document.instrumentType.label" default="Instrument Type" /></th>
						
							<g:sortableColumn property="pageNumber" title="${message(code: 'document.pageNumber.label', default: 'Page Number')}" />
						
						</tr>
					</thead>
					<tbody>
					<g:each in="${documentInstanceList}" status="i" var="documentInstance">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						
							<td><g:link action="audit" id="${documentInstance.id}">${fieldValue(bean: documentInstance, field: "id")}</g:link>
								</td>
						
							<td><g:formatDate date="${documentInstance.fileDate}" /></td>
						
							<td><g:formatDate date="${documentInstance.instrumentDate}" /></td>
						
							<td>${fieldValue(bean: documentInstance, field: "instrumentNumber")}</td>
						
							<td>${fieldValue(bean: documentInstance, field: "instrumentType")}</td>
						
							<td>${fieldValue(bean: documentInstance, field: "pageNumber")}</td>
						
						</tr>
					</g:each>
					</tbody>
				</table>
			</sec:ifAllGranted>

			<div class="pagination">
				<g:paginate total="${documentInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
