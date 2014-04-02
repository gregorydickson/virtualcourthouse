package net.rcenergy

import java.util.Set

class Assignment {

	Boolean started = false


	User admin
	User supervisor 
	User indexer
	User reviewer

	District district

	Date indexerAssigned
	Date indexingComplete
	Date supervisorAssigned
	Date reviewerAssigned
	Date reviewComplete
	Date finalizedToAdmin

	Integer auditPercentage

	String toString() {
		"county: " + district.toString() + " id:" + id
	}
	static hasMany = [images : Image,
						imagesRemaining: Image]


	static constraints = {

		admin(nullable:true)
		supervisor(nullable:true)
		indexer(nullable:true)
		reviewer(nullable:true)

		district(nullable:true)

		indexerAssigned(nullable:true)
		indexingComplete(nullable:true)
		supervisorAssigned(nullable:true)
		reviewerAssigned(nullable:true)
		reviewComplete(nullable:true)
		finalizedToAdmin(nullable:true)

		auditPercentage(nullable:true)

		images(nullable:true)
		imagesRemaining(nullable:true)
		

	}
}
