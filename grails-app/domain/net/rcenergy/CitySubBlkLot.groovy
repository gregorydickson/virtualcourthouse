package net.rcenergy

class CitySubBlkLot {
	String city
	String sub
	String block
	String lot
	String assessorNumber
	String acre
	
	
	
	static belongsTo = [document: Document]
    static mapping = {

    }
}