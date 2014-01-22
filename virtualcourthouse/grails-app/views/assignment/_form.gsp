<%@ page import="net.rcenergy.Assignment" %>



<div class="fieldcontain ${hasErrors(bean: assignmentInstance, field: 'images', 'error')} ">
	<label for="images">
		<g:message code="assignment.images.label" default="Images" />
		
	</label>
	<g:select name="images" from="${net.rcenergy.Image.list()}" multiple="multiple" optionKey="id" size="5" value="${assignmentInstance?.images*.id}" class="many-to-many"/>
</div>

