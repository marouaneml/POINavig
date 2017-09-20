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
            <div class="col-lg-3 col-sm-6">
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
                                    0
                                </div>
                            </div>
                        </div>

                        <div class="footer">
                            <hr/>

                            <div class="stats">
                                <i class="ti-reload"></i> Updated now
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-sm-6">
                <div class="card">
                    <div class="content">
                        <div class="row">
                            <div class="col-xs-5">
                                <div class="icon-big icon-success text-center">
                                    <i class="ti-location-pin"></i>
                                </div>
                            </div>

                            <div class="col-xs-7">
                                <div class="numbers">
                                    <p>POI</p>
                                    0
                                </div>
                            </div>
                        </div>

                        <div class="footer">
                            <hr/>

                            <div class="stats">
                                <i class="ti-calendar"></i> Updated now
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-sm-6">
                <div class="card">
                    <div class="content">
                        <div class="row">
                            <div class="col-xs-5">
                                <div class="icon-big icon-danger text-center">
                                    <i class="ti-star"></i>
                                </div>
                            </div>

                            <div class="col-xs-7">
                                <div class="numbers">
                                    <p>Groupes de POI</p>
                                    0
                                </div>
                            </div>
                        </div>

                        <div class="footer">
                            <hr/>

                            <div class="stats">
                                <i class="ti-timer"></i> Updated now
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-sm-6">
                <div class="card">
                    <div class="content">
                        <div class="row">
                            <div class="col-xs-5">
                                <div class="icon-big icon-info text-center">
                                    <i class="ti-more-alt"></i>
                                </div>
                            </div>

                            <div class="col-xs-7">
                                <div class="numbers">
                                    <p>Autres</p>
                                    +3
                                </div>
                            </div>
                        </div>

                        <div class="footer">
                            <hr/>

                            <div class="stats">
                                <i class="ti-reload"></i> Updated now
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
                            <hr>

                            <div class="stats">
                                <i class="ti-reload"></i> Updated now
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
                        <h4 class="title">Nombre de POI par groupe</h4>

                        <p class="category">Performance sur les 3 derniers mois</p>
                    </div>

                    <div class="content">
                        <div id="chartPreferences" class="ct-chart ct-perfect-fourth"></div>

                        <div class="footer">
                            <div class="chart-legend">
                                <i class="fa fa-circle text-info"></i> Utilisateur
                                <i class="fa fa-circle text-danger"></i> Moderateur
                                <i class="fa fa-circle text-warning"></i> Administrateur
                            </div>
                            <hr>

                            <div class="stats">
                                <i class="ti-timer"></i> Campaign sent 2 days ago
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

</body>
</html>
