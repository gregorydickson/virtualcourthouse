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
	
	static hasMany = [images : Image, 
			parentDocument:Document, 
			childDocument:Document,
			grantor: Party,
			grantee: Party]
	
    static constraints = {
		bookNumber(nullable:true)
		pageNumber(nullable:true)
		bookType(nullable:true)
		instrumentNumber(nullable:true)
		grantor(nullable:true)
		grantee(nullable:true)
    }
}
