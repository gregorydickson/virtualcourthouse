package net.rcenergy

import java.util.Set;

class Assignment {

	District district
	String stage

	User indexer;
	User reviewer;

	static hasMany = [images : Image,
						imagesRemaining: Image]


	static constraints = {
		stage(nullable:true)
		district(nullable:true)
		indexer(nullable:true)
		reviewer(nullable:true)
		imagesRemaining(nullable:true)
	}
}
