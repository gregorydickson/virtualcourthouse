package net.rcenergy

import java.util.Set;

class Assignment {
	District district
	static hasMany = [images : Image]
	static belongsTo = [user: User]
    static constraints = {
		stage(nullable:true)
		district(nullable:true)
    }
	String stage
}
