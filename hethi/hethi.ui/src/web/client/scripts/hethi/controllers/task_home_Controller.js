'use strict';


hethi.controller('task_home_Controller', ['$http','$scope','$rootScope','$location', function ($http,$scope,$rootScope,$location){

    $scope.clientTabList={};
    if($rootScope.clientTab==undefined){
        $rootScope.clientTab='extract';
        $scope.clientTabList={};
        $scope.clientTabList.dashboard='active';
    };
    $scope.setActiveClientTab=function(tab){
        $scope.clientTabList={};
        $scope.clientTabList[tab]='active';
    };

    $rootScope.selectClientTab=function(tab){
        $rootScope.clientTab=tab;
        $scope.setActiveClientTab(tab);
    };
    $rootScope.loadCompletedDocs=function(){
        var input={
            'buyerid':$rootScope.loginedUserData.buyerid,
            'status':"11"
        };
        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service+'/load_document',
            dataType:'jsonp',
            data: input
        }).success(function(data) {
            if (data[0][0].result == "Success"){
                $scope.stencilingCompletedList=data[0];
            }
            else{
                $scope.stencilingCompletedList=false;
            }
        });
    };

    $rootScope.loadCompletedDocs();
    $rootScope.showDocumentPreview=function(file){
        $rootScope.generatePreview(file.documentid);
        $location.path('Preview');
    };

}]);
