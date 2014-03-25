package net.rcenergy

import java.util.Date;
import java.util.Set;


class RelatedDocument implements Comparable {
	BookTypes bookType
	String bookNumber
	String pageNumber
	String instrumentNumber

    static constraints = {
		bookNumber(nullable:true)
		bookType(nullable:true)
		pageNumber(nullable:true)
		instrumentNumber(nullable:true)
    }

    int compareTo(Object other) {
       int result =0
       if(bookType.id != other.bookType.id) {
       	result = 1
       }
       if(bookNumber != other.bookNumber) {
		result = 1
       }
       if(pageNumber != other.pageNumber) {
		result = 1
       }
       if(instrumentNumber != other.instrumentNumber) {
		result = 1
       }
       println "RelatedDocument compareTo: " + result
       return result
   }
}