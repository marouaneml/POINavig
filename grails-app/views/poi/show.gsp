<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'poi.label', default: 'Poi')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
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

        <div class="card card-map">
            <div class="header">
                <h4 class="title"><span class="ti-map-alt"></span> <g:message code="default.show.label"
                                                                              args="[entityName]"/></h4>
            </div>

            <div class="row">
                <div class="map col-md-6" style="height: 300px; padding: 15px 0 20px 30px;">
                    <div id="map" style="height: 100%; width: 100%;"></div>

                </div>

                <div class="poi-infos col-md-6">
                    <div id="show-poi" class="content scaffold-show" role="main">

                        <g:if test="${flash.message}">
                            <div class="message" role="status">${flash.message}</div>
                        </g:if>
                        <ul class="list-group">
                            <li class="list-group-item">
                                <strong>Name:</strong><br>
                                <f:display bean="poi" property="name"/>
                            </li>
                            <li class="list-group-item">
                                <strong>Description:</strong><br>
                                <f:display bean="poi" property="description"/>
                            </li>
                            <li class="list-group-item">
                                <strong>Poi Groupe:</strong><br>
                                <f:display bean="poi" property="poiGroupes"/>
                            </li>

                        </ul>
                        <ul class="list-group">
                            <strong>Les Photos:</strong>
                            <g:each in="${this.poi.medias}">
                                <li class="list-group-item"><img src="${it.url}" alt="${it.description}"></li>
                            </g:each>

                        </ul>
                        <sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_MODERATEUR">
                            <g:form resource="${this.poi}" method="DELETE">
                                <fieldset class="buttons">
                                    <g:link class="edit btn btn-info" action="edit" resource="${this.poi}"><g:message
                                            code="default.button.edit.label" default="Edit"/></g:link>
                                    <input class="delete btn btn-warning" type="submit"
                                           value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                           onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
                                </fieldset>
                            </g:form>
                        </sec:ifAnyGranted>

                    </div>
                </div>
            </div>

        </div>

    </div>
</div>

<script>
    var map;
    function initMap() {

        map = new google.maps.Map(document.getElementById('map'), {
            center: {lat: 43.6670625, lng: 7.2527203},
            zoom: 16,
            draggable: true,
            scrollwheel: false,
            styles: styles
        });
        var marker = new google.maps.Marker({
            map: map,
            position: {lat: ${raw(this.poi.localisation.lat)}, lng: ${raw(this.poi.localisation.lng)}},
            icon: "../../assets/map-marker.png"
        });
        map.panTo({lat: ${raw(this.poi.localisation.lat)}, lng: ${raw(this.poi.localisation.lng)}})
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
