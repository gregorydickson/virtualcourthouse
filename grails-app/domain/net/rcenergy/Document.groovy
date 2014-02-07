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
	

	static hasMany = [images : Integer, 
			parentDocument:RelatedDocument, 
			childDocument:RelatedDocument,
			grantor: String,
			grantee: String,
			legalDescription: LegalDescriptions
			]
	String toString() {"DOCUMENT bookNumber: " + bookNumber?.toString() + 
							" bookType: " + bookType?.toString() +
							" pageNumber: " + pageNumber?.toString() +
							" instrumentNumber: " + instrumentNumber +
							" instrumentType: " + instrumentType?.toString() +
							" fileDate: " + fileDate?.toString() +
							" instrumentDate: " + instrumentDate?.toString() +
							" parentDocument: " + parentDocument?.toString() +
							" grantor: " + grantor +
							" grantee: " + grantee +
							" legalDescription: " + legalDescription?.toString()
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
		legalDescription(nullable:true)
    }
}
