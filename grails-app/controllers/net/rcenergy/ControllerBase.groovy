package net.rcenergy


import net.rcenergy.User

import org.springframework.security.core.GrantedAuthority
import grails.plugin.springsecurity.SpringSecurityUtils

/**
 * Provides base functionality for controllers such as spring security
 * @author dinko
 *
 */
class ControllerBase {

	def springSecurityService

	/**
	 * Use this to get the currently logged user
	 * @return
	 */
	protected currentUser() {
		return User.get(springSecurityService.principal.id);
	}

	/**
	 * Call with 'ROLE_INDEXER', 'ROLE_ADMIN' ... etc, to check programmatically if currently logged user has this authority
	 * @param role
	 * @return
	 */
	protected boolean hasRole(String role) {
		Collection<GrantedAuthority> authorities = springSecurityService.principal.authorities;
		for (GrantedAuthority authority : authorities) {
			if (role.equals(authority.authority)) {
				return true;
			}
		}
		return false;
	}
}
