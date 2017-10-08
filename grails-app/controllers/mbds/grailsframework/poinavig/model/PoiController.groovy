package mbds.grailsframework.poinavig.model

import grails.converters.JSON
import grails.core.GrailsApplication
import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured(["ROLE_ADMIN", "ROLE_MODERATEUR"])
class PoiController {
    GrailsApplication grailsApplication
    static allowedMethods = [save: "POST", update: "PUT", delete: ["DELETE", "POST"]]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Poi.list(params), model: [poiCount: Poi.count()]
    }

    @Secured(["ROLE_ADMIN", "ROLE_MODERATEUR", "ROLE_USER"])
    def show(Poi poi) {
        respond poi
    }

    @Secured(["ROLE_ADMIN", "ROLE_MODERATEUR", "ROLE_USER"])
    def getByIdAsJson(Long id) {
        def responseData = [
                'poi'         : Poi.findById(id),
                'localisation': Poi.findById(id).localisation,
                'medias'      : Poi.findById(id).medias
        ]
        render responseData as JSON
    }

    def create() {
        respond new Poi(params)
    }

    @Transactional
    def save(Poi poi) {
        if (poi == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (poi.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond poi.errors, view: 'create'
            return
        }


        if (params.poiGroupes) {
            poi.addToPoiGroupes(PoiGroupe.findById(params.poiGroupes))

        } else {
            println("no poigroupe defined")
        }

        poi.save flush: true

        /**
         * Ajouter les images au poi et les sauvegarder sur disque
         */
        List fileList = request.getFiles('photos')
        int j = 0;
        fileList.each { file ->
            if (file.getOriginalFilename()) {
                String path = 'uploads/images/poimedias/restaurants/'
                file.transferTo(new File(grailsApplication.config.getProperty('media.path') + "image_" + j + "_poi_" + poi.id + ".jpg"))
                Media media = new Media(
                        name: "image_" + j + "_poi_" + poi.id,
                        description: "image_" + j + "_poi_" + poi.id,
                        url: path + "image_" + j + "_poi_" + poi.id + ".jpg",
                        poi: poi).save(flush: true, failOnError: true)
                poi.addToMedias(media)
                j++
            }
        }
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'poi.label', default: 'Poi'), poi.id])
                redirect poi
            }
            '*' { respond poi, [status: CREATED] }
        }

    }

    def edit(Poi poi) {
        respond poi
    }

    @Transactional
    def update(Poi poi) {
        if (poi == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (poi.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond poi.errors, view: 'edit'
            return
        }

        poi.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'poi.label', default: 'Poi'), poi.id])
                redirect poi
            }
            '*' { respond poi, [status: OK] }
        }
    }

    @Transactional
    def delete(Poi poi) {
        if (poi == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        poi.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'poi.label', default: 'Poi'), poi.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'poi.label', default: 'Poi'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
