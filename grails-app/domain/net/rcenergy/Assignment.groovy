package net.rcenergy

import java.util.Set

class Assignment {


	String stage
	User indexer
	User reviewer
	Boolean started = false
	Boolean complete = false
	Boolean hasContainer = false
	District district
	String toString() {
		"county: " + district.toString() + " id:" + id
	}
	static hasMany = [images : Image,
						imagesRemaining: Image]


	static constraints = {
		stage(nullable:true)
		indexer(nullable:true)
		reviewer(nullable:true)
		imagesRemaining(nullable:true)
		images(nullable:true)
		district(nullable:true)
	}
}
