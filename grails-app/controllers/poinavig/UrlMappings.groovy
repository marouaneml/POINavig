package poinavig

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
        "/poi/$id?"(resource:"poi")
                {
                    action = [GET: "show", PUT: "update", DELETE: "delete", POST: "save"]
                }

        "/"(view:"/index")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
