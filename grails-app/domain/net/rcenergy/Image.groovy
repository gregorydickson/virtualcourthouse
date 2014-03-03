package net.rcenergy

import java.util.Date;

class Image {

	static transients = ['displayString']

	Date dateLoaded
	byte[] image
	String fileName
	Integer bookNumber
	Integer pageNumber
	District district

	/**
	 * A transient property to represent an image object as string in UI
	 * Will return book and page number if existing
	 * @return
	 */
	String getDisplayString() {
		"image " + id + (bookNumber ? " [book " + bookNumber + "/p." + pageNumber + "]": "")
	}
	String toString() {
		"date: " + dateLoaded.toString() + " file:" + fileName
	}
	String idToString(){
		id
	}
	private static final MAX_IMAGE_SIZE = 1073741824


	static constraints = {
		image(maxSize:MAX_IMAGE_SIZE)

		// make book & page numbers optional
		bookNumber(nullable:true)
		pageNumber(nullable:true)
	}
}
