<%@ page import="net.rcenergy.City" %>



<div class="fieldcontain ${hasErrors(bean: cityInstance, field: 'district', 'error')} required">
	<label for="district">
		<g:message code="city.district.label" default="District" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="district" name="district.id" from="${net.rcenergy.District.list()}" optionKey="id" required="" value="${cityInstance?.district?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cityInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="city.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${cityInstance?.name}"/>
</div>

