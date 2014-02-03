
<%@ page import="net.rcenergy.InstrumentTypes" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'instrumentTypes.label', default: 'InstrumentTypes')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-instrumentTypes" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-instrumentTypes" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="instrumentType" title="${message(code: 'instrumentTypes.instrumentType.label', default: 'Instrument Type')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${instrumentTypesInstanceList}" status="i" var="instrumentTypesInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${instrumentTypesInstance.id}">${fieldValue(bean: instrumentTypesInstance, field: "instrumentType")}</g:link></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${instrumentTypesInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
