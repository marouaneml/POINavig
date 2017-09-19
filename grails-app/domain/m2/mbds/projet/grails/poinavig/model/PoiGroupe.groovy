package m2.mbds.projet.grails.poinavig.model

class PoiGroupe {
    /*
    many pois for user : un utilisateur possede plusieurs points d'interet
     */
    static hasMany = [pois: Poi]
    static constraints = {
    }

}
