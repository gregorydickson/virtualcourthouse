package net.rcenergy

class LegalDescriptionSecTwnRge {
	String section
	String townshipNumber
	String townshipDirection
	String rangeNumber
	String rangeDirection
	String assessorNumber
	String acre
	String metesBounds
	
	static constraints = {
		section(nullable:true)
		townshipNumber(nullable:true)
		townshipDirection(nullable:true)
		rangeNumber(nullable:true)
		rangeDirection(nullable:true)
		assessorNumber(nullable:true)
		acre(nullable:true)
		metesBounds(nullable:true,maxSize:200000)
	}
	

    static mapping = {

    }
}