<%--
  Created by IntelliJ IDEA.
  User: MAROUANE
  Date: 28/09/2017
  Time: 07:07
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>PoiNavig | accueil user</title>
</head>

<body>
<div class="content">
    <div class="container-fluid">
        <div class="card card-map">
            <div class="header">
                <h4 class="title"><span class="ti-map-alt"></span> Les Poi sur la carte</h4>
            </div>
            <div id="photos">
            </div>
            <div class="map">
                <div id="map" style="height: 100%; width: 100%;"></div>

                <div class="pois">
                    <div id="searchBarToggle"><span class="ti-close"></span></div>

                    <div class="searchPoi">
                        <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                            <div class="input-group-addon"><span class="ti-search"></span></div>
                            <input type="text" id="poi_search" name="searchPoi" class="form-control border-input"
                                   placeholder="Nom du point d'interet">
                        </div>
                    </div>
                    <ul class="poiList">
                        <g:each in="${pois}">
                            <li onclick="getOnMap(${it.id});">
                                <h3>${it.name}</h3>

                                <p>${it.description}</p>
                            </li>
                        </g:each>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="/projet/assets/jquery-2.2.0.min.js?compile=false"></script>
<script>
    $("#searchBarToggle").click(function (e) {
        $(this).parent().toggleClass('width0');
        $(".searchPoi").find("input").focus().select()
    })
</script>
<script>
    var map;
    function getOnMap(poiId) {
        //là ajax va entrer en jeu, et on a l'id du poi! donc?
        $.ajax({
            url: "${g.createLink(controller:'poi',action:'getByIdAsJson')}",
            data: {
                id: poiId
            },
            dataType: 'json',
            success: function (poi) {
                map.setZoom(16);
                map.panTo({
                    lat: parseFloat(poi.localisation.lat),
                    lng: parseFloat(poi.localisation.lng)
                });


            },
            error: function () {
                console.log("error")
            }
        });
    }


    function putMarker(poiLoc, poiInfo) {
        var location = {
            lat: parseFloat(poiLoc.lat),
            lng: parseFloat(poiLoc.lng)
        };
        var contentString = '<div id="content">' +
            '<h3 id="firstHeading" class="firstHeading">' + poiInfo.name + '</h3>' +
            '<div id="bodyContent">' +
            '<p>' + poiInfo.description + '</p><a href="${g.createLink(controller:'poi',action:'show')}/' + poiInfo.id + '">Plus + </a>' +
            '</div>' +
            '</div>';

        var infowindow = new google.maps.InfoWindow({
            content: contentString
        });;
        var marker = new google.maps.Marker({
            map: map,
            position: location,
            icon: "assets/map-marker.png"
        });
        marker.addListener('click', function () {
            infowindow.open(map, marker);
        });
    }
    drawPois()
    function drawPois() {
        $(document).ready(function () {
            $.ajax({
                url: "${g.createLink(controller:'userInterface',action:'getJsonPois')}",
                data: {},
                dataType: 'json',
                success: function (pois) {
                    var bounds = new google.maps.LatLngBounds();

                    for (var i = 0; i < pois.localisation.length; i++) {
                        putMarker(pois.localisation[i], pois.poi[i])
                        bounds.extend({
                            lat: parseFloat(pois.localisation[i].lat),
                            lng: parseFloat(pois.localisation[i].lng)
                        });

                    }
                    map.fitBounds(bounds);

                    // chercher les pois depuis je Json deja chargé -- plus rapide
                    // que les charger depuis une requete ajax à chaque tape de clavier
                    $(function () {
                        // il faut taper plus ou egale à 3 char pour faire la recherche
                        // si non, la liste complete est renvoyée
                        var minlength = 2;
                        $("#poi_search").bind('keyup', {pois: pois}, function () {
                            var value = $(this).val();
                            var poiList = $(".poiList");
                            poiList.html("");
                            if (value.length >= minlength) {
                                $.each(pois.poi, function (index, val) {
                                    if (~val.name.toLowerCase().indexOf(value.toLowerCase())) {
                                        poiList.append("<li onclick='getOnMap(" + val.id + ");'><h3>" + val.name + "</h3><p>" + val.description + "</p></li>");
                                    }
                                })
                            } else {
                                var poi = pois.poi;
                                for (var i = 0; i < poi.length; i++) {
                                    poiList.append("<li onclick='getOnMap(" + poi[i].id + ");'><h3>" + poi[i].name + "</h3><p>" + poi[i].description + "</p></li>")
                                }
                            }
                        });
                    });
                },
                error: function () {
                    console.log("error")
                }
            });
        });
    }

    function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
            center: {lat: 43.6670625, lng: 7.2527203},
            zoom: 12,
            draggable: true,
            scrollwheel: false,
            styles: styles
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