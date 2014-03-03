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
		survey(nullable:true)
		abstractNumber(nullable:true)
		block(nullable:true)
		lot(nullable:true)
		section(nullable:true)
		assessorNumber(nullable:true)
		acre(nullable:true)
		metesBounds(nullable:true,maxSize:200000)
	}
	

    static mapping = {

    }
}