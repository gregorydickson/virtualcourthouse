<%@ page import="net.rcenergy.Document" %>
<div class="row">
	<div class="medium-6 large-3 columns">
		<div class="input-wrapper">
			<label>BOOK TYPE</label>
			<g:select id="BookType" name="BookType.id" from="${net.rcenergy.BookTypes.list()}" optionKey="id" required="" value="${documentInstance?.bookType?.id}" class="many-to-one"/>
		</div>
	</div>
	
	<div class="medium-6 large-3 columns">
		<div class="input-wrapper">
			<label>BOOK NUMBER</label>
			<g:field name="bookNumber" type="number" value="${documentInstance.bookNumber}" required=""/>
		</div>	
	</div>

	<div class="medium-6 large-3 columns">
		<div class="input-wrapper">
			<label>FILE DATE</label>
			<input type="date" id="fileDate" required pattern="month_day_year" value="${documentInstance?.fileDate}" />
			<small class="error">File Date Required.</small>
		</div>
	</div>
	<div class="medium-6 large-3 columns">
		<div class="input-wrapper">
			<label>INSTRUMENT DATE</label>
			<input type="date" id="instrumentDate" required pattern="month_day_year" value="${documentInstance?.instrumentDate}">	
			<small class="error">Instrument Date Required.</small>
		</div>
	</div>
</div>

<div class="row">

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

<div class="row">
	<div class="large-4 columns ${hasErrors(bean: documentInstance, field: 'images', 'error')} ">
		<label for="images">
			<g:message code="document.images.label" default="Images" />
	
		</label>
		<g:select name="images" from="${net.rcenergy.Image.list()}" multiple="multiple" optionKey="id" size="10" value="${documentInstance?.images*.id}" class="many-to-many"/>
	</div>
</div>