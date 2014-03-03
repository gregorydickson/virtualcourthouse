package net.rcenergy

class LegalDescriptionCitySubBlkLot {
	City city
	Subdivision subdivision
	String block
	String lot
	String assessorNumber
	String acre
	String metesBounds
	
	static constraints = {
		city(nullable:true)
		subdivision(nullable:true)
		block(nullable:true)
		lot(nullable:true)
		assessorNumber(nullable:true)
		acre(nullable:true)
		metesBounds(nullable:true, maxSize:200000)
	}
	

    static mapping = {

    }
}