package mbds.grailsframework.poinavig.model

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured(["ROLE_ADMIN", "ROLE_MODERATEUR"])
class PoiGroupeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: ["POST", "DELETE"]]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond PoiGroupe.list(params), model:[poiGroupeCount: PoiGroupe.count()]
    }

    def show(PoiGroupe poiGroupe) {
        respond poiGroupe
    }

    def create() {
        respond new PoiGroupe(params)
    }

    @Transactional
    def save(PoiGroupe poiGroupe) {
        if (poiGroupe == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (poiGroupe.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond poiGroupe.errors, view:'create'
            return
        }

        poiGroupe.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'poiGroupe.label', default: 'PoiGroupe'), poiGroupe.id])
                redirect poiGroupe
            }
            '*' { respond poiGroupe, [status: CREATED] }
        }
    }

    def edit(PoiGroupe poiGroupe) {
        respond poiGroupe
    }

    @Transactional
    def update(PoiGroupe poiGroupe) {
        if (poiGroupe == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (poiGroupe.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond poiGroupe.errors, view:'edit'
            return
        }

        poiGroupe.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'poiGroupe.label', default: 'PoiGroupe'), poiGroupe.id])
                redirect poiGroupe
            }
            '*'{ respond poiGroupe, [status: OK] }
        }
    }

    @Transactional
    def delete(PoiGroupe poiGroupe) {

        if (poiGroupe == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        poiGroupe.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'poiGroupe.label', default: 'PoiGroupe'), poiGroupe.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'poiGroupe.label', default: 'PoiGroupe'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
