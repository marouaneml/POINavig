package mbds.grailsframework.poinavig.model

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured("ROLE_ADMIN")
class LocController {

    static allowedMethods = [save: "POST", update: "PUT", delete: ["POST", "DELETE"]]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Loc.list(params), model:[locCount: Loc.count()]
    }

    def show(Loc loc) {
        respond loc
    }

    def create() {
        respond new Loc(params)
    }

    @Transactional
    def save(Loc loc) {
        if (loc == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (loc.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond loc.errors, view:'create'
            return
        }

        loc.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'loc.label', default: 'Loc'), loc.id])
                redirect loc
            }
            '*' { respond loc, [status: CREATED] }
        }
    }

    def edit(Loc loc) {
        respond loc
    }

    @Transactional
    def update(Loc loc) {
        if (loc == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (loc.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond loc.errors, view:'edit'
            return
        }

        loc.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'loc.label', default: 'Loc'), loc.id])
                redirect loc
            }
            '*'{ respond loc, [status: OK] }
        }
    }

    @Transactional
    def delete(Loc loc) {

        if (loc == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        loc.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'loc.label', default: 'Loc'), loc.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'loc.label', default: 'Loc'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
