
<%@ page import="net.rcenergy.Assignment"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="assignment">
<g:set var="entityName"
	value="${message(code: 'assignment.label', default: 'Assignment')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>

	<sec:ifAllGranted roles="ROLE_ADMIN">
		<div class="nav row" role="navigation">
			<ul>
				<li><g:link class="create" action="start">
						<g:message code="default.new.label" args="[entityName]" />
					</g:link>
				</li>
			</ul>
		</div>
	</sec:ifAllGranted>
	<div class="nav row" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label" /></a></li>
			</ul>
	</div>
	<div class="row" >
		<h1>
			<g:message code="default.list.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		
		<br>
		UserName: <sec:loggedInUserInfo field="username"/>
		<br><br><br>

		
		<sec:ifAllGranted roles="ROLE_ADMIN">

			<div class="row">
				<div class="large-2 columns">
					<label>SUPERVISOR</label>
					<g:select optionKey="id" noSelection="${['':'Assign...']}" name="novalue"  optionValue="username" class="assignsupervisor"  from="${supervisorInstanceList}" />
				</div>
				<div class="large-10 columns">
				</div>
			</div>

			<div class="row">
			<g:form action="supervisor" method="POST" >
				
				<table>
					<thead>
						<tr>
							<th>ID</th>
							<th>ASSIGN</th>
							<th>County</th>
							<th>Review Complete Date</th>
							<th>Supervisor</th>
						</tr>
					</thead>
					<tbody>
						<g:each in="${assignmentInstanceList}" status="i" var="assignmentInstance">
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
								<td>
									<g:link action="edit" id="${assignmentInstance.id}">
										${fieldValue(bean: assignmentInstance, field: "id")}
									</g:link>
								</td>
								<td>
									<g:checkBox class="" name="assignment.${assignmentInstance.id}.supervisor" value="" />
								</td>
								<td>
									${assignmentInstance.district.toString()}
								</td>
								<td>
									<g:formatDate format="MM/dd/yyyy" date="${assignmentInstance?.reviewComplete}"/>
								</td>
								<td>
									${assignmentInstance?.supervisor?.username}
								</td>
							</tr>
						</g:each>
					</tbody>
				</table>
					<fieldset class="buttons">
						<g:actionSubmit class="save" action="supervisor" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					</fieldset>
			</g:form>
		</sec:ifAllGranted>

		<sec:ifAllGranted roles="ROLE_SUPERVISOR">
			<table>
				<thead>
					<tr>
						<th>ASSIGN</th>
						<th>County</th>
						<th>Date Arrived</th>
						<th>Indexer Assigned Date</th>
						<th>Indexer</th>
						<th>Indexer Complete Date</th>
						<th>Review Assigned Date</th>
						<th>Reviewer</th>
						<th>Review Complete Date</th>
						<th>Finalized to Admin Date</th>
						<th>Accuracy %</th>
						<th>Audit Assignment</th>
					</tr>
				</thead>
				<tbody>
					<g:each in="${assignmentInstanceList}" status="i" var="assignmentInstance">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
							<td>
								<g:link action="supervisoredit" id="${assignmentInstance.id}">
									${fieldValue(bean: assignmentInstance, field: "id")}
								</g:link>
							</td>
							<td>
								${assignmentInstance.district.toString()}
							</td>
							<td>
								<g:formatDate format="MM/dd/yyyy" date="${assignmentInstance.supervisorAssigned}"/>
							</td>
							<td>
								<g:formatDate format="MM/dd/yyyy" date="${assignmentInstance.indexerAssigned}"/>
							</td>
							<td>
								${fieldValue(bean: assignmentInstance.indexer, field: "username")}
							</td>
							<td>
								<g:formatDate format="MM/dd/yyyy" date="${assignmentInstance.indexingComplete}"/>
							</td>
							<td>
								<g:formatDate format="MM/dd/yyyy" date="${assignmentInstance.reviewerAssigned}"/>
							</td>
							<td>
								${fieldValue(bean: assignmentInstance.reviewer, field: "username")}
							</td>
							<td>
								<g:formatDate format="MM/dd/yyyy" date="${assignmentInstance.reviewComplete}"/>
							</td>
							<td>
								<g:formatDate format="MM/dd/yyyy" date="${assignmentInstance.finalizedToAdmin}"/>
							</td>
							<td>
								${fieldValue(bean: assignmentInstance, field: "auditPercentage")}
							</td>
							<td>
								<g:link action="audit" id="${assignmentInstance.id}">
									${fieldValue(bean: assignmentInstance, field: "id")}
								</g:link>
							</td>
						</tr>
					</g:each>
				</tbody>
			</table>
		</sec:ifAllGranted>


		<sec:ifAllGranted roles="ROLE_INDEXER">
			<table>
				<thead>
					<tr>

						<th>ID</th>
						
						<th>Assigned Date</th>

						<th>COUNTY</th>
						
						<th>WORK ASSIGNMENT</th>

						<th>ASSIGNMENT COMPLETE</th>
					</tr>
				</thead>
				<tbody>
					<g:each in="${assignmentInstanceList}" status="i"
						var="assignmentInstance">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
								<td>
									${fieldValue(bean: assignmentInstance, field: "id")}
								</td>
								
								<td>
									<g:formatDate format="MM/dd/yyyy" date="${assignmentInstance.indexerAssigned}"/>
								</td>
								
								<td>
									${assignmentInstance.district.toString()}
								</td>
								<td>
									<g:link action="work" id="${assignmentInstance.id}">
										Work Assignment															
									</g:link>
								</td>
								<td>
									<g:link action="indexercomplete" id="${assignmentInstance.id}">
										Complete															
									</g:link>
								</td>

						</tr>
					</g:each>
				</tbody>
			</table>
		</sec:ifAllGranted>

		<sec:ifAllGranted roles="ROLE_REVIEWER">
			<table>
				<thead>
					<tr>

						<th><g:message code="assignment.indexer.label" default="Indexer" /></th>
						
						<th><g:message code="assignment.reviewer.label" default="Reviewer" /></th>

						<th>COUNTY</th>
						
						<th>WORK ASSIGNMENT</th>

						<th>COMPLETE ASSIGNMENT</th>
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
									${assignmentInstance.district.toString()}
								</td>
								<td>
									<g:link action="review" id="${assignmentInstance.id}">
										Work Assignment															
									</g:link>
								</td>
								<td>
									<g:link action="reviewercomplete" id="${assignmentInstance.id}">
										Complete															
									</g:link>
								</td>

						</tr>
					</g:each>
				</tbody>
			</table>
		</sec:ifAllGranted>
	</div>
	<div class="pagination">
		<g:paginate total="${assignmentInstanceCount ?: 0}" />
	</div>

</body>
</html>
