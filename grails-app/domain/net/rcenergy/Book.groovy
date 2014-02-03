package net.rcenergy

import java.util.Set;

class Book {
	String identifer
	BookTypes booktype
	
	static hasMany = [images : Image]
    static constraints = {
    }
}
