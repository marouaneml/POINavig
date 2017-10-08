<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<div class="nav sub-nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-user" class="content scaffold-list" role="main">

    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <g:if test="${flash.message}">
                        <div class="message" role="status">${flash.message}</div>
                    </g:if>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="header">
                            <h4 class="title"><g:message code="default.list.label" args="[entityName]"/></h4>
                        </div>

                        <div class="content table-responsive table-full-width">
                            <table class="table table-striped">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Username</th>
                                    <th>Enabled</th>
                                    <th>Password Expired</th>
                                    <th><span class="ti-marker-alt"></span></th>
                                    <th><span class="ti-trash"></span></th>
                                </tr>
                                </thead>
                                <tbody>
                                <g:each in="${userList}">
                                    <tr>
                                        <td><g:link action="show" id="${it.id}">${it.id}</g:link></td>
                                        <td>${it.username}</td>
                                        <td>
                                            <g:if test="${it.enabled == true}">
                                                <span class="ti-check"></span>
                                            </g:if>
                                            <g:elseif test="${it.enabled == false}">
                                                <span class="ti-close"></span>
                                            </g:elseif>
                                        </td>
                                        <td>
                                            <g:if test="${it.passwordExpired == true}">
                                                <span class="ti-check"></span>
                                            </g:if>
                                            <g:elseif test="${it.passwordExpired == false}">
                                                <span class="ti-close"></span>
                                            </g:elseif>
                                        </td>
                                        <td><a href="/projet/user/edit/${it.id}"><span class="ti-marker-alt"></span></a></td>
                                        <td><g:link action="delete" id="${it.id}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"><span class="ti-trash" style="color: #db4800;"></span></g:link></td>
                                    </tr>
                                </g:each>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="pagination">
        <g:paginate total="${userCount ?: 0}"/>
    </div>
</div>
</body>
</html>