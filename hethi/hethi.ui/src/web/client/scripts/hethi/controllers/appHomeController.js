// <copyright file="appHomeController.js" company="hethi">
// Copyright (c) 2014 All Right Reserved, http://devaayanam.com/
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


hethi.controller('appHomeController', ['$http','$scope','$filter','$location','$rootScope','logger', function ($http,$scope,$filter,$location,$rootScope,logger){



    $(document).ready(function(){
        $('[data-toggle="tooltip"]').tooltip();
    });
    $scope.newServices=false;
    $scope.HomeActive="active";
    $rootScope.hidef="";
    $rootScope.RegisterColor='';
    $rootScope.abtcolor='aboutColor';
    $rootScope.taskColor='';
    $rootScope.AdminColor='';


    $rootScope.QueueIn='active';
    $rootScope.QueueOut='';
    $rootScope.QueueHold='';
    $rootScope.QueueApproval='';
    $rootScope.QueueDelegation='';

    $rootScope.menuTab=1;
    $rootScope.selectMenuTab=function(step){
        $rootScope.menuTab=step;
        //logger.log($rootScope.menuTab)
    };

    $rootScope.invtab='inventory';
    $rootScope.expense=false;

    $rootScope.tab='locale';
    $rootScope.review=false;
    $rootScope.locale=true;
    $rootScope.calendar=false;
    $rootScope.volume=false;
    $rootScope.compliance=false;
    $rootScope.aspects=false;
    $rootScope.delivery=false;
    $rootScope.selectTab=function(step){
        $rootScope.tab=step;
        if(step=="locale"){
            $rootScope.locale=true;
            $rootScope.calendar=false;
            $rootScope.volume=false;
            $rootScope.compliance=false;
            $rootScope.aspects=false;
            $rootScope.delivery=false;
            $rootScope.review=false;
        }
        else if(step=="calendar"){
            $rootScope.locale=false;
            $rootScope.calendar=true;
            $rootScope.volume=false;
            $rootScope.compliance=false;
            $rootScope.aspects=false;
            $rootScope.delivery=false;
            $rootScope.review=false;
        }
        else if(step=="delivery"){
            $rootScope.locale=false;
            $rootScope.calendar=false;
            $rootScope.volume=false;
            $rootScope.compliance=false;
            $rootScope.aspects=false;
            $rootScope.delivery=true;
            $rootScope.review=false;
        }
        else if(step=="volume"){
            $rootScope.locale=false;
            $rootScope.calendar=false;
            $rootScope.volume=true;
            $rootScope.compliance=false;
            $rootScope.aspects=false;
            $rootScope.delivery=false;
            $rootScope.review=false;
        }
        if(step=="aspects"){
            $rootScope.locale=false;
            $rootScope.calendar=false;
            $rootScope.volume=false;
            $rootScope.compliance=false;
            $rootScope.aspects=true;
            $rootScope.delivery=false;
            $rootScope.review=false;
        }
        else if($rootScope.tab=='compliance'){
            $rootScope.review=true;
            $rootScope.locale=false;
            $rootScope.calendar=false;
            $rootScope.volume=false;
            $rootScope.compliance=true;
            $rootScope.aspects=false;
            $rootScope.delivery=false;
        }


    };

    $scope.signUpUser=function(){
        $location.path('sign_up')
    };

    $rootScope.selectTab=function(step){
        $rootScope.invtab=step;
        if(step=="inventory"){
            $rootScope.inventory=true;
            $rootScope.expense=false;
        }
        else if(step=="expense"){
            $rootScope.inventory=false;
            $rootScope.locale=true;
        }
    };

    $rootScope.QueueTab=1;
    $rootScope.selectQueueTab=function(step){
        $rootScope.QueueTab=step;
    };
   $scope.forgot=function(){
     $location.path('forgot_password')
   };

    //$scope.MenuData=1;
    $scope.selectData=function(step){
        $scope.MenuData=step;
    };

    $('.stop-propagation').on('click',function(e){
        e.stopPropagation();
        });
    $scope.signUp=function(){

        if($rootScope.isSigned==true){

            $location.path('/Home');
        }
        else{
            $location.path('/sign_up')
        }



    };
    $scope.hideCareer1=true;

    $scope.detailsPage=function(row){
        $location.path('/Details');
        $scope.hideCareer1=true;
        $scope.hideCareer2=false;

    };
    $scope.signOutFromHethi=function(){
        $rootScope.eraseCookie('hethi_secret_key');
        $rootScope.checkCookie();
        if((window.location.pathname.split("/")[1])!='verifyUser')
           $location.path('/');
        logger.logSuccess("Logout completed");
    };
    $scope.SignInToHethi=function(signin){
        var signIn_input={
            username:signin.username,
            password:signin.password
        };
        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service +'/signIn',
            dataType:'jsonp',
            data: signIn_input
        }).success(function(data) {
            var flag='';
            if(data[0][0].result=="Success") {
                if(data[0][0].user_login_id!=signin.username){
                    flag='1';
                }
                if(data[0][0].user_login_password!=signin.password){
                    flag='2';
                }
                if(flag=='1'){
                    logger.logError("Please check your username");
                }
                else if(flag=='2'){
                    logger.logError("Please check your password");
                }
                else{
                    logger.logSuccess("Successfully signed in as "+data[0][0].role_name);
                    var secret = JSON.stringify(data[0][0])
                    if (signin.remember == true) {
                        $rootScope.createCookie('hethi_secret_key', secret, 30);
                    }
                    else {
                        $rootScope.createCookie('hethi_secret_key', secret, 30);
                    }
                    $rootScope.checkCookie();
                    console.log("secret :" + secret);
                }
                $('#sign_in_modal').modal('hide');
                $location.path('/');
            }
            else
            {
                logger.logError("User not registered");
            }


        });
    };
    $scope.custmer_email='';
    $scope.change_signup_btn_stats=function(stat){
        $scope.signup_btn_stats=stat;
    };
    $scope.registerNewUSer=function(register){
        $scope.custmer_email=register.business_email;
        $scope.signup_btn_stats=true;
        var x2js =new X2JS();
        var xml=x2js.json2xml_str({"root":{"data":register}});
        var formData={data:xml};
        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service +'/register',
            dataType:'jsonp',
            data: formData
        }).success(function(data) {
            if(data.result=="Success"){
                $scope.signup_btn_stats=false;
                logger.logSuccess('Thank You, please check your email to confirm cloudplug  ');
            }
            else
            {
                $scope.signup_btn_stats='';
                $scope.custmer_email='';
                logger.logError('unable to communicate with your email, Please try later');
            }

        }).error(function(err){
            $scope.signup_btn_stats='';
            $scope.custmer_email='';

        });
    };

    //$http({
    //    method: 'POST',
    //    url: 'http://localhost:9999/checkSession'
    //}).success(function(data) {
    //    $scope.company=data;
    //    logger.log($scope.company)
    //});
    $scope.notSigned=true;

    //$scope.hideData=false;
    //$scope.showData=function(row){
    //    $scope.hideData=true;
    //};
    $scope.DataHide=function(row){
        $scope.hideData=false;
    };



    $scope.myInterval=3000;
    $scope.slides=[{
        image:'images/S5.jpg'
    },{
        image:'images/S6.jpg'
    },{
        image:'images/S7.jpg'
    }
    ];



    $rootScope.back=false;
    $rootScope.finish=false;
    $rootScope.continue=true;

    $scope.menuTab=1;

    $scope.redirect=function(){
        $location.path('/registration')


    };
    $scope.contentRedirect=function(){
        //$location.path('/content')
        $location.path('/content_workflow')


    };


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


//Date picker Open Event
    $scope.open1 = function($event) {
        $event.preventDefault();
        $event.stopPropagation();
        return $scope.opened1 = true;
    };
    $scope.open = function($event) {
        $event.preventDefault();
        $event.stopPropagation();
        return $scope.opened = true;
    };

    $scope.dateOptions = {
        'year-format': "'yy'",
        'starting-day': 1
    };
    $scope.formats = ['dd-MMMM-yyyy', 'yyyy/MM/dd', 'shortDate'];
    $scope.format = $scope.formats[0];


    $(function(){

        function storeValues(){
            if(localStorage["uname"]){
                $('#uname').val(localStorage["uname"]);
            }
            if(localStorage["uemail"]){
                $('#uemail').val(localStorage["uemail"]);
            }
            if(localStorage["ucompanyname"]){
                $('#ucompanyname').val(localStorage["ucompanyname"]);
            }
            if(localStorage["uphonenumber"]){
                $('#uphonenumber').val(localStorage["uphonenumber"]);
            }
            if(localStorage["uaddress"]){
                $('#uaddress').val(localStorage["uaddress"]);
            }
            if(localStorage["ucity"]){
                $('#ucity').val(localStorage["ucity"]);
            }
            if(localStorage["ucountry"]){
                $('#ucountry').val(localStorage["ucountry"]);
            }
            if(localStorage["uremarks"]){
                $('#uremarks').val(localStorage["uremarks"]);
            }
            if(localStorage["card_name"]){
                $('#card_name').val(localStorage["card_name"]);
            }



        }
        storeValues();
        $('.text').keyup(function(){
            localStorage[$(this).attr('name')] = $(this).val();
        });
        $('#localStorageForm').submit(function(){
            localStorage.clear();
        });
    });







}])
    .controller('verificationController', ['$http','$scope','$filter','$location','$rootScope','logger','base64', function ($http,$scope,$filter,$location,$rootScope,logger,base64){
    $scope.listenVerivication=function(){

        var data=$rootScope.readCookie('hethi_registration');
        if(data!=null){
            var cookieData=JSON.parse(base64.decode(data));
            $rootScope.hethi_reg_data=cookieData;
        }
        else
        {
            $rootScope.hethi_reg_data=true;
            alert('You do not have sufficient permissions to access this page');
            logger.logWarning('You do not have sufficient permissions to access this page ,redirecting to homepage');
            //$location.path('/');

        }

    };
    $scope.completeRegistrationProcess=function(data){



        if(data.password == data.verify_password){
            var signIn_input={
                username:data.email,
                password:data.password
            };
            data.prefix='Mr';
            var x2js =new X2JS();
            var xml=x2js.json2xml_str({"root":{"data":data}});
            var userData={userData:xml};
            $http({
                method: 'POST',
                url: $rootScope.spring_rest_service +'/complete_registration',
                dataType:'jsonp',
                data: userData
            }).success(function(resp){
                if(resp.length==0){
                    logger.logSuccess('Registration completed');
                    $scope.SignInToHethi(signIn_input);
                    $location.path('/');
                    $rootScope.eraseCookie('hethi_registration');
                };



            }).error(function(err){

            });
        }
        else
        {
            logger.logError('Password mismatch, Please check your password');
        }

    }
    var qs=$location.$$search;
    $location.search({});
    if(qs.q!=undefined){
        var qString=qs.q;
        qString = qString.replace('-','=' ).replace('_',' ').replace("|","=+$");
        $rootScope.createCookie('hethi_registration', qString,1);
        $scope.listenVerivication();

    }
    else
    {
        $scope.listenVerivication();
    }
}])
    .controller('OperationsPartnerController', ['$http','$scope','$filter','$location','$rootScope','logger','base64', function ($http,$scope,$filter,$location,$rootScope,logger,base64) {

    var qs = $location.$$search;
    $scope.op_tabs=[{name:'manage_offers', isActive:''},{ name:'classify_source', isActive:''},{ name:'impersonate', isActive:''},{name:'initiate_implementation', isActive:''}];
    $scope.selectOPTab=function(tab){
        $scope.selectedOPTab=tab;
        //assign selected tab to query string
        $location.search({setTab:tab});
        //make selected tab active;
        $scope.op_tabs.forEach(function(row){
            if(tab==row.name){
                row.isActive='active';
            }
            else
            {
                row.isActive='';
            }

        });

        $('html, body').animate({
            scrollTop: $("#details_div").offset().top -100
        }, 1100);
    };

    if (qs.setTab != undefined){
        //open selected tab on page refresh
        $scope.selectOPTab(qs.setTab);
    }
    else
    {
        //open default tab here
        //$scope.selectOPTab('manage_offers');
    };

    $scope.classify_source_tabs={on_offer:'', on_board:''};

    $scope.set_classify_source_tab=function(tab){
        $scope.classify_source_tab=tab;
        //make selected tab active;
        for(var k in  $scope.classify_source_tabs){
            if(tab==k){
                $scope.classify_source_tabs[k]='active';
            }
            else
            {
                $scope.classify_source_tabs[k]='';
            }
        }
    };
        $scope.business_mode = 'on_offer';
        //$scope.set_selected_b_mode('on_offer')


    $scope.load_business_modes=function(){

        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service+'/load_offer_serviceplay',
            dataType:'jsonp'

        }).success(function(data){
            if(data[0][0].result=='Success'){
                $scope.business_modes=data[0];
                $scope.business_modes_details=data[1];
                $scope.tempOffers= _.groupBy($scope.business_modes_details,function(element){
                    return element.offer_id;
                });
            }
            else{
                logger.log('no business modes to list')
            }


        })
    };
    $scope.convertToDate=function(date){
            date=new Date(date);
            return date;
    };


        var init;


        $scope.searchKeywordsIndexer = '';
        $scope.filteredStoresIndexer = [];
        $scope.rowIndexer = '';


        $scope.selectIndexer = function(page) {
//        logger.log(page) ;

            var end, start;
            start = (page - 1) * $scope.numPerPageIndexer;
            end = start + $scope.numPerPageIndexer;
            return $scope.currentPageCustomerList = $scope.filteredStoresIndexer.slice(start, end);
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
            $scope.filteredStoresIndexer = $filter('filter')($scope.customerUploadsList, $scope.searchKeywordsIndexer);
            return $scope.onFilterChangeIndexer();
        };
        $scope.orderIndexer = function(rowName) {
            if ($scope.rowIndexer === rowName) {
                return;
            }
            $scope.rowIndexer = rowName;
            $scope.filteredStoresIndexer = $filter('orderBy')($scope.customerUploadsList, rowName);
            return $scope.onOrderChangeIndexer();
        };
        $scope.numPerPageOptIndexer = [3, 5, 10, 20];
        $scope.numPerPageIndexer = $scope.numPerPageOptIndexer[1];
        $scope.currentPageIndexer = 1;
        $scope.currentPageCustomerList = [];
        init = function() {
            $scope.searchIndexer();
            return $scope.selectIndexer($scope.currentPageIndexer);
        };


        $scope.load_uploads_by_status=function(stats){
            var form={status:stats};
            $http({
                method: 'POST',
                url: $rootScope.spring_rest_service + '/load_uploads_by_status',
                dataType: 'jsonp',
                data:form
            }).success(function (data) {
                if (data[0][0].result != "No Data") {
                    $scope.customer_uploads= data[0];
                    return init();

                }
            });
        };
        $scope.load_uploads_by_status(0);

    $scope.loadCustomerList=function() {


        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service + '/loadCustomerList',
            dataType: 'jsonp'
        }).success(function (data) {
            if (data[0][0].result != "No Data") {
                $scope.customerUploadsList = data[0];
                init();
            }
        });
    }
    $scope.load_artist_list=function(){
        $http({method: 'POST',
            url: $rootScope.spring_rest_service+'/load_artist_list',
            dataType:'jsonp'
        }).success(function(data) {
            $scope.artistData=data[0];
        });
    };
        $scope.change_classify_file_selected=function(){
        $rootScope.classify_file_selected=!$rootScope.classify_file_selected;
        $('html, body').animate({
            scrollTop: $("#details_div").offset().top -100
        }, 1100);
    };
        $scope.open_classify_forms=function(form){

        $scope.classify_file_selected=true;
        $scope.classify_selected_upload=form;

        $('html, body').animate({
            scrollTop: $("#classify_forms_div").offset().top -95
        }, 1100);


        $http({method: 'POST',
            url: $rootScope.spring_rest_service+'/load_uploaded_files_by_upload_id',
            dataType:'jsonp',
            data:form
        }).success(function(data){
            $scope.classify_selected_upload.files=data[0];
            $scope.selectImportedForm($scope.classify_selected_upload.files[0]);
        });




        };
        $scope.set_form_bsource=function(fs){
            $scope.form_bsource=fs;
            $scope.all_forms_filterd= $filter('filter')($scope.all_forms_with_owner_and_template, {'form_bsource': fs} );
            $scope.unique_form_types=_.groupBy($scope.all_forms_filterd,function(element){
                return element.form_type;
            });
            $scope.selected_hethi_form_data='';
        };

        $scope.load_all_stenciled_forms=function(){
            var form={customer_id:1};
            $http({
                method: 'POST',
                url: $rootScope.spring_rest_service+'/load_all_forms_with_owner_and_template',
                dataType:'jsonp',
                data:form
            }).success(function(data){
                if(data[0][0].result=='Success'){
                    $scope.all_forms_with_owner_and_template=data[0];
                    $scope.set_form_bsource('FRM');
                }
                else
                {
                    //logger.log('no forms to list')
                }


            })
        };
        $scope.load_all_stenciled_forms();
        $scope.selectImportedForm=function(form){
            $scope.selected_form=form;
            $scope.classify_selected_upload.files.forEach(function(row){
                if(row.file_id==form.file_id){
                    row.is_active=true;
                }
               else
                {
                  row.is_active=false;
                };
        });
    };

        $scope.show_preview_selected_form=function(form){

            form.file_path=$scope.selected_form.file_location;
            $http({
                method: 'POST',
                url: $rootScope.spring_rest_service+'/stencilservices/preview_by_form',
                dataType:'jsonp',
                data:form
            }).success(function(s) {
                alert(s);
                alert(JSON.stringify(s));
            });
        };
        $scope.assign_form_to_file=function(form){

            form.upload_id=$scope.selected_form.upload_id;
            form.file_id=$scope.selected_form.file_id;
            $http({
                method: 'POST',
                url: $rootScope.spring_rest_service+'/assign_form_to_file',
                dataType:'jsonp',
                data:form
            }).success(function(s) {
                $scope.classify_selected_upload.files.forEach(function(row){
                    if(row.file_id==$scope.selected_form.file_id){
                        row.efs_uin=form.efs_uin;
                        row.form_type=form.form_type;
                    }

                });

                logger.logSuccess('form assigned to file');
            }).error(function(err){

                logger.logError('unable to assign form')
            });
        };

        $scope.create_a_new_form_or_owner=function(){

            //$scope.selected_form.upload_id;
            //$scope.selected_form.file_id;
            $scope.selected_form;
            jQuery('#createNewFormModel').modal('show');



        };

        $scope.openDialogBox=function(tab,s){
                $scope.tab_for_new_form=tab;
                $scope.toggle_for_new_form=s;
        };
        $scope.load_all_master_data=function(){

            $http({
                method: 'POST',
                url: $rootScope.spring_rest_service+'/load_all_master_data',
                dataType:'jsonp'
            }).success(function(s) {

                $scope.all_master_data_list=s;
                $scope.bps_master_data_list=s[0];
                $scope.industry_master_data_list=s[1];
                $scope.flob_master_data_list=s[2];
                $scope.fowner_master_data_list=s[3];

            });
        };

        $scope.create_new_form=function(form){

            alert(JSON.stringify(form));

            //form.upload_id=$scope.selected_form.upload_id;
            //form.file_id=$scope.selected_form.file_id;
            //$http({
            //    method: 'POST',
            //    url: $rootScope.spring_rest_service+'/assign_form_to_file',
            //    dataType:'jsonp',
            //    data:form
            //}).success(function(s) {
            //    $scope.classify_selected_upload.files.forEach(function(row){
            //        if(row.file_id==$scope.selected_form.file_id){
            //            row.efs_uin=form.efs_uin;
            //            row.form_type=form.form_type;
            //        }
            //
            //    });
            //
            //    logger.logSuccess('form assigned to file');
            //}).error(function(err){
            //
            //    logger.logError('unable to assign form')
            //});
        };


    $scope.load_all_master_data();
    $scope.load_artist_list();
    $scope.load_business_modes();
    $scope.loadCustomerList();
    $scope.set_classify_source_tab('on_offer');
        $scope.selectedOffer='';
        $scope.selectedOfferChanged=function(item){
            $scope.selectedOffer=item;
        };
        $scope.selectedArtistChanged=function(item){
            $scope.assigned_artist=item;
        };
        $scope.chooseItem=function(i){
            //alert(JSON.stringify($scope.selectedOffer));
            if(angular.isArray($scope.selectedOffer)||angular.isObject($scope.selectedOffer)){
            }else{
                $scope.customerUploadsList[$scope.numPerPageIndexer*($scope.currentPageIndexer-1)+i].status=false;
                logger.logError("Please Select An Offer")
            }

        };

        $scope.assignToArtist=function(){
            if(angular.isObject($scope.assigned_artist)&&angular.isObject($scope.selectedOffer)){
                var jsonData=[];
                $scope.tempOffers[$scope.selectedOffer.offer_id].forEach(function(rows){
                    jsonData.push({"sfs_UIN":rows.sfs_UIN});
                });
                var x2js =new X2JS();
                var xml=x2js.json2xml_str({"root":{"data":jsonData}});
                var selectedUploads=[]
                //alert(JSON.stringify($scope.assigned_artist));
                //alert(JSON.stringify($scope.customerUploadsList[0]));
                $scope.customerUploadsList.forEach(function(row){
                    if(row.status)selectedUploads.push({user_id:row.customer_id,upload_id:row.upload_id,efs_uin:row.efs_uin});
                })
                var xml2=x2js.json2xml_str({"root":{"data":selectedUploads}});
                var input={
                    'customer_id': $rootScope.loginedUserData.customer_id,
                    'artist_id':$scope.assigned_artist.user_id,
                    'efs_data':xml2,
                    'sfs_data': xml
                };
                $http({
                    method: 'POST',
                    url: $rootScope.spring_rest_service+'/offer_assingnTo_artist',
                    dataType:'jsonp',
                    data: input
                }).success(function(data) {
                    $scope.loadCustomerList();
                });
            }else{
                logger.logError("Please Select An Offer or select an artist")
            }

            //alert(JSON.stringify($scope.customerUploadsList))
            //alert(JSON.stringify($scope.customerUploadsList[0]))
        }

}])
    .controller('PlatformPartnerController', ['$http','$scope','$filter','$location','$rootScope','logger','base64', function ($http,$scope,$filter,$location,$rootScope,logger,base64) {

    var qs = $location.$$search;
    $scope.main_tabs=[{'menu_name':'service & delivery','is_active':''},{'menu_name': 'platform as a service','is_active':''},{'menu_name': 'infrastructure as a service',is_active :''}];
    $scope.select_main_tab=function(tab){
        $scope.selected_main_tab=tab;
        //assign selected tab to query string
        $location.search({setTab:tab});
        //make selected tab active;
        $scope.main_tabs.forEach(function(row){

            if(tab==row.menu_name){
                row.is_active='active';
            }
            else
            {
                row.is_active='';
            }


        })
        $('html, body').animate({
            scrollTop: $("#details_div").offset().top -10
        }, 1100);



    };

    if (qs.setTab != undefined){
        //open selected tab on page refresh
        $scope.select_main_tab(qs.setTab);
    }
    else
    {
        //open default tab here
        //$scope.selectOPTab('manage_offers');
    };
    $scope.service_delivery_tabs = [
        { menu_name: 'capture',isActive: ' '},
        { menu_name: 'workflow',isActive: ''},
        { menu_name: 'output',isActive: ''},
        { menu_name: 'BPaaS services',isActive: ''},
        { menu_name: 'locale management',isActive: ''},
        { menu_name: 'organization structure',isActive: ''},
        { menu_name: 'complaince',isActive: ' '},
        { menu_name: 'service level agreement',isActive: ''}
    ];


    $scope.set_service_delivery_tab=function(tab){
        $scope.service_delivery_tab=tab;
        //make selected tab active;
        $scope.service_delivery_tabs.forEach(function(row){
            if(tab==row.menu_name){
                row.isActive='btn-info-wizard-active';
            }
            else
            {
                row.isActive='';
            }

        })
    };

    $scope.set_service_delivery_tab('capture');

    $scope.load_all_forms=function(){
        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service+'/load_home_content',
            dataType:'jsonp'

        }).success(function(data){
            if(data[0][0].result=='Success'){
                $scope.all_forms=data[0];
            }
            else
            {
                logger.log('no forms to list')
            }


        })
    };

    $scope.load_data_cbaas_workflow=function(form){
        alert(form);

        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service+'/load_cbaas_workflow_rules',
            dataType:'jsonp',
            data: form

        }).success(function(data){
            if(data[0][0].result=='Success'){
                $scope.cbaas_workflow_rules=data[0];
            }
            else
            {
                logger.logError('no sop rules to list for this form');
                $scope.cbaas_workflow_rules=false;
            }
        })
    };

    $scope.load_customer_list=function(){
        $http({method: 'POST',
            url: $rootScope.spring_rest_service+'/loadCustomerName',
            dataType:'jsonp'
        }).success(function(data) {
            $scope.customerList=data[0];
        });
    };
    $scope.listenSelectedCustomer=function(){

            var data=$rootScope.readCookie('hethi_freemium_customer');
            if(data!=null){
                var cookieData=JSON.parse(base64.decode(data));
                $rootScope.selectedCustomer=cookieData;
                $rootScope.customer_selected=true;
            }
            else
            {
                $rootScope.selectedCustomer='';
                $rootScope.customer_selected=false;

            }

        };

    $scope.load_landing_page=function(customer){

        var secret=base64.encode(JSON.stringify(customer));
        $rootScope.createCookie('hethi_freemium_customer', secret,1);
        $scope.listenSelectedCustomer();


    };
        $scope.removeSelectedCustomer=function(){
            $rootScope.selectedCustomer='';
            $rootScope.customer_selected=false;
            logger.log('customer removed');
            $rootScope.createCookie('hethi_freemium_customer', '',-1);
            $scope.listenSelectedCustomer();

        };

        $scope.hethi_core_services_orchestration=[];
        //hethi_core_services
        $scope.add_hethi_core_services_for_form=function(data){

            var form_data=data;
            $scope.hethi_core_services_orchestration.forEach(function(row){
               if(row.form_type==data.form_type) {
                   row={};
               }
            });

            $scope.hethi_core_services_orchestration.push(form_data);
            form_data='';
            data='';


        };

        $scope.listenSelectedCustomer();
    $scope.load_customer_list();
    $scope.load_all_forms();




       // hseeb controller start

        $scope.data=[{"id":"AF","text":"Afghanistan"},{"id":"AX","text":"Åland Islands"},{"id":"AL","text":"Albania"},{"id":"DZ","text":"Algeria"},{"id":"AS","text":"American Samoa"},{"id":"AD","text":"Andorra"},{"id":"AO","text":"Angola"},{"id":"AI","text":"Anguilla"},{"id":"AQ","text":"Antarctica"},{"id":"AG","text":"Antigua and Barbuda"},{"id":"AR","text":"Argentina"},{"id":"AM","text":"Armenia"},{"id":"AW","text":"Aruba"},{"id":"AU","text":"Australia"},{"id":"AT","text":"Austria"},{"id":"AZ","text":"Azerbaijan"},{"id":"BS","text":"Bahamas"},{"id":"BH","text":"Bahrain"},{"id":"BD","text":"Bangladesh"},{"id":"BB","text":"Barbados"},{"id":"BY","text":"Belarus"},{"id":"BE","text":"Belgium"},{"id":"BZ","text":"Belize"},{"id":"BJ","text":"Benin"},{"id":"BM","text":"Bermuda"},{"id":"BT","text":"Bhutan"},{"id":"BO","text":"Bolivia"},{"id":"BQ","text":"Bonaire"},{"id":"BA","text":"Bosnia and Herzegovina"},{"id":"BW","text":"Botswana"},{"id":"BV","text":"Bouvet Island"},{"id":"BR","text":"Brazil"},{"id":"IO","text":"British Indian Ocean Territory"},{"id":"VG","text":"British Virgin Islands"},{"id":"BN","text":"Brunei"},{"id":"BG","text":"Bulgaria"},{"id":"BF","text":"Burkina Faso"},{"id":"BI","text":"Burundi"},{"id":"KH","text":"Cambodia"},{"id":"CM","text":"Cameroon"},{"id":"CA","text":"Canada"},{"id":"CV","text":"Cape Verde"},{"id":"KY","text":"Cayman Islands"},{"id":"CF","text":"Central African Republic"},{"id":"TD","text":"Chad"},{"id":"CL","text":"Chile"},{"id":"CN","text":"China"},{"id":"CX","text":"Christmas Island"},{"id":"CC","text":"Cocos (Keeling) Islands"},{"id":"CO","text":"Colombia"},{"id":"KM","text":"Comoros"},{"id":"CG","text":"Republic of the Congo"},{"id":"CD","text":"DR Congo"},{"id":"CK","text":"Cook Islands"},{"id":"CR","text":"Costa Rica"},{"id":"HR","text":"Croatia"},{"id":"CU","text":"Cuba"},{"id":"CW","text":"Curaçao"},{"id":"CY","text":"Cyprus"},{"id":"CZ","text":"Czech Republic"},{"id":"DK","text":"Denmark"},{"id":"DJ","text":"Djibouti"},{"id":"DM","text":"Dominica"},{"id":"DO","text":"Dominican Republic"},{"id":"EC","text":"Ecuador"},{"id":"EG","text":"Egypt"},{"id":"SV","text":"El Salvador"},{"id":"GQ","text":"Equatorial Guinea"},{"id":"ER","text":"Eritrea"},{"id":"EE","text":"Estonia"},{"id":"ET","text":"Ethiopia"},{"id":"FK","text":"Falkland Islands"},{"id":"FO","text":"Faroe Islands"},{"id":"FJ","text":"Fiji"},{"id":"FI","text":"Finland"},{"id":"FR","text":"France"},{"id":"GF","text":"French Guiana"},{"id":"PF","text":"French Polynesia"},{"id":"TF","text":"French Southern and Antarctic Lands"},{"id":"GA","text":"Gabon"},{"id":"GM","text":"Gambia"},{"id":"GE","text":"Georgia"},{"id":"DE","text":"Germany"},{"id":"GH","text":"Ghana"},{"id":"GI","text":"Gibraltar"},{"id":"GR","text":"Greece"},{"id":"GL","text":"Greenland"},{"id":"GD","text":"Grenada"},{"id":"GP","text":"Guadeloupe"},{"id":"GU","text":"Guam"},{"id":"GT","text":"Guatemala"},{"id":"GG","text":"Guernsey"},{"id":"GN","text":"Guinea"},{"id":"GW","text":"Guinea-Bissau"},{"id":"GY","text":"Guyana"},{"id":"HT","text":"Haiti"},{"id":"HM","text":"Heard Island and McDonald Islands"},{"id":"VA","text":"Vatican City"},{"id":"HN","text":"Honduras"},{"id":"HK","text":"Hong Kong"},{"id":"HU","text":"Hungary"},{"id":"IS","text":"Iceland"},{"id":"IN","text":"India"},{"id":"ID","text":"Indonesia"},{"id":"CI","text":"Ivory Coast"},{"id":"IR","text":"Iran"},{"id":"IQ","text":"Iraq"},{"id":"IE","text":"Ireland"},{"id":"IM","text":"Isle of Man"},{"id":"IL","text":"Israel"},{"id":"IT","text":"Italy"},{"id":"JM","text":"Jamaica"},{"id":"JP","text":"Japan"},{"id":"JE","text":"Jersey"},{"id":"JO","text":"Jordan"},{"id":"KZ","text":"Kazakhstan"},{"id":"KE","text":"Kenya"},{"id":"KI","text":"Kiribati"},{"id":"KW","text":"Kuwait"},{"id":"KG","text":"Kyrgyzstan"},{"id":"LA","text":"Laos"},{"id":"LV","text":"Latvia"},{"id":"LB","text":"Lebanon"},{"id":"LS","text":"Lesotho"},{"id":"LR","text":"Liberia"},{"id":"LY","text":"Libya"},{"id":"LI","text":"Liechtenstein"},{"id":"LT","text":"Lithuania"},{"id":"LU","text":"Luxembourg"},{"id":"MO","text":"Macau"},{"id":"MK","text":"Macedonia"},{"id":"MG","text":"Madagascar"},{"id":"MW","text":"Malawi"},{"id":"MY","text":"Malaysia"},{"id":"MV","text":"Maldives"},{"id":"ML","text":"Mali"},{"id":"MT","text":"Malta"},{"id":"MH","text":"Marshall Islands"},{"id":"MQ","text":"Martinique"},{"id":"MR","text":"Mauritania"},{"id":"MU","text":"Mauritius"},{"id":"YT","text":"Mayotte"},{"id":"MX","text":"Mexico"},{"id":"FM","text":"Micronesia"},{"id":"MD","text":"Moldova"},{"id":"MC","text":"Monaco"},{"id":"MN","text":"Mongolia"},{"id":"ME","text":"Montenegro"},{"id":"MS","text":"Montserrat"},{"id":"MA","text":"Morocco"},{"id":"MZ","text":"Mozambique"},{"id":"MM","text":"Myanmar"},{"id":"NA","text":"Namibia"},{"id":"NR","text":"Nauru"},{"id":"NP","text":"Nepal"},{"id":"NL","text":"Netherlands"},{"id":"NC","text":"New Caledonia"},{"id":"NZ","text":"New Zealand"},{"id":"NI","text":"Nicaragua"},{"id":"NE","text":"Niger"},{"id":"NG","text":"Nigeria"},{"id":"NU","text":"Niue"},{"id":"NF","text":"Norfolk Island"},{"id":"KP","text":"North Korea"},{"id":"MP","text":"Northern Mariana Islands"},{"id":"NO","text":"Norway"},{"id":"OM","text":"Oman"},{"id":"PK","text":"Pakistan"},{"id":"PW","text":"Palau"},{"id":"PS","text":"Palestine"},{"id":"PA","text":"Panama"},{"id":"PG","text":"Papua New Guinea"},{"id":"PY","text":"Paraguay"},{"id":"PE","text":"Peru"},{"id":"PH","text":"Philippines"},{"id":"PN","text":"Pitcairn Islands"},{"id":"PL","text":"Poland"},{"id":"PT","text":"Portugal"},{"id":"PR","text":"Puerto Rico"},{"id":"QA","text":"Qatar"},{"id":"XK","text":"Kosovo"},{"id":"RE","text":"Réunion"},{"id":"RO","text":"Romania"},{"id":"RU","text":"Russia"},{"id":"RW","text":"Rwanda"},{"id":"BL","text":"Saint Barthélemy"},{"id":"SH","text":"Saint Helena, Ascension and Tristan da Cunha"},{"id":"KN","text":"Saint Kitts and Nevis"},{"id":"LC","text":"Saint Lucia"},{"id":"MF","text":"Saint Martin"},{"id":"PM","text":"Saint Pierre and Miquelon"},{"id":"VC","text":"Saint Vincent and the Grenadines"},{"id":"WS","text":"Samoa"},{"id":"SM","text":"San Marino"},{"id":"ST","text":"São Tomé and Príncipe"},{"id":"SA","text":"Saudi Arabia"},{"id":"SN","text":"Senegal"},{"id":"RS","text":"Serbia"},{"id":"SC","text":"Seychelles"},{"id":"SL","text":"Sierra Leone"},{"id":"SG","text":"Singapore"},{"id":"SX","text":"Sint Maarten"},{"id":"SK","text":"Slovakia"},{"id":"SI","text":"Slovenia"},{"id":"SB","text":"Solomon Islands"},{"id":"SO","text":"Somalia"},{"id":"ZA","text":"South Africa"},{"id":"GS","text":"South Georgia"},{"id":"KR","text":"South Korea"},{"id":"SS","text":"South Sudan"},{"id":"ES","text":"Spain"},{"id":"LK","text":"Sri Lanka"},{"id":"SD","text":"Sudan"},{"id":"SR","text":"Suriname"},{"id":"SJ","text":"Svalbard and Jan Mayen"},{"id":"SZ","text":"Swaziland"},{"id":"SE","text":"Sweden"},{"id":"CH","text":"Switzerland"},{"id":"SY","text":"Syria"},{"id":"TW","text":"Taiwan"},{"id":"TJ","text":"Tajikistan"},{"id":"TZ","text":"Tanzania"},{"id":"TH","text":"Thailand"},{"id":"TL","text":"Timor-Leste"},{"id":"TG","text":"Togo"},{"id":"TK","text":"Tokelau"},{"id":"TO","text":"Tonga"},{"id":"TT","text":"Trinidad and Tobago"},{"id":"TN","text":"Tunisia"},{"id":"TR","text":"Turkey"},{"id":"TM","text":"Turkmenistan"},{"id":"TC","text":"Turks and Caicos Islands"},{"id":"TV","text":"Tuvalu"},{"id":"UG","text":"Uganda"},{"id":"UA","text":"Ukraine"},{"id":"AE","text":"United Arab Emirates"},{"id":"GB","text":"United Kingdom"},{"id":"US","text":"United States"},{"id":"UM","text":"United States Minor Outlying Islands"},{"id":"VI","text":"United States Virgin Islands"},{"id":"UY","text":"Uruguay"},{"id":"UZ","text":"Uzbekistan"},{"id":"VU","text":"Vanuatu"},{"id":"VE","text":"Venezuela"},{"id":"VN","text":"Vietnam"},{"id":"WF","text":"Wallis and Futuna"},{"id":"EH","text":"Western Sahara"},{"id":"YE","text":"Yemen"},{"id":"ZM","text":"Zambia"},{"id":"ZW","text":"Zimbabwe"}];
        $scope.configDataService="Capture";
        $scope.customiseWorkflow="workflow";
        $scope.DefineOutput="output";
        $scope.ErpIntegration="Integrate";
        $scope.DefineStorage="Storage";
        $scope.DefineAnalytics="Analytics";
        $scope.BPaasService="BPaaS services";
        $scope.localeMangement="locale management";
        $scope.serviceLevelAgreement="service level agreement";
        $scope.complaince="complaince";
        $scope.OrganisationStructure="organization structure";

//ng show
        $scope.rfiTab=1;
        $scope.selectRFI=function(step){
            $scope.rfiTab=step;
            $('html, body').animate({
                scrollTop: $("#freemium_scroll_1").offset().top -90
            }, 1000);
        };

        $scope.complianceTab=1;
        $scope.selectCompliance=function(step){
            $scope.complianceTab=step;
        };

        $(document).ready(function() {

            $("#owl-demo").owlCarousel({
                //autoPlay: 3000,
                items : 3,
                itemsDesktop : [1199,3],
                itemsDesktopSmall : [979,3],
                pagination:false,
                navigation: true,
                navigationText: [
                    "<i class='fa fa-chevron-left icon-white'></i>",
                    "<i class='fa fa-chevron-right icon-white'></i>"
                ]
                //Call beforeInit callback, elem parameter point to $("#owl-demo")
                //beforeInit : function(elem){
                //    random(elem);
                //}

            });



        });

        $scope.captureChannel=[
            {name:'email',value:'no'},
            {name:'fax',value:'no'},
            {name:'email',value:'no'},
            {name:'PDF',value:'no'},
            {name:'MS-WORD',value:'no'}

        ];

        $scope.captureSource=[

            {name:'TIFF',value:'no'},
            {name:'ANSI',value:'no'},
            {name:'EDIFACT',value:'no'},
            {name:'JPEG',value:'no'}

        ];

        //    Define output services

        $scope.outputContent=[
            {name:'ANSI',value:'no'},
            {name:'EDIFACT',value:'no'}

        ];

        $scope.outputChannel=[
            {name:'email',value:'no'},
            {name:'webservice',value:'no'},
            {name:'email',value:'no'},
            {name:'fax',value:'no'}

        ];

        $scope.queues=false;

        $scope.showQueues=function(){
            $scope.queues = $scope.queues ? false : true;


        };
        $scope.rules=false;
        $scope.showRules=function(){
            $scope.rules = $scope.rules ? false : true;

        };

        $scope.platform_as_services=false;
        $scope.showRFIscreen=function(){
//$scope.rfi_form=true;
            $('html, body').animate({
                scrollTop: $("#freemium_scroll_1").offset().top -90
            }, 1000);
            $scope.platform_as_services=false;
            $scope.services_and_delivery=true;
        };

        //    Services and delivery

        $scope.bpaasData=[
            {
                name:'PO inventory'
            },
            {
                name:'PO expense'
            },
            {
                name:'NPO'
            },
            {
                name:'NPO-Travel & Expense'
            },
            {
                name:'NPO-Claim & Reimbursements'
            }
        ];

        $scope.countries = [
            {name: 'Afghanistan', code: 'AF'},{name: 'Åland Islands', code: 'AX'},{name: 'Albania', code: 'AL'},{name: 'Algeria', code: 'DZ'},{name: 'American Samoa', code: 'AS'},{name: 'Andorra', code: 'AD'},{name: 'Angola', code: 'AO'},{name: 'Anguilla', code: 'AI'},{name: 'Antarctica', code: 'AQ'},{name: 'Antigua and Barbuda', code: 'AG'},{name: 'Argentina', code: 'AR'},{name: 'Armenia', code: 'AM'},{name: 'Aruba', code: 'AW'},{name: 'Australia', code: 'AU'},{name: 'Austria', code: 'AT'},{name: 'Azerbaijan', code: 'AZ'},{name: 'Bahamas', code: 'BS'},{name: 'Bahrain', code: 'BH'},{name: 'Bangladesh', code: 'BD'},{name: 'Barbados', code: 'BB'},{name: 'Belarus', code: 'BY'},{name: 'Belgium', code: 'BE'},{name: 'Belize', code: 'BZ'},{name: 'Benin', code: 'BJ'},{name: 'Bermuda', code: 'BM'},{name: 'Bhutan', code: 'BT'},{name: 'Bolivia', code: 'BO'},{name: 'Bosnia and Herzegovina', code: 'BA'},{name: 'Botswana', code: 'BW'},{name: 'Bouvet Island', code: 'BV'},{name: 'Brazil', code: 'BR'},{name: 'British Indian Ocean Territory', code: 'IO'},{name: 'Brunei Darussalam', code: 'BN'},{name: 'Bulgaria', code: 'BG'},{name: 'Burkina Faso', code: 'BF'},{name: 'Burundi', code: 'BI'},{name: 'Cambodia', code: 'KH'},{name: 'Cameroon', code: 'CM'},{name: 'Canada', code: 'CA'},{name: 'Cape Verde', code: 'CV'},{name: 'Cayman Islands', code: 'KY'},{name: 'Central African Republic', code: 'CF'},{name: 'Chad', code: 'TD'},{name: 'Chile', code: 'CL'},{name: 'China', code: 'CN'},{name: 'Christmas Island', code: 'CX'},{name: 'Cocos (Keeling) Islands', code: 'CC'},{name: 'Colombia', code: 'CO'},{name: 'Comoros', code: 'KM'},{name: 'Congo', code: 'CG'},{name: 'Congo, The Democratic Republic of the', code: 'CD'},{name: 'Cook Islands', code: 'CK'},{name: 'Costa Rica', code: 'CR'},{name: 'Cote D\'Ivoire', code: 'CI'},{name: 'Croatia', code: 'HR'},{name: 'Cuba', code: 'CU'},{name: 'Cyprus', code: 'CY'},{name: 'Czech Republic', code: 'CZ'},{name: 'Denmark', code: 'DK'},{name: 'Djibouti', code: 'DJ'},{name: 'Dominica', code: 'DM'},{name: 'Dominican Republic', code: 'DO'},{name: 'Ecuador', code: 'EC'},{name: 'Egypt', code: 'EG'},{name: 'El Salvador', code: 'SV'},{name: 'Equatorial Guinea', code: 'GQ'},{name: 'Eritrea', code: 'ER'},{name: 'Estonia', code: 'EE'},{name: 'Ethiopia', code: 'ET'},{name: 'Falkland Islands (Malvinas)', code: 'FK'},{name: 'Faroe Islands', code: 'FO'},{name: 'Fiji', code: 'FJ'},{name: 'Finland', code: 'FI'},{name: 'France', code: 'FR'},{name: 'French Guiana', code: 'GF'},{name: 'French Polynesia', code: 'PF'},{name: 'French Southern Territories', code: 'TF'},{name: 'Gabon', code: 'GA'},{name: 'Gambia', code: 'GM'},{name: 'Georgia', code: 'GE'},{name: 'Germany', code: 'DE'},{name: 'Ghana', code: 'GH'},{name: 'Gibraltar', code: 'GI'},{name: 'Greece', code: 'GR'},{name: 'Greenland', code: 'GL'},{name: 'Grenada', code: 'GD'},{name: 'Guadeloupe', code: 'GP'},{name: 'Guam', code: 'GU'},{name: 'Guatemala', code: 'GT'},{name: 'Guernsey', code: 'GG'},{name: 'Guinea', code: 'GN'},{name: 'Guinea-Bissau', code: 'GW'},
            {name: 'Guyana', code: 'GY'},
            {name: 'Haiti', code: 'HT'},
            {name: 'Heard Island and Mcdonald Islands', code: 'HM'},
            {name: 'Holy See (Vatican City State)', code: 'VA'},
            {name: 'Honduras', code: 'HN'},
            {name: 'Hong Kong', code: 'HK'},
            {name: 'Hungary', code: 'HU'},
            {name: 'Iceland', code: 'IS'},
            {name: 'India', code: 'IN'},
            {name: 'Indonesia', code: 'ID'},
            {name: 'Iran, Islamic Republic Of', code: 'IR'},
            {name: 'Iraq', code: 'IQ'},
            {name: 'Ireland', code: 'IE'},
            {name: 'Isle of Man', code: 'IM'},
            {name: 'Israel', code: 'IL'},
            {name: 'Italy', code: 'IT'},
            {name: 'Jamaica', code: 'JM'},
            {name: 'Japan', code: 'JP'},
            {name: 'Jersey', code: 'JE'},
            {name: 'Jordan', code: 'JO'},
            {name: 'Kazakhstan', code: 'KZ'},
            {name: 'Kenya', code: 'KE'},
            {name: 'Kiribati', code: 'KI'},
            {name: 'Korea, Democratic People\'s Republic of', code: 'KP'},
            {name: 'Korea, Republic of', code: 'KR'},
            {name: 'Kuwait', code: 'KW'},
            {name: 'Kyrgyzstan', code: 'KG'},
            {name: 'Lao People\'s Democratic Republic', code: 'LA'},
            {name: 'Latvia', code: 'LV'},
            {name: 'Lebanon', code: 'LB'},
            {name: 'Lesotho', code: 'LS'},
            {name: 'Liberia', code: 'LR'},
            {name: 'Libyan Arab Jamahiriya', code: 'LY'},
            {name: 'Liechtenstein', code: 'LI'},
            {name: 'Lithuania', code: 'LT'},
            {name: 'Luxembourg', code: 'LU'},
            {name: 'Macao', code: 'MO'},
            {name: 'Macedonia, The Former Yugoslav Republic of', code: 'MK'},
            {name: 'Madagascar', code: 'MG'},
            {name: 'Malawi', code: 'MW'},
            {name: 'Malaysia', code: 'MY'},
            {name: 'Maldives', code: 'MV'},
            {name: 'Mali', code: 'ML'},
            {name: 'Malta', code: 'MT'},
            {name: 'Marshall Islands', code: 'MH'},
            {name: 'Martinique', code: 'MQ'},
            {name: 'Mauritania', code: 'MR'},
            {name: 'Mauritius', code: 'MU'},
            {name: 'Mayotte', code: 'YT'},
            {name: 'Mexico', code: 'MX'},
            {name: 'Micronesia, Federated States of', code: 'FM'},
            {name: 'Moldova, Republic of', code: 'MD'},
            {name: 'Monaco', code: 'MC'},
            {name: 'Mongolia', code: 'MN'},
            {name: 'Montserrat', code: 'MS'},
            {name: 'Morocco', code: 'MA'},
            {name: 'Mozambique', code: 'MZ'},
            {name: 'Myanmar', code: 'MM'},
            {name: 'Namibia', code: 'NA'},
            {name: 'Nauru', code: 'NR'},
            {name: 'Nepal', code: 'NP'},
            {name: 'Netherlands', code: 'NL'},
            {name: 'Netherlands Antilles', code: 'AN'},
            {name: 'New Caledonia', code: 'NC'},
            {name: 'New Zealand', code: 'NZ'},
            {name: 'Nicaragua', code: 'NI'},
            {name: 'Niger', code: 'NE'},
            {name: 'Nigeria', code: 'NG'},
            {name: 'Niue', code: 'NU'},
            {name: 'Norfolk Island', code: 'NF'},
            {name: 'Northern Mariana Islands', code: 'MP'},
            {name: 'Norway', code: 'NO'},
            {name: 'Oman', code: 'OM'},
            {name: 'Pakistan', code: 'PK'},
            {name: 'Palau', code: 'PW'},
            {name: 'Palestinian Territory, Occupied', code: 'PS'},
            {name: 'Panama', code: 'PA'},
            {name: 'Papua New Guinea', code: 'PG'},
            {name: 'Paraguay', code: 'PY'},
            {name: 'Peru', code: 'PE'},
            {name: 'Philippines', code: 'PH'},
            {name: 'Pitcairn', code: 'PN'},
            {name: 'Poland', code: 'PL'},
            {name: 'Portugal', code: 'PT'},
            {name: 'Puerto Rico', code: 'PR'},
            {name: 'Qatar', code: 'QA'},
            {name: 'Reunion', code: 'RE'},
            {name: 'Romania', code: 'RO'},
            {name: 'Russian Federation', code: 'RU'},
            {name: 'Rwanda', code: 'RW'},
            {name: 'Saint Helena', code: 'SH'},
            {name: 'Saint Kitts and Nevis', code: 'KN'},
            {name: 'Saint Lucia', code: 'LC'},
            {name: 'Saint Pierre and Miquelon', code: 'PM'},
            {name: 'Saint Vincent and the Grenadines', code: 'VC'},
            {name: 'Samoa', code: 'WS'},
            {name: 'San Marino', code: 'SM'},
            {name: 'Sao Tome and Principe', code: 'ST'},
            {name: 'Saudi Arabia', code: 'SA'},
            {name: 'Senegal', code: 'SN'},
            {name: 'Serbia and Montenegro', code: 'CS'},
            {name: 'Seychelles', code: 'SC'},
            {name: 'Sierra Leone', code: 'SL'},
            {name: 'Singapore', code: 'SG'},
            {name: 'Slovakia', code: 'SK'},
            {name: 'Slovenia', code: 'SI'},
            {name: 'Solomon Islands', code: 'SB'},
            {name: 'Somalia', code: 'SO'},
            {name: 'South Africa', code: 'ZA'},
            {name: 'South Georgia and the South Sandwich Islands', code: 'GS'},
            {name: 'Spain', code: 'ES'},
            {name: 'Sri Lanka', code: 'LK'},
            {name: 'Sudan', code: 'SD'},
            {name: 'Suriname', code: 'SR'},
            {name: 'Svalbard and Jan Mayen', code: 'SJ'},
            {name: 'Swaziland', code: 'SZ'},
            {name: 'Sweden', code: 'SE'},
            {name: 'Switzerland', code: 'CH'},
            {name: 'Syrian Arab Republic', code: 'SY'},
            {name: 'Taiwan, Province of China', code: 'TW'},
            {name: 'Tajikistan', code: 'TJ'},
            {name: 'Tanzania, United Republic of', code: 'TZ'},
            {name: 'Thailand', code: 'TH'},
            {name: 'Timor-Leste', code: 'TL'},
            {name: 'Togo', code: 'TG'},
            {name: 'Tokelau', code: 'TK'},
            {name: 'Tonga', code: 'TO'},
            {name: 'Trinidad and Tobago', code: 'TT'},
            {name: 'Tunisia', code: 'TN'},
            {name: 'Turkey', code: 'TR'},
            {name: 'Turkmenistan', code: 'TM'},
            {name: 'Turks and Caicos Islands', code: 'TC'},
            {name: 'Tuvalu', code: 'TV'},
            {name: 'Uganda', code: 'UG'},
            {name: 'Ukraine', code: 'UA'},
            {name: 'United Arab Emirates', code: 'AE'},
            {name: 'United Kingdom', code: 'GB'},
            {name: 'United States', code: 'US'},
            {name: 'United States Minor Outlying Islands', code: 'UM'},
            {name: 'Uruguay', code: 'UY'},
            {name: 'Uzbekistan', code: 'UZ'},
            {name: 'Vanuatu', code: 'VU'},
            {name: 'Venezuela', code: 'VE'},
            {name: 'Vietnam', code: 'VN'},
            {name: 'Virgin Islands, British', code: 'VG'},
            {name: 'Virgin Islands, U.S.', code: 'VI'},
            {name: 'Wallis and Futuna', code: 'WF'},
            {name: 'Western Sahara', code: 'EH'},
            {name: 'Yemen', code: 'YE'},
            {name: 'Zambia', code: 'ZM'},
            {name: 'Zimbabwe', code: 'ZW'}
        ];


    }]) .directive('ngFileModel',[
    function(){
        return{
            restrict:'A',
            link:function($scope,elem,attrs){
                elem.bind('change',function(e){
                    $scope[attrs.ngFileModel]= e.target.files;
                    var reader=new FileReader();
                    reader.onload=function(e){
                        $scope.$apply(function(){
                            $scope.image= e.target.result;
                            $scope.pathfile=$("#file").val();
                        });
                    };
                    reader.readAsDataURL($scope[attrs.ngFileModel][0]);
                });
                return $scope.image;
            }
        }
    }
]);