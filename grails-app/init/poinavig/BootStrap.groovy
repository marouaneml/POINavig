package poinavig

import m2.mbds.grailsframework.project.poinavig.springsecurity.Role
import m2.mbds.grailsframework.project.poinavig.springsecurity.User
import m2.mbds.grailsframework.project.poinavig.springsecurity.UserRole

class BootStrap {
    def springSecurityService

    def init = { servletContext ->
        def adminRole = new Role(authority: 'ROLE_ADMIN').save()
        def moderateurRole = new Role(authority: 'ROLE_ADMIN').save()
        def userRole = new Role(authority: 'ROLE_USER').save()

        def admin = new User(username: 'admin',
                password: 'admin', enabled: true)
        def moderateur = new User(username: 'moderateur',
                password: springSecurityService.encodePassword('moderateur'), enabled: true)
        def user = new User(username: 'user',
                password: springSecurityService.encodePassword('user'), enabled: true)

        admin.save()
        moderateur.save()
        user.save()

        /*
        attribuer le role adminRole à l'utilisateur admin
         */
        UserRole.create admin, adminRole
        UserRole.create moderateurRole, moderateurRole
        UserRole.create user, userRole

        UserRole.withSession {
            it.flush()
            it.clear()
        }

        assert User.count() == 3
        assert Role.count() == 2
        assert UserRole.count() == 2
    }
    def destroy = {
    }
}
