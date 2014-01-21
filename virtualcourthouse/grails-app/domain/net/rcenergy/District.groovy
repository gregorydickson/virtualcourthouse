package net.rcenergy

class District {
	String name
	
	static hasMany = [books : Book]
    static constraints = {
    }
}
