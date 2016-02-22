'use strict';


hethi.controller('taskListController', ['$http','$scope','$filter','$location','$rootScope','logger', function ($http,$scope,$filter,$location,$rootScope,logger){
//      logger.log("sfgdsfg");
    $scope.viewContent=function(indexer,index){
        $rootScope.uid=indexer.uid;
        $rootScope.din=indexer.din;
        $rootScope.index_value=index;
        var input={
            din:indexer.din
        };
        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service+'/search_efsuin_for_din',
            dataType:'jsonp',
            data:input
        }).success(function(data) {
            $rootScope.datas=data;
            $rootScope.efs_uin_a=data;
            $rootScope.document_type=indexer.document_type;
            $location.path('/content_workflow');

        });

    };

    /*$scope.viewContentException=function(indexer,index){
        $rootScope.uid=indexer.uid;
        $rootScope.din=indexer.din;
        $rootScope.index_value=index;
        var input={
            din:indexer.din
        };
        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service+'/search_efsuin_for_din',
            dataType:'jsonp',
            data:input
        }).success(function(data) {
            $rootScope.datas=data;
            $rootScope.efs_uin_a=data;
            $rootScope.document_type=indexer.document_type;
            $location.path('/exception_workflow');

        });

    };*/
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














}]).controller('service_level_Controller', ['$http','$scope','$filter','$location','$rootScope', function ($http,$scope,$filter,$location,$rootScope){
//      logger.log("sfgdsfg");

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

    $scope.exportData = function () {
        alasql('SELECT * INTO XLSX("export.xlsx",{headers:true}) FROM ?',[$scope.storesIndexer]);
    };
    $scope.exportCSV=function(){
        alasql("SELECT * INTO CSV('mydata.csv', {headers:true}) FROM ?",[$scope.storesIndexer]);
    };
    $scope.exportPDF=function(){
        alasql("SELECT * INTO PDF('mydata1.pdf', {headers:true}) FROM ?",[$scope.storesIndexer]);
    };

    $scope.menuItems = [
        { menu_name: 'Business Demography',isActive: ' '},
        { menu_name: 'Configure Data Service',isActive: ''},
        { menu_name: 'Customise Workflows',isActive: ''},
        { menu_name: 'Define Output',isActive: ''},
        { menu_name: 'Define ERP Integration',isActive: ''},
        { menu_name: 'Define Analytics',isActive: ''},
        { menu_name: 'Define Storage',isActive: ''},
        { menu_name: 'Service level agreement',isActive: 'btn-success '}
        ];

    $scope.storesIndexer = [
        {
            data_process: 'HCFA S',
            incoming_channel: 'email',
            input_format: 'pdf scanned',
            output_content: 'ANSI',
            output_channel:'SFTP',
            volume:'2000',
            TAT:'24 Hours',
            quality_base:'form',
            permisible_QA:'99.3'
        },
        {
            data_process: 'HCFA S + EOB',
            incoming_channel: 'fax',
            input_format: 'Tif',
            output_content: 'ANSI',
            output_channel:'SFTP',
            volume:'800',
            TAT:'24 Hours',
            quality_base:'form',
            permisible_QA:'95.3'
        },
        {
            data_process: 'UB M + EOB',
            incoming_channel: 'webupload',
            input_format: 'pdf search',
            output_content: 'ANSI',
            output_channel:'ERP',
            volume:'2000',
            TAT:'12 Hours',
            quality_base:'form',
            permisible_QA:'99.9'
        }
    ];

    $scope.searchKeywordsIndexer = '';
    $scope.filteredStoresIndexer = [];
    $scope.rowIndexer = '';


    $scope.selectIndexer = function(page) {
//        logger.log(page) ;

        var end, start;
        start = (page - 1) * $scope.numPerPageIndexer;
        end = start + $scope.numPerPageIndexer;
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

    return init();

//    **************************************


//Task list Export to excel














}]).controller('define_storage_Controller', ['$http','$scope','$filter','$location','$rootScope', function ($http,$scope,$filter,$location,$rootScope){

    $scope.menuItems = [
        { menu_name: 'Business Demography',isActive: ' '},
        { menu_name: 'Configure Data Service',isActive: ''},
        { menu_name: 'Customise Workflows',isActive: ''},
        { menu_name: 'Define Output',isActive: ''},
        { menu_name: 'Define ERP Integration',isActive: ''},
        { menu_name: 'Define Analytics',isActive: ''},
        { menu_name: 'Define Storage',isActive: 'btn-success '},
        { menu_name: 'Service level agreement',isActive: ''}
    ];


}]).controller('configure_data_serviceController', ['$http','$scope','$filter','$location','$rootScope', function ($http,$scope,$filter,$location,$rootScope){

    $scope.menuItems = [
        { menu_name: 'Business Demography',isActive: ' '},
        { menu_name: 'Configure Data Service',isActive: 'btn-success'},
        { menu_name: 'Customise Workflows',isActive: ''},
        { menu_name: 'Define Output',isActive: ''},
        { menu_name: 'Define ERP Integration',isActive: ''},
        { menu_name: 'Define Analytics',isActive: ''},
        { menu_name: 'Define Storage',isActive: ' '},
        { menu_name: 'Service level agreement',isActive: ''}
    ];

}]).controller('customize_workflows_serviceController', ['$http','$scope','$filter','$location','$rootScope', function ($http,$scope,$filter,$location,$rootScope){

    $scope.menuItems = [
        { menu_name: 'Business Demography',isActive: ' '},
        { menu_name: 'Configure Data Service',isActive: ''},
        { menu_name: 'Customise Workflows',isActive: 'btn-success'},
        { menu_name: 'Define Output',isActive: ''},
        { menu_name: 'Define ERP Integration',isActive: ''},
        { menu_name: 'Define Analytics',isActive: ''},
        { menu_name: 'Define Storage',isActive: ' '},
        { menu_name: 'Service level agreement',isActive: ''}
    ];

}]).controller('define_analytics_serviceController', ['$http','$scope','$filter','$location','$rootScope', function ($http,$scope,$filter,$location,$rootScope){

    $scope.menuItems = [
        { menu_name: 'Business Demography',isActive: ' '},
        { menu_name: 'Configure Data Service',isActive: ''},
        { menu_name: 'Customise Workflows',isActive: ''},
        { menu_name: 'Define Output',isActive: ''},
        { menu_name: 'Define ERP Integration',isActive: ''},
        { menu_name: 'Define Analytics',isActive: 'btn-success'},
        { menu_name: 'Define Storage',isActive: ' '},
        { menu_name: 'Service level agreement',isActive: ''}
    ];

}]).controller('define_output_serviceController', ['$http','$scope','$filter','$location','$rootScope', function ($http,$scope,$filter,$location,$rootScope){

    $scope.menuItems = [
        { menu_name: 'Business Demography',isActive: ' '},
        { menu_name: 'Configure Data Service',isActive: ''},
        { menu_name: 'Customise Workflows',isActive: ''},
        { menu_name: 'Define Output',isActive: 'btn-success'},
        { menu_name: 'Define ERP Integration',isActive: ''},
        { menu_name: 'Define Analytics',isActive: ''},
        { menu_name: 'Define Storage',isActive: ' '},
        { menu_name: 'Service level agreement',isActive: ''}
    ];

}]).controller('erp_integration_serviceController', ['$http','$scope','$filter','$location','$rootScope', function ($http,$scope,$filter,$location,$rootScope){

    $scope.menuItems = [
        { menu_name: 'Business Demography',isActive: ' '},
        { menu_name: 'Configure Data Service',isActive: ''},
        { menu_name: 'Customise Workflows',isActive: ''},
        { menu_name: 'Define Output',isActive: ''},
        { menu_name: 'Define ERP Integration',isActive: 'btn-success'},
        { menu_name: 'Define Analytics',isActive: ''},
        { menu_name: 'Define Storage',isActive: ' '},
        { menu_name: 'Service level agreement',isActive: ''}
    ];


    $scope.storesIndexer = [
        {
            ServiceBundle: 'HCFA S',
            DaaS: 'Y',
            BaaS: 'Y',
            OaaS: 'N',
            InaaS:'Y',
            AaaS:'Y',
            StaaS:'Y'
        },
        {
            ServiceBundle: 'HCFA S + EOB',
            DaaS: 'Y',
            BaaS: 'Y',
            OaaS: 'N',
            InaaS:'Y',
            AaaS:'Y',
            StaaS:'Y'
        },
        {
            ServiceBundle: 'UB M + EOB',
            DaaS: 'Y',
            BaaS: 'Y',
            OaaS: 'N',
            InaaS:'Y',
            AaaS:'Y',
            StaaS:'Y'
        }


    ];

    $scope.searchKeywordsIndexer = '';
    $scope.filteredStoresIndexer = [];
    $scope.rowIndexer = '';


    $scope.selectIndexer = function(page) {
//        logger.log(page) ;
        var end, start;
        start = (page - 1) * $scope.numPerPageIndexer;
        end = start + $scope.numPerPageIndexer;
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
    var init = function() {
        $scope.searchIndexer();
        return $scope.selectIndexer($scope.currentPageIndexer);
    };

    return init();

}])

.directive('toggle', function(){
    return {
        restrict: 'A',
        link: function(scope, element, attrs){
            if (attrs.toggle=="tooltip"){
                $(element).tooltip();
            }
            if (attrs.toggle=="popover"){
                $(element).popover();
            }
        }
    };
});