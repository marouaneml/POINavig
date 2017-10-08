<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
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
                        <h4 class="title"><g:message code="default.edit.label" args="[entityName]"/></h4>
                    </div>

                    <div id="edit-user" class="content scaffold-edit" role="main">

                        <g:if test="${flash.message}">
                            <div class="message" role="status">${flash.message}</div>
                        </g:if>
                        <g:hasErrors bean="${this.user}">
                            <ul class="errors" role="alert">
                                <g:eachError bean="${this.user}" var="error">
                                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                                            error="${error}"/></li>
                                </g:eachError>
                            </ul>
                        </g:hasErrors>
                        <g:form resource="${this.user}" method="PUT">
                            <g:hiddenField name="version" value="${this.user?.version}"/>

                            <div class="row">
                                <div class="col-md-6">
                                    <f:field bean="user" property="username"/>
                                    <f:field bean="user" property="password" value=""/>
                                    <f:field bean="user" property="passwordExpired"/>
                                    <f:field bean="user" property="accountLocked"/>
                                    <f:field bean="user" property="enabled"/>
                                </div>

                                <div class="col-md-6">
                                    <f:field bean="user" property="poiGoupes"/>
                                    <hr>
                                    <input class="save btn btn-info btn-fill btn-wd" type="submit"
                                           value="${message(code: 'default.button.update.label', default: 'Update')}"/>
                                </div>
                            </div>
                        </g:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
