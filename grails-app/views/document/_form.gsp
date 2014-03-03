<%@ page import="net.rcenergy.Document" %>
<input type="hidden" name="id" class="documentId" id="documentId"/>
<div class="top row">
	<div class="medium-4 large-2 columns">
		<label>BOOK TYPE</label>
		<input id="BookType" type="text" class="" autofocus/>
		<input type="hidden" name="bookType" id="BookType.id"/>
	</div>
	
	<div class="medium-4 large-1 columns">
		<div class="input-wrapper">
			<label>BOOK #</label>
			<g:field id="bookNumber" name="bookNumber" type="number"  />
		</div>	
	</div>
	<div class="clearfields">
	<div class="medium-4 large-1 columns">
		<label>PAGE #</label>
		<input type="text" name="pageNumber" />
	</div>
	
	<div class="medium-4 large-2 columns">
		<label for="instrumentNumber">INST #</label>
		<g:textField name="instrumentNumber"  class="uppercase"/>
	</div>
	
	<div class="medium-4 large-2 columns">
		<label>INST TYPE</label>
		<input id="InsrumentType" type="text"   class="InstrumentType clear" />
		<input type="hidden" name="instrumentType" id="InstrumentType.id" class=""/>
	</div>
	
	<div class="medium-2 large-2 columns">
		<div class="input-wrapper">
			<label>FILE DATE</label>
			<input type="text" id="fileDate" name="fileDate" class="dateformat" />
			<small class="error">File Date Error.</small>
		</div>
	</div>
	
	<div class="medium-2 large-2 columns">
		<div class="input-wrapper">
			<label>INST DATE</label>
			<input type="text" id="instrumentDate" name="instrumentDate" class="dateformat clear" />	
			<small class="error">Instrument Date Errror.</small>
		</div>
	</div>
    </div>
</div>
<div class="grantor-grantee row">
	<h6>GRANTORS</h6>
	<div class="panel">
		<div id="grantors_wrapper" class="large-12 columns clearfields"	>
		    <p class="form-paragraph">
		        <input class="grantor uppercase clear" name="grantor[]" type="text" id="grantor"   />
		    </p>
		</div>
	</div>
</div>
<div class="grantor-grantee row">
	<h6>GRANTEES</h6>
	<div class="panel">
		<div id="grantees_wrapper" class="large-12 columns clearfields">
		    <p class="form-paragraph">
		        <input class="grantee uppercase clear" name="grantee[]" type="text" id="grantee"  />
		    </p>
		</div>
	</div>
</div>

<div class="row panel">
	<div class="large-2 columns">
		LEGAL DESCRIPTION
	</div>
	<div class="large-2 columns">
		TOTAL ROWS:
	</div>
	<div class="large-2 columns" id="rowsTotal">
		
	</div>
	<div class="large-2 columns">
			 TOTAL ACRES:
	</div>
	<div class="large-4 columns" id="acresTotal">
		
	</div>
</div>
<div class="legal-description row clearfields">
	
   <dl class="tabs" data-tab>
	 <dd class="active"><a href="#panel2-1" >City/Sub/Blk/Lot</a></dd>
     <dd><a href="#panel2-2">Sec/Twn/Rge</a></dd>
     <dd><a href="#panel2-3" >Survey/Abstract</a></dd>
     <dd><a href="#panel2-4" >Tax/Map/Parcel</a></dd>
     
   </dl>
   <div class="tabs-content legal-description-tab-content ">
	
     <div class="content" id="panel2-2">
        <div id="section_township_range_wrapper">
		  <div class="a_section_township_range row">
	          <div class="form-paragraph large-2 columns">
	            <label>SECTION</label>
	            <input type="text" id="section" name="legalDescriptionSecTwnRge[0].section" class="section uppercase sec-twn-rge" size="400" />
	          </div>
			  <div class="form-paragraph large-1 columns">
				<label>TOWNSHIP #</label>
				<input type="text" id="townshipNumber" name="legalDescriptionSecTwnRge[0].townshipNumber" class="sec-twn-rge"/>
	          </div>
	          <div class="form-paragraph large-2 columns">
	            <label>TOWNSHIP DIRECTION</label>
	            <input type="text" id="townshipDirection" name="legalDescriptionSecTwnRge[0].townshipDirection" class="uppercase sec-twn-rge"/>
			  </div>
			  <div class="form-paragraph large-2 columns">
				<label>Range Number</label>
				<input type="text" id="rangeNumber" name="legalDescriptionSecTwnRge[0].rangeNumber" class="rangeNumber[0] sec-twn-rge"/>
	          </div>
	          <div class="form-paragraph large-1 columns">
	             <label>RANGE DIRECTION</label>
	             <input type="text" id="rangeDirection" name="legalDescriptionSecTwnRge[0].rangeDirection" class="uppercase  sec-twn-rge"/>
			  </div>
	          <div class="form-paragraph large-2 columns">
	            <label>Acre</label>
	            <input type="text" id="acre" name="legalDescriptionSecTwnRge[0].acre" class="acre sec-twn-rge"/>
	          </div>
	          <div class="form-paragraph large-1 columns">
	            <label>Assessor #</label>
	            <input type="text" id="assessorNumber" name="legalDescriptionSecTwnRge[0].assessorNumber" class="uppercase sec-twn-rge"/>
	          </div>
	          <div class="form-paragraph large-1 columns metesBounds">
	             <label>Metes & Bounds</label>
				 	<input type="text"  id="sec-twn-rge-metesBounds" name="legalDescriptionSecTwnRge[0].metesBounds"  class="uppercase popout sec-twn-rge" />
	          </div>
		  </div>
	    </div>
     </div>
     
	<div class="content active" id="panel2-1">
       <div id="city_sub_block_lot_wrapper">
		   <div class="a_city_sub_block_lot row">
	          <div class="form-paragraph large-2 columns">
	            <label>City</label>
	            <input type="text" id="city"  size="400" class="city autocomplete city-sub-block-lot"/>
				<input type="hidden" name="legalDescriptionCitySubBlkLot[0].city" class="city-sub-block-lot"/>
	          </div>
	          <div class="form-paragraph large-2 columns">
	            <label>Sub</label>
	            <input type="text" size="400" id="sub" class="uppercase city-sub-block-lot subdivision" />
				<input type="hidden" name="legalDescriptionCitySubBlkLot[0].subdivision" class="city-sub-block-lot"/>
	           </div>
	           <div class="form-paragraph large-1 columns">
	             <label>Block</label>
	             <input type="text" size="400" id="block" name="legalDescriptionCitySubBlkLot[0].block" class="uppercase city-sub-block-lot" />
	           </div>
	           <div class="form-paragraph large-1 columns">
	             <label>Lot</label>
	             <input type="text" name="legalDescriptionCitySubBlkLot[0].lot" id="lot" class="uppercase city-sub-block-lot" />
	           </div>
	           <div class="form-paragraph large-2 columns">
	             <label>Acre</label>
	             <input type="text" name="legalDescriptionCitySubBlkLot[0].acre" id="city-sub-blk-lot-acre" class="acre uppercase city-sub-block-lot"/>
	           </div>
	          <div class="form-paragraph large-2 columns">
	            <label>Assessor #</label>
	            <input type="text" id="assessorNumber" id="city-sub-block-lot-assessorNumber"name="legalDescriptionCitySubBlkLot[0].assessorNumber" class="uppercase city-sub-block-lot"/>
	          </div>
	          <div class="form-paragraph large-2 columns">
	             <label>Metes & Bounds</label>
				 	<input type="text"  id="city-sub-block-lot-metes-bounds" name="legalDescriptionCitySubBlkLot[0].metesBounds"  class="uppercase popout city-sub-block-lot" />
	          </div>
		   </div>
       </div>
     </div>
     <div class="content" id="panel2-4">
       <div id="tax_map_parcel_wrapper">
		   <div class="a_tax_map_parcel row">
	           <div class="form-paragraph large-3 columns">
	             <label>Dis/Twn</label>
	             <input type="text" size="400" id="district"  class="district uppercase tax-map-parcel"/>
				 <input type="hidden" name="legalDescriptionTaxMapParcel[0].district" class="tax-map-parcel" />
	           </div>
	           <div class="form-paragraph large-2 columns">
	            <label>Tax</label>
	            <input type="text" name="legalDescriptionTaxMapParcel[0].tax" class="uppercase tax-map-parcel"/>
	           </div>
	           <div class="form-paragraph large-2 columns">
	            <label>Map</label>
	            <input type="text" name="legalDescriptionTaxMapParcel[0].map" class="uppercase tax-map-parcel" />
	           </div>
	           <div class="form-paragraph large-1 columns">
	             <label>Parcel</label>
	             <input type="text" name="legalDescriptionTaxMapParcel[0].parcel" class="uppercase tax-map-parcel" />
	           </div>
	           <div class="form-paragraph large-2 columns">
	             <label>Acre</label>
	             <input type="text" name="legalDescriptionTaxMapParcel[0].acre" id="tax-map-parcel-acre" class="tax-map-parcel"/>
	           </div>
	           <div class="form-paragraph large-1 columns">
	             <label>Assessor #</label>
	             <input type="text" id="tax-map-parcel-assessorNumber" name="legalDescriptionTaxMapParcel[0].assessorNumber" class="uppercase tax-map-parcel"/>
	           </div>
	           <div class="form-paragraph large-1 columns">
				   <label>Metes & Bounds</label>
				   <input type="text"  id="tax-map-parcel-metes-bounds" name="legalDescriptionTaxMapParcel[0].metesBounds"  class="uppercase popout tax-map-parcel" />
			   </div>
		   </div>
       </div>
     </div>
     <div class="content" id="panel2-3">
       <div id="survey_abstract_wrapper">
		   <div class="a_survey_abstract row">
	          <div class="form-paragraph large-2 columns">
	            <label>Survey</label>
	            <input type="text" size="400" name="legalDescriptionSurveyAbstract[0].survey" class="survey uppercase survey-abstract"/>
	          </div>
	          <div class="form-paragraph large-1 columns">
	            <label>Abstract</label>
	            <input type="text" name="legalDescriptionSurveyAbstract[0].abstract" class="uppercase survey-abstract"/>
	          </div>
	          <div class="form-paragraph large-2 columns">
	            <label>Block</label>
	            <input type="text" name="legalDescriptionSurveyAbstract[0].block" class="uppercase survey-abstract" />
	           </div>
	           <div class="form-paragraph large-2 columns">
	             <label>Lot</label>
	             <input type="text" name="legalDescriptionSurveyAbstract[0].lot" class="uppercase survey-abstract" />
	           </div>
	           <div class="form-paragraph large-1 columns">
	             <label>Sec</label>
	             <input type="text" name="legalDescriptionSurveyAbstract[0].section" class="uppercase survey-abstract" />
	           </div>
	           <div class="form-paragraph large-2 columns">
	             <label>Acre</label>
	             <input type="text" name="legalDescriptionSurveyAbstract[0].acre" id="survey-abstract-acre" class="uppercase survey-abstract"/>
	           </div>
	           <div class="form-paragraph large-1 columns">
	             <label>Assessor #</label>
	             <input type="text" name="legalDescriptionSurveyAbstract[0].assessorNumber" class="uppercase survey-abstract"/>
	           </div>
	          <div class="form-paragraph large-1 columns">
				  <label>Metes & Bounds</label>
	             <input type="text"  id="survey-abstract-metes-bounds" name="legalDescriptionSurveyAbstract[0].metesBounds"  class="uppercase popout survey-abstract" />
			  </div>
		  </div>
       </div>
     </div>
   </div>
</div>


<div class="related-documents row clearfields">
	<h6>RELATED DOCUMENTS</h6>
	<div class="panel related-doc-panel">
		<div id="related_documents_wrapper">
			<div class="a_related_document">
				<div class="form-paragraph large-2 columns">
					<label>Book Type</label>
					<input type="text" id="relatedDocumentBookType1"  class="related-documents relatedDocumentBookType" >
					<input type="hidden" name="parentDocument[0].bookType" class="related-documents" />
				</div>
				<div class="form-paragraph large-2 columns">
					<label>Book Number</label>
					<input class="related-documents" name="parentDocument[0].bookNumber" type="text" />
				</div>
				<div class="form-paragraph large-2 columns">
					<label>Page #</label>
					<input class="related-documents" name="parentDocument[0].pageNumber" type="text"   />
				</div>
				<div class="form-paragraph large-6 columns">
					<label>Instrument #</label>
					<input class="related-documents" name="parentDocument[0].instrumentNumber" type="text"  />
				</div>
			</div>
		</div>
	</div>
</div>

<div class="will-number row clearfields">
	<h6>WILL NUMBER</h6>
	<div class="large-12 columns panel">
		<input class="uppercase clear" name="will-number" type="text">
	</div>
</div>

<div class="notes row clearfields">
	<a href="#" data-reveal-id="notes" data-reveal tabindex><h6>NOTES</h6></a>
	<div class="large-12 columns panel">
		 <div id="notes" class="" >
			 <h6>NOTES</h6>
			 <textarea  id="" name="notes"  class="uppercase popout clear"  ></textarea>
		 </div>
	</div>
</div>
<div class="images row" id="imagesRow">
	
	<div class="large-6 columns">
		<h6>IMAGES LIST</h6>
		<table class="images-content">
			<thead>
				<tr>
					<th width="400">FILENAME</th>
					<th></th>
					<th>ID</th>
				</tr>
			</thead>
			<tbody> 
				<g:each var="images" in="${net.rcenergy.Image.list()}">
					<tr class="data-row">
						<td>
							${images.toString()}
						</td>
						<td class="imageLinkCell">
							<g:link action="show" controller="image" id="${images.id}" target="imageWindow"></g:link>
						</td>
						<td class="imageId">
							${images.id}
						</td>
					</tr>
				</g:each>
			</tbody>
		</table>
	</div>
	<div class="large-6 columns">
		<h6>IMAGES ASSIGNED TO DOCUMENT</h6>
		<table id="" class="images-content">
			<thead>
			    <tr>
			      <th width="400">FILENAME</th>
				  <th></th>
				  <th>ID</th>
			    </tr>
			 </thead>
			 <tbody id="images-assigned"> 
			 </tbody>
		</table>
	</div>
</div>