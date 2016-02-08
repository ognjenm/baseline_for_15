// <copyright file="appHomeController.js" company="hethi">
// Copyright (c) 2014 All Right Reserved, http://hethi.com/
//
// This source is subject to the hethi Permissive License.
// Unauthorized copying of this file, via any medium is strictly prohibited
// Proprietary and confidential
// All other rights reserved.
//
// </copyright>
//
// <author>Santhosh Poothankurussi</author>
// <email>contact@cronyco.in</email>
// <date>2015-08-17</date>
// <summary>Contains Javascript methods for Routing CartController Functions </summary>

'use strict';
hethi.controller('signUpController', ['$http','$scope','$filter','$location','$rootScope','logger', function ($http,$scope,$filter,$location,$rootScope,logger){

//    logger.log("sign Up Opens");
    $scope.formMapper=function(){
        $location.path('/Form_Mapper')


    };
    $scope.signUpToHethi=function(signup){
        //logger.log(JSON.stringify(signup))
        var register_input={
            company:signup.company,
            email:signup.email,
            password:signup.password
        };
        var signIn_input={
            username:signup.email,
            password:signup.password
        };
        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service+'/register',
            dataType:'jsonp',
            data: register_input
        }).success(function(data) {
            $http({
                method: 'POST',
                url: $rootScope.spring_rest_service+'/signIn',
                dataType:'jsonp',
                data: signIn_input
            }).success(function(data) {
                if(data[0][0].result=="Success"){
                    logger.log("Successfully signed in");
                    var secret=JSON.stringify(data[0][0]);
                    $rootScope.createCookie('hethi_secret_key',secret,1);
                    $rootScope.checkCookie();
                    console.log("secret :"+secret);
                    $rootScope.isSigned=true;
                    $location.path('/Upload')
                }
                else{
                    logger.log("Invalid Username or Password");
                }

            });

        });
        //$location.path('/Upload')
    };

    $rootScope.hidef="hidden";

}]);
