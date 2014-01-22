<%@ page import="net.rcenergy.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'assignments', 'error')} ">
	<label for="assignments">
		<g:message code="user.assignments.label" default="Assignments" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${userInstance?.assignments?}" var="a">
    <li><g:link controller="assignment" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="assignment" action="create" params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'assignment.label', default: 'Assignment')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="user.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${userInstance?.enabled}" />
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} ">
	<label for="password">
		<g:message code="user.password.label" default="Password" />
		
	</label>
	<g:textField name="password" value="${userInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'salt', 'error')} ">
	<label for="salt">
		<g:message code="user.salt.label" default="Salt" />
		
	</label>
	<g:textField name="salt" value="${userInstance?.salt}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} ">
	<label for="username">
		<g:message code="user.username.label" default="Username" />
		
	</label>
	<g:textField name="username" value="${userInstance?.username}"/>
</div>

