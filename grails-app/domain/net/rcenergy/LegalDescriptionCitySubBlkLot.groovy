package net.rcenergy

class LegalDescriptionCitySubBlkLot implements 	Comparable {
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
 
    int compareTo(Object other) {
       int result =0
       if(city.id != other.city.id) {
       	result = 1
       }
	   if(subdivision.id != other.subdivision.id) {
       	result = 1
       }
       if(block != other.block) {
		result = 1
       }
       if(lot != other.lot) {
		result = 1
       }
       if(assessorNumber != other.assessorNumber) {
		result = 1
       }
	   if(acre != other.acre) {
		result = 1
       }
       if(metesBounds != other.metesBounds) {
		result = 1
       }
       println "LegalDescriptionCitySubBlkLot compareTo: " + result
       return result
   }
}