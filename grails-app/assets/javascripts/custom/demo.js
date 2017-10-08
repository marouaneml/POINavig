graphs = {
    initGraph1: function (poiByGroupe) {
        var labels = [], series = [];
        for (var i = 0; i < Object.keys(poiByGroupe).length; i++) {
            if (Object.keys(poiByGroupe).length > 5) {
                labels[i] = "G " + Object.keys(poiByGroupe)[i].toString();
            } else {
                labels[i] = "Groupe " + Object.keys(poiByGroupe)[i].toString();
            }
            series[i] = Object.values(poiByGroupe)[i];
        }
        new Chartist.Bar('.cavnas-graph1', {
            labels: labels,
            series: series
        }, {
            distributeSeries: true
        });
    }
    ,

    initGraph2: function (users) {
        var usersJson = [];
        for (var i = 0; i < users.length; i++) {

            usersJson.push({
                x: new Date(new Date(users[i][0]).getTime()),
                y: users[i][1]
            });
        }
        usersJson.push({x: new Date(1505911447000), y: 40},{x: new Date(1507121047000), y: 45}
            )
        console.log(usersJson)

        new Chartist.Line('.cavnas-graph2', {
            series: [
                {
                    name: 'series-1',
                    data: usersJson
                }
            ]
        }, {
            axisX: {
                type: Chartist.FixedScaleAxis,
                divisor: 5,
                labelInterpolationFnc: function (value) {
                    return moment(value).format('MMM D');
                }
            }
        });
    }


}
