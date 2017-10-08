package mbds.grailsframework.poinavig.model

class Media {
    String name // unique
    String description // nullable
    String url // not null
    /*
    this media should be deleted if a point of interest has been deleted
     */
    static belongsTo = [poi: Poi]
    static constraints = {
        name maxSize: 100
    }
}
