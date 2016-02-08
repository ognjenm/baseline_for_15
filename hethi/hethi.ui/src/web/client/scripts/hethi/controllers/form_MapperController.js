// <copyright file="form_MapperController.js" company="hethi">
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
hethi.controller('form_MapperController', ['$http','$scope','$filter','$location','$rootScope', function ($http,$scope,$filter,$location,$rootScope){


$scope.uVideo=[
    {
        url:"http://www.w3schools.com/html/mov_bbb.mp4"
    },
    {
        url:"http://www.w3schools.com/html/mov_bbb.mp4"
    }
];

    //logger.log("form Mapper Opens");

    $scope.UploadImage=function(files){

        var fd = new FormData();
        fd.append("file", files[0]);
        $http.post("/imageUpload",fd,{transformRequest:angular.identity,headers:{"Content-Type":undefined}}).success(function(res) {
            //logger.log(JSON.stringify(res));
            if(res.status=="complete"){
                var documentpath=res.url;
                //logger.log(JSON.stringify($rootScope.loginedUserData));
                var input={
                    'documentpath':documentpath,
                    'userid':$rootScope.loginedUserData.user_id,
                    'file_name':res.file_name,
                    'file_type':res.file_type,
                    'file_size':res.file_size
                };


                $http({
                    method: 'POST',
                    url: $rootScope.spring_rest_service+'/save_doc',
                    dataType:'jsonp',
                    data: input
                }).success(function(data) {

                    logger.log(JSON.stringify(data))
                });
            }
            else{

            }



        });
     };
    $scope.uploadFile = function() {
        var fd = new FormData();
        //Take the first selected file
        fd.append("file", $scope.filavalue);

        $http.post('/upload', fd, {
            withCredentials: true,
            headers: {'Content-Type': undefined },
            transformRequest: angular.identity
        }).success(function(data){
            logger.log('...all right!... ');
            }
        ).error( function(data){
                logger.log('...not right!... ');
            } );

    };
    $rootScope.hidef="";
    $scope.uploadFileToHethi=function() {
        var formData = new FormData();
        formData.append("file", file.files[0]);
        $http.post('/upload', formData, {
            transformRequest: function (data, headersGetterFunction) {
                return data;
            },
            headers: {'Content-Type': undefined}
        }).success(function (data, status) {
            var lastIndex=window.location.href.lastIndexOf('/');
            var baseURL=window.location.href.substring(0,lastIndex)+"/";
            $rootScope.image=data.photo;
            $scope.document_id=data.person_id;
            //logger.log(data);
        }).error(function (data, status) {
            logger.log("Error ... " + status);
        });
    };
    $scope.IsVisible = false;
    $scope.ShowHide = function () {
        //If DIV is visible it will be hidden and vice versa.
        $scope.IsVisible = $scope.IsVisible ? false : true;
    };

    $scope.stencil=function(){
        $location.path('/content')
    };
    $scope.finish=function(){
        logger.log("Success")
    };
    $scope.wizardTab=1;
    $scope.selectWizard=function(step){
        $scope.wizardTab=step;
    };


    $(document).on('change', '.btn-file :file', function() {
        var input = $(this),
            numFiles = input.get(0).files ? input.get(0).files.length : 1,
            label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
        input.trigger('fileselect', [numFiles, label]);
    });

    $(document).ready( function() {
        $('.btn-file :file').on('fileselect', function(event, numFiles, label) {

            var input = $(this).parents('.input-group').find(':text'),
                log = numFiles > 1 ? numFiles + ' files selected' : label;

            if( input.length ) {
                input.val(log);
            } else {
                if( log ) logger.log(log);
            }

        });
    });


}]).directive('fileModel', ['$parse', function ($parse) {
    return {
        restrict: 'A',
        link: function(scope, element, attrs) {
            var model = $parse(attrs.fileModel);
            var modelSetter = model.assign;

            element.bind('change', function(){
                scope.$apply(function(){
                    modelSetter(scope, element[0].files[0]);
                });
            });
        }
    };
}]);

hethi.service('fileUpload', ['$http', function ($http) {
    this.uploadFileToUrl = function(file, uploadUrl){
        var fd = new FormData();
        fd.append('file', file);
        $http.post(uploadUrl, fd, {
            transformRequest: angular.identity,
            headers: {'Content-Type': undefined}
        })
            .success(function(){

            })
            .error(function(){
            });
    }
}]);

hethi.controller('myCtrl', ['$scope', 'fileUpload', function($scope, fileUpload){

    $scope.uploadFile = function(){
        var file = $scope.myFile;
        console.log('file is ' );
        console.dir(file);
        var uploadUrl = "/upload";
        fileUpload.uploadFileToUrl(file, uploadUrl);
    };

}]);