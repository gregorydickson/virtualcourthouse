package net.rcenergy

import java.util.Date;
import java.util.Set;


class Document {
	Integer bookNumber
	BookTypes bookType
	Integer pageNumber
	String instrumentNumber
	InstrumentTypes instrumentType
	Date fileDate
	Date instrumentDate
	String notes
	String willNumber
	User indexer
	User reviewer
	Assignment assignment
	User supervisor
	Long numberOfChangesReview
	/*A Document will have two copies, an indexer copy and a review copy.
	When indexing final, a copy is made and the review copy id is saved
	in the indexer copy and indexer id in the review copy    */
	Boolean isIndexerFinal = false//If True then this copy cannot be updated, it is the indexed version, 
							//  and a copy has been generated, the id of the copy has been saved as
							// submittedVersionId
	
	// If this is the review copy then it will have the id of the indexer version
	Long indexerVersionId
	//If this is the indexer copy, and the indexing is final then it will have the id of the review
	// copy:
	Long reviewerVersionId
	Boolean isReviewerCopy = false //If True then this is the reviewer copy
	Boolean reviewFinal = false   //If true then the review is final, NO CHANGES
	

	List legalDescriptionCitySubBlkLot
	List legalDescriptionSecTwnRge
	List legalDescriptionSurveyAbstract
	List legalDescriptionTaxMapParcel
	static mapping = {
		legalDescriptionCitySubBlkLot lazy: false
	 	legalDescriptionSecTwnRge  lazy: false
	 	legalDescriptionSurveyAbstract  lazy: false
	 	legalDescriptionTaxMapParcel lazy: false
	}
	static hasMany = [images : Image, 
			parentDocument:RelatedDocument, 
			childDocument:RelatedDocument,
			grantor: String,
			grantee: String,
			legalDescriptionCitySubBlkLot: LegalDescriptionCitySubBlkLot,
			legalDescriptionSecTwnRge: LegalDescriptionSecTwnRge,
			legalDescriptionSurveyAbstract: LegalDescriptionSurveyAbstract,
			legalDescriptionTaxMapParcel: LegalDescriptionTaxMapParcel
	]
	String toString() {"DOCUMENT bookNumber: " + bookNumber?.toString() + 
							" bookType: " + bookType?.toString() +
							" pageNumber: " + pageNumber?.toString() +
							" instrumentNumber: " + instrumentNumber +
							" instrumentType: " + instrumentType?.toString() +
							" fileDate: " + fileDate?.toString() +
							" instrumentDate: " + instrumentDate?.toString() 
	}
    static constraints = {
		bookNumber(nullable:true)
		bookType(nullable:true)
		pageNumber(nullable:true)
		instrumentNumber(nullable:true)
		instrumentType(nullable:true)
		fileDate(nullable:true)
		instrumentDate(nullable:true)
		images(nullable:true)
		parentDocument(nullable:true)
		childDocument(nullable:true)
		grantor(nullable:true)
		grantee(nullable:true)
		legalDescriptionCitySubBlkLot(nullable:true)
		legalDescriptionSecTwnRge(nullable:true)
		legalDescriptionSurveyAbstract(nullable:true)
		legalDescriptionTaxMapParcel(nullable:true)
		indexer(nullable:true)
		reviewer(nullable:true)
		assignment(nullable:true)
		notes(nullable:true,maxSize:200000)
		indexerVersionId(nullable:true)
		reviewerVersionId(nullable:true)
		isIndexerFinal(nullable:true)
		isReviewerCopy(nullable:true)
		reviewFinal(nullable:true)
		willNumber(nullable:true)
		numberOfChangesReview(nullable:true)
    }
}
