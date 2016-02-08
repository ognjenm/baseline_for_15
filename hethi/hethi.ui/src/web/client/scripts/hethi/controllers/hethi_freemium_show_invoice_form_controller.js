'use strict';


hethi.controller('hethi_freemium_show_invoice_form_controller', ['$http','$scope','$filter','$location','$rootScope','logger', function ($http,$scope,$filter,$location,$rootScope,logger) {

    if($rootScope.selectedBPS==undefined){$location.path('/freemium_package')}else {
        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });
        $scope.loadforms=function() {
            var input = {
                'Bpaas_id': $rootScope.selectedBPS.BpaaS_id,
                'efs_uin': $rootScope.selectedBPS.efs_uin,
                'customer_id': $rootScope.selectedCustomerData.customer_id
            };
            $http({
                method: 'POST',
                url: $rootScope.spring_rest_service + '/load_current_forms',
                dataType: 'jsonp',
                data: input
            }).success(function (data) {
                $rootScope.currentForms = [];
                if(data[0][0].result!="No Data") {
                    $rootScope.currentForms = data[0];
                }
            });

            $http({
                method: 'POST',
                url: $rootScope.spring_rest_service + '/load_all_forms',
                dataType: 'jsonp',
                data: input
            }).success(function (data) {
                $scope.allForms = data[0];
                $scope.poForms = [];
                $scope.nonpoForms = [];
                  if(data[0][0].result!="No Data") {
                      data[0].forEach(function (row) {
                          if (row.form_type == 'NONPO') {
                              $scope.nonpoForms.push(row);
                          } else {
                              $scope.poForms.push(row);
                          }
                      });
                  }
            });
        };
        $scope.loadforms();
    }
    $scope.selectForms=function(row,type){
        $(document).ready(function(){
            $('html, body').animate({
                scrollTop: $("#uploadform").offset().top -90
            }, 1000);
        });

        $scope.GoToHome=false;
        $scope.selectedForm=row;
        if(type=='PO'){
            $scope.nonpoForms.forEach(function (data) {
                data.class = false;
            });
            $scope.poForms.forEach(function (data) {
                if(data==row) {
                    data.class = !data.class;
                    if(data.class==true){
                        $scope.isSelected=true;
                    }else{
                        $scope.isSelected=false;
                    }
                }else{
                    data.class = false;
                }
            });
        }else{
            $scope.poForms.forEach(function (data) {
                data.class = false;
            });
            $scope.nonpoForms.forEach(function (data) {
                if(data==row) {
                    data.class = !data.class;
                    if(data.class==true){
                        $scope.isSelected=true;
                    }else{
                        $scope.isSelected=false;
                    }
                }else{
                    data.class = false;
                }
            });
        }
    };
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
                    'file_size':res.file_size,
                    'BpaaS_id':$scope.selectedForm.BpaaS_id,
                    'indus_id':$scope.selectedForm.indus_id,
                    'form_stencid':$scope.selectedForm.form_stencid,
                    'customer_id':$rootScope.loginedUserData.customer_id
                };


                $http({
                    method: 'POST',
                    url: $rootScope.spring_rest_service+'/upload_doc',
                    dataType:'jsonp',
                    data: input
                }).success(function(data) {
                    $scope.loadforms();
                    $scope.GoToHome=true;

                    //$location.path('/');
                    //logger.log(JSON.stringify(data))
                });
            }
            else{
                logger.log("File uploading failed... Please try again.")
            }



        });
    };
    $scope.ProceedCloudplayServices=function(){
        $location.path('/customer_cloud');
    }

}]);