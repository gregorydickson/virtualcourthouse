package net.rcenergy

class LegalDescriptionSecTwnRge implements 	Comparable  {
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
     int compareTo(Object other) {
       int result =0
       if(section != other.section) {
       	result = 1
       }
	   if(townshipNumber!= other.townshipNumber) {
       	result = 1
       }
       if(townshipDirection != other.townshipDirection) {
		result = 1
       }
       if(rangeNumber != other.rangeNumber) {
		result = 1
       }
       if(rangeDirection != other.rangeDirection) {
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
       println "LegalDescriptionSecTwnRge compareTo: " + result
       return result
   }
}