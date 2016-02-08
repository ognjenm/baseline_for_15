
'use strict';
hethi.controller('artist_dashboard_controller', ['$http','$scope','$filter','$location','$rootScope', function ($http,$scope,$filter,$location,$rootScope){

    //alert("Artist Dashboard Opens");
    $('#PieChart').highcharts({
        chart: {
            type: 'pie',
            options3d: {
                enabled: true,
                alpha: 45,
                beta: 0
            }
        },
        title: {
            text: 'INVOICE IN'
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                depth: 35,
                dataLabels: {
                    enabled: true,
                    format: '<b>{point.name}</b>: {point.percentage:.1f} %'
                }
            }
        },
        series: [{
            type: 'pie',
            name: 'Browser share',
            data: [
                ['Microsoft',   45.0],
                ['Nokia',       26.8],
                {
                    name: 'Pears',
                    y: 12.8,
                    sliced: true,
                    selected: true
                },
                ['Muthoot',    8.5],
                ['Bajaj',     6.2],
                ['TVS',   0.7]
            ]
        }]
    });

    $('#3dDonut').highcharts({
        chart: {
            type: 'pie',
            options3d: {
                enabled: true,
                alpha: 45
            }
        },
        title: {
            text: 'Tasks (day basis)'
        },
        //subtitle: {
        //    text: '3D donut in Highcharts'
        //},
        plotOptions: {
            pie: {
                innerSize: 100,
                depth: 45,
                allowPointSelect: true,
                cursor: 'pointer',
                //depth: 35,
                dataLabels: {
                    enabled: true,
                    format: '<b>{point.name}</b>: {point.percentage:.1f} %'
                }
            }
        },
        series: [{
            name: 'Delivered amount',
            data: [
                ['Queue', 8],
                ['Hold', 3],
                ['Pending', 1],
                ['IN', 6],

                ['Uploads', 8],
                ['Complete',50],
                {
                    name: 'Delivered',
                    y: 24,
                    sliced: true,
                    selected: true
                }
            ]
        }]
    });
//    Column Basics

    $('#columnBasics').highcharts({
        chart: {
            type: 'column'
        },
        title: {
            text: 'Monthly Average Process'
        },
        //subtitle: {
        //    text: 'Source: hethi.com'
        //},
        xAxis: {
            categories: [
                'Jan',
                'Feb',
                'Mar',
                'Apr',
                'May',
                'Jun',
                'Jul',
                'Aug',
                'Sep',
                'Oct',
                'Nov',
                'Dec'
            ],
            crosshair: true
        },
        yAxis: {
            min: 0,
            title: {
                text: 'Rainfall (mm)'
            }
        },
        tooltip: {
            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
            '<td style="padding:0"><b>{point.y:.1f} mm</b></td></tr>',
            footerFormat: '</table>',
            shared: true,
            useHTML: true
        },
        plotOptions: {
            column: {
                pointPadding: 0.2,
                borderWidth: 0
            }
        },
        series: [{
            name: 'DAas',
            data: [49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4]

        }, {
            name: 'Baas',
            data: [83.6, 78.8, 98.5, 93.4, 106.0, 84.5, 105.0, 104.3, 91.2, 83.5, 106.6, 92.3]

        }, {
            name: 'BPaas',
            data: [48.9, 38.8, 39.3, 41.4, 47.0, 48.3, 59.0, 59.6, 52.4, 65.2, 59.3, 51.2]

        },
        //    {
        //    name: '',
        //    data: [42.4, 33.2, 34.5, 39.7, 52.6, 75.5, 57.4, 60.4, 47.6, 39.1, 46.8, 51.1]
        //
        //}
        ]
    });


}]);
