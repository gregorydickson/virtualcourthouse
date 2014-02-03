<%@ page import="net.rcenergy.District" %>



<div class="fieldcontain ${hasErrors(bean: districtInstance, field: 'books', 'error')} ">
	<label for="books">
		<g:message code="district.books.label" default="Books" />
		
	</label>
	<g:select name="books" from="${net.rcenergy.Book.list()}" multiple="multiple" optionKey="id" size="5" value="${districtInstance?.books*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: districtInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="district.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${districtInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: districtInstance, field: 'usstate', 'error')} required">
	<label for="usstate">
		<g:message code="district.usstate.label" default="Usstate" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="usstate" name="usstate.id" from="${net.rcenergy.USState.list()}" optionKey="id" required="" value="${districtInstance?.usstate?.id}" class="many-to-one"/>
</div>

