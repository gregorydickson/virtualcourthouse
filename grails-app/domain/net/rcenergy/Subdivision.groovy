package net.rcenergy

class Subdivision {
	String name
	
	static belongsTo = [city: City]
    static mapping = {
		sort "name"
    }
}