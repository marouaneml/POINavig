package mbds.grailsframework.poinavig

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import mbds.grailsframework.poinavig.model.Poi

@Secured(["ROLE_ADMIN", "ROLE_MODERATEUR", "ROLE_USER"])
class UserInterfaceController {
    List<Poi> pois = Poi.getAll()
    def index() {
        [pois: pois]
    }
    def getJsonPois(){
        def responseData = [
                'poi'         : Poi.findAll(),
                'localisation': Poi.findAll().localisation,
                'medias'      : Poi.findAll().medias
        ]
        render responseData as JSON
    }
}
