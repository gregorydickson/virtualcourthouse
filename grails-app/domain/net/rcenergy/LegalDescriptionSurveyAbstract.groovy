package net.rcenergy

class LegalDescriptionSurveyAbstract implements Comparable  {
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
    int compareTo(Object other) {
       int result =0
       if(survey != other.survey) {
       	result = 1
       }
	   if(abstractNumber!= other.abstractNumber) {
       	result = 1
       }
       if(block != other.block) {
		result = 1
       }
       if(lot != other.lot) {
		result = 1
       }
       if(section != other.section) {
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
       println "LegalDescriptionSurveyAbstract compareTo: " + result
       return result
   }
}