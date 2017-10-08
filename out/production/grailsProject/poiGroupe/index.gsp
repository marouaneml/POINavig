<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'poiGroupe.label', default: 'PoiGroupe')}"/>
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
                                    <th>ID</th>
                                    <th>L'utilisateur propriétaire</th>
                                    <th><span class="ti-marker-alt"></span></th>
                                    <th><span class="ti-trash"></span></th>
                                </tr>
                                </thead>
                                <tbody>

                                <g:each in="${poiGroupeList}">
                                    <tr>
                                        <td><g:link action="show" id="${it.id}">${it.id}</g:link></td>
                                        <td>${it.user.username}</td>
                                        <td><g:link action="edit" id="${it.id}"><span
                                                class="ti-marker-alt"></span></g:link></td>
                                        <td><g:link action="delete" id="${it.id}"
                                                    onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"><span
                                                    class="ti-trash" style="color: #db4800;"></span></g:link></td>
                                    </tr>
                                </g:each>
                                </tbody>
                            </table>
                        </div>

                        <div class="pagination">
                            <g:paginate total="${poiGroupeCount ?: 0}"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>