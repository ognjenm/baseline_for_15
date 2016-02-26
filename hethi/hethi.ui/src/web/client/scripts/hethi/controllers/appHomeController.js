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
    $scope.op_tabs=[{name:'manage_offers', isActive:'',icon:'cubes'},{ name:'classify_source', isActive:'',icon:'object-group'},{ name:'impersonate', isActive:'',icon:'diamond'},{name:'initiate_implementation', isActive:'',icon:'cogs'}];
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
            scrollTop: $("#details_div").offset().top -90
        }, 1000);
    };

    if (qs.setTab != undefined){
        //open selected tab on page refresh
        $scope.selectOPTab(qs.setTab);
    }
    else
    {
        //open default tab here
        $scope.selectOPTab('manage_offers');
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

        $scope.load_all_process_and_sub_process=function(){
            $http({method: 'POST',
                url: $rootScope.spring_rest_service+'/load_all_process_and_sub_process',
                dataType:'jsonp'
            }).success(function(data) {
                $scope.hethi_service_list=data[0];
                $scope.hethi_service_process_list=data[1];
                $scope.hethi_service_micro_process_list=data[2];
                $scope.hethi_service_process_list.forEach(function(p){
                    p.micro_processes=[];
                    $scope.hethi_service_micro_process_list.forEach(function(mp){
                        if(p.sfs_UIN==mp.sfs_UIN){
                            p.micro_processes.push(mp);
                        }
                    });
                });
                $scope.hide_diagram=true;
                $scope.set_workflow_process_container($scope.hethi_service_list[0]);

            });
        };
        $scope.set_workflow_process_container=function(servic){

            $scope.hethi_service_list.forEach(function(bp) {
                bp.is_active=false;
                if(bp.hethi_service_id==servic.hethi_service_id){
                    bp.is_active=true;
                    bp.main_process=[];
                    $scope.main_process_container=[];
                    $scope.hethi_service_process_list.forEach(function(p) {
                        if(p.hethi_service_id==bp.hethi_service_id){
                            bp.main_process.push(p);
                            $scope.main_process_container.push(p);
                        }
                    });
                }
            });
            //$scope.set_workflow_micro_process_container($scope.main_process_container[0]);
            $scope.set_workflow_diagram_for_process($scope.main_process_container);
        };



        //$scope.set_workflow_micro_process_container($scope.main_process_container[0]);
        $scope.set_workflow_micro_process_container=function(process){
            $scope.micro_process_container=process;
            $scope.load_micro_process_diagram(process);
            $scope.main_process_container.forEach(function(mp) {
                mp.is_active=false;
                if(mp.sfs_UIN==process.sfs_UIN){
                    mp.is_active=true;
                };
            });

        };


        $scope.listenSelectedCustomer();
        $scope.load_customer_list();
        $scope.load_all_forms();




        //$scope.load_all_process_and_sub_process();



        var micro_process_diagram,myPalette;
        $scope.init=function() {
            //if (window.goSamples) goSamples();  // init for these samples -- you don't need to call this
            var $ = go.GraphObject.make;  // for conciseness in defining templates

            micro_process_diagram =
                $(go.Diagram, "micro_process_diagram",// must name or refer to the DIV HTML element
                    {
                        initialContentAlignment: go.Spot.Center,
                        allowDrop: true,  // must be true to accept drops from the Palette
                        "LinkDrawn": showLinkLabel,  // this DiagramEvent listener is defined below
                        "LinkRelinked": showLinkLabel,
                        "animationManager.duration": 800, // slightly longer than default (600ms) animation
                        "undoManager.isEnabled": true  // enable undo & redo
                    });


            window.PIXELRATIO = micro_process_diagram.computePixelRatio(); // constant needed to determine mouse coordinates on the canvas

            // define a simple Node template


            // when the document is modified, add a "*" to the title and enable the "Save" button
            micro_process_diagram.addDiagramListener("Modified", function(e) {
                var button = document.getElementById("SaveButton");
                //if (button) button.disabled = !myDiagram.isModified;
                var idx = document.title.indexOf("*");
                if (micro_process_diagram.isModified) {
                    if (idx < 0) document.title += "*";
                } else {
                    if (idx >= 0) document.title = document.title.substr(0, idx);
                }
            });

            // helper definitions for node templates

            function nodeStyle() {
                return [
                    // The Node.location comes from the "loc" property of the node data,
                    // converted by the Point.parse static method.
                    // If the Node.location is changed, it updates the "loc" property of the node data,
                    // converting back using the Point.stringify static method.
                    new go.Binding("location", "loc", go.Point.parse).makeTwoWay(go.Point.stringify),
                    {
                        // the Node.location is at the center of each node
                        locationSpot: go.Spot.Center,
                        //isShadowed: true,
                        //shadowColor: "#888",
                        // handle mouse enter/leave events to show/hide the ports
                        mouseEnter: function (e, obj) { showPorts(obj.part, true); },
                        mouseLeave: function (e, obj) { showPorts(obj.part, false); }
                    }
                ];
            }

            // Define a function for creating a "port" that is normally transparent.
            // The "name" is used as the GraphObject.portId, the "spot" is used to control how links connect
            // and where the port is positioned on the node, and the boolean "output" and "input" arguments
            // control whether the user can draw links from or to the port.
            function makePort(name, spot, output, input) {
                // the port is basically just a small circle that has a white stroke when it is made visible
                return $(go.Shape, "Circle",
                    {
                        fill: "transparent",
                        stroke: null,  // this is changed to "white" in the showPorts function
                        desiredSize: new go.Size(15, 15),
                        alignment: spot, alignmentFocus: spot,  // align the port on the main Shape
                        portId: name,  // declare this object to be a "port"
                        fromSpot: spot, toSpot: spot,  // declare where links may connect at this port
                        fromLinkable: output, toLinkable: input,  // declare whether the user may draw links to/from here
                        cursor: "pointer"  // show a different cursor to indicate potential link point
                    });
            }


            // define the Node templates for regular nodes

            var lightText = 'white';

            micro_process_diagram.nodeTemplateMap.add("",  // the default category
                $(go.Node, "Spot",
                    { contextMenu:
                        $(go.Adornment, "Vertical",
                            $("ContextMenuButton",
                                $(go.TextBlock, "Properties"),
                                { click: function(e, obj) {  jQuery('#myModal').modal('show');}
                                }),
                            $("ContextMenuButton",
                                $(go.TextBlock, "Settings"),
                                { click: function(e, obj) {  jQuery('#myModal1').modal('show'); }
                                })
                        ) },
                    nodeStyle(),
                    // the main object is a Panel that surrounds a TextBlock with a rectangular Shape
                    $(go.Panel, "Auto",
                        $(go.Shape, "Rectangle",
                            { fill: "lightgray", stroke: null },
                            new go.Binding("figure", "figure")),
                        $(go.TextBlock,
                            {
                                font: "bold 11pt Helvetica, Arial, sans-serif",
                                stroke: lightText,
                                margin: 8,
                                maxSize: new go.Size(160, NaN),
                                wrap: go.TextBlock.WrapFit,
                                editable: true
                            },
                            new go.Binding("text").makeTwoWay())
                    ),
                    // four named ports, one on each side:
                    makePort("T", go.Spot.Top, false, true),
                    makePort("L", go.Spot.Left, true, true),
                    makePort("R", go.Spot.Right, true, true),
                    makePort("B", go.Spot.Bottom, true, false)
                ));

            micro_process_diagram.nodeTemplateMap.add("Rectangle",  // the default category
                $(go.Node, "Spot",
                    { contextMenu:
                        $(go.Adornment, "Vertical",
                            $("ContextMenuButton",
                                $(go.TextBlock, "Properties"),
                                { click: function(e, obj) {  jQuery('#myModal').modal('show');}
                                }),
                            $("ContextMenuButton",
                                $(go.TextBlock, "Settings"),
                                { click: function(e, obj) {  jQuery('#myModal1').modal('show'); }
                                })
                        ) },
                    nodeStyle(),
                    // the main object is a Panel that surrounds a TextBlock with a rectangular Shape
                    $(go.Panel, "Auto",
                        $(go.Shape, "Rectangle",
                            { fill: "#3B8686", stroke: null },
                            new go.Binding("figure", "figure")),
                        $(go.TextBlock,
                            {
                                font: "bold 11pt Helvetica, Arial, sans-serif",
                                stroke: lightText,
                                margin: 8,
                                maxSize: new go.Size(160, NaN),
                                wrap: go.TextBlock.WrapFit,
                                editable: true
                            },
                            new go.Binding("text").makeTwoWay())
                    ),
                    // four named ports, one on each side:
                    makePort("T", go.Spot.Top, false, true),
                    makePort("L", go.Spot.Left, true, true),
                    makePort("R", go.Spot.Right, true, true),
                    makePort("B", go.Spot.Bottom, true, false)
                ));
            micro_process_diagram.nodeTemplateMap.add("Rectangleaaas",  // the default category
                $(go.Node, "Spot",
                    { contextMenu:
                        $(go.Adornment, "Vertical",
                            $("ContextMenuButton",
                                $(go.TextBlock, "Properties"),
                                { click: function(e, obj) {  jQuery('#myModal').modal('show');}
                                }),
                            $("ContextMenuButton",
                                $(go.TextBlock, "Settings"),
                                { click: function(e, obj) {  jQuery('#myModal1').modal('show'); }
                                })
                        ) },
                    nodeStyle(),
                    // the main object is a Panel that surrounds a TextBlock with a rectangular Shape
                    $(go.Panel, "Auto",
                        $(go.Shape, "RoundedRectangle",
                            { fill:$(go.Brush,"Linear",{0.0:"#BF4141",1.0:"#ce60a6"}), stroke: null },
                            new go.Binding("figure", "figure")),
                        $(go.TextBlock,
                            {
                                font: "bold 11pt Helvetica, Arial, sans-serif",
                                stroke: lightText,
                                margin: 8,
                                maxSize: new go.Size(160, NaN),
                                wrap: go.TextBlock.WrapFit,
                                editable: true
                            },
                            new go.Binding("text").makeTwoWay())
                    ),
                    // four named ports, one on each side:
                    makePort("T", go.Spot.Top, false, true),
                    makePort("L", go.Spot.Left, true, true),
                    makePort("R", go.Spot.Right, true, true),
                    makePort("B", go.Spot.Bottom, true, false)
                ));

            micro_process_diagram.nodeTemplateMap.add("Rectangleiaas",  // the default category
                $(go.Node, "Spot",
                    { contextMenu:
                        $(go.Adornment, "Vertical",
                            $("ContextMenuButton",
                                $(go.TextBlock, "Properties"),
                                { click: function(e, obj) {
                                    $scope.selected_workflow_process=obj.part.data;
                                    $scope.loadRulesByProcess();
                                    jQuery('#ruleModel').modal('show');}
                                }),
                            $("ContextMenuButton",
                                $(go.TextBlock, "Settings"),
                                { click: function(e, obj) {  jQuery('#myModal1').modal('show'); }
                                })
                        ) },
                    nodeStyle(),
                    // the main object is a Panel that surrounds a TextBlock with a rectangular Shape
                    $(go.Panel, "Auto",
                        $(go.Shape, "RoundedRectangle",
                            { fill:$(go.Brush,"Linear",{0.0:"#3c2722",1.0:"#664e4a"}), stroke: null },
                            new go.Binding("figure", "figure")),
                        $(go.TextBlock,
                            {
                                font: "bold 11pt Helvetica, Arial, sans-serif",
                                stroke: lightText,
                                margin: 8,
                                maxSize: new go.Size(160, NaN),
                                wrap: go.TextBlock.WrapFit,
                                editable: true
                            },
                            new go.Binding("text").makeTwoWay())
                    ),
                    // four named ports, one on each side:
                    makePort("T", go.Spot.Top, false, true),
                    makePort("L", go.Spot.Left, true, true),
                    makePort("R", go.Spot.Right, true, true),
                    makePort("B", go.Spot.Bottom, true, false)
                ));

            micro_process_diagram.nodeTemplateMap.add("Rectangleoaas",  // the default category
                $(go.Node, "Spot",
                    { contextMenu:
                        $(go.Adornment, "Vertical",
                            $("ContextMenuButton",
                                $(go.TextBlock, "Properties"),
                                { click: function(e, obj) {
                                    $scope.selected_workflow_process=obj.part.data;
                                    $scope.loadRulesByProcess();
                                    jQuery('#ruleModel').modal('show');}
                                }),
                            $("ContextMenuButton",
                                $(go.TextBlock, "Settings"),
                                { click: function(e, obj) {  jQuery('#myModal1').modal('show'); }
                                })
                        ) },
                    nodeStyle(),
                    // the main object is a Panel that surrounds a TextBlock with a rectangular Shape
                    $(go.Panel, "Auto",
                        $(go.Shape, "RoundedRectangle",
                            {fill:$(go.Brush,"Linear",{0.0:"#76a879",1.0:"#366d51"}), stroke: null },
                            new go.Binding("figure", "figure")),
                        $(go.TextBlock,
                            {
                                font: "bold 11pt Helvetica, Arial, sans-serif",
                                stroke: lightText,
                                margin: 8,
                                maxSize: new go.Size(160, NaN),
                                wrap: go.TextBlock.WrapFit,
                                editable: true
                            },
                            new go.Binding("text").makeTwoWay())
                    ),
                    // four named ports, one on each side:
                    makePort("T", go.Spot.Top, false, true),
                    makePort("L", go.Spot.Left, true, true),
                    makePort("R", go.Spot.Right, true, true),
                    makePort("B", go.Spot.Bottom, true, false)
                ));

            micro_process_diagram.nodeTemplateMap.add("Rectanglebaas",  // the default category
                $(go.Node, "Spot",
                    { contextMenu:
                        $(go.Adornment, "Vertical",
                            $("ContextMenuButton",
                                $(go.TextBlock, "Properties"),
                                { click: function(e, obj) {
                                    $scope.selected_workflow_process=obj.part.data;
                                    $scope.loadRulesByProcess();
                                    jQuery('#ruleModel').modal('show');}
                                }),
                            $("ContextMenuButton",
                                $(go.TextBlock, "Settings"),
                                { click: function(e, obj) {  jQuery('#myModal1').modal('show'); }
                                })
                        ) },
                    nodeStyle(),
                    // the main object is a Panel that surrounds a TextBlock with a rectangular Shape
                    $(go.Panel, "Auto",
                        $(go.Shape, "RoundedRectangle",
                            { fill:$(go.Brush,"Linear",{0.0:"#cf3529",1.0:"#fa5f4b"}), stroke: null },
                            new go.Binding("figure", "figure")),
                        $(go.TextBlock,
                            {
                                font: "bold 11pt Helvetica, Arial, sans-serif",
                                stroke: lightText,
                                margin: 8,
                                maxSize: new go.Size(160, NaN),
                                wrap: go.TextBlock.WrapFit,
                                editable: true
                            },
                            new go.Binding("text").makeTwoWay())
                    ),
                    // four named ports, one on each side:
                    makePort("T", go.Spot.Top, false, true),
                    makePort("L", go.Spot.Left, true, true),
                    makePort("R", go.Spot.Right, true, true),
                    makePort("B", go.Spot.Bottom, true, false)
                ));

            micro_process_diagram.nodeTemplateMap.add("Rectangledaas",  // the default category
                $(go.Node, "Spot",
                    { contextMenu:
                        $(go.Adornment, "Vertical",
                            $("ContextMenuButton",
                                $(go.TextBlock, "Rule-Properties"),
                                { click: function(e, obj) {
                                    //save rule here
                                    $scope.selected_workflow_process=obj.part.data;
                                    $scope.loadRulesByProcess();
                                    jQuery('#ruleModel').modal('show');}
                                }),
                            $("ContextMenuButton",
                                $(go.TextBlock, "Settings"),
                                { click: function(e, obj) {
                                    //save rule here
                                    $scope.selected_workflow_process=obj.part.data;
                                    $scope.loadRulesByProcess();
                                    jQuery('#ruleModel').modal('show');}
                                })
                        ) },
                    nodeStyle(),
                    // the main object is a Panel that surrounds a TextBlock with a rectangular Shape
                    $(go.Panel, "Auto",
                        $(go.Shape, "RoundedRectangle",
                            { fill:$(go.Brush,"Linear",{0.0:"#c89033",1.0:"#f9b73c"}), stroke: null },
                            new go.Binding("figure", "figure")),
                        $(go.TextBlock,
                            {
                                font: "bold 11pt Helvetica, Arial, sans-serif",
                                stroke: lightText,
                                margin: 8,
                                maxSize: new go.Size(160, NaN),
                                wrap: go.TextBlock.WrapFit,
                                editable: true
                            },
                            new go.Binding("text").makeTwoWay())
                    ),
                    // four named ports, one on each side:
                    makePort("T", go.Spot.Top, false, true),
                    makePort("L", go.Spot.Left, true, true),
                    makePort("R", go.Spot.Right, true, true),
                    makePort("B", go.Spot.Bottom, true, false)
                ));
            micro_process_diagram.nodeTemplateMap.add("Diamonddaas",  // the default category
                $(go.Node, "Spot",
                    { contextMenu:
                        $(go.Adornment, "Vertical",
                            $("ContextMenuButton",
                                $(go.TextBlock, "Properties"),
                                { click: function(e, obj) {  jQuery('#myModal').modal('show');}
                                }),
                            $("ContextMenuButton",
                                $(go.TextBlock, "Settings"),
                                { click: function(e, obj) {  jQuery('#myModal1').modal('show'); }
                                })
                        ) },
                    nodeStyle(),
                    // the main object is a Panel that surrounds a TextBlock with a rectangular Shape
                    $(go.Panel, "Auto",
                        $(go.Shape, "Diamond",
                            { fill: "#92646D", stroke: null },
                            new go.Binding("figure", "figure")),
                        $(go.TextBlock,
                            {
                                font: "bold 11pt Helvetica, Arial, sans-serif",
                                stroke: lightText,
                                margin: 8,
                                maxSize: new go.Size(160, NaN),
                                wrap: go.TextBlock.WrapFit,
                                editable: true
                            },
                            new go.Binding("text").makeTwoWay())
                    ),
                    // four named ports, one on each side:
                    makePort("T", go.Spot.Top, false, true),
                    makePort("L", go.Spot.Left, true, true),
                    makePort("R", go.Spot.Right, true, true),
                    makePort("B", go.Spot.Bottom, true, false)
                ));
            micro_process_diagram.nodeTemplateMap.add("Diamondbaas",  // the default category
                $(go.Node, "Spot",
                    { contextMenu:
                        $(go.Adornment, "Vertical",
                            $("ContextMenuButton",
                                $(go.TextBlock, "Properties"),
                                { click: function(e, obj) {  jQuery('#myModal').modal('show');}
                                }),
                            $("ContextMenuButton",
                                $(go.TextBlock, "Settings"),
                                { click: function(e, obj) {  jQuery('#myModal1').modal('show'); }
                                })
                        ) },
                    nodeStyle(),
                    // the main object is a Panel that surrounds a TextBlock with a rectangular Shape
                    $(go.Panel, "Auto",
                        $(go.Shape, "Diamond",
                            { fill: "#20981F", stroke: null },
                            new go.Binding("figure", "figure")),
                        $(go.TextBlock,
                            {
                                font: "bold 11pt Helvetica, Arial, sans-serif",
                                stroke: lightText,
                                margin: 8,
                                maxSize: new go.Size(160, NaN),
                                wrap: go.TextBlock.WrapFit,
                                editable: true
                            },
                            new go.Binding("text").makeTwoWay())
                    ),
                    // four named ports, one on each side:
                    makePort("T", go.Spot.Top, false, true),
                    makePort("L", go.Spot.Left, true, true),
                    makePort("R", go.Spot.Right, true, true),
                    makePort("B", go.Spot.Bottom, true, false)
                ));
            micro_process_diagram.nodeTemplateMap.add("Diamondoaas",  // the default category
                $(go.Node, "Spot",
                    { contextMenu:
                        $(go.Adornment, "Vertical",
                            $("ContextMenuButton",
                                $(go.TextBlock, "Properties"),
                                { click: function(e, obj) {  jQuery('#myModal').modal('show');}
                                }),
                            $("ContextMenuButton",
                                $(go.TextBlock, "Settings"),
                                { click: function(e, obj) {  jQuery('#myModal1').modal('show'); }
                                })
                        ) },
                    nodeStyle(),
                    // the main object is a Panel that surrounds a TextBlock with a rectangular Shape
                    $(go.Panel, "Auto",
                        $(go.Shape, "Diamond",
                            { fill: "#A29B16", stroke: null },
                            new go.Binding("figure", "figure")),
                        $(go.TextBlock,
                            {
                                font: "bold 11pt Helvetica, Arial, sans-serif",
                                stroke: lightText,
                                margin: 8,
                                maxSize: new go.Size(160, NaN),
                                wrap: go.TextBlock.WrapFit,
                                editable: true
                            },
                            new go.Binding("text").makeTwoWay())
                    ),
                    // four named ports, one on each side:
                    makePort("T", go.Spot.Top, false, true),
                    makePort("L", go.Spot.Left, true, true),
                    makePort("R", go.Spot.Right, true, true),
                    makePort("B", go.Spot.Bottom, true, false)
                ));
            micro_process_diagram.nodeTemplateMap.add("Diamondiaas",  // the default category
                $(go.Node, "Spot",
                    { contextMenu:
                        $(go.Adornment, "Vertical",
                            $("ContextMenuButton",
                                $(go.TextBlock, "Properties"),
                                { click: function(e, obj) {  jQuery('#myModal').modal('show');}
                                }),
                            $("ContextMenuButton",
                                $(go.TextBlock, "Settings"),
                                { click: function(e, obj) {  jQuery('#myModal1').modal('show'); }
                                })
                        ) },
                    nodeStyle(),
                    // the main object is a Panel that surrounds a TextBlock with a rectangular Shape
                    $(go.Panel, "Auto",
                        $(go.Shape, "Diamond",
                            { fill: "#FF4819", stroke: null },
                            new go.Binding("figure", "figure")),
                        $(go.TextBlock,
                            {
                                font: "bold 11pt Helvetica, Arial, sans-serif",
                                stroke: lightText,
                                margin: 8,
                                maxSize: new go.Size(160, NaN),
                                wrap: go.TextBlock.WrapFit,
                                editable: true
                            },
                            new go.Binding("text").makeTwoWay())
                    ),
                    // four named ports, one on each side:
                    makePort("T", go.Spot.Top, false, true),
                    makePort("L", go.Spot.Left, true, true),
                    makePort("R", go.Spot.Right, true, true),
                    makePort("B", go.Spot.Bottom, true, false)
                ));

            micro_process_diagram.nodeTemplateMap.add("Diamond",  // the default category
                $(go.Node, "Spot",
                    { contextMenu:
                        $(go.Adornment, "Vertical",
                            $("ContextMenuButton",
                                $(go.TextBlock, "Properties"),
                                { click: function(e, obj) {  jQuery('#myModal').modal('show');
                                } }),
                            $("ContextMenuButton",
                                $(go.TextBlock, "Settings"),
                                { click: function(e, obj) {  jQuery('#myModal1').modal('show'); } })
                        ) },
                    nodeStyle(),
                    // the main object is a Panel that surrounds a TextBlock with a rectangular Shape
                    $(go.Panel, "Auto",
                        $(go.Shape, "Diamond",
                            { fill: "#86863B", stroke: null },
                            new go.Binding("figure", "figure")),
                        $(go.TextBlock,
                            {
                                font: "bold 11pt Helvetica, Arial, sans-serif",
                                stroke: lightText,
                                margin: 8,
                                maxSize: new go.Size(160, NaN),
                                wrap: go.TextBlock.WrapFit,
                                editable: true
                            },
                            new go.Binding("text").makeTwoWay())
                    ),
                    // four named ports, one on each side:
                    makePort("T", go.Spot.Top, false, true),
                    makePort("L", go.Spot.Left, true, true),
                    makePort("R", go.Spot.Right, true, true),
                    makePort("B", go.Spot.Bottom, true, false)
                ));

            micro_process_diagram.nodeTemplateMap.add("Start",
                $(go.Node, "Spot", nodeStyle(),
                    $(go.Panel, "Auto",
                        $(go.Shape, "Circle",
                            { minSize: new go.Size(40, 40), fill:$(go.Brush,"Linear",{0.0:"#259048",1.0:"#2cb258"}), stroke: null }),
                        $(go.TextBlock, "Start",
                            { font: "bold 11pt Helvetica, Arial, sans-serif", stroke: lightText },
                            new go.Binding("text"))
                    ),
                    // three named ports, one on each side except the top, all output only:
                    makePort("L", go.Spot.Left, true, false),
                    makePort("R", go.Spot.Right, true, false),
                    makePort("B", go.Spot.Bottom, true, false)
                ));

            micro_process_diagram.nodeTemplateMap.add("End",
                $(go.Node, "Spot", nodeStyle(),
                    $(go.Panel, "Auto",
                        $(go.Shape, "Circle",
                            { minSize: new go.Size(40, 40), fill:$(go.Brush,"Linear",{0.0:"#d9534f",1.0:"#c12e2a"}), stroke: null }),
                        $(go.TextBlock, "End",
                            { font: "bold 11pt Helvetica, Arial, sans-serif", stroke: lightText },
                            new go.Binding("text"))
                    ),
                    // three named ports, one on each side except the bottom, all input only:
                    makePort("T", go.Spot.Top, false, true),
                    makePort("L", go.Spot.Left, false, true),
                    makePort("R", go.Spot.Right, false, true)
                ));

            micro_process_diagram.nodeTemplateMap.add("Comment",
                $(go.Node, "Auto", nodeStyle(),
                    $(go.Shape, "File",
                        { fill: "#EFFAB4", stroke: null }),
                    $(go.TextBlock,
                        {
                            margin: 5,
                            maxSize: new go.Size(200, NaN),
                            wrap: go.TextBlock.WrapFit,
                            textAlign: "center",
                            editable: true,
                            font: "bold 12pt Helvetica, Arial, sans-serif",
                            stroke: '#454545'
                        },
                        new go.Binding("text").makeTwoWay())
                    // no ports, because no links are allowed to connect with a comment
                ));


            // replace the default Link template in the linkTemplateMap
            micro_process_diagram.linkTemplate =
                $(go.Link,  // the whole link panel
                    {
                        routing: go.Link.AvoidsNodes,
                        curve: go.Link.JumpOver,
                        corner: 5, toShortLength: 4,
                        relinkableFrom: true,
                        relinkableTo: true,
                        reshapable: true,
                        resegmentable: true,
                        // mouse-overs subtly highlight links:
                        mouseEnter: function(e, link) { link.findObject("HIGHLIGHT").stroke = "rgba(30,144,255,0.2)"; },
                        mouseLeave: function(e, link) { link.findObject("HIGHLIGHT").stroke = "transparent"; }
                    },
                    new go.Binding("points").makeTwoWay(),
                    $(go.Shape,  // the highlight shape, normally transparent
                        { isPanelMain: true, strokeWidth: 8, stroke: "transparent", name: "HIGHLIGHT" }),
                    $(go.Shape,  // the link path shape
                        { isPanelMain: true, stroke: "gray", strokeWidth: 2 }),
                    $(go.Shape,  // the arrowhead
                        { toArrow: "standard", stroke: null, fill: "gray"}),
                    $(go.Panel, "Auto",  // the link label, normally not visible
                        { visible: false, name: "LABEL", segmentIndex: 2, segmentFraction: 0.5},
                        new go.Binding("visible", "visible").makeTwoWay(),
                        $(go.Shape, "RoundedRectangle",  // the label shape
                            { fill: "#F8F8F8", stroke: null }),
                        $(go.TextBlock, "Yes",  // the label
                            {
                                textAlign: "center",
                                font: "10pt helvetica, arial, sans-serif",
                                stroke: "#333333",
                                editable: true
                            },
                            new go.Binding("text", "text").makeTwoWay())
                    )
                );

            // Make link labels visible if coming out of a "conditional" node.
            // This listener is called by the "LinkDrawn" and "LinkRelinked" DiagramEvents.
            function showLinkLabel(e) {
                var label = e.subject.findObject("LABEL");
                if (label !== null) label.visible = (e.subject.fromNode.data.figure === "Diamond");
            }

            // temporary links used by LinkingTool and RelinkingTool are also orthogonal:
            micro_process_diagram.toolManager.linkingTool.temporaryLink.routing = go.Link.Orthogonal;
            micro_process_diagram.toolManager.relinkingTool.temporaryLink.routing = go.Link.Orthogonal;


            // initialize the Palette that is on the left side of the page
            //myPalette =
            //    $(go.Palette, "myPalette",  // must name or refer to the DIV HTML element
            //        {
            //            "animationManager.duration": 800, // slightly longer than default (600ms) animation
            //            nodeTemplateMap: micro_process_diagram.nodeTemplateMap  // share the templates used by micro_process_diagram
            //        });

            micro_process_diagram.addDiagramListener("ObjectSingleClicked",
                function(e) {
                    var part = e.subject.part;
                    if (!(part instanceof go.Link)) $scope.showMessage(part);
                });
            micro_process_diagram.addDiagramListener("BackgroundSingleClicked",
                function(e) {
                    $scope.$apply(function(){
                        $scope.rulesList=[];
                    });
                });
            //micro_process_diagram.model = go.Model.fromJson('{ "class": "go.GraphLinksModel","linkFromPortIdProperty": "fromPort","linkToPortIdProperty": "toPort"}');  // load an initial diagram from some JSON text
            //micro_process_diagram.model = go.Model.fromJson(JSON.stringify({ "class": "go.GraphLinksModel",
            //    "linkFromPortIdProperty": "fromPort",
            //    "linkToPortIdProperty": "toPort",
            //    "nodeDataArray": [
            //        {"category":"Start", "text":"Start", "key":"Start", "loc":"-342.828125 -454"},
            //        {"category":"Rectangle", "figure":"Rectangle", "text":"Process1", "key":"Process1", "loc":"-342.828125 -354"},
            //        {"category":"Diamond", "figure":"Diamond", "text":"Rule1", "key":"Rule1", "loc":"-329.828125 -259"},
            //        {"category":"Rectangle", "figure":"Rectangle", "text":"Process3", "key":"Process3", "loc":"-326.828125 -154"},
            //        {"category":"Rectangle", "figure":"Rectangle", "text":"Process4", "key":"Process4", "loc":"-326.828125 -54"},
            //        {"category":"End", "text":"End", "key":"End", "loc":"-326.828125 54"}
            //    ],
            //    "linkDataArray": [
            //        {"from":"Start", "to":"Process1", "fromPort":"B", "toPort":"T"},
            //        {"from":"Process1", "to":"Rule1", "fromPort":"B", "toPort":"T"},
            //        {"from":"Rule1", "to":"Process3", "fromPort":"B", "toPort":"T", "visible":true},
            //        {"from":"Rule1", "to":"Process4", "fromPort":"R", "toPort":"T", "visible":true ,text:"No"},
            //        {"from":"Process4", "to":"End", "fromPort":"B", "toPort":"T"}
            //    ]}));


        }

        function cxcommand(val) {
            var diagram = micro_process_diagram;
            if (!(diagram.currentTool instanceof go.ContextMenuTool)) return;
            switch (val) {
                case "Cut": diagram.commandHandler.cutSelection(); break;
                case "Copy": diagram.commandHandler.copySelection(); break;
                case "Paste": diagram.commandHandler.pasteSelection(diagram.lastInput.documentPoint); break;
                case "Delete": diagram.commandHandler.deleteSelection(); break;
                case "Color": changeColor(diagram); break;
            }
            diagram.currentTool.stopTool();
        }
// A custom command, for changing the color of the selected node(s).
        function changeColor(diagram) {
            // the object with the context menu, in this case a Node, is accessible as:
            var cmObj = diagram.toolManager.contextMenuTool.currentObject;
            // but this function operates on all selected Nodes, not just the one at the mouse pointer.
            // Always make changes in a transaction, except when initializing the diagram.
            diagram.startTransaction("change color");
            diagram.selection.each(function(node) {
                if (node instanceof go.Node) {  // ignore any selected Links and simple Parts
                    // Examine and modify the data, not the Node directly.
                    var data = node.data;
                    if (data.color === "red") {
                        // Call setDataProperty to support undo/redo as well as
                        // automatically evaluating any relevant bindings.
                        diagram.model.setDataProperty(data, "color", go.Brush.randomColor());
                    } else {
                        diagram.model.setDataProperty(data, "color", "red");
                    }
                }
            });
            diagram.commitTransaction("change color");
        }
        // Make all ports on a node visible when the mouse is over the node
        function showPorts(node, show) {
            var diagram = node.diagram;
            if (!diagram || diagram.isReadOnly || !diagram.allowLink) return;
            node.ports.each(function(port) {
                port.stroke = (show ? "white" : null);
            });
        }


        // Show the diagram's model in JSON format that the user may edit
        $scope.save=function() {
            //document.getElementById("mySavedModel").value = micro_process_diagram.model.toJson();
            $scope.mySavedModel = micro_process_diagram.model.toJson();
            micro_process_diagram.isModified = false;
        };

        $scope.page_load_completed=function() {
            if($scope.hide_diagram_data)
              $scope.load_micro_process_diagram($scope.hide_diagram_data);
        };

        $scope.set_workflow_diagram_for_process=function(process){
            alert(JSON.stringify(process))
            $scope.process_box_array=[];
            $scope.process_line_array=[];
            var maxx=0;
            var x=  -800;
            var y = -600;
            var data={};
            data.category="Start";
            data.text="Start";
            data.key="Start";
            data.demokey="Start";
            data.loc=x+" "+y;

            var line={from:"Start" , to:process[0].sfs_UIN};
            $scope.process_line_array.push(line);
            $scope.process_box_array.push(data);
            var j=0;

            process.forEach(function(row){

                var process_box_type;
                if(row.hethi_servicecode=='DaaS'){
                    process_box_type="Rectangledaas" ;
                }


                y= y+120;
                var data={};
                data.category="Rectangle";
                data.text=row.hethi_subservicecode;
                data.key=row.sfs_UIN;
                data.demokey=row.sfs_UIN;
                data.loc=x+" "+y;
                $scope.process_box_array.push(data);

                var i=1;
                if(row.micro_processes.length==0){
                    line={from:row.sfs_UIN };
                    $scope.process_line_array.push(line);
                };
                row.micro_processes.forEach(function(mp){
                    x=x+200;
                    data={};
                    data.category=process_box_type;
                    data.text=mp.micro_process_name;
                    data.key=mp.micro_process_id;
                    data.demokey=mp.sfs_UIN;
                    data.loc=x+" "+y;

                    if(i==1 ){

                        line={from:row.sfs_UIN ,to:mp.micro_process_id};
                        $scope.process_line_array.push(line);
                        line={from:mp.micro_process_id};
                        $scope.process_line_array.push(line);
                    }
                    else
                    {
                        var l=$scope.process_line_array.length - 1;
                        $scope.process_line_array[l].to=mp.micro_process_id;
                        line={from:mp.micro_process_id};
                        $scope.process_line_array.push(line);
                    }
                    i++;
                    $scope.process_box_array.push(data);

                });


                data={};
                data.category="Rectangle";
                data.text="Hand-off";
                data.key="End_"+row.hethi_subservicecode;
                data.demokey="End_"+row.hethi_subservicecode;
                x=x+200;
                data.loc=x+" "+y;
                $scope.process_box_array.push(data);
                var l=$scope.process_line_array.length - 1;
                $scope.process_line_array[l].to="End_"+row.hethi_subservicecode;
                if(x>maxx){
                    maxx=x;
                }
                x=  -800;

                j=j+1;
                if(process.length==j){

                    y= -600;
                    data={};
                    data.category="End";
                    data.text="End";
                    data.key="End";
                    data.demokey="End";
                    data.loc=maxx +100 +" "+y;
                    $scope.process_box_array.push(data);

                    line={from:"End_"+row.hethi_subservicecode , to:"End"};
                    $scope.process_line_array.push(line);

                }
                else
                {

                    line={from:"End_"+row.hethi_subservicecode , to:process[j].sfs_UIN};
                    $scope.process_line_array.push(line);

                }



            });
            var graph={ "class": "go.GraphLinksModel",
                "nodeDataArray": $scope.process_box_array,
                "linkDataArray":$scope.process_line_array
            };

            micro_process_diagram.model=go.Model.fromJson(graph);


        };
        $scope.load_micro_process_diagram=function(process) {
            alert(JSON.stringify(process));
            $scope.hide_diagram_data=process;
            if($scope.hide_diagram == false){

                var process_box_type;
                var loc;
                if(process.hethi_servicecode=='DaaS'){
                    process_box_type="Rectangledaas" ;
                }
                var arr= [
                    {"loc":"-800 -400"},
                    {"loc":"-600 -400"},
                    {"loc":"-400 -400"},
                    {"loc":"-200 -400"},
                    {"loc":"-0 -400"},
                    {"loc":"200 -400"},
                    {"loc":"400 -400"},
                    {"loc":"600 -400"},
                    {"loc":"800 -400"},
                ];

                $scope.micro_p_array=[];
                $scope.micro_l_array=[];

                var data={};

                data.category="Start";
                data.text="Start";
                data.key="Start";
                data.demokey="Start";
                data.loc=arr[0].loc;
                $scope.micro_p_array.push(data);
                var i=1;
                process.micro_processes.forEach(function(row){
                    loc=""
                    data={};
                    data.category=process_box_type;
                    data.text=row.micro_process_name;
                    data.key=row.micro_process_id;
                    data.demokey=row.sfs_UIN;
                    data.loc=arr[i].loc;

                    if(i==1){
                        var line={from:"Start",to:row.micro_process_id};
                        $scope.micro_l_array.push(line);
                            line={from:row.micro_process_id};
                        $scope.micro_l_array.push(line);
                    }
                    else
                    {
                        $scope.micro_l_array[i-1].to=row.micro_process_id;
                        line={from:row.micro_process_id};
                        $scope.micro_l_array.push(line);
                    }
                    i++;
                    $scope.micro_p_array.push(data);

                });


                data={};
                data.category="End";
                data.text="End";
                data.key="End";
                data.demokey="End";
                data.loc=arr[i].loc;
                $scope.micro_p_array.push(data);
                $scope.micro_l_array[i-1].to="End";

                var graph={ "class": "go.GraphLinksModel",
                    "nodeDataArray": $scope.micro_p_array,
                    "linkDataArray":$scope.micro_l_array
                };

                console.log(JSON.stringify(graph));
                micro_process_diagram.model=go.Model.fromJson(graph);



            }
            else{
                alert('first time ,please click load');
                $scope.hide_diagram=false;

            }
        }


        $scope.load=function() {

            $scope.init();

            var a={ "class": "go.GraphLinksModel",
                "nodeDataArray": [
                    {"category":"Rectangledaas", "text":"daas.inventory", "key":"csfs100101", "demokey":"csfs100101", "loc":"-601.9610283430231 -412.5255813953484"},
                    {"category":"Start", "text":"Start", "key":"Start", "loc":"-808.9610283430227 -412.5255813953486"},
                    {"category":"Rectangledaas", "text":"daas.fullextract", "key":"csfs100102", "demokey":"csfs100102", "loc":"-365.9610283430234 -412.5255813953489"},
                    {"category":"Rectangledaas", "text":"daas.classify", "key":"csfs100103", "demokey":"csfs100103", "loc":"-158.96102834302283 -412.5255813953487"},
                    {"category":"Rectangledaas", "text":"daas.index", "key":"csfs100104", "demokey":"csfs100104", "loc":"13.038971656977125 -412.52558139534864"},
                    {"category":"Rectangledaas", "text":"daas.split_merge", "key":"csfs100105", "demokey":"csfs100105", "loc":"187.03897165697697 -412.52558139534847"},
                    {"category":"Rectangledaas", "text":"daas.extract", "key":"csfs100106", "demokey":"csfs100106", "loc":"610.0389716569767 -412.52558139534904"},
                    {"category":"Rectangledaas", "text":"daas.batch", "key":"csfs100107", "demokey":"csfs100107", "loc":"609.0389716569767 -321.5255813953487"},
                    {"category":"Rectangledaas", "text":"daas.keywise", "key":"csfs100108", "demokey":"csfs100108", "loc":"196.71084665697686 -321.73488372093027"},
                    {"category":"End", "text":"End", "key":"End", "loc":"-816.9984556686043 -322.7348837209302"}
                ],
                "linkDataArray": [
                    {"from":"Start", "to":"csfs100101", "points":[-783.7517260174415,-412.5255813953488,-773.7517260174415,-412.5255813953488,-724.2370890548091,-412.5255813953488,-724.2370890548091,-412.5255813953483,-674.7224520921768,-412.5255813953483,-664.7224520921768,-412.5255813953483]},
                    {"from":"csfs100102", "to":"csfs100103", "points":[-301.1996045938695,-412.5255813953487,-291.1996045938695,-412.5255813953487,-258.2110283430231,-412.5255813953487,-258.2110283430231,-412.5255813953487,-225.22245209217672,-412.5255813953487,-215.22245209217672,-412.5255813953487]},
                    {"from":"csfs100103", "to":"csfs100104", "points":[-102.69960459386877,-412.5255813953487,-92.69960459386877,-412.5255813953487,-69.21102834302282,-412.5255813953487,-69.21102834302282,-412.525581395349,-45.722452092176866,-412.525581395349,-35.722452092176866,-412.525581395349]},
                    {"from":"csfs100104", "to":"csfs100105", "points":[61.800395406131074,-412.525581395349,71.80039540613107,-412.525581395349,89.0389716569771,-412.525581395349,89.0389716569771,-412.52558139534864,106.27754790782312,-412.52558139534864,116.27754790782312,-412.52558139534864]},
                    {"from":"csfs100105", "to":"csfs100106", "points":[257.80039540613103,-412.52558139534864,267.80039540613103,-412.52558139534864,407.03897165697697,-412.52558139534864,407.03897165697697,-412.52558139534875,546.277547907823,-412.52558139534875,556.277547907823,-412.52558139534875]},
                    {"from":"csfs100106", "to":"csfs100107", "points":[610.038971656977,-393.4641576461948,610.038971656977,-383.4641576461948,610.038971656977,-367.0255813953488,609.0389716569769,-367.0255813953488,609.0389716569769,-350.58700514450277,609.0389716569769,-340.58700514450277]},
                    {"from":"csfs100107", "to":"csfs100108", "points":[559.7775479078228,-321.5255813953488,549.7775479078228,-321.5255813953488,406.87490915697686,-321.5255813953488,406.87490915697686,-321.7348837209302,263.97227040613086,-321.7348837209302,253.97227040613086,-321.7348837209302]},
                    {"from":"csfs100101", "to":"csfs100102", "points":[-539.1996045938688,-412.5255813953483,-529.1996045938688,-412.5255813953483,-484.9610283430231,-412.5255813953483,-484.9610283430231,-412.5255813953487,-440.7224520921774,-412.5255813953487,-430.7224520921774,-412.5255813953487]},
                    {"from":"csfs100108", "to":"End", "points":[139.4494229078229,-321.7348837209302,129.4494229078229,-321.7348837209302,-328.3500977757395,-321.7348837209302,-328.3500977757395,-322.73488372093027,-786.1496184593019,-322.73488372093027,-796.1496184593019,-322.73488372093027]}
                ]};

            micro_process_diagram.model=go.Model.fromJson(a);
            //micro_process_diagram.model = go.Model.fromJson(document.getElementById("mySavedModel").value);

        };







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