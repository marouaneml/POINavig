<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'poi.label', default: 'Poi')}"/>
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

                    <div id="edit-poi" class="content scaffold-edit" role="main">
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
                        <div class="row">
                            <div class="col-md-6">
                                <g:form resource="${this.poi}" method="PUT">
                                    <g:hiddenField name="version" value="${this.poi?.version}"/>
                                    <fieldset class="form">

                                        <f:with bean="poi">
                                            <f:field property="name"/>
                                            <f:field property="description"/>
                                            <f:field property="localisation.name" label="Adresse"/>
                                            <f:field property="localisation.lat"/>
                                            <f:field property="localisation.lng"/>
                                            <f:field property="poiGroupes"/>
                                        </f:with>
                                    </fieldset>
                                    <hr>
                                    <fieldset class="buttons">
                                        <input class="save btn btn-primary" type="submit"
                                               value="${message(code: 'default.button.update.label', default: 'Update')}"/>
                                    </fieldset>
                                </g:form>

                            </div>

                            <div class="map col-md-6" style="height: 300px; padding: 10px 15px 0 0;">
                                <div id="map" style="height: 100%; width: 100%;"></div>

                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    var map;
    var marker;


    function initMap() {

        map = new google.maps.Map(document.getElementById('map'), {
            center: {lat: 43.6670625, lng: 7.2527203},
            zoom: 16,
            draggable: true,
            scrollwheel: false,
            styles: styles
        });
        marker = new google.maps.Marker({
            map: map,
            position: {lat: ${raw(this.poi.localisation.lat)}, lng: ${raw(this.poi.localisation.lng)}},
            icon: "../../assets/map-marker.png"
        });
        map.panTo({lat: ${raw(this.poi.localisation.lat)}, lng: ${raw(this.poi.localisation.lng)}})

        google.maps.event.addListener(map, 'click', function (event) {
            marker.setPosition(event.latLng);
            map.panTo(event.latLng);
            $("#localisation\\.lat").val(event.latLng.lat());
            $("#localisation\\.lng").val(event.latLng.lng());
        });
    }
    var styles = [
        {
            "elementType": "geometry",
            "stylers": [
                {
                    "color": "#ebe3cd"
                }
            ]
        },
        {
            "elementType": "labels.text.fill",
            "stylers": [
                {
                    "color": "#523735"
                }
            ]
        },
        {
            "elementType": "labels.text.stroke",
            "stylers": [
                {
                    "color": "#f5f1e6"
                }
            ]
        },
        {
            "featureType": "administrative",
            "elementType": "geometry.stroke",
            "stylers": [
                {
                    "color": "#c9b2a6"
                }
            ]
        },
        {
            "featureType": "administrative.land_parcel",
            "elementType": "geometry.stroke",
            "stylers": [
                {
                    "color": "#dcd2be"
                }
            ]
        },
        {
            "featureType": "administrative.land_parcel",
            "elementType": "labels.text.fill",
            "stylers": [
                {
                    "color": "#ae9e90"
                }
            ]
        },
        {
            "featureType": "landscape.natural",
            "elementType": "geometry",
            "stylers": [
                {
                    "color": "#dfd2ae"
                }
            ]
        },
        {
            "featureType": "poi",
            "elementType": "geometry",
            "stylers": [
                {
                    "color": "#dfd2ae"
                }
            ]
        },
        {
            "featureType": "poi",
            "elementType": "labels.text.fill",
            "stylers": [
                {
                    "color": "#93817c"
                }
            ]
        },
        {
            "featureType": "poi.park",
            "elementType": "geometry.fill",
            "stylers": [
                {
                    "color": "#a5b076"
                }
            ]
        },
        {
            "featureType": "poi.park",
            "elementType": "labels.text.fill",
            "stylers": [
                {
                    "color": "#447530"
                }
            ]
        },
        {
            "featureType": "road",
            "elementType": "geometry",
            "stylers": [
                {
                    "color": "#f5f1e6"
                }
            ]
        },
        {
            "featureType": "road.arterial",
            "elementType": "geometry",
            "stylers": [
                {
                    "color": "#fdfcf8"
                }
            ]
        },
        {
            "featureType": "road.highway",
            "elementType": "geometry",
            "stylers": [
                {
                    "color": "#f8c967"
                }
            ]
        },
        {
            "featureType": "road.highway",
            "elementType": "geometry.stroke",
            "stylers": [
                {
                    "color": "#e9bc62"
                }
            ]
        },
        {
            "featureType": "road.highway.controlled_access",
            "elementType": "geometry",
            "stylers": [
                {
                    "color": "#e98d58"
                }
            ]
        },
        {
            "featureType": "road.highway.controlled_access",
            "elementType": "geometry.stroke",
            "stylers": [
                {
                    "color": "#db8555"
                }
            ]
        },
        {
            "featureType": "road.local",
            "elementType": "labels.text.fill",
            "stylers": [
                {
                    "color": "#806b63"
                }
            ]
        },
        {
            "featureType": "transit.line",
            "elementType": "geometry",
            "stylers": [
                {
                    "color": "#dfd2ae"
                }
            ]
        },
        {
            "featureType": "transit.line",
            "elementType": "labels.text.fill",
            "stylers": [
                {
                    "color": "#8f7d77"
                }
            ]
        },
        {
            "featureType": "transit.line",
            "elementType": "labels.text.stroke",
            "stylers": [
                {
                    "color": "#ebe3cd"
                }
            ]
        },
        {
            "featureType": "transit.station",
            "elementType": "geometry",
            "stylers": [
                {
                    "color": "#dfd2ae"
                }
            ]
        },
        {
            "featureType": "water",
            "elementType": "geometry.fill",
            "stylers": [
                {
                    "color": "#b9d3c2"
                }
            ]
        },
        {
            "featureType": "water",
            "elementType": "labels.text.fill",
            "stylers": [
                {
                    "color": "#92998d"
                }
            ]
        }
    ]
</script>
<script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAjpbMLKWtdtVUdNEbFU3jh8VaFlpH3_bM&callback=initMap">
</script>
</body>
</html>
