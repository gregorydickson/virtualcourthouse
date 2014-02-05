package net.rcenergy

import java.util.Date;
import java.util.Set;


class RelatedDocument {
	Integer bookNumber
	Integer pageNumber
	String instrumentNumber



	
    static constraints = {
		bookNumber(nullable:true)
		pageNumber(nullable:true)
		instrumentNumber(nullable:true)

    }
}