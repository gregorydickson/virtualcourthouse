package net.rcenergy

class LegalDescriptionTaxMapParcel  implements 	Comparable {
	District district
	String tax
	String map
	String parcel
	String assessorNumber
	String acre
	String metesBounds
	
	static constraints = {
		district(nullable:true)
		tax(nullable:true)
		map(nullable:true)
		parcel(nullable:true)
		assessorNumber(nullable:true)
		acre(nullable:true)
		metesBounds(nullable:true,maxSize:200000)
	}
    static mapping = {

    }
    int compareTo(Object other) {
       int result =0
       if(district != other.district) {
       	result = 1
       }
	   if(tax!= other.tax) {
       	result = 1
       }
       if(map != other.map) {
		result = 1
       }
       if(parcel != other.parcel) {
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
       println "LegalDescriptionTaxMapParcel compareTo: " + result
       return result
   }
}