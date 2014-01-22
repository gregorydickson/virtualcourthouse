package net.rcenergy

import java.util.Date;

class Image {
	Date dateLoaded
	byte[] image
	Integer bookNumber
	Integer pageNumber
	
	static hasMany = [documents:Document]
	static belongsTo = Document
    static constraints = {
    }
}
