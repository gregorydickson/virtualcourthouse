<%@ page import="net.rcenergy.Assignment" %>



<div class="fieldcontain ${hasErrors(bean: assignmentInstance, field: 'images', 'error')} ">
	<label for="images">
		<g:message code="assignment.images.label" default="Images" />
		
	</label>
	<g:select name="images" from="${net.rcenergy.Image.list()}" multiple="multiple" optionKey="id" size="5" value="${assignmentInstance?.images*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: assignmentInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="assignment.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${net.rcenergy.User.list()}" optionKey="id" required="" value="${assignmentInstance?.user?.id}" class="many-to-one"/>
</div>

