<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'poi.label', default: 'Poi')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
    </ul>
</div>

<div class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="header">
                        <h4 class="title"><g:message code="default.create.label" args="[entityName]"/></h4>
                    </div>

                    <div id="create-poi" class="content scaffold-create" role="main">
                        <g:if test="${flash.message}">
                            <div class="message" role="status">${flash.message}</div>
                        </g:if>
                        <g:hasErrors bean="${this.poi}">
                            <ul class="errors" role="alert">
                                <g:eachError bean="${this.poi}" var="error">
                                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                                            error="${error}"/></li>
                                </g:eachError>
                            </ul>
                        </g:hasErrors>
                        <g:form resource="${this.poi}" method="POST" enctype="multipart/form-data">
                            <div class="row">
                                <div class="col-md-6">
                                    <fieldset class="form">
                                        <f:field bean="poi" class="dddf" property="name"/>
                                        <f:field bean="poi" property="description"/>
                                        <f:field bean="poi" property="localisation.name" label="Address"/>
                                        <f:field bean="poi" property="localisation.lat"/>
                                        <f:field bean="poi" property="localisation.lng"/>
                                        <f:field bean="poi" property="poiGroupes"/>
                                    </fieldset>
                                </div>

                                <div class="col-md-6">

                                    <label class="custom-file">
                                        <span class="custom-file-control">Ajouter des photos (plusieurs photos à la fois)</span>
                                        <br><br>
                                        <input type="file" name="photos" id="photos" class="custom-file-input" multiple>

                                    </label>
                                    <ul id="photos-cavnas">

                                    </ul>
                                    <hr>
                                    <fieldset class="buttons">
                                        <g:submitButton name="create" class="save btn btn-primary"
                                                        value="${message(code: 'default.button.create.label', default: 'Create')}"/>
                                    </fieldset>
                                </div>
                            </div>

                        </g:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="/projet/assets/jquery-2.2.0.min.js?compile=false"></script>

<script>
    $(function () {
        var imagesPreview = function (input, photosDiv) {
            if (input.files) {
                var filesAmount = input.files.length;

                for (i = 0; i < filesAmount; i++) {
                    var reader = new FileReader();

                    reader.onload = function (event) {
                        var li = document.createElement("li");
                        $($.parseHTML('<img>')).attr('src', event.target.result).appendTo($(li));
                        $(li).appendTo(photosDiv)
                    }
                    reader.readAsDataURL(input.files[i]);
                }
            }

        };
        $('#photos').click(function (e) {
            $("#photos-cavnas").html("");
        });
        $('#photos').on('change', function () {
            imagesPreview(this, '#photos-cavnas');
        });
    });
</script>
</body>
</html>
