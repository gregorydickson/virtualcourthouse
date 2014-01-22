package net.rcenergy

import java.util.Date;

class Image {
	Date dateLoaded
	byte[] image
	
	static belongsTo = [ supervisor: Document ]
	
    static constraints = {
    }
}
