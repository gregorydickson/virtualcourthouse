package net.rcenergy

class User {
	String username
	String password
	String salt
	Date dateCreated
	Boolean enabled
		
	static hasMany = [assignments : Assignment]
    static constraints = {
    }
	
}
