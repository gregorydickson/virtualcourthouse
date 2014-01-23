<%@ page import="net.rcenergy.Document" %>
<div class="row">
	<div class="medium-6 large-3 columns ${hasErrors(bean: documentInstance, field: 'bookType', 'error')}">
		<label for="instrumentType">
			<g:message code="document.bookType.label" default="Book Type" />
			
		</label>
		<g:select id="BookType" name="BookType.id" from="${net.rcenergy.BookTypes.list()}" optionKey="id" required="" value="${documentInstance?.bookType?.id}" class="many-to-one"/>
	</div>
	
	<div class="medium-6 large-3 columns ${hasErrors(bean: documentInstance, field: 'bookNumber', 'error')} ">
		<label for="bookNumber">
			<g:message code="document.bookNumber.label" default="Book Number" />
		</label>
		<g:field name="bookNumber" type="number" value="${documentInstance.bookNumber}" required=""/>
	</div>

	<div class="medium-6 large-3 columns ${hasErrors(bean: documentInstance, field: 'fileDate', 'error')}">
		<label for="fileDate">
			<g:message code="document.fileDate.label" default="File Date" />
		</label>
		<g:textField name="fileDate" id="datepicker" value="${documentInstance?.fileDate}"  />
	</div>
	<div class="medium-6 large-3 columns ${hasErrors(bean: documentInstance, field: 'instrumentDate', 'error')} required">
		<label for="instrumentDate">
			<g:message code="document.instrumentDate.label" default="Instrument Date" />	
		</label>
		<g:textField name="instrumentDate" id="datepicker" value="${documentInstance?.instrumentDate}"  />
	</div>
</div>

<div class="row">
	<div class="large-4 columns ${hasErrors(bean: documentInstance, field: 'images', 'error')} ">
		<label for="images">
			<g:message code="document.images.label" default="Images" />
		
		</label>
		<g:select name="images" from="${net.rcenergy.Image.list()}" multiple="multiple" optionKey="id" size="5" value="${documentInstance?.images*.id}" class="many-to-many"/>
	</div>

	<div class="large-4 columns ${hasErrors(bean: documentInstance, field: 'instrumentNumber', 'error')} ">
		<label for="instrumentNumber">
			<g:message code="document.instrumentNumber.label" default="Instrument Number" />
		
		</label>
		<g:textField name="instrumentNumber" value="${documentInstance?.instrumentNumber}"/>
	</div>
</div>

<div class="row">
	<div class="large-4 columns ${hasErrors(bean: documentInstance, field: 'instrumentType', 'error')} required">
		<label for="instrumentType">
			<g:message code="document.instrumentType.label" default="Instrument Type" />
			<span class="required-indicator">*</span>
		</label>
		<g:select id="instrumentType" name="instrumentType.id" from="${net.rcenergy.InstrumentTypes.list()}" optionKey="id" required="" value="${documentInstance?.instrumentType?.id}" class="many-to-one"/>
	</div>

	<div class="large-4 columns ${hasErrors(bean: documentInstance, field: 'pageNumber', 'error')} required">
		<label for="pageNumber">
			<g:message code="document.pageNumber.label" default="Page Number" />
			<span class="required-indicator">*</span>
		</label>
		<g:field name="pageNumber" type="number" value="${documentInstance.pageNumber}" required=""/>
	</div>

	<div class="large-4 columns ${hasErrors(bean: documentInstance, field: 'parentDocument', 'error')} ">
		<label for="parentDocument">
			<g:message code="document.parentDocument.label" default="Parent Document" />
		
		</label>
		<g:select name="parentDocument" from="${net.rcenergy.Document.list()}" multiple="multiple" optionKey="id" size="5" value="${documentInstance?.parentDocument*.id}" class="many-to-many"/>
	</div>
</div>
