<%@ page import="net.rcenergy.Image" %>



<div class="fieldcontain ${hasErrors(bean: imageInstance, field: 'dateLoaded', 'error')} required">
	<label for="dateLoaded">
		<g:message code="image.dateLoaded.label" default="Date Loaded" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateLoaded" precision="day"  value="${imageInstance?.dateLoaded}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: imageInstance, field: 'image', 'error')} required">
	<label for="image">
		<g:message code="image.image.label" default="Image" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" id="image" name="image" />
</div>

