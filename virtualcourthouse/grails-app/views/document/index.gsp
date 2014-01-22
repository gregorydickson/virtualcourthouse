
<%@ page import="net.rcenergy.Document" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'document.label', default: 'Document')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-document" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-document" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="bookNumber" title="${message(code: 'document.bookNumber.label', default: 'Book Number')}" />
					
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
					
						<td><g:link action="show" id="${documentInstance.id}">${fieldValue(bean: documentInstance, field: "bookNumber")}</g:link></td>
					
						<td><g:formatDate date="${documentInstance.fileDate}" /></td>
					
						<td><g:formatDate date="${documentInstance.instrumentDate}" /></td>
					
						<td>${fieldValue(bean: documentInstance, field: "instrumentNumber")}</td>
					
						<td>${fieldValue(bean: documentInstance, field: "instrumentType")}</td>
					
						<td>${fieldValue(bean: documentInstance, field: "pageNumber")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${documentInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
