<%@ page import="net.rcenergy.USState" %>



<div class="fieldcontain ${hasErrors(bean: USStateInstance, field: 'districts', 'error')} ">
	<label for="districts">
		<g:message code="USState.districts.label" default="Districts" />
		
	</label>
	<g:select name="districts" from="${net.rcenergy.District.list()}" multiple="multiple" optionKey="id" size="5" value="${USStateInstance?.districts*.id}" class="many-to-many"/>
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

