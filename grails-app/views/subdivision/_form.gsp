<%@ page import="net.rcenergy.Subdivision" %>



<div class="fieldcontain ${hasErrors(bean: subdivisionInstance, field: 'city', 'error')} required">
	<label for="city">
		<g:message code="subdivision.city.label" default="City" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="city" name="city.id" from="${net.rcenergy.City.list()}" optionKey="id" required="" value="${subdivisionInstance?.city?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: subdivisionInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="subdivision.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${subdivisionInstance?.name}"/>
</div>

