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
			<small class="error">File Date Error.</small>
		</div>
	</div>
	
	<div class="medium-2 large-2 columns">
		<div class="input-wrapper">
			<label>INST DATE</label>
			<input type="date" id="instrumentDate" name="instrumentDate" pattern="date" value="${documentInstance?.instrumentDate}">	
			<small class="error">Instrument Date Errror.</small>
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
	<div class="large-5 columns">
		LEGAL DESCRIPTION
	</div>
	<div class="large-7 columns totalAcres">
			 TOTAL ACRES:
	</div>
</div>
<div class="legal-description row">
	
   <dl class="tabs" data-tab>
     <dd class="active"><a href="#panel2-1">Sec/Twn/Rge</a></dd>
     <dd><a href="#panel2-2" >City/Sub/Blk/Lot</a></dd>
     <dd><a href="#panel2-3" >Tax/Map/Parcel</a></dd>
     <dd><a href="#panel2-4" >Survey/Abstract</a></dd>
   </dl>
   <div class="tabs-content">
	
     <div class="content active" id="panel2-1">
        <div id="section_township_range_wrapper">
		  <div class="a_section_township_range row">
	          <div class="form-paragraph large-2 columns">
	            <label>SECTION</label>
	            <input type="text" id="section" name="section[0]" class="section uppercase sec-twn-rge" size="400" />
	          </div>
			  <div class="form-paragraph large-1 columns">
				<label>TOWNSHIP #</label>
				<input type="text" id="townshipNumber" name="townshipNumber[0]" class="sec-twn-rge"/>
	          </div>
	          <div class="form-paragraph large-2 columns">
	            <label>TOWNSHIP DIRECTION</label>
	            <input type="text" id="townshipDirection" name="townshipDirection[0]" class="uppercase sec-twn-rge"/>
			  </div>
			  <div class="form-paragraph large-2 columns">
				<label>Range Number</label>
				<input type="text" id="rangeNumber" class="rangeNumber[0] sec-twn-rge"/>
	          </div>
	          <div class="form-paragraph large-2 columns">
	             <label>RANGE DIRECTION</label>
	             <input type="text" id="rangeDirection" name="rangeDirection[0]" class="uppercase  sec-twn-rge"/>
			  </div>
	          <div class="form-paragraph large-1 columns">
	            <label>Acre</label>
	            <input type="text" id="acre" name="sec-twn-rge-acre[0]" class="acre sec-twn-rge"/>
	          </div>
	          <div class="form-paragraph large-1 columns">
	            <label>Assessor #</label>
	            <input type="text" id="assessorNumber" name="sec-twn-rge-assessorNumber[0]" class="uppercase  sec-twn-rge"/>
	          </div>
	          <div class="form-paragraph large-1 columns metesBounds">
	             <label>Metes & Bounds</label>
				 	<input type="text"  id="sec-twn-rge-metesBounds" name="sec-twn-rge-metesBounds[0]"  class="uppercase popout sec-twn-rge" />
	          </div>
		  </div>
	    </div>
     </div>
     
	<div class="content" id="panel2-2">
       <div id="city_sub_block_lot_wrapper">
		   <div class="a_city_sub_block_lot row">
	          <div class="form-paragraph large-2 columns">
	            <label>City</label>
	            <input type="text" id="city" name="city[0]" size="400" class="city uppercase city-sub-block-lot"/>
	          </div>
	          <div class="form-paragraph large-2 columns">
	            <label>Sub</label>
	            <input type="text" size="400" id="sub" name="sub[0]"class="uppercase city-sub-block-lot" />
	           </div>
	           <div class="form-paragraph large-1 columns">
	             <label>Block</label>
	             <input type="text" size="400" id="block" name="block[0]" class="uppercase city-sub-block-lot" />
	           </div>
	           <div class="form-paragraph large-1 columns">
	             <label>Lot</label>
	             <input type="text" name="lot[0]" id="lot" class="uppercase city-sub-block-lot" />
	           </div>
	           <div class="form-paragraph large-1 columns">
	             <label>Acre</label>
	             <input type="text" name="city-sub-blk-lot-acre[0]" id="city-sub-blk-lot-acre" class="acre uppercase city-sub-block-lot"/>
	           </div>
	          <div class="form-paragraph large-3 columns">
	            <label>Assessor #</label>
	            <input type="text" id="assessorNumber" id="city-sub-block-lot-assessorNumber"name="city-sub-block-lot-assessorNumber[0]" class="uppercase city-sub-block-lot"/>
	          </div>
	          <div class="form-paragraph large-2 columns">
	             <label>Metes & Bounds</label>
				 	<input type="text"  id="city-sub-block-lot-metes-bounds" name="city-sub-block-lot-metesBounds[0]"  class="uppercase popout city-sub-block-lot" />
	          </div>
		   </div>
       </div>
     </div>
     <div class="content" id="panel2-3">
       <div id="tax_map_parcel_wrapper">
		   <div class="a_tax_map_parcel row">
	           <div class="form-paragraph large-3 columns">
	             <label>Dis/Twn</label>
	             <input type="text" size="400" id="district" name="district[0]" class="district uppercase tax-map-parcel"/>
	           </div>
	           <div class="form-paragraph large-2 columns">
	            <label>Tax</label>
	            <input type="text" name="tax[0]" class="uppercase tax-map-parcel"/>
	           </div>
	           <div class="form-paragraph large-2 columns">
	            <label>Map</label>
	            <input type="text" name="map[0]" class="uppercase tax-map-parcel" />
	           </div>
	           <div class="form-paragraph large-2 columns">
	             <label>Parcel</label>
	             <input type="text" name="parcel[0]" class="uppercase tax-map-parcel" />
	           </div>
	           <div class="form-paragraph large-1 columns">
	             <label>Acre</label>
	             <input type="text" name="tax-map-parcel-acre[0]" id="tax-map-parcel-acre" class="tax-map-parcel"/>
	           </div>
	           <div class="form-paragraph large-1 columns">
	             <label>Assessor #</label>
	             <input type="text" id="tax-map-parcel-assessorNumber" name="tax-map-parcel-assessorNumber[0]" class="uppercase tax-map-parcel"/>
	           </div>
	           <div class="form-paragraph large-1 columns">
				   <label>Metes & Bounds</label>
				   <input type="text"  id="tax-map-parcel-metes-bounds" name="tax-map-parcel-metesBounds[0]"  class="uppercase popout tax-map-parcel" />
			   </div>
		   </div>
       </div>
     </div>
     <div class="content" id="panel2-4">
       <div id="survey_abstract_wrapper">
		   <div class="a_survey_abstract row">
	          <div class="form-paragraph large-2 columns">
	            <label>Survey</label>
	            <input type="text" size="400" name="survey[0]" class="survey uppercase survey-abstract"/>
	          </div>
	          <div class="form-paragraph large-1 columns">
	            <label>Abstract</label>
	            <input type="text" name="abstract[0]" class="uppercase survey-abstract"/>
	          </div>
	          <div class="form-paragraph large-2 columns">
	            <label>Block</label>
	            <input type="text" name="survey-abstract-block[0]" class="uppercase survey-abstract" />
	           </div>
	           <div class="form-paragraph large-2 columns">
	             <label>Lot</label>
	             <input type="text" name="survey-abstract-lot[0]" class="uppercase survey-abstract" />
	           </div>
	           <div class="form-paragraph large-2 columns">
	             <label>Sec</label>
	             <input type="text" name="survey-abstract-section[0]" class="uppercase survey-abstract" />
	           </div>
	           <div class="form-paragraph large-1 columns">
	             <label>Acre</label>
	             <input type="text" name="survey-abstract-acre[0]" id="survey-abstract-acre" class="uppercase survey-abstract"/>
	           </div>
	           <div class="form-paragraph large-1 columns">
	             <label>Assessor #</label>
	             <input type="text" name="survey-abstract-assessorNumber[0]" class="uppercase survey-abstract"/>
	           </div>
	          <div class="form-paragraph large-1 columns">
				  <label>Metes & Bounds</label>
	             <input type="text"  id="survey-abstract-metes-bounds" name="survey-abstract-metesBounds[0]"  class="uppercase popout survey-abstract" />
			  </div>
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
					<select id="relatedDocumentBookType1" required="" class="relatedDocumentBookType chosen-select" >
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

<div class="will-number row">
	<h6>WILL NUMBER</h6>
	<div class="large-12 columns panel">
		<input class="" type="text">
	</div>
</div>

<div class="notes row">
	<a href="#" data-reveal-id="notes" data-reveal tabindex><h6>NOTES</h6></a>
	<div class="large-12 columns panel">
		 <div id="notes" class="" >
			 <h6>NOTES</h6>
			 <textarea  id="" name="notes"  class="uppercase popout"  ></textarea>
		 </div>
	</div>
</div>
<div class="images row">
	<h6>IMAGES</h6>
	<div class="large-12 columns">
		<table>
			<thead>
			    <tr>
			      <th width="400">FILENAME</th>
				  <th width="20">VIEW</th>
			      <th width="200">SELECT & REMOVE</th>
			      <th width="200">SELECT & REMAIN</th>
			    </tr>
			 </thead>
			 <tbody>
				 
					 
    	<g:each var="images" in="${net.rcenergy.Image.list()}">
			<tr>
				<td>
	         	   ${images*.toString()}
			   </td>
			   <td>
				   <g:link action="show" id="${images.id}" target="_blank">VIEW</g:link>
			   </td>
			   <td>
				   <input type="checkbox" />
			   </td>
			   <td>
				   <input type="checkbox" />
			   </td>
			  
		   </tr>
	    </g:each>
	</table>
		
		
		
	</div>
</div>