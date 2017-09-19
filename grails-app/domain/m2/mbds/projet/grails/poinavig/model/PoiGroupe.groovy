package m2.mbds.projet.grails.poinavig.model

import m2.mbds.projet.grails.poinavig.User

class PoiGroupe {
    /*
    many pois for user : un utilisateur possede plusieurs points d'interet
     */
    static hasMany = [pois: Poi]

    static belongsTo = [user: User]
    static constraints = {
    }

}
