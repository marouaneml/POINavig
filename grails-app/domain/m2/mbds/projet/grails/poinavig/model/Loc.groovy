package m2.mbds.projet.grails.poinavig.model

class Loc {
    String name
    Long lng
    Long lat
    static belongsTo = [poi : Poi]

    static constraints = {
    }
}
