<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>PoiNagiv project</title>

    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>
</head>

<body>
<div class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-4 col-sm-6">
                <div class="card">
                    <div class="content">
                        <div class="row">
                            <div class="col-xs-5">
                                <div class="icon-big icon-warning text-center">
                                    <i class="ti-user"></i>
                                </div>
                            </div>

                            <div class="col-xs-7">
                                <div class="numbers">
                                    <p> Nombre d'utilisateur</p>
                                    ${nbUsers}
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <div class="col-lg-4 col-sm-6">
                <div class="card">
                    <div class="content">
                        <div class="row">
                            <div class="col-xs-5">
                                <div class="icon-big icon-success text-center">
                                    <i class="ti-map-alt"></i>
                                </div>
                            </div>

                            <div class="col-xs-7">
                                <div class="numbers">
                                    <p>Les points d'intérêt</p>
                                    ${nbPois}
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <div class="col-lg-4 col-sm-6">
                <div class="card">
                    <div class="content">
                        <div class="row">
                            <div class="col-xs-5">
                                <div class="icon-big icon-danger text-center">
                                    <i class="ti-view-grid"></i>
                                </div>
                            </div>

                            <div class="col-xs-7">
                                <div class="numbers">
                                    <p>Groupes des POIs</p>
                                    ${nbPoiGroupes}
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

        </div>

        <div class="row">

            <div class="col-md-12">
                <div class="card">
                    <div class="header">
                        <h4 class="title">Création d'utilisateurs </h4>

                        <p class="category"> Performance sur les 3 derniers mois</p>
                    </div>

                    <div class="content">
                        <div id="chartHours" class="ct-chart"></div>

                        <div class="footer">
                            <div class="chart-legend">
                                <i class="fa fa-circle text-info"></i> Utilisateur
                                <i class="fa fa-circle text-danger"></i> Moderateur
                                <i class="fa fa-circle text-warning"></i> Administrateur
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6">
                <div class="card">
                    <div class="header">
                        <h4 class="title">Les POI par groupe</h4>

                        <p class="category">La répatrition des Pois selon les groupes</p>
                    </div>

                    <div class="content">
                        <div id="chartPreferences" class="ct-chart ct-perfect-fourth"></div>

                        <div class="footer">

                            <hr>

                            <div class="stats">
                                <i class="ti-timer"></i> Mis à jour juste maintenant
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <div class="card ">
                    <div class="header">
                        <h4 class="title">2015 Sales</h4>

                        <p class="category">All products including Taxes</p>
                    </div>

                    <div class="content">
                        <div id="chartActivity" class="ct-chart"></div>

                        <div class="footer">
                            <div class="chart-legend">
                                <i class="fa fa-circle text-info"></i> Tesla Model S
                                <i class="fa fa-circle text-warning"></i> BMW 5 Series
                            </div>
                            <hr>

                            <div class="stats">
                                <i class="ti-check"></i> Data information certified
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="/projet/assets/jquery-2.2.0.min.js?compile=false"></script>
<script type="text/javascript" src="/projet/assets/custom/chartist.min.js?compile=false" ></script>
<script type="text/javascript" src="/projet/assets/custom/demo.js?compile=false" ></script>
<script>
    $(document).ready(function () {
        $.ajax({
            url: "${g.createLink(controller:'adminInterface',action:'poisByGroupe')}",
            data: {},
            dataType: 'json',
            success: function (pois) {
                demo.initChartist(pois)
            },
            error: function () {
                console.log("error")
            }
        });
    });
</script>
</body>
</html>
