package net.rcenergy

class USState {
	String name
	String layout
	
	static hasMany = [districts : District]
    static constraints = {
    }
}
