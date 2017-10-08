<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'poiGroupe.label', default: 'PoiGroupe')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>

    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="header">
                            <h4 class="title"><g:message code="default.show.label" args="[entityName]"/> N° ${this.poiGroupe.id}</h4>
                        </div>

                        <div id="show-poiGroupe" class="content scaffold-show" role="main">
                            <g:if test="${flash.message}">
                                <div class="message" role="status">${flash.message}</div>
                            </g:if>
                            <div class="row">

                                <div class="col-md-6">
                                    <span>User:</span>
                                    <f:display bean="poiGroupe" property="user"/>
                                </div>
                                <div class="col-md-6">
                                    <span>Poi List:</span>
                                    <g:if test="${this.poiGroupe.pois.size() == 0}">
                                        <div style="text-align: center; min-height: 50px;"> No Pois in this PoiGroupe</div>
                                    </g:if>
                                    <f:display bean="poiGroupe" property="pois"/>
                                </div>
                            </div>

                            <g:form resource="${this.poiGroupe}" method="DELETE">
                                <fieldset class="buttons">
                                    <g:link class="edit  btn btn-info" action="edit" resource="${this.poiGroupe}"><g:message
                                            code="default.button.edit.label" default="Edit"/></g:link>
                                    <input class="delete  btn btn-warning" type="submit"
                                           value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                           onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
                                </fieldset>
                            </g:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    </body>
</html>
