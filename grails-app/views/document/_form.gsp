<%@ page import="net.rcenergy.Document" %>
<div class="top row">

	<div class="medium-4 large-2 columns">
		<label>BOOK TYPE</label>
		<select id="BookType" name="BookType.id" required="" class="chosen-select" >
	    	<g:each var="BookType" in="${net.rcenergy.BookTypes.list()}">
		        <option value="${BookType.id}" > ${BookType.bookType}</option>
		    </g:each>
		</select>
	</div>
	
	<div class="medium-4 large-1 columns">
		<div class="input-wrapper">
			<label>BOOK #</label>
			<g:field id="bookNumber" name="bookNumber" type="number" value="${documentInstance.bookNumber}" />
		</div>	
	</div>
	
	<div class="medium-4 large-1 columns">
		<label for="pageNumber">PAGE #</label>
		<g:field name="pageNumber" type="number" value="${documentInstance.pageNumber}" />
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

<div class="grantor-grantee row">
	<h6>GRANTORS</h6>
	<div class="panel">
		<div id="grantors_wrapper" class="large-12 columns">
		    <p class="form-paragraph">
		        <input class="grantor" name="grantor1" type="text" id="grantor1"  value="" />
		    </p>
		</div>
	</div>
</div>
<div class="grantor-grantee row">
	<h6>GRANTEES</h6>
	<div class="panel">
		<div id="grantees_wrapper">
		    <p class="form-paragraph">
		        <input class="grantee" name="grantee1"type="text" id="grantee1" value="" />
		    </p>
		</div>
	</div>
</div>

<div class="related-documents row">
	<h6>RELATED DOCUMENTS</h6>
	<div class="panel related-doc-panel">
		<div id="related_documents_wrapper">
			<div class="a_related_document">
				<div class="form-paragraph large-2 columns">
					<label>Book Type</label>
					<select id="relatedDocumentBookType1.id" name="relatedDocumentBookType1.id" required="" class="relatedDocumentBookType chosen-select" >
						<g:each var="BookType" in="${net.rcenergy.BookTypes.list()}">
					        <option value="${BookType.id}" > ${BookType.bookType}</option>
					    </g:each>
					</select>
				</div>
				<div class="form-paragraph large-2 columns">
					<label>Book Number</label>
					<input class="related-documents-book-number" type="text" id="parentDocument1" value="" />
				</div>
				<div class="form-paragraph large-2 columns">
					<label>Page #</label>
					<input class="related-documents-page-number" type="text" id="relatedDocumentPageNumber1" value="" />
				</div>
				<div class="form-paragraph large-6 columns">
					<label>Instrument #</label>
					<input class="related-documents-instrument-number" type="text" id="relatedDocumentInstrumentNumber1" value="" />
				</div>
			</div>
		</div>
	</div>
</div>
<h6>LEGAL DESCRIPTION</h6>
<div class="legal-description panel">
	
   <dl class="tabs" data-tab>
     <dd class="active"><a href="#panel2-1">Sec/Twn/Rge</a></dd>
     <dd><a href="#panel2-2" >City/Sub/Blk/Lot</a></dd>
     <dd><a href="#panel2-3" >Tax/Map/Parcel</a></dd>
     <dd><a href="#panel2-4" >Survey/Abstract</a></dd>
   </dl>
   <div class="tabs-content">
	
     <div class="content active" id="panel2-1">
        <div id="section_township_range_wrapper">
		  <div class="a_section_township_range">
	          <div class="form-paragraph large-1 columns">
	            <label>Section</label>
	            <input type="text" id="section1" class="section" />
	          </div>
	          <div class="form-paragraph large-1 columns">
	            <label>Township</label>
	            <input type="text" id="township1" class="township"/>
	           </div>
	           <div class="form-paragraph large-2 columns">
	             <label>Range</label>
	             <input type="text" id="range1" class="range"/>
	           </div>
	          <div class="form-paragraph large-8 columns">
	             <label>Metes & Bounds</label>
	             <input type="text" id="sec-twn-rge-metes-bounds1" class="sec-twn-rge-metes-bounds" size="200"/>
	          </div>
		  </div>
	    </div>
     </div>
     
	<div class="content" id="panel2-2">
       <div class="city_sub_block_lot_wrapper row">
       <div class="form-paragraph large-2 columns">
            <label>City</label>
            <input type="text"  />
          </div>
          <div class="form-paragraph large-2 columns">
            <label>Sub</label>
            <input type="text" />
           </div>
           <div class="form-paragraph large-1 columns">
             <label>Block</label>
             <input type="text"  />
           </div>
           <div class="form-paragraph large-1 columns">
             <label>Lot</label>
             <input type="text"  />
           </div>
          <div class="form-paragraph large-6 columns">
             <label>Metes & Bounds</label>
             <input type="text"  size="200"/>
           </div>
       </div>
     </div>
     <div class="content" id="panel2-3">
       <div class="tax_map_parcel_wrapper row">
          <div class="form-paragraph large-1 columns">
            <label>Tax</label>
            <input type="text" />
          </div>
          <div class="form-paragraph large-1 columns">
            <label>Map</label>
            <input type="text"  />
           </div>
           <div class="form-paragraph large-2 columns">
             <label>Parcel</label>
             <input type="text"  />
           </div>
          <div class="form-paragraph large-8 columns">
             <label>Metes & Bounds</label>
             <input type="text" size="200" />
           </div>
       </div>
     </div>
     <div class="content" id="panel2-4">
       <div class="survey_wrapper row">
          <div class="form-paragraph large-12 columns">
            <label>Survey</label>
            <input type="text" size="400" />
          </div>
       </div>
     </div>
   </div>
</div>

<div class="images row">
	<div class="medium-12 large-12 columns ${hasErrors(bean: documentInstance, field: 'images', 'error')} ">
		<label for="images">IMAGES</label>
		<g:select name="images" from="${net.rcenergy.Image.list()}" multiple="multiple" optionKey="id" size="10" value="${documentInstance?.images*.id}" class="many-to-many"/>
	</div>
</div>