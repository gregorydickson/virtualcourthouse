package net.rcenergy

class District {
	String name
	
	static hasMany = [books : Book]
	static belongsTo = [usstate: USState]
    static constraints = {
    }
}
