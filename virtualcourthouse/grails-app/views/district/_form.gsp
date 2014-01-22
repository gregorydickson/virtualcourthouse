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

