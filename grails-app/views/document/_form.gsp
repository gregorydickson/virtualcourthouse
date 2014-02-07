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
		<g:textField name="instrumentNumber" value="${documentInstance?.instrumentNumber}" class="uppercase"/>
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
			<input type="date" id="fileDate" name="fileDate" pattern="date" value="${documentInstance?.fileDate}" />
			<small class="error">File Date Required.</small>
		</div>
	</div>
	
	<div class="medium-2 large-2 columns">
		<div class="input-wrapper">
			<label>INST DATE</label>
			<input type="date" id="instrumentDate" name="instrumentDate" pattern="date" value="${documentInstance?.instrumentDate}">	
			<small class="error">Instrument Date Required.</small>
		</div>
	</div>
</div>

<div class="grantor-grantee row">
	<h6>GRANTORS</h6>
	<div class="panel">
		<div id="grantors_wrapper" class="large-12 columns">
		    <p class="form-paragraph">
		        <input class="grantor uppercase" name="grantor" type="text" id="grantor"  value="" />
		    </p>
		</div>
	</div>
</div>
<div class="grantor-grantee row">
	<h6>GRANTEES</h6>
	<div class="panel">
		<div id="grantees_wrapper">
		    <p class="form-paragraph">
		        <input class="grantee uppercase" name="grantee" type="text" id="grantee" value="" />
		    </p>
		</div>
	</div>
</div>

<div class="row">
	<div class="large-6 columns">
		LEGAL DESCRIPTION
	</div>
	<div id="large-3 columns totalAcres">
			 TOTAL ACRES:
	</div>
</div>
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
	          <div class="form-paragraph large-2 columns">
	            <label>Section</label>
	            <input type="text" id="section"name="section[0]" class="section" />
	          </div>
	          <div class="form-paragraph large-1 columns">
	            <label>Township Direction</label>
	            <input type="text" id="townshipDirection" name="townshipDirection[0]" class="uppercase township"/>
			  </div>
			  <div class="form-paragraph large-1 columns">
				<label>Township Number</label>
				<input type="text" id="townshipNumber" name="townshipNumber[0]"/>
	          </div>
	          <div class="form-paragraph large-1 columns">
	             <label>Range Direction</label>
	             <input type="text" id="rangeDirection" name="rangeDirection[0]" class="uppercase range"/>
			  </div>
			  <div class="form-paragraph large-1 columns">
				<label>Range Number</label>
				<input type="text" id="rangeNumber" class="rangeNumber[0]"/>
	          </div>
	          <div class="form-paragraph large-1 columns">
	            <label>Acre</label>
	            <input type="text" id="acre" name="acre[0]" class="acre"/>
	          </div>
	          <div class="form-paragraph large-3 columns">
	            <label>Assessor #</label>
	            <input type="text" id="assessorNumber" name="assessorNumber[0]" class="uppercase township"/>
	          </div>
	          <div class="form-paragraph large-2 columns">
	             <label>Metes & Bounds</label>
	             <input type="text" id="metesBounds" name="metesBounds[0]"  class="uppercase metesBounds" size="200"/>
	          </div>
		  </div>
	    </div>
     </div>
     
	<div class="content" id="panel2-2">
       <div class="city_sub_block_lot_wrapper row">
       <div class="form-paragraph large-2 columns">
            <label>City</label>
            <input type="text" name="city[0]" />
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
           <div class="form-paragraph large-1 columns">
             <label>Acre</label>
             <input type="text" name="acre[0]" />
           </div>
          <div class="form-paragraph large-3 columns">
            <label>Assessor #</label>
            <input type="text" id="assessorNumber" name="assessorNumber[0]" class="township"/>
          </div>
          <div class="form-paragraph large-2 columns">
             <label>Metes & Bounds</label>
             <input type="text" id="metesBounds" name="metesBounds[0]"  class="metesBounds" size="200"/>
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


<div class="related-documents row">
	<h6>RELATED DOCUMENTS</h6>
	<div class="panel related-doc-panel">
		<div id="related_documents_wrapper">
			<div class="a_related_document">
				<div class="form-paragraph large-2 columns">
					<label>Book Type</label>
					<select id="relatedDocumentBookType1.id" required="" class="relatedDocumentBookType chosen-select" >
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

<div class="images row">
	<div class="medium-12 large-12 columns ${hasErrors(bean: documentInstance, field: 'images', 'error')} ">
		<label for="images">IMAGES</label>
		<g:select name="images" from="${net.rcenergy.Image.list()}" multiple="multiple" optionKey="id" size="10" value="${documentInstance?.images*.id}" class="many-to-many"/>
	</div>
</div>