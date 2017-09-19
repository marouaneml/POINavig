package m2.mbds.projet.grails.poinavig.model

class Poi {

    String name
    String description
    static HasOne = [localisation: Loc]
    /*
    a poi belongs to one user: relation bidirectionnelle
    pour pouvoir supprimer le point d'interet une fois le user qui le possede est supprimé
     */
    static belongsTo = [poiGroupe: PoiGroupe]

    /*
    many medias for the same poi
     */
    static hasMany = [medias: Media]

    static constraints = {
    }
}
