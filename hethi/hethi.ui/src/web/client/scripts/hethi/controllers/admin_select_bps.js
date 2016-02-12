
'use strict';


hethi.controller('admin_select_bps', ['$http','$scope','$filter','$location','$rootScope','logger', function ($http,$scope,$filter,$location,$rootScope,logger) {
    if($rootScope.selectedCustomer==undefined){$location.path('/free')}else{
    $scope.varSelectedCustomer=$rootScope.selectedCustomer;}



    $scope.servicePlays_tabs=new Array();
    $scope.servicePlays_tabs_summary=false;
    $scope.selectedArtist={user_name:"Select Artist"};
    $scope.setSelectedArtist = function (item) {
        $scope.selectedArtist = item;
    };

    $scope.findNextTab = function (i) {
          $scope.servicePlays_tabs[i]=false;
        if($scope.servicePlays_tabs_count==i) {
            $scope.servicePlays_tabs[i+1]=false;
        }
        else
        {
            $scope.servicePlays_tabs[i+1]=true;
        }
    };
    $scope.load_admin_task_list=function(){
        var input={
            'customer_id':$rootScope.selectedCustomer.customer_id
        };
        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service+'/load_ccore_serviceplays',
            dataType:'jsonp',
            data: input
        }).success(function(data) {
            $rootScope.servicePlays=data[0];
            $scope.servicePlays_grouped = _.groupBy($rootScope.servicePlays, function (elemet) {

                return elemet.hethi_servicecode;
            });




            var i=0;
            $rootScope.services.forEach(function(rows){
                if(!rows.status){
                    delete $scope.servicePlays_grouped[rows.master_service];
                }
                else{
                    if(i==0){
                        $scope.servicePlays_tabs[i]=true;
                    }
                    else{
                        $scope.servicePlays_tabs[i]=false;
                    }

                    i++;
                    $scope.servicePlays_tabs_count=i;

                };
            });
        });
    };
    $scope.load_artist_list=function(){
        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service+'/load_artist_list',
            dataType:'jsonp'
        }).success(function(data) {
            //logger.log(JSON.stringify(data));
            $scope.artistData=data[0];
        });
    };
    $scope.load_admin_task_list();
    $scope.load_artist_list();
    $scope.assignClick=function(){
    var jsonData=[];

    for(var key in $scope.servicePlays_grouped){

        $scope.servicePlays_grouped[key].forEach(function(rows){
           if(rows.status){
               jsonData.push({"sfs_UIN":rows.sfs_UIN});
           }
        });

    };
    var x2js =new X2JS();
    var xml=x2js.json2xml_str({"root":{"data":jsonData}});
    var input={
        'customer_id': $rootScope.loginedUserData.customer_id,
        'user_id':$rootScope.selectedCustomer.customer_id,
        'efs_uin':$rootScope.selectedCustomer.efs_uin,
        'sfs_data': xml
    };

    $http({
        method: 'POST',
        url: $rootScope.spring_rest_service+'/save_customer_serviceplay',
        dataType:'jsonp',
        data: input
    }).success(function(data) {
        $location.path('/');
        $scope.assingnToQa();
    });

};
    $scope.assingnToQa=function(){

        if($scope.selectedArtist.user_id!=undefined){

            $rootScope.selectedBArtist=$scope.selectedArtist;
            var input={
                'customer_id': $rootScope.loginedUserData.customer_id,
                'user_id':$rootScope.selectedCustomer.customer_id,
                'upload_id':$rootScope.selectedCustomer.upload_id,
                'artist_id': $rootScope.selectedBArtist.user_id
            };

            $http({
                method: 'POST',
                url: $rootScope.spring_rest_service+'/assign_to_artist',
                dataType:'jsonp',
                data: input
            }).success(function(data) {
                $scope.load_admin_task_list();
                $location.path('/thankyoubusinessadmin');
            });
        }
        else{
            logger.logError('please select a artist to assign');
        }
    };
    $scope.goToInbox=function(){
        $location.path('/');
    };

    $scope.loadoffer=function(){
        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service+'/load_offer_serviceplay',
            dataType:'jsonp'

        }).success(function(data){
            $scope.offerlist=data[0];
            $scope.offerdetails=data[1];

        })
    };

    $scope.loadoffer();

    $scope.selectData=function(offerName){
        $scope.details= _.groupBy($scope.offerdetails,function(element){
            return element.offer_name;
        });

        $scope.searchOfferDetails=[];
        for(var key in $scope.details){
            if(key==offerName.offer_name){
                $scope.tempOffers= _.groupBy($scope.details[key],function(element){
                    return element.hethi_servicecode;
                });
                break;
            }
        }

        for(var key in $scope.tempOffers){
            $scope.tempOffers[key].forEach(function(res){
                res['status']=true;
            })
        }
        //for(var key in $scope.tempOffers){
            //alert(JSON.stringify($scope.tempOffers[key]))
        //}
        //$scope.servicePlays_grouped=[];
        var input={
            'customer_id':1
        };
        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service+'/load_ccore_serviceplays',
            dataType:'jsonp',
            data: input
        }).success(function(data) {
            $rootScope.servicePlays = data[0];

            $scope.servicePlays_grouped = _.groupBy($rootScope.servicePlays, function (elemet) {
                return elemet.hethi_servicecode;
            });
            for(var key in $scope.tempOffers){

                for(var key1 in $scope.servicePlays_grouped){
                    if(key==key1){
                        $scope.tempOffers[key].forEach(function(ele){
                            $scope.servicePlays_grouped[key1].forEach(function(row){
                                if(ele.hethi_subservicecode==row.hethi_subservicecode){
                                    row.status=true;
                                }
                                else{
                                    row.status=false;
                                }
                            })
                        })
                    }
                }
            }
        });


        //$scope.servicePlays_grouped=$scope.tempOffers;

    };
    $scope.$watch(
        'offerName',
        function ( newValue, oldValue ) {
            if(angular.isObject(newValue)){
                $scope.selectData(newValue)
            }
        }
    );
}]);