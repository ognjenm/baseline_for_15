
'use strict';
hethi.controller('artist_dashboard_controller', ['$http','$scope','$filter','$location','$rootScope','$interval', function ($http,$scope,$filter,$location,$rootScope,$interval){


    $scope.load_dashboard=function(){

        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service+'/load_dashboard_data',
            dataType:'jsonp'
        }).success(function(data) {
            if(data[0][0].result=='Success'){
                $scope.dashboard_data=data[0];
                $scope.dashboard_data_history=data[1];
                $scope.dashboard_data.forEach(function(row){
                    row.histroy=[];
                    $scope.dashboard_data_history.forEach(function(d){
                        if((row.upload_id == d.upload_id ) && (row.file_id == d.file_id)){
                            row.histroy.push(d);
                        }
                    })

                });

                var que_types= _.groupBy($scope.dashboard_data, function (elemet) {
                    return elemet.micro_process_id;
                });

                $scope.files_in_each_micro_process=[];
                var i=0;
                $scope.array_micro_process=[];
                for (var key in que_types) {


                    var no_of_files=que_types[key].length;
                    var perc=( +no_of_files / +$scope.dashboard_data.length)*100;
                    var data={
                        micro_process_id:key,
                        micro_process_name:que_types[key][0].micro_process_name,
                        no_of_files:no_of_files,
                        percent:perc,
                        list_of_files:[]
                    };

                    que_types[key].forEach(function(row){
                        data.list_of_files.push(row) ;
                    });

                    $scope.files_in_each_micro_process.push(data);

                    if(i==0){
                        var d=  {
                            name: data.micro_process_name,
                            y: perc,
                            sliced: true,
                            selected: true
                        }
                        $scope.array_micro_process.push(d);
                    }
                    else
                    {
                        $scope.array_micro_process.push([data.micro_process_name,perc]);
                    }
                    i++
                }


                var process_types= _.groupBy($scope.dashboard_data, function (elemet) {
                    return elemet.sfs_UIN;
                });
                $scope.files_in_each_process=[];
                var i=0;
                $scope.array_process=[];
                for (var key in process_types) {


                    var no_of_files=process_types[key].length;
                    var perc=( +no_of_files / +$scope.dashboard_data.length)*100;
                    var data={
                        sfs_UIN:key,
                        hethi_subservicecode:process_types[key][0].hethi_subservicecode,
                        no_of_files:no_of_files,
                        percent:perc,
                        list_of_files:[]
                    };

                    process_types[key].forEach(function(row){
                        data.list_of_files.push(row) ;
                    });

                    $scope.files_in_each_process.push(data);


                    if(i==0){
                        var d=  {
                            name: data.hethi_subservicecode,
                            y: perc,
                            sliced: true,
                            selected: true
                        }
                        $scope.array_process.push(d);
                    }
                    else
                    {
                        $scope.array_process.push([data.hethi_subservicecode,perc]);
                    }
                    i++
                }

                var micro_process_diagData={
                    title:'File In Sub Process',
                    name:'Micro Process Shares',
                    data:$scope.array_micro_process
                };
                var diagData={
                    title:'FILE IN QUEUES',
                    name:'Process Shares',
                    data:$scope.array_process
                };

                $scope.generate_pie_diag(micro_process_diagData);
                $scope.generate_pie_3d_diag(diagData);
            }


        });
    };
    $scope.load_dashboard();
    $interval(function() {

        $scope.load_dashboard();

    }, 50000 );

    $scope.generate_pie_diag=function(data){

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
                text: data.title
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
                name: data.name,
                data: data.data
            }]
        });

    }
    $scope.generate_pie_3d_diag=function(data){
        $('#3dDonut').highcharts({
            chart: {
                type: 'pie',
                options3d: {
                    enabled: true,
                    alpha: 45
                }
            },
            title: {
                text: data.title
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
                name: data.name,
                data: data.data
            }]
        });

    }

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

        },{
            name: 'Oaas',
            data: [42.4, 33.2, 34.5, 39.7, 52.6, 75.5, 57.4, 60.4, 47.6, 39.1, 46.8, 51.1]

        }
        ]
    });


}]);
