'use strict';

hethi.controller('registrationController', ['$http','$scope','$store','$location','$rootScope', function ($http,$scope,$store,$location,$rootScope){
    $rootScope.hidef="";

    $rootScope.RegisterColor='registrationClass';
    $rootScope.abtcolor='';
    $rootScope.taskColor='';
    $rootScope.AdminColor='';

    $rootScope.back=false;
    $rootScope.finish=false;
    $rootScope.continue=true;

    $scope.menuTab=1;
    $scope.selectMenuTab=function(step){
        $scope.menuTab=step;
        if($scope.menuTab == 1){
            $rootScope.back=false;
            $rootScope.continue=true;
            $rootScope.finish=false;
        }
        else if($scope.menuTab == 2){
            $rootScope.back=true;
            $rootScope.continue=true;
            $rootScope.finish=false;
        }
        else if($scope.menuTab == 3){
            $rootScope.back=true;
            $rootScope.continue=true;
            $rootScope.finish=false;
        }
        else if($scope.menuTab == 4){
            $rootScope.back=true;
            $rootScope.continue=false;
            $rootScope.finish=true;
        }
    };
    $scope.backBtn=function(){
        $scope.menuTab=$scope.menuTab - 1;
        $scope.selectMenuTab($scope.menuTab)
    };
    $scope.continueBtn=function(){
        $scope.menuTab=$scope.menuTab + 1;
        $scope.selectMenuTab($scope.menuTab)
    };



    //    Local Storage
    $store.bind($scope, 'username');


    $store.bind($scope, 'email');
    $store.bind($scope, 'companyname');
    $store.bind($scope, 'phonenumber');
    $store.bind($scope, 'address');
    $store.bind($scope, 'city');
    $store.bind($scope, 'country');
    $store.bind($scope, 'remarks');
    $store.bind($scope, 'cardHolderName');
    $scope.clearTest = function(){

        $store.remove('username');
        $store.remove('email');
        $store.remove('companyname');
        $store.remove('phonenumber');
        $store.remove('address');
        $store.remove('city');
        $store.remove('country');
        $store.remove('remarks');
        $store.remove('cardHolderName');
        $scope.username='';
        $scope.email='';
        $scope.companyname='';
        $scope.phonenumber='';
        $scope.address='';
        $scope.city='';
        $scope.country='';
        $scope.remarks='';
        $scope.cardHolderName='';

    };








}]);

