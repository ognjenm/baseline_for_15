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







}]).
    controller('verificationController', ['$http','$scope','$filter','$location','$rootScope','logger','base64', function ($http,$scope,$filter,$location,$rootScope,logger,base64){
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

        })


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

    $scope.loadCustomerList=function() {

        $scope.selectIndexer = function(page) {
//        logger.log(page) ;
//            alert(page);
            //var end=$scope.filteredCustomerList.length, start=0;
            var start = (page - 1) * $scope.numPerPageIndexer;
            var end = start + $scope.numPerPageIndexer;
            return $scope.currentPageCustomerList = $scope.filteredCustomerList.slice(start, end);
        };
        $scope.onFilterChangeIndexer = function() {
            $scope.selectIndexer(1);
            $scope.currentPageIndexer = 1;
            //return $scope.rowIndexer = '';
        };
        $scope.onNumPerPageChangeIndexer = function(i) {
            $scope.numPerPageIndexer=(i);
            $scope.selectIndexer(1);
            return $scope.currentPageIndexer = 1;
        };
        $scope.onOrderChangeIndexer = function() {
            $scope.selectIndexer(1);
            return $scope.currentPageIndexer = 1;
        };
        $scope.searchIndexer = function() {
            $scope.filteredCustomerList = $filter('filter')($scope.customerUploadsList, $scope.searchKeywordsIndexer);
            //alert(JSON.stringify($scope.filteredCustomerList));
            return $scope.onFilterChangeIndexer();
        };
        $scope.orderIndexer = function(rowName) {
            if ($scope.rowIndexer === rowName) {
                return;
            }
            $scope.rowIndexer = rowName;
            $scope.filteredCustomerList = $filter('orderBy')($scope.customerUploadsList, rowName);
            return $scope.onOrderChangeIndexer();
        };
        $scope.numPerPageOptIndexer = [3, 5, 10, 20];
        $scope.numPerPageIndexer = $scope.numPerPageOptIndexer[1];
        $scope.currentPageIndexer = 1;
        $scope.filteredCustomerList = [];
        $scope.init = function() {
            $scope.searchIndexer();
            return $scope.selectIndexer($scope.currentPageIndexer);
        };
        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service + '/loadCustomerList',
            dataType: 'jsonp'
        }).success(function (data) {
            if (data[0][0].result != "No Data") {
                $scope.customerUploadsList = data[0];
                //alert(JSON.stringify(data));
                $scope.init();
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
    $rootScope.open_classify_forms=function(form){
        $http({method: 'POST',
            url: $rootScope.spring_rest_service+'/load_artist_list',
            dataType:'jsonp'
        }).success(function(data) {
            $scope.artistData=data[0];
        });
    };
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
    $scope.main_tabs={'service & delivery':'', 'platform as a service':'', 'infrastructure as a service' :''};
    $scope.select_main_tab=function(tab){
        $scope.selected_main_tab=tab;
        //assign selected tab to query string
        $location.search({setTab:tab});
        //make selected tab active;
        for(var k in  $scope.main_tabs){
            if(tab==k){
                $scope.main_tabs[k]='active';
            }
            else
            {
                $scope.main_tabs[k]='';
            }
        }
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
                row.isActive='btn-success';
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

    $scope.load_artist_list=function(){
        $http({method: 'POST',
            url: $rootScope.spring_rest_service+'/load_artist_list',
            dataType:'jsonp'
        }).success(function(data) {
            $scope.artistData=data[0];
        });
    };

    $scope.load_artist_list();
    $scope.load_all_forms();


}])
    .directive('ngFileModel',[
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