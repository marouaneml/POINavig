package mbds.grailsframework.poinavig.model

import mbds.grailsframework.poinavig.springsec.User

class PoiGroupe {
    /*
    Many pois for user : un utilisateur possede plusieurs points d'interet
    A poi belongs to one user: relation bidirectionnelle
    pour pouvoir supprimer le point d'interet une fois le user qui le possede est supprimé
     */
    static hasMany = [pois: Poi]

    static belongsTo = [user: User]

    static constraints = {
    }
    static mapping = {
        pois cascade: "all-delete-orphan"
    }
}
