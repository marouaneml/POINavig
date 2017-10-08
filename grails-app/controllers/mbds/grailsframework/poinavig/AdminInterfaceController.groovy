package mbds.grailsframework.poinavig

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import mbds.grailsframework.poinavig.model.Poi
import mbds.grailsframework.poinavig.model.PoiGroupe
import mbds.grailsframework.poinavig.springsec.User

@Secured(["ROLE_ADMIN", "ROLE_MODERATEUR"])
class AdminInterfaceController {

    def index() {
        def nbUsers = User.count
        def nbPois = Poi.count
        def nbPoiGroupes = PoiGroupe.count
        [
                nbUsers     : nbUsers,
                nbPois      : nbPois,
                nbPoiGroupes: nbPoiGroupes
        ]
    }

    def graphsData() {
        Map<Integer, Integer> nbPoisByPoiGroupe = new HashMap<>();
        int i = 0;
        for (PoiGroupe poiGroupe : PoiGroupe.findAll()) {
            nbPoisByPoiGroupe.put(poiGroupe.id, poiGroupe.pois.size())
        }
        def responseData = [
                'pois' : nbPoisByPoiGroupe,
                'users': User.executeQuery("SELECT  concat(day(e.dateCreated), '-', month(e.dateCreated), '-', year(e.dateCreated)), COUNT(*) FROM User e GROUP BY concat(day(e.dateCreated), '-', month(e.dateCreated), '-', year(e.dateCreated))")
        ]
        render responseData as JSON
    }

}
