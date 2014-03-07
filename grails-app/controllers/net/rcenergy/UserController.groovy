package net.rcenergy

import java.util.Map;
import grails.plugin.springsecurity.SpringSecurityUtils;

/**
 * Override the spring security user controller 
 * @author dinko
 *
 */
class UserController extends grails.plugin.springsecurity.ui.UserController {

	/**
	 * Override this method to add all indexers/reviewers to the data model
	 */
	protected Map buildUserModel(user) {

		String authorityFieldName = SpringSecurityUtils.securityConfig.authority.nameField
		String authoritiesPropertyName = SpringSecurityUtils.securityConfig.userLookup.authoritiesPropertyName

		List roles = sortedRoles()
		Set userRoleNames = user[authoritiesPropertyName].collect { it[authorityFieldName] }
		def granted = [:]
		def notGranted = [:]
		for (role in roles) {
			String authority = role[authorityFieldName]
			if (userRoleNames.contains(authority)) {
				granted[(role)] = userRoleNames.contains(authority)
			}
			else {
				notGranted[(role)] = userRoleNames.contains(authority)
			}
		}

		def allIndexers;
		if (user.hasRole('ROLE_SUPERVISOR')) {
			allIndexers = UserRole.findAll('from UserRole where role.authority=:authority', [authority: 'ROLE_INDEXER']).collect(){it.user} as Set;
		}

		return [user: user, roleMap: granted + notGranted, "allIndexers" : allIndexers];
	}
}
