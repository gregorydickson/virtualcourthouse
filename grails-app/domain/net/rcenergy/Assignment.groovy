package net.rcenergy

import java.util.Set;

class Assignment {
	static hasMany = [images : Image]
	static belongsTo = [user: User]
    static constraints = {
    }
	String stage
}
