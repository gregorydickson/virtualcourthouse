package net.rcenergy

class District {
	String name
	
	static hasMany = [books : Book]
	static belongsTo = [usstate: USState]
    static constraints = {
    }
    String toString() {
		usstate.toString() + "-" + name.toString()
	}
}
