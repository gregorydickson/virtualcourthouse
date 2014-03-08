package net.rcenergy

class User {

	transient springSecurityService

	String username
	String password
	boolean enabled = true
	boolean accountExpired = false
	boolean accountLocked = false
	boolean passwordExpired = false
	//so we can know the assignment when creating a document
	Assignment currentAssignment
	Long documentsIndexed
	Long documentsReviewed
	Long numberChangesAudit
	
	User supervisor;
	User reviewer;

	static transients = ['springSecurityService']

	static constraints = {
		username blank: false, unique: true
		password blank: false
		supervisor(nullable:true)
		reviewer(nullable:true)
		documentsIndexed(nullable:true)
		documentsReviewed(nullable:true)
		numberChangesAudit(nullable:true)
		currentAssignment(nullable:true)
	}

	static mapping = {
		password column: '`password`'
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}
	
	public boolean hasRole(String role) {
		for (Role authority : getAuthorities()) {
			if (role.equals(authority.getAuthority())) {
				return true;
			}
		}
		return false;
	}
}
