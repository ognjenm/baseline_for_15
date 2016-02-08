hethi.controller('groupController', ['$http','$scope','$location','$rootScope', function ($http,$scope,$location,$rootScope){
     //logger.log("group starts");

    $rootScope.hidef="";
    $rootScope.AdminColor='AdminTaskColor';
    $rootScope.RegisterColor='';
    $rootScope.abtcolor='';
    $rootScope.taskColor='';
    $scope.User = [
        {
            UserName:'John David'
        },
        {
            UserName:'Mark Williams'
        }
    ];

}]);
