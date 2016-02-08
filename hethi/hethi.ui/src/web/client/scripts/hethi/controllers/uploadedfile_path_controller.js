/**
 * Created by shebeen on 10/22/2015.
 */
/**
 * Created by shebeen on 10/21/2015.
 */

'use strict';


hethi.controller('uploadedfile_path_controller', ['$http','$scope','$filter','$location','$rootScope','logger', function ($http,$scope,$filter,$location,$rootScope,logger){













    //----------------------------------------------------------------------------------------------------------------------
    $rootScope.invtab='inventory';
    $rootScope.expense=false;

    $scope.dat= {pathdata:
        [
            {"paths":"C:\ab\abc" }]
    }

    $scope.lst =[]

    $rootScope.invtab='inventory';
    $rootScope.expense=false;
    $rootScope.selectTab=function(step){
        $rootScope.invtab=step;
        if(step=="inventory"){
            $rootScope.inventory=true;
            $rootScope.expense=false;
        }
        else if(step=="expense"){
            $rootScope.inventory=false;
            $rootScope.locale=true;
        }
    };

/*
    $http({
        method: 'POST',
        url: $rootScope.spring_rest_service+'/loadCustomerList',
        dataType:'jsonp'
    }).success(function(data) {
        $scope.customerList=data[0];
        init();
    });
*/
 var da= {"customer_id":"3" };



    $http({

        method: 'POST',
        url: $rootScope.spring_rest_service+'/load_customer_uploaded_forms',
        dataType:'jsonp',
        data:da
    }).success(function(data) {
        //logger.log($rootScope.cust_id);
        $scope.pathList=data[0];
        init();
    });

    $scope.allowDrop=function(ev)
    {
        ev.preventDefault();
    }

    $scope.drag=function(ev,index) {
        ev.dataTransfer.setData("text", ev.target.id);
        $scope.lst.push($scope.pathList[index]);
    }

    $scope.drop= function(ev) {
        logger.log(JSON.stringify($scope.lst));
        ev.preventDefault();
        var data = ev.dataTransfer.getData("text");

        ev.target.appendChild(document.getElementById(data));

    }

}]);