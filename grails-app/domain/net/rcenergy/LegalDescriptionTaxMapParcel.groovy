package net.rcenergy

class LegalDescriptionTaxMapParcel {
	String District
	String Tax
	String Map
	String Parcel
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