'use strict';

hethi.controller('workItemController',['$http','$scope','$location','$rootScope', function($http,$scope,$location,$rootScope){

    $rootScope.hidef="";

    $rootScope.QueueIn='';
    $rootScope.QueueOut='';
    $rootScope.QueueHold='';
    $rootScope.QueueApproval='';
    $rootScope.QueueDelegation='';
    $rootScope.NewWorkItem='active';

    $rootScope.taskColor='taskColor';
    $rootScope.RegisterColor='';
    $rootScope.abtcolor='';
    $rootScope.AdminColor='';

//    logger.log("work Item Controller Opens")
    $scope.UploadTab=1;
    $scope.selectAttachment=function(step){
        $scope.UploadTab=step;
    };


}]);
