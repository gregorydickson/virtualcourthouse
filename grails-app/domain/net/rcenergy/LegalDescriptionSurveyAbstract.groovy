package net.rcenergy

class LegalDescriptionSurveyAbstract {
	String survey
	String abstractNumber
	String block
	String lot
	String section
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