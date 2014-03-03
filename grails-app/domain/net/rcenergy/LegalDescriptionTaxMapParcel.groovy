package net.rcenergy

class LegalDescriptionTaxMapParcel {
	String district
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
}