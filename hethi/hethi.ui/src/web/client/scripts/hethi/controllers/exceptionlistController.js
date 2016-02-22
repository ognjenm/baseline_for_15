'use strict';


hethi.controller('exceptionlistController', ['$http','$scope','$filter','$location','$rootScope','logger', function ($http,$scope,$filter,$location,$rootScope,logger){
//      logger.log("sfgdsfg");


    $scope.viewContentException=function(indexer,index){
        $rootScope.uid=indexer.uid;
        $rootScope.din=indexer.din;
        $rootScope.index_value=index;
        var input={
            din:indexer.din
        };
        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service+'/search_efsuin_for_din_exception',
            dataType:'jsonp',
            data:input
        }).success(function(data) {
            $rootScope.datas=data;
            $rootScope.efs_uin_a=data;
            $rootScope.document_type=indexer.document_type;
            $location.path('/exception_workflow');

        });

    };
    $rootScope.hidef="";

    $rootScope.QueueIn='active';
    $rootScope.QueueOut='';
    $rootScope.QueueHold='';
    $rootScope.QueueApproval='';
    $rootScope.QueueDelegation='';
    $rootScope.NewWorkItem='';


    //Task List View Pagination
    //    ****************************************************
    var init;
    $rootScope.storesIndexer = [];

    $scope.exportData = function () {
        alasql('SELECT * INTO XLSX("export.xlsx",{headers:true}) FROM ?',[$scope.storesIndexer]);
    };
    $scope.exportCSV=function(){
        alasql("SELECT * INTO CSV('mydata.csv', {headers:true}) FROM ?",[$scope.storesIndexer]);
    };
    $scope.exportPDF=function(){
        alasql("SELECT * INTO PDF('mydata1.pdf', {headers:true}) FROM ?",[$scope.storesIndexer]);
    };



    $scope.searchKeywordsIndexer = '';
    $scope.filteredStoresIndexer = [];
    $scope.rowIndexer = '';


    $scope.selectIndexer = function(page) {
//        logger.log(page) ;

        var start = (page - 1) * $scope.numPerPageIndexer;
        var end = start + $scope.numPerPageIndexer;
        return $scope.currentPageStoresIndexer = $scope.filteredStoresIndexer.slice(start, end);
    };
    $scope.onFilterChangeIndexer = function() {
        $scope.selectIndexer(1);
        $scope.currentPageIndexer = 1;
        return $scope.rowIndexer = '';
    };
    $scope.onNumPerPageChangeIndexer = function() {
        $scope.selectIndexer(1);
        return $scope.currentPageIndexer = 1;
    };
    $scope.onOrderChangeIndexer = function() {
        $scope.selectIndexer(1);
        return $scope.currentPageIndexer = 1;
    };
    $scope.searchIndexer = function() {
        $scope.filteredStoresIndexer = $filter('filter')($scope.storesIndexer, $scope.searchKeywordsIndexer);
        return $scope.onFilterChangeIndexer();
    };
    $scope.orderIndexer = function(rowName) {
        if ($scope.rowIndexer === rowName) {
            return;
        }
        $scope.rowIndexer = rowName;
        $scope.filteredStoresIndexer = $filter('orderBy')($scope.storesIndexer, rowName);
        return $scope.onOrderChangeIndexer();
    };
    $scope.numPerPageOptIndexer = [3, 5, 10, 20];
    $scope.numPerPageIndexer = $scope.numPerPageOptIndexer[1];
    $scope.currentPageIndexer = 1;
    $scope.currentPageStoresIndexer = [];
    init = function() {
        $scope.searchIndexer();
        return $scope.selectIndexer($scope.currentPageIndexer);
    };
    $http({
        method: 'POST',
        url: $rootScope.spring_rest_service+'/search_ixsd_data',
        dataType:'jsonp'
    }).success(function(data) {
        $rootScope.ixsd_form_data=(data[0]);
        $rootScope.user_details=(data[1]);
        data[0].forEach(function(respo){
            if($rootScope.storesIndexer.length>0){
                var flag=false;
                $rootScope.storesIndexer.forEach(function(rows){
                    if(respo.din==rows.din){
                        flag=true;
                    }
                });
                if(flag==false){
                    $rootScope.storesIndexer.push(respo);
                }
            }
            else{
                $rootScope.storesIndexer.push(respo);
            }
        });
        init();

    });

    return init();

//    **************************************


//Task list Export to excel














}]);