
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
		<table>
			<thead>
				<tr>

					<th><g:message code="assignment.user.label" default="User" /></th>

					<th><g:message code="assignment.user.label" default="Images" /></th>
					
					<th><g:message code="assignment.user.label" default="Action" /></th>
				</tr>
			</thead>
			<tbody>
				<g:each in="${assignmentInstanceList}" status="i"
					var="assignmentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
							<td>
								${fieldValue(bean: assignmentInstance.user, field: "username")}
							</td>

							<td>
								<g:each in="${assignmentInstance.images}" var="i2">
									<span class="property-value" aria-labelledby="images-label">${i2?.displayString}</span>
									<br/>
								</g:each>
							</td>
							<td>
								<g:link action="show" id="${assignmentInstance.id}">
									<g:message code="assignment.user.label" default="View" />															
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
