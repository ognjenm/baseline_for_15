/**
 * Created by shebeen on 10/21/2015.
 */

'use strict';


hethi.controller('artist_data_controller', ['$http','$scope','$filter','$location','$rootScope', function ($http,$scope,$filter,$location,$rootScope){

 $scope.dataa= {artistdata:
      [
          {"cname":"John" ,"BPS": "Hethi service","Industry":"Finance","Type":"Medium" },
          {"cname":"Anna" ,"BPS":"Daas","Industry":"Hospital","Type":"Large"},
          {"cname":"Peter","BPS":"Inaas","Industry":"Manufacturing","Type":"Medium"}]
  }

    $http({
        method: 'POST',
        url: $rootScope.spring_rest_service+'/loadCustomerList',
        dataType:'jsonp'
    }).success(function(data) {
        $scope.customerList=data[0];
        init();
    });
}]);