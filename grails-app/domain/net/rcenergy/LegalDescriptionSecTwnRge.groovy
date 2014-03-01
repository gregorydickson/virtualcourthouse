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
		metesBounds(maxSize:200000)
	}
	
	static belongsTo = [document: Document]
    static mapping = {

    }
}