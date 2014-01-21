package net.rcenergy

import java.util.Date;
import java.util.Set;

class Document {
	Integer bookNumber
	Integer pageNumber
	String instrumentNumber
	InstrumentTypes instrumentType
	Date fileDate
	Date instrumentDate
	
	static hasMany = [images : Image, parentsDocument:Document, childDocument:Document]
    static constraints = {
    }
}
