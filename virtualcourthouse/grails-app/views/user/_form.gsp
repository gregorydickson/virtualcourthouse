<%@ page import="net.rcenergy.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'assignments', 'error')} ">
	<label for="assignments">
		<g:message code="user.assignments.label" default="Assignments" />
		
	</label>
	<g:select name="assignments" from="${net.rcenergy.Assignment.list()}" multiple="multiple" optionKey="id" size="5" value="${userInstance?.assignments*.id}" class="many-to-many"/>
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

