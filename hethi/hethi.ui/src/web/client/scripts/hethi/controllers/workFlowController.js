'use strict';

hethi.controller('workFlowController',['$http','$scope','$location','$rootScope', function($http,$scope,$location,$rootScope){

    $rootScope.hidef="";

    $rootScope.taskColor='taskColor';
    $rootScope.RegisterColor='';
    $rootScope.abtcolor='';
    $rootScope.AdminColor='';

//    Accordion


    $scope.oneAtATime = true;
    $scope.status = {
        isFirstOpen: true,
        isFirstOpen1: true,
        isFirstOpen2: true,
        isFirstOpen3: true,
        isFirstOpen4: true,
        isFirstOpen5: true,
        isFirstOpen6: true
    };

    $scope.hideCareer=false;
    $scope.showCareer=function(row){
        $scope.hideCareer=true;
    };
    $scope.careerHide=function(row){
        $scope.hideCareer=false;
    };

}]);
