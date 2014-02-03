<%@ page import="net.rcenergy.USState" %>



<div class="fieldcontain ${hasErrors(bean: USStateInstance, field: 'districts', 'error')} ">
	<label for="districts">
		<g:message code="USState.districts.label" default="Districts" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${USStateInstance?.districts?}" var="d">
    <li><g:link controller="district" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="district" action="create" params="['USState.id': USStateInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'district.label', default: 'District')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: USStateInstance, field: 'layout', 'error')} ">
	<label for="layout">
		<g:message code="USState.layout.label" default="Layout" />
		
	</label>
	<g:textField name="layout" value="${USStateInstance?.layout}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: USStateInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="USState.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${USStateInstance?.name}"/>
</div>

