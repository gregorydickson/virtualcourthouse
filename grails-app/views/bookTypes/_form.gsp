<%@ page import="net.rcenergy.BookTypes" %>



<div class="fieldcontain ${hasErrors(bean: bookTypesInstance, field: 'bookType', 'error')} ">
	<label for="bookType">
		<g:message code="bookTypes.bookType.label" default="Book Type" />
		
	</label>
	<g:textField name="bookType" value="${bookTypesInstance?.bookType}"/>
</div>

