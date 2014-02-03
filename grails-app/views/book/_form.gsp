<%@ page import="net.rcenergy.Book" %>



<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'booktype', 'error')} required">
	<label for="booktype">
		<g:message code="book.booktype.label" default="Booktype" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="booktype" name="booktype.id" from="${net.rcenergy.BookTypes.list()}" optionKey="id" required="" value="${bookInstance?.booktype?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'identifer', 'error')} ">
	<label for="identifer">
		<g:message code="book.identifer.label" default="Identifer" />
		
	</label>
	<g:textField name="identifer" value="${bookInstance?.identifer}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'images', 'error')} ">
	<label for="images">
		<g:message code="book.images.label" default="Images" />
		
	</label>
	<g:select name="images" from="${net.rcenergy.Image.list()}" multiple="multiple" optionKey="id" size="5" value="${bookInstance?.images*.id}" class="many-to-many"/>
</div>

