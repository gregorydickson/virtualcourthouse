<%@ page import="net.rcenergy.Document" %>



<div class="fieldcontain ${hasErrors(bean: documentInstance, field: 'bookNumber', 'error')} required">
	<label for="bookNumber">
		<g:message code="document.bookNumber.label" default="Book Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="bookNumber" type="number" value="${documentInstance.bookNumber}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: documentInstance, field: 'childDocument', 'error')} ">
	<label for="childDocument">
		<g:message code="document.childDocument.label" default="Child Document" />
		
	</label>
	<g:select name="childDocument" from="${net.rcenergy.Document.list()}" multiple="multiple" optionKey="id" size="5" value="${documentInstance?.childDocument*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: documentInstance, field: 'fileDate', 'error')} required">
	<label for="fileDate">
		<g:message code="document.fileDate.label" default="File Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fileDate" precision="day"  value="${documentInstance?.fileDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: documentInstance, field: 'images', 'error')} ">
	<label for="images">
		<g:message code="document.images.label" default="Images" />
		
	</label>
	<g:select name="images" from="${net.rcenergy.Image.list()}" multiple="multiple" optionKey="id" size="5" value="${documentInstance?.images*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: documentInstance, field: 'instrumentDate', 'error')} required">
	<label for="instrumentDate">
		<g:message code="document.instrumentDate.label" default="Instrument Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="instrumentDate" precision="day"  value="${documentInstance?.instrumentDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: documentInstance, field: 'instrumentNumber', 'error')} ">
	<label for="instrumentNumber">
		<g:message code="document.instrumentNumber.label" default="Instrument Number" />
		
	</label>
	<g:textField name="instrumentNumber" value="${documentInstance?.instrumentNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: documentInstance, field: 'instrumentType', 'error')} required">
	<label for="instrumentType">
		<g:message code="document.instrumentType.label" default="Instrument Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="instrumentType" name="instrumentType.id" from="${net.rcenergy.InstrumentTypes.list()}" optionKey="id" required="" value="${documentInstance?.instrumentType?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: documentInstance, field: 'pageNumber', 'error')} required">
	<label for="pageNumber">
		<g:message code="document.pageNumber.label" default="Page Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="pageNumber" type="number" value="${documentInstance.pageNumber}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: documentInstance, field: 'parentDocument', 'error')} ">
	<label for="parentDocument">
		<g:message code="document.parentDocument.label" default="Parent Document" />
		
	</label>
	<g:select name="parentDocument" from="${net.rcenergy.Document.list()}" multiple="multiple" optionKey="id" size="5" value="${documentInstance?.parentDocument*.id}" class="many-to-many"/>
</div>

