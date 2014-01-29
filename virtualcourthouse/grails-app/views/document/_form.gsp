<%@ page import="net.rcenergy.Document" %>
<div class="top row">

	<div class="medium-4 large-2 columns">
		<div class="input-wrapper">
			<label>BOOK TYPE</label>
			<select id="BookType" name="BookType.id" required="" class="chosen-select" >
		    	<g:each var="BookType" in="${net.rcenergy.BookTypes.list()}">
			        <option value="${BookType.id}" > ${BookType.bookType}</option>
			    </g:each>
			</select>
		</div>
	</div>
	
	<div class="medium-4 large-1 columns">
		<div class="input-wrapper">
			<label>BOOK #</label>
			<g:field id="bookNumber" name="bookNumber" type="number" value="${documentInstance.bookNumber}" required=""/>
		</div>	
	</div>
	
	<div class="medium-4 large-1 columns">
		<label for="pageNumber">PAGE #</label>
		<g:field name="pageNumber" type="number" value="${documentInstance.pageNumber}" required=""/>
	</div>
	
	<div class="medium-4 large-2 columns">
		<label for="instrumentNumber">INST #</label>
		<g:textField name="instrumentNumber" value="${documentInstance?.instrumentNumber}"/>
	</div>
	
	<div class="medium-4 large-2 columns">
		<label for="instrumentType">INST TYPE</label>
		<select id="insrumentType" name="instrumentType.id"  class="chosen-select" >
	    	<g:each var="InstrumentType" in="${net.rcenergy.InstrumentTypes.list()}">
		        <option value="${InstrumentType.id}"> ${InstrumentType.instrumentType}</option>
		    </g:each>
		</select>
	</div>
	
	<div class="medium-2 large-2 columns">
		<div class="input-wrapper">
			<label>FILE DATE</label>
			<input type="date" id="fileDate" name="file_date" pattern="date" value="${documentInstance?.fileDate}" />
			<small class="error">File Date Required.</small>
		</div>
	</div>
	
	<div class="medium-2 large-2 columns">
		<div class="input-wrapper">
			<label>INST DATE</label>
			<input type="date" id="instrumentDate" pattern="date" value="${documentInstance?.instrumentDate}">	
			<small class="error">Instrument Date Required.</small>
		</div>
	</div>
</div>

<div class="row">
	<div class="medium-12 large-12 columns ${hasErrors(bean: documentInstance, field: 'parentDocument', 'error')} ">
		<label for="parentDocument">RELATED DOCUMENTS</label>
		<g:select name="parentDocument" from="${net.rcenergy.Document.list()}" multiple="multiple" optionKey="id" size="5" value="${documentInstance?.parentDocument*.id}" class="many-to-many"/>
	</div>
</div>

<div class="row">
	<div class="medium-12 large-12 columns ${hasErrors(bean: documentInstance, field: 'images', 'error')} ">
		<label for="images">IMAGES</label>
		<g:select name="images" from="${net.rcenergy.Image.list()}" multiple="multiple" optionKey="id" size="10" value="${documentInstance?.images*.id}" class="many-to-many"/>
	</div>
</div>