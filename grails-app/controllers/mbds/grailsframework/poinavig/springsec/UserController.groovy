package mbds.grailsframework.poinavig.springsec

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured(["ROLE_ADMIN"])
class UserController {
    def springSecurityService
    static allowedMethods = [save: "POST", update: "PUT", delete: ["POST", "DELETE"]]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond User.list(params), model: [userCount: User.count()]
    }

    @Secured(["ROLE_MODERATEUR", "ROLE_USER", "ROLE_ADMIN"])
    def show(User user) {

        def currentUser = springSecurityService.getCurrentUser()
        // premettre au utilisateur portant le role ROLE_USER, de faire juste la consultation de son propre profil
        if (currentUser.authorities.authority[0] == "ROLE_USER" && currentUser != user) {
            response.sendRedirect(request.getContextPath() + "/accessDenied");
        } else {
            respond user
        }

    }

    def create() {
        respond new User(params)
    }

    @Transactional
    def save(User user) {
        if (user == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (user.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond user.errors, view: 'create'
            return
        }

        user.save flush: true

        if(params.role == "ROLE_USER"){
            UserRole.create(user, Role.findOrSaveWhere('authority': 'ROLE_USER'), true)
        }

        if(params.role == "ROLE_MODERATEUR"){
            UserRole.create(user, Role.findOrSaveWhere('authority': 'ROLE_MODERATEUR'), true)
        }
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), user.id])
                redirect user
            }
            '*' { respond user, [status: CREATED] }
        }
    }

    @Secured(["ROLE_MODERATEUR", "ROLE_USER", "ROLE_ADMIN"])
    def edit(User user) {
        respond user
    }
    @Transactional
    def update(User user) {
        if (user == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (user.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond user.errors, view: 'edit'
            return
        }

        user.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), user.id])
                redirect user
            }
            '*' { respond user, [status: OK] }
        }
    }

    @Transactional
    @Secured("ROLE_ADMIN")
    def delete(User user) {
        if (user == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        user.delete flush: true

        request.withFormat {
            form multipartForm {

                flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), user.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
