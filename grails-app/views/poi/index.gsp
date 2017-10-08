<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'poi.label', default: 'Poi')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="header">
                        <h4 class="title"><g:message code="default.list.label" args="[entityName]"/></h4>
                    </div>

                    <div id="list-poi" class="content scaffold-list" role="main">
                        <g:if test="${flash.message}">
                            <div class="message" role="status">${flash.message}</div>
                        </g:if>
                        <div class="content table-responsive table-full-width">
                            <table class="table table-striped">
                                <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Description</th>
                                    <th>Poi groupe</th>
                                    <th>Localisation</th>
                                    <th>Media</th>
                                    <th><span class="ti-marker-alt"></span></th>
                                    <th><span class="ti-trash"></span></th>
                                </tr>
                                </thead>
                                <tbody>

                                <g:each in="${poiList}">
                                    <tr>
                                        <td><g:link action="show" id="${it.id}">${it.name}</g:link></td>
                                        <td>${it.description}</td>
                                        <td>
                                            ${it.poiGroupes.id}
                                        </td>
                                        <td>${it.localisation.lat} , ${it.localisation.lng}</td>
                                        <td><img src="${it.medias[0]?.url}" alt="${it.medias[0]?.description}"></td>
                                        <td><a href="/projet/poi/edit/${it.id}"><span class="ti-marker-alt"></span></a>
                                        </td>
                                        <td>
                                            <g:form action="delete" id="${it.id}">
                                                <g:submitButton 
                                                        onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Etre vous sure?')}');" name="Supprimer"></g:submitButton>
                                            </g:form>
                                        </td>
                                    </tr>
                                </g:each>

                                </tbody>
                            </table>
                        </div>

                        <div class="pagination">
                            <g:paginate total="${poiCount ?: 0}"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>