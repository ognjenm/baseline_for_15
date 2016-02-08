hethi.controller('delegationController', ['$http','$scope','$filter','$location','$rootScope', function ($http,$scope,$filter,$location,$rootScope){

    $rootScope.hidef="";
    $rootScope.AdminColor='AdminTaskColor';
    $rootScope.RegisterColor='';
    $rootScope.abtcolor='';
    $rootScope.taskColor='';

    //
    $rootScope.QueueIn='';
    $rootScope.QueueOut='';
    $rootScope.QueueHold='';
    $rootScope.QueueApproval='';
    $rootScope.QueueDelegation='active';
    $rootScope.NewWorkItem='';


    $scope.DelegationRole = [
        {
          items:'SubstituteTask'
        },
        {
           items:'Transfer Task'
        }
    ];
    $scope.saveAction=function(){
        logger.log("hia")
    }
    var init;
    $scope.stores = [
        {
            Name: 'Harison',
            Email: 'harison@gmail.com',
            DomainName:'adminmanager.com',
            DelegatedRoles:'Complete Task',
            description: 'Description',
            LoginName:'DaividHU'

        }, {
            Name: 'Mark',
            Email: 'mark@gmail.com',
            DomainName:'adminmanager.com',
            DelegatedRoles:'Complete Task',
            description: 'Description',
            LoginName:'MarkWM'
        }, {
            Name: 'john',
            Email: 'john@gmail.com',
            DomainName:'adminmanager.com',
            DelegatedRoles:'Complete Task',
            description: 'Description',
            LoginName:'johnHD'
        }, {
            Name: 'Jacob',
            Email: 'jacob@gmail.com',
            DomainName:'adminmanager.com',
            DelegatedRoles:'Complete Task',
            description: 'Description',
            LoginName:'jacobKM'
        }
    ];
    $scope.searchKeywords = '';
    $scope.filteredStores = [];
    $scope.row = '';


    $scope.select = function(page) {
//        logger.log(page) ;

        var end, start;
        start = (page - 1) * $scope.numPerPage;
        end = start + $scope.numPerPage;
        return $scope.currentPageStores = $scope.filteredStores.slice(start, end);
    };
    $scope.onFilterChange = function() {
        $scope.select(1);
        $scope.currentPage = 1;
        return $scope.row = '';
    };
    $scope.onNumPerPageChange = function() {
        $scope.select(1);
        return $scope.currentPage = 1;
    };
    $scope.onOrderChange = function() {
        $scope.select(1);
        return $scope.currentPage = 1;
    };
    $scope.search = function() {
        $scope.filteredStores = $filter('filter')($scope.stores, $scope.searchKeywords);
        return $scope.onFilterChange();
    };
    $scope.order = function(rowName) {
        if ($scope.row === rowName) {
            return;
        }
        $scope.row = rowName;
        $scope.filteredStores = $filter('orderBy')($scope.stores, rowName);
        return $scope.onOrderChange();
    };
    $scope.numPerPageOpt = [3, 5, 10, 20];
    $scope.numPerPage = $scope.numPerPageOpt[1];
    $scope.currentPage = 1;
    $scope.currentPageStores = [];
    init = function() {
        $scope.search();
        return $scope.select($scope.currentPage);
    };
    return init();



}]);
