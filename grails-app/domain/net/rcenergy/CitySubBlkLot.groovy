package net.rcenergy

class CitySubBlkLot {
	String city
	String sub
	String block
	String lot
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