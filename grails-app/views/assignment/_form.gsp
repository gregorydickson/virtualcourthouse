<%@ page import="net.rcenergy.Assignment"%>


<input type="hidden" name="container.id" value="${containerInstance?.id}" />
<div
	class="fieldcontain ${hasErrors(bean: assignmentInstance, field: 'indexer', 'error')}">
	<label for="indexer"> <g:message code="assignment.indexer.label"
			default="Indexer" /> 
	</label>
	<g:select id="indexer" noSelection="${['':'Assign...']}" name="indexer.id" from="${indexerInstanceList}"
		optionKey="id" optionValue="username"  value="${assignmentInstance?.indexer?.id}"
		class="many-to-one" />
</div>
<div
	class="fieldcontain ${hasErrors(bean: assignmentInstance, field: 'reviewer', 'error')} ">
	<label for="reviewer"> <g:message code="assignment.reviewer.label"
			default="Reviewer" /> 
	</label>
	<g:select id="reviewer" noSelection="${['':'Assign...']}" name="reviewer.id" from="${reviewerInstanceList}"
		optionKey="id" optionValue="username"  value="${assignmentInstance?.reviewer?.id}"
		class="many-to-one" />
</div>
<div
	class="fieldcontain ${hasErrors(bean: assignmentInstance, field: 'admin', 'error')} required">
	<label for="reviewer"> <g:message code="assignment.reviewer.label"
			default="Reviewer" /> 
	</label>
	<g:select id="reviewer" noSelection="${['':'Assign...']}" name="admin.id" from="${adminInstanceList}"
		optionKey="id" optionValue="username"  value="${assignmentInstance?.admin?.id}"
		class="many-to-one" />
</div>
