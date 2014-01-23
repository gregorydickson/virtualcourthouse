package net.rcenergy

import java.util.Date;

class Image {
	Date dateLoaded
	byte[] image
	Integer bookNumber
	Integer pageNumber
	private static final MAX_IMAGE_SIZE = 1073741824
	static hasMany = [documents:Document]
	static belongsTo = Document
    static constraints = {
       image(maxSize:MAX_IMAGE_SIZE)
	   
	   // make book & page numbers optional
	   bookNumber(nullable:true)
	   pageNumber(nullable:true)
    }
}
