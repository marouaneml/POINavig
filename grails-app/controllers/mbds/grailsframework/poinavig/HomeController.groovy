package mbds.grailsframework.poinavig

import grails.plugin.springsecurity.SpringSecurityUtils
import grails.plugin.springsecurity.annotation.Secured
import mbds.grailsframework.poinavig.model.Loc
import mbds.grailsframework.poinavig.model.Media
import mbds.grailsframework.poinavig.model.Poi
import mbds.grailsframework.poinavig.model.PoiGroupe

@Secured(["permitAll"])
class HomeController {
    def index() {

    }

    def show() {
        // Vous allez etre derigés suivant votre role à la page de gestion ou à la page de la carte
        if (SpringSecurityUtils.ifAnyGranted("ROLE_ADMIN, ROLE_MODERATEUR")) {
            response.sendRedirect(request.getContextPath() + "/adminInterface")
            return
        }
        response.sendRedirect(request.getContextPath() + "/userInterface")
    }
}
