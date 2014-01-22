<%@ page import="net.rcenergy.Image" %>



<div class="fieldcontain ${hasErrors(bean: imageInstance, field: 'bookNumber', 'error')} required">
	<label for="bookNumber">
		<g:message code="image.bookNumber.label" default="Book Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="bookNumber" type="number" value="${imageInstance.bookNumber}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: imageInstance, field: 'dateLoaded', 'error')} required">
	<label for="dateLoaded">
		<g:message code="image.dateLoaded.label" default="Date Loaded" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateLoaded" precision="day"  value="${imageInstance?.dateLoaded}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: imageInstance, field: 'documents', 'error')} ">
	<label for="documents">
		<g:message code="image.documents.label" default="Documents" />
		
	</label>
	
</div>

<div class="fieldcontain ${hasErrors(bean: imageInstance, field: 'image', 'error')} required">
	<label for="image">
		<g:message code="image.image.label" default="Image" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" id="image" name="image" />
</div>

<div class="fieldcontain ${hasErrors(bean: imageInstance, field: 'pageNumber', 'error')} required">
	<label for="pageNumber">
		<g:message code="image.pageNumber.label" default="Page Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="pageNumber" type="number" value="${imageInstance.pageNumber}" required=""/>
</div>

