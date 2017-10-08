<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <asset:stylesheet src="application.css"/>

    <g:layoutHead/>

    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
</head>

<body>
<div class="wrapper">
    <div class="sidebar" data-background-color="white" data-active-color="danger">
        <div class="sidebar-wrapper">
            <div class="logo">
                <a href="/projet/" class="simple-text">
                    POI Navig
                </a>
            </div>

            <ul class="nav">
                <sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_MODERATEUR, ROLE_USER">
                    <li class="${request.forwardURI == '/projet/userInterface'? 'active':''}">
                        <a href="/projet/userInterface">
                            <i class="ti-location-pin"></i>
                            <p>La POIMap</p>
                        </a>
                    </li>
                </sec:ifAnyGranted>
                <sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_MODERATEUR">
                    <li class="${request.forwardURI == '/projet/adminInterface'? 'active':''}">
                        <a href="/projet/adminInterface">
                            <i class="ti-stats-up"></i>
                            <p>Tableau de bord</p>
                        </a>
                    </li>
                </sec:ifAnyGranted>
                <sec:ifAnyGranted roles="ROLE_USER">
                    <li class="${request.forwardURI.contains('/projet/user/show')? 'active':''}">

                        <a href="/projet/user/show/${sec.loggedInUserInfo(field: 'id')}">
                            <i class="ti-user"></i>

                            <p>Profil</p>
                        </a>

                    </li>
                </sec:ifAnyGranted>

                <sec:ifAnyGranted roles="ROLE_ADMIN">
                    <li class="${request.forwardURI.contains('/projet/user') && !request.forwardURI.contains('userInterface')? 'active':''}">
                        <a href="/projet/user">
                            <i class="ti-settings"></i>

                            <p>Gestion d'utilisateurs</p>
                        </a>
                    </li>
                </sec:ifAnyGranted>
                <sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_MODERATEUR">
                    <li class="${request.forwardURI.contains('/projet/poi')  && !request.forwardURI.contains('poiGroupe')? 'active':''}">
                        <a href="/projet/poi">
                            <i class="ti-map-alt"></i>

                            <p>Gestion des POIs</p>
                        </a>
                    </li>
                </sec:ifAnyGranted>
                <sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_MODERATEUR">
                    <li class="${request.forwardURI.contains('/projet/poiGroupe')? 'active':''}">
                        <a href="/projet/poiGroupe">
                            <i class="ti-layers-alt"></i>

                            <p>Gestion des groupes</p>
                        </a>
                    </li>
                </sec:ifAnyGranted>


                <li class="active-pro" data-toggle="modal" data-target=".bd-example-modal-lg">
                    <a href="#">
                        <i class="ti-bookmark-alt"></i>

                        <p>Récapitulatif</p>
                    </a>
                </li>

            </ul>
        </div>
    </div>

    <div class="main-panel">
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar bar1"></span>
                        <span class="icon-bar bar2"></span>
                        <span class="icon-bar bar3"></span>
                    </button>
                    <sec:ifAnyGranted roles="ROLE_USER">
                        <span class="navbar-brand" href="#">Plateforme d'utilisateur</span>
                    </sec:ifAnyGranted>
                    <sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_MODERATEUR">
                        <span class="navbar-brand" href="#">Plateforme Admin</span>
                    </sec:ifAnyGranted>

                </div>

                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <sec:ifLoggedIn>
                            <li>
                                <a href="/projet/user/show/${sec.loggedInUserInfo(field: 'id')}">
                                    <i class="ti-user"></i>

                                    <p>${sec.loggedInUserInfo(field: 'username')}</p>
                                </a>
                            </li>
                            <li>
                                <a href="/projet/logout">
                                    <i class="ti-power-off"></i>

                                    <p>Sortir</p>
                                </a>
                            </li>
                        </sec:ifLoggedIn>
                        <sec:ifNotLoggedIn>
                            <li>
                                <a href="/projet/login">
                                    <i class="ti-unlock"></i>

                                    <p>S'identifier</p>
                                </a>
                            </li>
                        </sec:ifNotLoggedIn>
                    </ul>

                </div>
            </div>
        </nav>


        <g:layoutBody/>

        <footer class="footer" role="contentinfo">
            <div class="container-fluid">
                <nav class="pull-left">
                    <ul>

                        <li>
                            <a href="">
                                Réalisé par LAMINE &  HAMES
                            </a>
                        </li>
                        <li>
                            <a href="">
                                Projet Grails
                            </a>
                        </li>
                    </ul>
                </nav>

                <div class="copyright pull-right">
                    2017 - 2018
                </div>
            </div>
        </footer>

    </div>

    <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="card">
                <div class="header">
                    <h4 class="title">Récapitulatif de notre travail</h4>
                </div>
                <hr style="margin-bottom: 0">

                <div class="content">
                    <div class="row">
                        <div class="col-md-12">
                            <p style="font-size: 18px; text-align: justify">PoiNavig est une application qui permet la gestion d'un ensemble d'emplacements (restaurants,
                            magasins, etc) désignés par leur nomination, description ainsi que leur localisation ; ceux-ci sont appelés "points d'intérêt".</p>
                        </div>
                    </div>
                    <hr>
                    <h5 class="title"><strong>Les fonctionnalités</strong></h5>
                    <br>
                    <div class="row" id="dones">
                        <div class="col-md-6">
                            <ul>
                                <li>Mécanisme de sécurité mis en place grace au module "Spring Security"</li>
                                <li>Authentification préalable requise</li>
                                <li>Menu personalisé est affiché après l'authentification</li>
                                <li>Visualiser divers statistiques pour l'admin</li>
                                <li>Visualiser des graphs en utilisant <a href="https://gionkunz.github.io/chartist-js/">Chartist-js</a></li>
                                <li>Gerer la geolocalisation des Pois avec GoogleMaps API</li>
                            </ul>
                        </div>

                        <div class="col-md-6">
                            <ul>
                                <li>Une belle interface utilisateur, pour navigation dans les Pois</li>
                                <li>Recherche rapide dans les Pois</li>
                                <li>Respecter les droits de chaque type d'utilisateur</li>
                                <li>Ajouter la possibilité d'uploader plusieurs images de poi en meme temps</li>
                                <li>Visualiser les images qu'on télécharger sur le browser</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="spinner" class="spinner" style="display:none;">
    <g:message code="spinner.alt" default="Loading&hellip;"/>
</div>

<asset:javascript src="application.js"/>

</body>
</html>
