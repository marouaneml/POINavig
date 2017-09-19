package m2.mbds.projet.grails.poinavig.model

class Media {
    String name // unique
    String description // nullable
    String url // not null
    /*
    this media should be deleted if a point of interest has been deleted
     */
    static belongsTo = [poi: Poi]

    static constraints = {

    }
}
