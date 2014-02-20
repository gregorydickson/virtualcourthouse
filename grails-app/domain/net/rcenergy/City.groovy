package net.rcenergy

class City {
	String name
	
	
	static belongsTo = [district: District]
    static mapping = {
		sort "name"
    }
}