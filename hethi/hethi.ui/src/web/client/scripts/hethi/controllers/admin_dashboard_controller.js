
'use strict';
hethi.controller('admin_dashboard_controller', ['$http','$scope','$filter','$location','$rootScope', function ($http,$scope,$filter,$location,$rootScope){

    //alert("Artist Dashboard Opens");
    $('#admin_PieChart').highcharts({
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
                    enabled: true
                    //format: '<b>{point.name}</b>: {point.percentage:.1f} %'
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

    $('#admin_3dDonut').highcharts({
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
                cursor: 'pointer'
                ////depth: 35,
                //dataLabels: {
                //    enabled: true,
                //    format: '<b>{point.name}</b>: {point.percentage:.1f} %'
                //}
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

    $('#WorkflowStatus').highcharts({
        chart: {
            type: 'column'
        },
        title: {
            text: 'Workflow Results'
        },
        //subtitle: {
        //    text: 'Source: hethi.com'
        //},
        xAxis: {
            categories: [
                'Complete Transaction',
                'Display Success',
                'Distribute report',
                'Tasks/Main',
                'OCR & Active Directory',
                'Run program',
                'Start Order Process',
                'test'

            ],
            labels: {
                rotation: -25,
                style: {
                    fontSize: '10px',
                    color:'black',
                    fontWeight:'bold',
                    fontFamily: 'Verdana, sans-serif'
                }
            },
            crosshair: true
        },
        yAxis: {
            min: 0,
            title: {
                text: 'Number of occurrences'
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
            name: 'Min.Time',
            data: [49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5]

        }, {
            name: 'Max.Time',
            data: [83.6, 78.8, 98.5, 93.4, 106.0, 84.5, 105.0, 104.3]

        }, {
            name: 'Avg.Time',
            data: [48.9, 38.8, 39.3, 41.4, 47.0, 48.3, 59.0, 59.6]

        }]
    });
//    Drilled Down

    $('#drilledDown').highcharts({
        chart: {
            type: 'column'
        },
        title: {
            text: 'Number of Active Workflows Started Hourly Over Time (Yesterday)'
        },
        subtitle: {
            text: 'Click on the Bar to view more .'
        },
        xAxis: {
            type: 'category'
        },
        yAxis: {
            title: {
                text: 'Workflow Context Count'
            }

        },
        legend: {
            enabled: false
        },
        plotOptions: {
            series: {
                borderWidth: 0,
                dataLabels: {
                    enabled: true,
                    format: '{point.y:.1f}%'
                }
            }
        },

        tooltip: {
            headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
            pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}%</b> of total<br/>'
        },

        series: [{
            name: "Brands",
            colorByPoint: true,
            data: [{
                name: "Microsoft",
                y: 45.0,
                drilldown: "Microsoft"
            }, {
                name: "Nokia",
                y: 26.08,
                drilldown: "Nokia"
            }, {
                name: "Pears",
                y: 12.08,
                drilldown: "Pears"
            }, {
                name: "Muthoot",
                y: 8.05,
                drilldown: "Muthoot"
            }, {
                name: "Bajaj",
                y: 6.02,
                drilldown: "Bajaj"
            }, {
                name: "TVS",
                y: 0.7,
                drilldown: null
            }]
        }],
        drilldown: {
            series: [{
                name: "Microsoft",
                id: "Microsoft",
                data: [
                    [
                        "v11.0",
                        24.13
                    ],
                    [
                        "v8.0",
                        17.2
                    ],
                    [
                        "v9.0",
                        8.11
                    ],
                    [
                        "v10.0",
                        5.33
                    ],
                    [
                        "v6.0",
                        1.06
                    ],
                    [
                        "v7.0",
                        0.5
                    ]
                ]
            }, {
                name: "Nokia",
                id: "Nokia",
                data: [
                    [
                        "v40.0",
                        5
                    ],
                    [
                        "v41.0",
                        4.32
                    ],
                    [
                        "v42.0",
                        3.68
                    ],
                    [
                        "v39.0",
                        2.96
                    ],
                    [
                        "v36.0",
                        2.53
                    ],
                    [
                        "v43.0",
                        1.45
                    ],
                    [
                        "v31.0",
                        1.24
                    ],
                    [
                        "v35.0",
                        0.85
                    ],
                    [
                        "v38.0",
                        0.6
                    ],
                    [
                        "v32.0",
                        0.55
                    ],
                    [
                        "v37.0",
                        0.38
                    ],
                    [
                        "v33.0",
                        0.19
                    ],
                    [
                        "v34.0",
                        0.14
                    ],
                    [
                        "v30.0",
                        0.14
                    ]
                ]
            }, {
                name: "Pears",
                id: "Pears",
                data: [
                    [
                        "v35",
                        2.76
                    ],
                    [
                        "v36",
                        2.32
                    ],
                    [
                        "v37",
                        2.31
                    ],
                    [
                        "v34",
                        1.27
                    ],
                    [
                        "v38",
                        1.02
                    ],
                    [
                        "v31",
                        0.33
                    ],
                    [
                        "v33",
                        0.22
                    ],
                    [
                        "v32",
                        0.15
                    ]
                ]
            }, {
                name: "Muthoot",
                id: "Muthoot",
                data: [
                    [
                        "v8.0",
                        2.56
                    ],
                    [
                        "v7.1",
                        0.77
                    ],
                    [
                        "v5.1",
                        0.42
                    ],
                    [
                        "v5.0",
                        0.3
                    ],
                    [
                        "v6.1",
                        0.29
                    ],
                    [
                        "v7.0",
                        0.26
                    ],
                    [
                        "v6.2",
                        0.17
                    ]
                ]
            }, {
                name: "Bajaj",
                id: "Bajaj",
                data: [
                    [
                        "v12.x",
                        0.34
                    ],
                    [
                        "v28",
                        0.24
                    ],
                    [
                        "v27",
                        0.17
                    ],
                    [
                        "v29",
                        0.16
                    ]
                ]
            }]
        }
    });

//    Running Workflow

    $('#runningWorkflow').highcharts({
        colors: ["#90ed7d", "#7cb5ec"],
        dataLabelsColor: '#B0B0B3',
        chart: {
            type: 'column',
            options3d: {
                enabled: true,
                alpha: 15,
                beta: 15,
                viewDistance: 25,
                depth: 40
            }
        },
        title: {
            text: 'Workflows run between Yesterday and Today (By table)'
        },
        xAxis: {
            categories: ['Workflow_execution', 'Change Request', 'Sc_Request', 'Sc_req_Item'],
            labels: {
                rotation: -20,
                style: {
                    fontSize: '10px',
                    fontFamily: 'Verdana, sans-serif'
                }
            }
        },
        yAxis: {
            min: 0,
            title: {
                text: 'Workflow Context Count'
            }
        },
        tooltip: {
            pointFormat: '<span style="color:{series.color}">{series.name}</span>: <b>{point.y}</b> ({point.percentage:.0f}%)<br/>',
            shared: true
        },
        plotOptions: {
            column: {
                stacking: 'normal',
                dataLabels: {
                    enabled: true,
                    color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white',
                    style: {
                        textShadow: '0 0 3px black'
                    }
                }
            }

        },
        series: [{
            name: 'Finished',
            data: [5, 2, 4, 3]
        },  {
            name: 'Executing',
            data: [3, 1, 2, 2]
        }]
    });
//Workflow State

    $('#workflowState').highcharts({
        chart: {
            type: 'pie'
            //options3d: {
            //    enabled: true,
            //    alpha: 45
            //}
        },
        title: {
            text: 'Workflows by State'
        },
        subtitle: {
            text: 'This Month'
        },
        //tooltip: {
        //    pointFormat: '{series.data}: <b>{point.percentage:.1f}%</b>'
        //},
        plotOptions: {
            pie: {
                innerSize: 100,
                depth: 45,
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    format: '<b>{point.name}</b>: {point.percentage:.1f} %'
                },
                showInLegend: true
            },
            showInLegend: true
        },
        series: [{
            name: 'Workflow State',
            data: [
                ['Finished', 80],
                {
                    name: 'Executing',
                    y: 20,
                    sliced: true,
                    selected: true
                }
            ]
        }]
    });




}]);
