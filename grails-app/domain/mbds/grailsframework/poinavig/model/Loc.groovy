package mbds.grailsframework.poinavig.model

class Loc {

    String name
    String lng
    String lat

    static constraints = {
        name maxSize: 100
    }

}
