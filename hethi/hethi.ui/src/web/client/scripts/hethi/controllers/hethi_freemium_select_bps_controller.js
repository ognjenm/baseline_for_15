'use strict';


hethi.controller('hethi_freemium_select_bps_controller', ['$http','$scope','$filter','$location','$rootScope', function ($http,$scope,$filter,$location,$rootScope) {

    $(document).ready(function () {
        $('[data-toggle="tooltip"]').tooltip();
    });
    if($rootScope.homepage_chooser==3){
        $rootScope.selectedCustomerData=$rootScope.loginedUserData;
    }
    var input={
        'customer_id':$rootScope.selectedCustomerData.customer_id
    };
    $http({
        method: 'POST',
        url: $rootScope.spring_rest_service+'/load_existing_bps',
        dataType:'jsonp',
        data: input
    }).success(function(data) {
        $scope.existingBPS=data[0];
    });

    $http({
        method: 'POST',
        url: $rootScope.spring_rest_service+'/load_all_bps',
        dataType:'jsonp',
        data: input
    }).success(function(data) {
        $scope.allBPS=data[0];
    });
    $scope.proceedExisting=function(row){
        row.Type="Existing";
        $rootScope.selectedBPS=row;
        $location.path('/showinvoiceform');
    };
}]);