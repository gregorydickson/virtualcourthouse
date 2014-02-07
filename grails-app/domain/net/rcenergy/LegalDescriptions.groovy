package net.rcenergy

import java.util.Date;
import java.util.Set;


class LegalDescriptions {
	Integer section
	Integer townshipNumber
	String  townshipDirection

	


	
    static constraints = {
		section(nullable:true)
		townshipNumber(nullable:true)
		townshipDirection(nullable:true)


    }
}