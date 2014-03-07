<%@ page import="net.rcenergy.Document" %>
<%@ page import="net.rcenergy.City" %>
<%@ page import="net.rcenergy.Subdivision %>
<input type="hidden" name="id" class="documentId" id="documentId" value="${documentInstance.id}"/>
<div class="top row">
	<div class="medium-4 large-2 columns">
		<label>BOOK TYPE</label>
		<input id="BookType" type="text" class="" value="${documentInstance.bookType}" autofocus/>
		<input type="hidden" name="bookType" id="BookType.id"  />
	</div>
	
	<div class="medium-4 large-1 columns">
		<div class="input-wrapper">
			<label>BOOK #</label>
			<g:field id="bookNumber" name="bookNumber" type="number" value="${documentInstance.bookNumber}" />
		</div>	
	</div>
	<div class="clearfields">
	<div class="medium-4 large-1 columns">
		<label>PAGE #</label>
		<input type="text" name="pageNumber" class="pageNumber" value="${documentInstance.pageNumber}" />
	</div>
	
	<div class="medium-4 large-2 columns">
		<label for="instrumentNumber">INST #</label>
		<g:textField name="instrumentNumber"  class="uppercase instrumentNumber" value="${documentInstance.instrumentNumber}" />
	</div>
	
	<div class="medium-4 large-2 columns">
		<label>INST TYPE</label>
		<input id="InsrumentType" type="text"   class="InstrumentType clear" value="${documentInstance.instrumentType}"/>
		<input type="hidden" name="instrumentType" id="InstrumentType.id" class=""  />
	</div>
	
	<div class="medium-2 large-2 columns">
		<div class="input-wrapper">
			<label>FILE DATE</label>
			<input type="text" id="fileDate" name="fileDate" class="dateformat" value="<g:formatDate date="${documentInstance.fileDate}"/>"/>
		</div>
	</div>
	
	<div class="medium-2 large-2 columns">
		<div class="input-wrapper">
			<label>INST DATE</label>
			<input type="text" id="instrumentDate" name="instrumentDate" class="dateformat clear" value="<g:formatDate date="${documentInstance.instrumentDate}"/>" />	
		</div>
	</div>
    </div>
</div>
<div class="grantor-grantee row">
	<h6>GRANTORS</h6>
	<div class="panel">
		<div id="grantors_wrapper" class="large-12 columns clearfields"	>
			<g:if test="${documentInstance?.grantor?.isEmpty() || documentInstance.id == null}">
			    <p class="form-paragraph">
			        <input class="grantor uppercase clear" name="grantor[]" type="text" id="grantor" />
			    </p>
			</g:if>
			<g:else>
				<g:each in="${documentInstance.grantor}" var="grantor">
				    <p class="form-paragraph">
				        <input class="grantor uppercase clear" name="grantor[]" type="text" id="grantor" value="${grantor}"  />
				    </p>
				</g:each>
			</g:else>
		</div>
	</div>
</div>
<div class="grantor-grantee row">
	<h6>GRANTEES</h6>
	<div class="panel">
		<div id="grantees_wrapper" class="large-12 columns clearfields">
			<g:if test="${documentInstance?.grantee?.isEmpty() || documentInstance.id == null}">
			    <p class="form-paragraph">
			        <input class="grantee uppercase clear" name="grantee[]" type="text" id="grantee"  />
			    </p>
			</g:if>
			<g:else>
				<g:each in="${documentInstance.grantee}" var="grantee">
		   		    <p class="form-paragraph">
		   		        <input class="grantee uppercase clear" name="grantee[]" type="text" id="grantee" value="${grantee}" />
		   		    </p>
				</g:each>
			</g:else>
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
			<g:if test="${documentInstance?.legalDescriptionSecTwnRge?.isEmpty() || documentInstance.id == null}">
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
			</g:if>
			<g:else>
				<g:each in="${documentInstance.legalDescriptionSecTwnRge}" var="legalDescriptionSecTwnRge" status="i">
	 			  <div class="a_section_township_range row">
	 		          <div class="form-paragraph large-2 columns">
	 		            <label>SECTION</label>
	 		            <input type="text" id="section" name="legalDescriptionSecTwnRge[${i}].section" class="section uppercase sec-twn-rge" size="400" value="${legalDescriptionSecTwnRge.section}"/>
	 		          </div>
	 				  <div class="form-paragraph large-1 columns">
	 					<label>TOWNSHIP #</label>
	 					<input type="text" id="townshipNumber" name="legalDescriptionSecTwnRge[${i}].townshipNumber" class="sec-twn-rge" value="${legalDescriptionSecTwnRge.townshipNumber}"/>
	 		          </div>
	 		          <div class="form-paragraph large-2 columns">
	 		            <label>TOWNSHIP DIRECTION</label>
	 		            <input type="text" id="townshipDirection" name="legalDescriptionSecTwnRge[${i}].townshipDirection" class="uppercase sec-twn-rge" value="${legalDescriptionSecTwnRge.townshipDirection}"/>
	 				  </div>
	 				  <div class="form-paragraph large-2 columns">
	 					<label>Range Number</label>
	 					<input type="text" id="rangeNumber" name="legalDescriptionSecTwnRge[${i}].rangeNumber" class="rangeNumber[0] sec-twn-rge" value="${legalDescriptionSecTwnRge.rangeNumber}"/>
	 		          </div>
	 		          <div class="form-paragraph large-1 columns">
	 		             <label>RANGE DIRECTION</label>
	 		             <input type="text" id="rangeDirection" name="legalDescriptionSecTwnRge[${i}].rangeDirection" class="uppercase  sec-twn-rge" value="${legalDescriptionSecTwnRge.rangeDirection}"/>
	 				  </div>
	 		          <div class="form-paragraph large-2 columns">
	 		            <label>Acre</label>
	 		            <input type="text" id="acre" name="legalDescriptionSecTwnRge[${i}].acre" class="acre sec-twn-rge" value="${legalDescriptionSecTwnRge.acre}"/>
	 		          </div>
	 		          <div class="form-paragraph large-1 columns">
	 		            <label>Assessor #</label>
	 		            <input type="text"  name="legalDescriptionSecTwnRge[${i}].assessorNumber" class="uppercase sec-twn-rge" value="${legalDescriptionSecTwnRge.assessorNumber}"/>
	 		          </div>
	 		          <div class="form-paragraph large-1 columns metesBounds">
	 		             <label>Metes & Bounds</label>
	 					 	<input type="text"  id="sec-twn-rge-metesBounds" name="legalDescriptionSecTwnRge[${i}].metesBounds"  class="uppercase popout sec-twn-rge" value="${legalDescriptionSecTwnRge.metesBounds}" />
	 		          </div>
	 			  </div>
				</g:each>
			</g:else>
	    </div>
     </div>
     
	<div class="content active" id="panel2-1">
       <div id="city_sub_block_lot_wrapper">
		   <g:if test="${documentInstance?.legalDescriptionCitySubBlkLot?.isEmpty() || documentInstance.id == null}">
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
		            <input type="text" id="city-sub-block-lot-assessorNumber"name="legalDescriptionCitySubBlkLot[0].assessorNumber" class="uppercase city-sub-block-lot"/>
		          </div>
		          <div class="form-paragraph large-2 columns">
		             <label>Metes & Bounds</label>
					 	<input type="text"  id="city-sub-block-lot-metes-bounds" name="legalDescriptionCitySubBlkLot[0].metesBounds"  class="uppercase popout city-sub-block-lot" />
		          </div>
			   </div>
	   		</g:if>
	   	 	<g:else>
				<g:each in="${documentInstance.legalDescriptionCitySubBlkLot}" var="legalDescriptionCitySubBlkLot" status="i">
	 			   <div class="a_city_sub_block_lot row">
	 		          <div class="form-paragraph large-2 columns">
	 		            <label>City</label>
	 		            <input type="text" id="city"  size="400" class="city autocomplete city-sub-block-lot" value="${legalDescriptionCitySubBlkLot.city.name}"/>
	 					<input type="hidden" name="legalDescriptionCitySubBlkLot[${i}].city" class="city-sub-block-lot"/>
	 		          </div>
	 		          <div class="form-paragraph large-2 columns">
	 		            <label>Sub</label>
	 		            <input type="text" size="400" id="sub" class="uppercase city-sub-block-lot subdivision" value="${legalDescriptionCitySubBlkLot.subdivision.name}" />
	 					<input type="hidden" name="legalDescriptionCitySubBlkLot[${i}].subdivision" class="city-sub-block-lot"  />
	 		           </div>
	 		           <div class="form-paragraph large-1 columns">
	 		             <label>Block</label>
	 		             <input type="text" size="400" id="block" name="legalDescriptionCitySubBlkLot[${i}].block" class="uppercase city-sub-block-lot" value="${legalDescriptionCitySubBlkLot.block}" />
	 		           </div>
	 		           <div class="form-paragraph large-1 columns">
	 		             <label>Lot</label>
	 		             <input type="text" name="legalDescriptionCitySubBlkLot[${i}].lot" id="lot" class="uppercase city-sub-block-lot" value="${legalDescriptionCitySubBlkLot.lot}" />
	 		           </div>
	 		           <div class="form-paragraph large-2 columns">
	 		             <label>Acre</label>
	 		             <input type="text" name="legalDescriptionCitySubBlkLot[${i}].acre" id="city-sub-blk-lot-acre" class="acre uppercase city-sub-block-lot" value="${legalDescriptionCitySubBlkLot.acre}" />
	 		           </div>
	 		          <div class="form-paragraph large-2 columns">
	 		            <label>Assessor #</label>
	 		            <input type="text"  id="city-sub-block-lot-assessorNumber"name="legalDescriptionCitySubBlkLot[${i}].assessorNumber" class="uppercase city-sub-block-lot" value="${legalDescriptionCitySubBlkLot.assessorNumber}"/>
	 		          </div>
	 		          <div class="form-paragraph large-2 columns">
	 		             <label>Metes & Bounds</label>
	 					 	<input type="text"  id="city-sub-block-lot-metes-bounds" name="legalDescriptionCitySubBlkLot[${i}].metesBounds"  class="uppercase popout city-sub-block-lot" value="${legalDescriptionCitySubBlkLot.metesBounds}" />
	 		          </div>
	 			   </div>
				</g:each>
	   	 	</g:else>
	    </div>
     </div>
     <div class="content" id="panel2-4">
       <div id="tax_map_parcel_wrapper">
		   <g:if test="${documentInstance?.legalDescriptionTaxMapParcel?.isEmpty() || documentInstance.id == null}">
			   <div class="a_tax_map_parcel row">
		           <div class="form-paragraph large-3 columns">
		             <label>Dis/Twn</label>
		             <input type="text" size="400" id="district" name="legalDescriptionTaxMapParcel[0].district" class="district uppercase tax-map-parcel"/>
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
		             <input type="text" name="legalDescriptionTaxMapParcel[0].acre" id="tax-map-parcel-acre" class="tax-map-parcel acre"/>
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
   		   </g:if>
   	 	   <g:else>
			 <g:each in="${documentInstance.legalDescriptionTaxMapParcel}" var="legalDescriptionTaxMapParcel" status="i">
			   <div class="a_tax_map_parcel row">
		           <div class="form-paragraph large-3 columns">
		             <label>Dis/Twn</label>
		             <input type="text" size="400" id="district" name="legalDescriptionTaxMapParcel[${i}].district" class="district uppercase tax-map-parcel" value="${legalDescriptionTaxMapParcel.district}" />
		           </div>
		           <div class="form-paragraph large-2 columns">
		            <label>Tax</label>
		            <input type="text" name="legalDescriptionTaxMapParcel[${i}].tax" class="uppercase tax-map-parcel" value="${legalDescriptionTaxMapParcel.tax}" />
		           </div>
		           <div class="form-paragraph large-2 columns">
		            <label>Map</label>
		            <input type="text" name="legalDescriptionTaxMapParcel[${i}].map" class="uppercase tax-map-parcel" value="${legalDescriptionTaxMapParcel.map}" />
		           </div>
		           <div class="form-paragraph large-1 columns">
		             <label>Parcel</label>
		             <input type="text" name="legalDescriptionTaxMapParcel[${i}].parcel" class="uppercase tax-map-parcel" value="${legalDescriptionTaxMapParcel.parcel}" />
		           </div>
		           <div class="form-paragraph large-2 columns">
		             <label>Acre</label>
		             <input type="text" name="legalDescriptionTaxMapParcel[${i}].acre" id="tax-map-parcel-acre" class="tax-map-parcel acre" value="${legalDescriptionTaxMapParcel.acre}" />
		           </div>
		           <div class="form-paragraph large-1 columns">
		             <label>Assessor #</label>
		             <input type="text" id="tax-map-parcel-assessorNumber" name="legalDescriptionTaxMapParcel[${i}].assessorNumber" class="uppercase tax-map-parcel" value="${legalDescriptionTaxMapParcel.assessorNumber}" />
		           </div>
		           <div class="form-paragraph large-1 columns">
					 <label>Metes & Bounds</label>
					 <input type="text"  id="tax-map-parcel-metes-bounds" name="legalDescriptionTaxMapParcel[${i}].metesBounds"  class="uppercase popout tax-map-parcel" value="${legalDescriptionTaxMapParcel.metesBounds}" />
				   </div>
			   </div>
 			 </g:each>
 	   	   </g:else>
       </div>
     </div>
     <div class="content" id="panel2-3">
       <div id="survey_abstract_wrapper">
		   <g:if test="${documentInstance?.legalDescriptionSurveyAbstract?.isEmpty() || documentInstance.id == null}">
			   <div class="a_survey_abstract row">
		          <div class="form-paragraph large-2 columns">
		            <label>Survey</label>
		            <input type="text" size="400" name="legalDescriptionSurveyAbstract[0].survey" class="survey uppercase survey-abstract"  />
		          </div>
		          <div class="form-paragraph large-1 columns">
		            <label>Abstract</label>
		            <input type="text" name="legalDescriptionSurveyAbstract[0].abstractNumber" class="uppercase survey-abstract"  />
		          </div>
		          <div class="form-paragraph large-2 columns">
		            <label>Block</label>
		            <input type="text" name="legalDescriptionSurveyAbstract[0].block" class="uppercase survey-abstract"  />
		           </div>
		           <div class="form-paragraph large-2 columns">
		             <label>Lot</label>
		             <input type="text" name="legalDescriptionSurveyAbstract[0].lot" class="uppercase survey-abstract"  />
		           </div>
		           <div class="form-paragraph large-1 columns">
		             <label>Sec</label>
		             <input type="text" name="legalDescriptionSurveyAbstract[0].section" class="uppercase survey-abstract" />
		           </div>
		           <div class="form-paragraph large-2 columns">
		             <label>Acre</label>
		             <input type="text" name="legalDescriptionSurveyAbstract[0].acre" id="survey-abstract-acre" class="uppercase survey-abstract acre"  />
		           </div>
		           <div class="form-paragraph large-1 columns">
		             <label>Assessor #</label>
		             <input type="text" name="legalDescriptionSurveyAbstract[0].assessorNumber" class="uppercase survey-abstract"  />
		           </div>
		          <div class="form-paragraph large-1 columns">
					  <label>Metes & Bounds</label>
		             <input type="text"  id="survey-abstract-metes-bounds" name="legalDescriptionSurveyAbstract[0].metesBounds"  class="uppercase popout survey-abstract"  />
				  </div>
			  </div>
  		   </g:if>
  	 	   <g:else>
			 <g:each in="${documentInstance.legalDescriptionSurveyAbstract}" var="legalDescriptionSurveyAbstract" status="i">
			   <div class="a_survey_abstract row">
		          <div class="form-paragraph large-2 columns">
		            <label>Survey</label>
		            <input type="text" size="400" name="legalDescriptionSurveyAbstract[${i}].survey" class="survey uppercase survey-abstract" value="${legalDescriptionSurveyAbstract.survey}"/>
		          </div>
		          <div class="form-paragraph large-1 columns">
		            <label>Abstract</label>
		            <input type="text" name="legalDescriptionSurveyAbstract[${i}].abstractNumber" class="uppercase survey-abstract" value="${legalDescriptionSurveyAbstract.abstractNumber}"/>
		          </div>
		          <div class="form-paragraph large-2 columns">
		            <label>Block</label>
		            <input type="text" name="legalDescriptionSurveyAbstract[${i}].block" class="uppercase survey-abstract"  value="${legalDescriptionSurveyAbstract.block}"/>
		           </div>
		           <div class="form-paragraph large-2 columns">
		             <label>Lot</label>
		             <input type="text" name="legalDescriptionSurveyAbstract[${i}].lot" class="uppercase survey-abstract" value="${legalDescriptionSurveyAbstract.lot}" />
		           </div>
		           <div class="form-paragraph large-1 columns">
		             <label>Sec</label>
		             <input type="text" name="legalDescriptionSurveyAbstract[${i}].section" class="uppercase survey-abstract" value="${legalDescriptionSurveyAbstract.section}" />
		           </div>
		           <div class="form-paragraph large-2 columns">
		             <label>Acre</label>
		             <input type="text" name="legalDescriptionSurveyAbstract[${i}].acre" id="survey-abstract-acre" class="uppercase survey-abstract acre" value="${legalDescriptionSurveyAbstract.acre}" />
		           </div>
		           <div class="form-paragraph large-1 columns">
		             <label>Assessor #</label>
		             <input type="text" name="legalDescriptionSurveyAbstract[${i}].assessorNumber" class="uppercase survey-abstract"  value="${legalDescriptionSurveyAbstract.assessorNumber}"/>
		           </div>
		          <div class="form-paragraph large-1 columns">
					  <label>Metes & Bounds</label>
		             <input type="text"  id="survey-abstract-metes-bounds" name="legalDescriptionSurveyAbstract[${i}].metesBounds"  class="uppercase popout survey-abstract" value="${legalDescriptionSurveyAbstract.metesBounds}" />
				  </div>
			   </div>
			 </g:each>
		   </g:else>
       </div>
     </div>
   </div>
</div>


<div class="related-documents row clearfields">
	<h6>RELATED DOCUMENTS</h6>
	<div class="panel related-doc-panel">
		<div id="related_documents_wrapper">
			<g:if test="${documentInstance?.parentDocument?.isEmpty() || documentInstance.id == null}">
				<div class="a_related_document">
					<div class="form-paragraph large-2 columns">
						<label>Book Type</label>
						<input type="text" id="relatedDocumentBookType1"  class="related-documents relatedDocumentBookType" />
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
			</g:if>
			<g:else>
				<g:each in="${documentInstance.parentDocument}" var="parentDocument" status="i">
					<div class="a_related_document">
						<div class="form-paragraph large-2 columns">
							<label>Book Type</label>
							<input type="text" id="relatedDocumentBookType1"  class="related-documents relatedDocumentBookType" value="${parentDocument.bookType}"/>
							<input type="hidden" name="parentDocument[${i}].bookType" class="related-documents" />
						</div>
						<div class="form-paragraph large-2 columns">
							<label>Book Number</label>
							<input class="related-documents" name="parentDocument[${i}].bookNumber" type="text" value="${parentDocument.bookNumber}"/>
						</div>
						<div class="form-paragraph large-2 columns">
							<label>Page #</label>
							<input class="related-documents" name="parentDocument[${i}].pageNumber" type="text"  value="${parentDocument.pageNumber}" />
						</div>
						<div class="form-paragraph large-6 columns">
							<label>Instrument #</label>
							<input class="related-documents" name="parentDocument[${i}].instrumentNumber" type="text" value="${parentDocument.instrumentNumber}" />
						</div>
					</div>
				</g:each>
			</g:else>
		</div>
	</div>
</div>

<div class="will-number row clearfields">
	<h6>WILL NUMBER</h6>
	<div class="large-12 columns panel">
		<input class="uppercase clear" name="willNumber" type="text" value="${documentInstance.willNumber}">
	</div>
</div>

<div class="notes row clearfields">
	<h6>NOTES</h6>
	<div class="large-12 columns panel">
		 <div id="notes" class="" >
			 <h6>NOTES</h6>
			 <textarea  id="" name="notes"  class="uppercase popout clear">${documentInstance.notes}</textarea>
		 </div>
	</div>
</div>
<div class="row">
	<div class="large-1 columns">IMAGES LIST</div>
	<div class="large-11 columns" id="imageTotal">X OF X IMAGES</div>
</div>

<div class="images row" id="imagesRow">
	
	<div class="large-6 columns">

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
				 <g:if test="${documentInstance?.images?.isEmpty() || documentInstance.id == null}">
				 </g:if>
				 <g:else>
				 	<g:each in="${documentInstance.images}" var="image" status="i">
						<tr class="image-assigned-row">
							<td>
								${image.toString()}
							</td>
							<td class="imageLinkCell">
								<g:link action="show" controller="image" id="${image.id}" target="imageWindow"></g:link>
							</td>
							<td class="imageId">
								${image.id}
							</td>
						</tr>
					</g:each>
				 </g:else>
			 </tbody>
		</table>
	</div>
</div>