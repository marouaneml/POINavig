<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
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
                            <h4 class="title"><g:message code="default.show.label" args="[entityName]"/></h4>

                            <div id="show-user" class="content scaffold-show" role="main">

                                <g:if test="${flash.message}">
                                    <div class="message" role="status">${flash.message}</div>
                                </g:if>
                                <ul class="list-group">
                                    <li class="list-group-item" style="text-transform: uppercase; text-align: center">
                                        <h3><f:display bean="user" property="username"/></h3>
                                    </li>
                                    <li class="list-group-item">
                                        Mot de passe expiré: <f:display bean="user" property="passwordExpired"/>
                                    </li>
                                    <li class="list-group-item">
                                        Compte verrouillé: <f:display bean="user" property="accountLocked"/>
                                    </li>
                                    <li class="list-group-item">
                                        Compte activé: <f:display bean="user" property="enabled"/>
                                    </li>
                                    <li class="list-group-item">
                                        Date de creation: <f:display bean="user" property="dateCreated" />
                                    </li>
                                </ul>
                                <g:form resource="${this.user}" method="DELETE">
                                    <fieldset class="buttons">
                                        <g:link class="edit btn btn-info" action="edit" resource="${this.user}"><g:message
                                                code="default.button.edit.label" default="Edit"/></g:link>
                                        <input class="delete btn btn-warning" type="submit"
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
    </div>

    </body>
</html>
