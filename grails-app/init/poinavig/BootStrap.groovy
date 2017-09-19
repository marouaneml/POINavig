package poinavig

import m2.mbds.projet.grails.poinavig.Role
import m2.mbds.projet.grails.poinavig.User
import m2.mbds.projet.grails.poinavig.UserRole

class BootStrap {

    def init = { servletContext ->
        def admin = new User(username: 'admin', password: 'admin', enabled: true).save()
        def moderateur = new User(username: 'moderateur', password: 'moderateur', enabled: true).save()
        def user = new User(username: 'user', password: 'user', enabled: true).save()

        def adminRole = new Role(authority: 'ROLE_ADMIN').save()
        def moderateurRole = new Role(authority: 'ROLE_MODERATEUR').save()
        def userRole = new Role(authority: 'ROLE_USER').save()

        UserRole.create admin, adminRole, true
        UserRole.create moderateur, moderateurRole, true
        UserRole.create user, userRole, true
    }
    def destroy = {
    }
}
