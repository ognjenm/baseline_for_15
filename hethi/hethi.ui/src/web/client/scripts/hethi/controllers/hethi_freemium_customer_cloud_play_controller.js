'use strict';


hethi.controller('hethi_freemium_customer_cloud_play_controller', ['$http','$scope','$filter','$location','$rootScope','logger', function ($http,$scope,$filter,$location,$rootScope,logger) {

    if($rootScope.selectedBPS==undefined){$location.path('/freemium_package')}else {
        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });
    }
    $http({
        method: 'POST',
        url: $rootScope.spring_rest_service+'/load_hethi_services',
        dataType:'jsonp',
        data:{'customer_id':$rootScope.selectedCustomerData.customer_id}
    }).success(function(data) {
        if(data[0][0].result!="No Data") {
            $scope.hethiServices = data[0];
            $scope.serviceBundle=[];
            $rootScope.currentForms.forEach(function(rows){
                var addRow={};
                addRow.Service_bundle=rows.form_type_decription_short;
                $scope.hethiServices.forEach(function(row){
                    if(row.ServiceStatus==0){
                        addRow[row.hethi_servicecode]=false;
                    }else{
                        addRow[row.hethi_servicecode]=true;
                    }
                    //addRow[row.hethi_servicecode]=row.ServiceStatus;
                });
                $scope.serviceBundle.push(addRow);
            });
        }
    });

    $scope.keys = function(obj){
        var keys=[];
        Object.keys(obj).forEach(function(k){
           if(k!=='$$hashKey'){
               keys.push(k);
           };
        });
        return keys;
        //return obj? Object.keys(obj) : [];
    };
    //$scope.selecteddataProcessType=$scope.currentForms[0];
    //$scope.selecteddataProcessTypeIndex=0;
    $scope.dataProcessTypeChanged=function(rows){
        $rootScope.currentForms.forEach(function(data,i){
            if(data==rows){
                $scope.selecteddataProcessTypeIndex=i;
            }
        });
        $scope.selecteddataProcessType=rows;
    };

    $scope.ProceedCloudplayServices=function(){
        $location.path('/customer_cloud');
    };
    $scope.menuItems = [
        { menu_name: 'Business Demography',isActive: 'btn-success'},
        { menu_name: 'Configure Data Service',isActive: ''},
        { menu_name: 'Customise Workflows',isActive: ''},
        { menu_name: 'Define Output',isActive: ''},
        { menu_name: 'Define ERP Integration',isActive: ''},
        { menu_name: 'Define Analytics',isActive: ''},
        { menu_name: 'Define Storage',isActive: ' '},
        { menu_name: 'Service level agreement',isActive: ''}
    ];
    $scope.weekdays = [
        { dayname: 'Sunday',value:0},
        { dayname: 'Monday',value:1},
        { dayname: 'Tuesday',value:2},
        { dayname: 'Wednesday',value:3},
        { dayname: 'Thursday',value:4},
        { dayname: 'Friday',value:5},
        { dayname: 'Saturday',value:6}
    ];
    $scope.startCustomizeBusinessProcess=function(){
        $location.path('/indexdemography');

    };
    $scope.BusinessDemographyTab='locale';
    $scope.BusinessDemographyActiveTab={locale:true};
    $scope.setBusinessDemographyTab=function(tab){
        $scope.BusinessDemographyTab=tab;
        $scope.BusinessDemographyActiveTab={};
        $scope.BusinessDemographyActiveTab[tab]=true;
    };
    $http({
        method: 'POST',
        url: $rootScope.spring_rest_service+'/load_clanguage',
        dataType:'jsonp'
    }).success(function(data) {
        if(data[0][0].result!="No Data") {
            $scope.clanguages = data[0];

        }
    });
    $http({
        method: 'POST',
        url: $rootScope.spring_rest_service+'/load_czone',
        dataType:'jsonp'
    }).success(function(data) {
        if(data[0][0].result!="No Data") {
            $scope.czones = data[0];
        }
    });
    $scope.fill_localeData_by_zone=function(locale){
        locale.country=locale.zone.zone_name;
        locale.currency_type=locale.zone.zone_currency_type;
    };
    $scope.save_locale_and_proceed=function(locale){
        var formData={
            'customer_id':$rootScope.selectedCustomerData.customer_id,
            'primary_doc_lang': locale.primary_doc_lang.language_id,
            'expected_doc_lang': locale.expected_doc_lang.language_id,
            'zone_id':locale.zone.zone_id,
            'user_id':$rootScope.loginedUserData.user_id
        };
        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service+'/save_dcustomer_locale',
            dataType:'jsonp',
            data:formData
        }).success(function(data) {
            if (data[0][0].result == "Success"){

                $scope.setBusinessDemographyTab('calendar');
            }
            else
            {
                logger.log('unable to save locale data, please try again');
                $scope.setBusinessDemographyTab('calendar');
            }
        });

    };

    //Shebeen-----------------------------------------------------------------
    $scope.save_calendar_and_proceed=function(calendar){
        var formData={
            'customer_id':$rootScope.selectedCustomerData.customer_id,
            'weekday_start':calendar.weekday_start.value,
            'weekday_end':calendar.weekday_end.value,
            'user_id':$rootScope.loginedUserData.user_id
        };
        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service+'/save_dcustomer_calendar',
            dataType:'jsonp',
            data:formData
        }).success(function(data) {
            if (data[0][0].result == "Success"){

                $scope.setBusinessDemographyTab('aspects');

            }
            else
            {
                logger.log('unable to save calendar data, please try again');
                $scope.setBusinessDemographyTab('aspects');
            }
        });

    };

    $scope.save_imageaspect_and_proceed=function(aspects){
        var formData={
            'customer_id':$rootScope.selectedCustomerData.customer_id,
            'layout':aspects.layout,
            'image_size':aspects.image_size,
            'standard_dpi':aspects.standard_dpi,
            'min_acceptable_dpi':aspects.min_acceptable_dpi,
            'avg_pages_form':aspects.avg_pages_form,
            'avg_pageds_form_bundle':aspects.avg_pageds_form_bundle,
            'total_form_fields':aspects.total_form_fields,
            'avg_character_fields':aspects.avg_character_fields,
            'avg_character_form':aspects.avg_character_form
        };
        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service+'/save_dcustomer_imageaspect',
            dataType:'jsonp',
            data:formData
        }).success(function(data) {
            if (data[0][0].result == "Success"){
                $scope.setBusinessDemographyTab('volume');
            }
            else
            {
                logger.log('unable to save imageaspect data, please try again');
                $scope.setBusinessDemographyTab('volume');
            }
        });

    };


      $scope.save_volumeaspects_and_proceed=function(volume){
        var formData={
            'customer_id':$rootScope.selectedCustomerData.customer_id,
            // 'layout':aspects.layout,
            'daily_volume':volume.daily_volume,
            'weekly_volume':volume.weekly_volume,
            'monthly_volume':volume.monthly_volume,
            'high_volume_days':volume.high_volume_days,
            'user_id':$rootScope.loginedUserData.user_id
        };
        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service+'/save_dcustomer_volumeaspect',
            dataType:'jsonp',
            data:formData
        }).success(function(data) {
            if (data[0][0].result == "Success"){
                $scope.setBusinessDemographyTab('delivery');
            }
            else
            {
                logger.log('unable to save calendar data, please try again');
                $scope.setBusinessDemographyTab('delivery');
            }
        });

    };
   $rootScope.dummyval=1;
    $scope.save_volumeaspects_and_proceed=function(volume){
        var formData={
            'customer_id':$rootScope.selectedCustomerData.customer_id,
            'tfs_uin':$rootScope.dummyval,
            // 'layout':aspects.layout,
            'daily_volume':volume.daily_volume,
            'weekly_volume':volume.weekly_volume,
            'monthly_volume':volume.monthly_volume,
            'high_volume_day_sunday':volume.high_volume_day_sunday,
            'high_volume_day_monday':volume.high_volume_day_monday,
            'high_volume_day_tuesday':volume.high_volume_day_tuesday,
            'high_volume_day_wednesday':volume.high_volume_day_wednesday,
            'high_volume_day_thursday':volume.high_volume_day_thursday,
            'high_volume_day_friday': volume.high_volume_day_friday,
            'high_volume_day_saturday':volume.high_volume_day_saturday,
            'lastupuser':$rootScope.loginedUserData.user_id
        };
        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service+'/save_dcustomer_volumeaspect',
            dataType:'jsonp',
            data:formData
        }).success(function(data) {
            if (data[0][0].result == "Success"){
                logger.log('success');
                $scope.setBusinessDemographyTab('delivery');
            }
            else
            {
                logger.log('unable to save calendar data, please try again');
                $scope.setBusinessDemographyTab('delivery');
            }
        });

    };

    $rootScope.dummyval=1;
    $scope.save_deliveryaspects_and_proceed=function(delivery){
        var formData={
            'customer_id':$rootScope.selectedCustomerData.customer_id,
            'tfs_uin':$rootScope.dummyval,
            'max_shipment_file_size':delivery.max_shipment_file_size,
            'max_shipment_file_record_nos':delivery.max_shipment_file_record_nos,
            'min_shipment_record_size_nos':delivery.min_shipment_record_size_nos,
            'max_shipment_image_size':delivery.max_shipment_image_size,
            'max_shipment_image_record_nos':delivery.max_shipment_image_record_nos,
            'customer_shipment_cutoff':delivery.customer_shipment_cutoff,
            'shipment_freq':delivery.shipment_freq,
            'shipment_start_time':delivery.shipment_start_time,
            'shipment_end_time':delivery.shipment_end_time,
            'lastupuser':$rootScope.loginedUserData.user_id
        };
        logger.log(JSON.stringify(formData));
        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service+'/save_dcustomer_deliveryaspect',
            dataType:'jsonp',
            data:formData
        }).success(function(data) {
            if (data[0][0].result == "Success"){
                logger.log('success');
                $scope.setBusinessDemographyTab('delivery');
            }
            else
            {
                logger.log('unable to save calendar data, please try again');
                $scope.setBusinessDemographyTab('delivery');
            }
        });

    };


    $rootScope.dummyval=1;
    $scope.save_complianceaspects_and_proceed=function(compliance){
      // logger.log('test');
         var formData = {
             'customer_id': $rootScope.selectedCustomerData.customer_id,
             'tfs_uin': $rootScope.dummyval,
             'industry_compliance': compliance.industry_compliance,
             'information_security': compliance.information_security,
             'data_shipment_file_name': compliance.data_shipment_file_name,
             'customer_din_format': compliance.customer_din_format,
             'hethi_din_format': compliance.hethi_din_format,
             'data_archival_period': compliance.data_archival_period,
             'image_archival_period': compliance.image_archival_period,
             'data_retention_period': compliance.data_retention_period,
             'image_retention_period': compliance.image_retention_period,
             'shipment_end_time': compliance.shipment_end_time,
             'lastupuser': $rootScope.loginedUserData.user_id
         };

        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service+'/save_dcustomer_complianceaspect',
            dataType:'jsonp',
            data:formData
        }).success(function(data) {
            if (data[0][0].result == "Success"){
                logger.log('success');
            }
            else
            {
                logger.log('unable to save calendar data, please try again');
            }
        });

    };


}]);

