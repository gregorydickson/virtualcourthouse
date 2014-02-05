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
			grantee: String]
	
    static constraints = {
		bookNumber(nullable:true)
		pageNumber(nullable:true)
		bookType(nullable:true)
		instrumentNumber(nullable:true)
		grantor(nullable:true)
		grantee(nullable:true)
		parentDocument(nullable:true)
		childDocument(nullable:true)
		images(nullable:true)
		fileDate(nullable:true)
		instrumentDate(nullable:true)
    }
}
