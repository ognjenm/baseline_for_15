
'use strict';


hethi.controller('admin_home_controller', ['$http','$scope','$filter','$location','$rootScope','logger', function ($http,$scope,$filter,$location,$rootScope,logger){

    var init;
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
        //alert(JSON.stringify($scope.tempOffers));
        for(var key in $scope.tempOffers){
            //alert(JSON.stringify($scope.tempOffers[key]))
        }
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
            //alert(JSON.stringify($scope.tempOffers));
            for(var key in $scope.tempOffers){
                //alert(JSON.stringify(key))

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
    $rootScope.customerList=[];

    $scope.searchKeywordsIndexer = '';
    $scope.filteredCustomerList = [];
    $scope.rowIndexer = '';

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

    //$(".goo-collapsible > li > a").on("click", function(e){
    //
    //    if(!$(this).hasClass("active")) {
    //
    //        // hide any open menus and remove all other classes
    //        $(".goo-collapsible li ul").slideUp(350);
    //        $(".goo-collapsible li a").removeClass("active");
    //
    //        // open our new menu and add the open class
    //        $(this).next("ul").slideDown(350);
    //        $(this).addClass("active");
    //
    //    }else if($(this).hasClass("active")) {
    //
    //        $(this).removeClass("active");
    //        $(this).next("ul").slideUp(350);
    //    }
    //});

    $scope.selectIndexer = function(page) {
//        logger.log(page) ;

        var end=$scope.filteredCustomerList.length, start=0;
        //start = (page - 1) * $scope.numPerPageIndexer;
        //end = start + $scope.numPerPageIndexer;
        return $scope.currentPageCustomerList = $scope.filteredCustomerList.slice(start, end);
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
        $scope.filteredCustomerList = $filter('filter')($rootScope.customerList, $scope.searchKeywordsIndexer);
        return $scope.onFilterChangeIndexer();
    };
    $scope.orderIndexer = function(rowName) {
        if ($scope.rowIndexer === rowName) {
            return;
        }
        $scope.rowIndexer = rowName;
        $scope.filteredCustomerList = $filter('orderBy')($rootScope.customerList, rowName);
        return $scope.onOrderChangeIndexer();
    };
    $scope.numPerPageOptIndexer = [3, 5, 10, 20];
    $scope.numPerPageIndexer = $scope.numPerPageOptIndexer[1];
    $scope.currentPageIndexer = 1;
    $scope.filteredCustomerList = [];
    init = function() {
        $scope.searchIndexer();
        return $scope.selectIndexer($scope.currentPageIndexer);
    };

    //init();
    $http({
        method: 'POST',
        url: $rootScope.spring_rest_service+'/loadCustomerList',
        dataType:'jsonp'
    }).success(function(data) {
        if(data[0][0].result!="No Data") {
            $rootScope.customerList = data[0];
            init();
        }
    });
    $http({
        method: 'POST',
        url: $rootScope.spring_rest_service+'/load_ccore_services',
        dataType:'jsonp'
    }).success(function(data) {
        $rootScope.services=data[0];
        $rootScope.services.forEach(function(rows,i){
            $rootScope.services[i].status=false;
        });
    });

    $scope.selectbps=function(id){

        var isChecked=false;
        $rootScope.services.forEach(function(rows){
            isChecked=true
            if(rows.status){
                isChecked=true;

            }
        });
        if(isChecked) {
            $rootScope.selectedCustomerIndex = id;
            $rootScope.selectedCustomer = $scope.currentPageCustomerList[id];

            $location.path('/classify_selectbps');
        }else{
            logger.logError('Check Any Item...');
        }
    };

    $scope.selectbpsnew=function(){
        var isChecked=false;
        $rootScope.services.forEach(function(rows){
            isChecked=true;
            if(rows.status){
                isChecked=true;
            }
            $scope.load_admin_task_list_new();
        });
        /*if(isChecked) {

            $scope.load_admin_task_list_new();
        }else{
            logger.logError('Check Any Item...');
        }*/
    };
    $scope.servicePlays_grouped =[];
    $scope.load_admin_task_list_new=function(){
        var input={
            'customer_id':1
        };
        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service+'/load_ccore_serviceplays',
            dataType:'jsonp',
            data: input
        }).success(function(data) {
            $rootScope.servicePlays=data[0];
            /*alert(JSON.stringify($rootScope.servicePlays))*/
            $scope.tempOffers=[];
            $scope.servicePlays_grouped = _.groupBy($rootScope.servicePlays, function (elemet) {

                return elemet.hethi_servicecode;
            });
            $scope.tempOffers=$scope.servicePlays_grouped;

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

    $scope.saveoffers=function(forms){
        console.log(JSON.stringify(forms))
        var jsonData=[];
        var offername=forms.newOfferName;
        alert(offername);
        for(var key in $scope.servicePlays_grouped){

            $scope.servicePlays_grouped[key].forEach(function(rows){
                if(rows.status){
                    jsonData.push({"sfs_UIN":rows.sfs_UIN});
                    rows.status=false;
                }
            });

        };
        var x2js =new X2JS();
        var xml=x2js.json2xml_str({"root":{"data":jsonData}});
        alert(xml);

        var input={
            offerxml:xml,name:offername,user_id:1
        };
        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service+'/hethi_offer_serviceplays',
            dataType:'jsonp',
            data: input
        }).success(function(res){
           // $scope.loadoffer();

            logger.log(JSON.stringify("Offer Successfully Save"));
            $scope.selectbps();
            $scope.load_admin_task_list_new();
            alert(res)
        })
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
//    **************************************


}]);