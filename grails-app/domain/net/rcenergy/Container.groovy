package net.rcenergy


class Container {
	USState usstate
	District district
	User supervisor
	Boolean complete = false

	static hasMany = [assignments : Assignment]


	static constraints = {

		district(nullable:true)
		supervisor(nullable:true)
		assignments(nullable:true)
	}
}
