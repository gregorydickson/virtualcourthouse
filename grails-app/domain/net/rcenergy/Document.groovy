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
	User indexer
	User reviewer
	Assignment assignment
	
	

	static hasMany = [images : Integer, 
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
		
    }
}
