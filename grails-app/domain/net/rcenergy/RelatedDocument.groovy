package net.rcenergy

import java.util.Date;
import java.util.Set;


class RelatedDocument {
	BookTypes bookType
	String bookNumber
	String pageNumber
	String instrumentNumber



	
    static constraints = {
		bookNumber(nullable:true)
		bookType(nullable:true)
		pageNumber(nullable:true)
		instrumentNumber(nullable:true)

    }
}