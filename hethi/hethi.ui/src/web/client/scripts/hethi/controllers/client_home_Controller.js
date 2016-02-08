'use strict';


hethi.controller('client_home_Controller', ['$http','$scope','$rootScope','$location', function ($http,$scope,$rootScope,$location){

$scope.colapsehide=function(){
  $scope.hide_col="col-md-11";
    $scope.side_col="col-md-1";
};
    $scope.clientTabList={};
    if($rootScope.clientTab==undefined){
        $rootScope.clientTab='dashboard';
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
    if($rootScope.loginedUserData!=undefined)
        var input={
            'customer_id':$rootScope.loginedUserData.customer_id
        };
        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service+'/stencilservices/list_all_documents',
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
        $rootScope.generatePreview(file);
        $location.path('Preview');
    };

}]);
