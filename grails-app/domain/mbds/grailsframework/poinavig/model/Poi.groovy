package mbds.grailsframework.poinavig.model

class Poi {
    String name
    String description
    Loc localisation

    /*
    many medias for the same poi
    poiGroupes is manyToMany relationship
    exp: https://chrisbroadfoot.id.au/2008/07/19/many-to-many-relationship-mapping-with-gorm-grails/index.html
     */
    static hasMany = [medias: Media, poiGroupes: PoiGroupe]

    static belongsTo = [poiGroupes: PoiGroupe]
    static constraints = {
        name maxSize: 35
        medias nullable: true
        localisation nullable: true
    }

    static mapping = {
        medias lazy: false

    }
}
