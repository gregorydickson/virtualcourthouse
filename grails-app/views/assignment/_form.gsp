<%@ page import="net.rcenergy.Assignment"%>


<div
	class="fieldcontain ${hasErrors(bean: assignmentInstance, field: 'indexer', 'error')} required">
	<label for="indexer"> <g:message code="assignment.indexer.label"
			default="Indexer" /> <span class="required-indicator">*</span>
	</label>
	<g:select id="indexer" name="indexer.id" from="${net.rcenergy.User.list()}"
		optionKey="id" optionValue="username" required="" value="${assignmentInstance?.indexer?.id}"
		class="many-to-one" />
</div>
<div
	class="fieldcontain ${hasErrors(bean: assignmentInstance, field: 'reviewer', 'error')} required">
	<label for="reviewer"> <g:message code="assignment.reviewer.label"
			default="Reviewer" /> <span class="required-indicator">*</span>
	</label>
	<g:select id="reviewer" name="reviewer.id" from="${net.rcenergy.User.list()}"
		optionKey="id" optionValue="username" required="" value="${assignmentInstance?.reviewer?.id}"
		class="many-to-one" />
</div>
<div
	class="fieldcontain ${hasErrors(bean: assignmentInstance, field: 'images', 'error')} ">
	
	<label for="images"> <g:message code="assignment.images.label"
			default="Images" />

	</label>
	<g:select name="images" from="${net.rcenergy.Image.list()}"
		multiple="multiple" optionKey="id" optionValue="displayString" size="5"
		value="${assignmentInstance?.images*.id}" style="height:200px;"/>

</div>
