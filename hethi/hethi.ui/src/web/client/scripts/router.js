'use strict';


var hethi=angular.module('hethi',['ngRoute','AxelSoft','dndLists','ngAnimate','ui.bootstrap']);

var routeConfig=function($provide,$locationProvider,$routeProvider){
    $provide.decorator( "$route", routeDecorator );
    // I augment the $route service - the original delegate ($route) is
    // returned, but with additional methods.
    function routeDecorator( $delegate ) {
        // Create a familiar short-hand for the delegate.
        var $route = $delegate;
        // I remove a defined route at the given path.
        $route.remove = function( path ) {
            // Normalize the path by removing any trailing slash - when
            // AngularJS sets up a route, it creates an auto-redirect from
            // your route to the other version (with or without a slash,
            // depending on what you defined); we need to delete your path
            // and the auto-redirect path.
            path = path.replace( /\/$/i, "" );
            // Delete your path and the auto-redirect version.
            delete( this.routes[ path ] );
            delete( this.routes[ path + "/" ] );
            return( this );
        };
        $route.removeAll = function() {
            for (var path in this.routes) {
                this.remove(path);
            }
            return( this );
        };
        // This provides a short-hand to removing the current route without
        // having to access the current route in the calling context.
        $route.removeCurrent = function() {
            return( this.remove( this.current.originalPath ) );
        };
        // I allow routes to be defined after the application has been
        // bootstrapped. These go into a shared "routes" collection.
        $route.when = function( path, route ) {
            $routeProvider.when( path, route );
            return( this );
        };
        $route.otherwise = function(route ) {
            $routeProvider.otherwise(route );
            return( this );
        };
        // Return the decorated service.
        return( $route );
    }
    $locationProvider.html5Mode(true);

    $routeProvider.when('/hethistudio_admin',{
        templateUrl:'pages/hethistudio/admin/admin_home.html' ,
        controller:'admin_home_controller'
    });


    $routeProvider.when('/hethistudio_artist',{
        templateUrl:'pages/hethistudio/artist/home_page.html'
    });
    $routeProvider.when('/sign_up',{
        templateUrl:'pages/sign_up.html',
        controller:'signUpController'
    });
    $routeProvider.when('/forgot_password',{
        templateUrl:'pages/forgot_password.html',
        controller:'forgotPasswordController'
    });
    $routeProvider.when('/signin',{
        templateUrl:'pages/signin.html',
        controller:'forgotPasswordController'
    });
    $routeProvider.when('/Details',{
        templateUrl:'pages/details.html',
        controller:'detailsController'
    });
    $routeProvider.when('/Form_Mapper',{
        templateUrl:'pages/form_mapper.html',
        controller:'form_MapperController'
    });
    $routeProvider.when('/Upload',{
        templateUrl:'pages/wizard.html',
        controller:'form_MapperController'
    });
    $routeProvider.when('/Workflow_Studio',{
        templateUrl:'pages/Workflow.html',
        controller:'appHomeController'
    });
    $routeProvider.when('/registration',{
        templateUrl:'pages/registration.html',
        controller:'registrationController'
    });
    $routeProvider.when('/content',{
        templateUrl:'pages/content.html',
        controller:'contentController'
    });
    $routeProvider.when('/content_workflow',{
        templateUrl:'pages/content-Copy.html',
        controller:'contentController'
    });
    $routeProvider.when('/TaskList',{
        templateUrl:'pages/taskList.html',
        controller:'taskListController'
    });
    $routeProvider.when('/Role',{
        templateUrl:'pages/role.html',
        controller:'roleController'
    });
    $routeProvider.when('/Group',{
        templateUrl:'pages/group.html',
        controller:'roleController'
    });
    $routeProvider.when('/Delegation',{
        templateUrl:'pages/delegation.html',
        controller:'delegationController'
    });
    $routeProvider.when('/WorkItem',{
        templateUrl:'pages/work_item.html',
        controller:'workItemController'
    });
    $routeProvider.when('/WorkFlow',{
        templateUrl:'pages/work_flow.html',
        controller:'workFlowController'
    });

    $routeProvider.when('/Home',{
        templateUrl:'pages/customer/home.html',
        controller:'appHomeController'
    });

    $routeProvider.when('/extract',{
        templateUrl:'pages/hethistudio/tasks/extract.html',
        controller:'task_home_Controller'
    });

    $routeProvider.when('/Preview',{
        templateUrl:'pages/customer/show_preview.html',
        controller:'client_home_Controller'
    });

    $routeProvider.when('/StartWorkflow',{
        templateUrl:'pages/customer/start_workflow.html',
        controller:'hethi_artist_home_Controller'
    });
    $routeProvider.when('/Hethi',{
        templateUrl:'pages/hethi/home.html',
        controller:'hethi_home_Controller'
    });
    $routeProvider.when('/Stencil',{
        templateUrl:'pages/customer/task/extract_wizard/extract_wizard.html',
        controller:'hethi_home_Controller'
    });

    $routeProvider.when('/registration',{
        templateUrl:'pages/registration/registration.html',
        controller:'hethi_home_Controller'
    });

    $routeProvider.when('/newbinbox',{
        templateUrl:'pages/formowner/newbusinessartisinbox.html',
        controller:'hethi_home_Controller'
    });

    $routeProvider.when('/freemium_package',{
        templateUrl:'pages/freemium/freemium_package.html'
    });
    $routeProvider.when('/showinvoiceform',{
        templateUrl:'pages/freemium/freemium_show_invoice_form.html'
    });
    $routeProvider.when('/customer_cloud',{
        templateUrl:'pages/freemium/freemium_customer_cloud_play.html'
    });
    $routeProvider.when('/indexdemography',{
        templateUrl:'pages/freemium/freemium_index_business_demography.html'
    });


    $routeProvider.when('/assigntobartist',{
        templateUrl:'pages/hethistudio/admin/assign_to_business_artist.html',
        controller:'admin_select_bps'
    });

    
    $routeProvider.when('/free',{
        templateUrl:'pages/free/free_package.html',
        controller:'hethi_home_Controller'
    });

    $routeProvider.when('/thankyou',{
        templateUrl:'pages/thank_you_business_admin.html',
        controller:'hethi_home_Controller'
    });

    $routeProvider.when('/selectbps',{
        templateUrl:'pages/formbundle/selectbps.html',
        controller:'hethi_home_Controller'
    });

    $routeProvider.when('/selectbps_frmowner',{
        templateUrl:'pages/newbusinessartisinbox.html',
        controller:'hethi_home_Controller'
    });

    $routeProvider.when('/formplayindexformtypepreview',{
        templateUrl:'pages/formowner/form_play_indexformtypepreview.html',
        controller:'hethi_home_Controller'
    });
    $routeProvider.when('/formplay_createnewlob',{
        templateUrl:'pages/formowner/form_play_createnewformlob.html',
        controller:'hethi_home_Controller'
    });

    $routeProvider.when('/formplay_stencilunknown',{
        templateUrl:'pages/formowner/classifyandstencilunknowformsandowner.html',
        controller:'hethi_home_Controller'
    });
    $routeProvider.when('/formplay_thankyoubartist',{
        templateUrl:'pages/formowner/form_owner_thankyoubusinessartist.html',
        controller:'hethi_home_Controller'
    });



    $routeProvider.when('/formbundle_thankyoubartist',{
        templateUrl:'pages/formbundle/formbundle_thankyoubusinessartist.html',
        controller:'hethi_home_Controller'
    });

    $routeProvider.when('/thankyoubusinessadmin',{
        templateUrl:'pages/hethistudio/admin/thank_you_business_admin.html',
        controller:'admin_select_bps'
    });


    $routeProvider.when('/newreg',{
        templateUrl:'pages/newreg/regnew.html',
        controller:'hethi_home_Controller'
    });

    $routeProvider.when('/stdadmin',{
        templateUrl:'pages/hethistudio/admin/home_page.html',
        controller:'hethi_home_Controller'
    });

    $routeProvider.when('/newsingle',{
        templateUrl:'pages/formbundle/singleepo+expense_new.html',
        controller:'appHomeController'
    });

    $routeProvider.when('/formplaymulti',{
        templateUrl:'pages/formbundle/formplay_multi.html',
        controller:'hethi_home_Controller'
    });

    $routeProvider.when('/classify_selectbps',{
        templateUrl:'pages/hethistudio/admin/classify_selectbps.html',
        controller:'admin_select_bps'
    });

    $routeProvider.when('/',{
        templateUrl:'pages/landing.html'
    });

    $routeProvider.when('/configure_data_service',{
        templateUrl:'pages/freemium/configure_data_service.html',
        controller:'hethi_home_Controller'
    });
    $routeProvider.when('/define_storage',{
        templateUrl:'pages/freemium/define_storage.html',
        controller:'hethi_home_Controller'
    });
    $routeProvider.when('/service_level_agreement',{
        templateUrl:'pages/freemium/service_level_agreement.html',
        controller:'hethi_home_Controller'
    });

    $routeProvider.when('/Select_your_data_services',{
        templateUrl:'pages/freemium/Select_your_data_services.html',
        controller:'BPaas_upload_controller'
    });

    $routeProvider.when('/artisthome',{
        templateUrl:'pages/hethistudio/artist/artist_home.html',
        controller:'hethi_home_Controller'
    });
    $routeProvider.when('/user_home',{
        templateUrl:'pages/hethi/home_page.html',
        controller:'BPaas_upload_controller'
    });
    $routeProvider.when('/artist_home',{
        templateUrl:'pages/formowner/newbusinessartisinbox.html',
        controller:'hethi_home_Controller'
    });
    $routeProvider.when('/freemium',{
        templateUrl:'pages/design/freemium_wizard.html',
        controller:'design_Controller'
    });
    $routeProvider.when('/ImageControl',{
        templateUrl:'pages/design/image_control.html',
        controller:'image_Controller'
    });
    $routeProvider.when('/ImageMagick',{
        templateUrl:'pages/design/image_magick.html',
        controller:'image_Controller'
    });
    $routeProvider.when('/User_Creation',{
        templateUrl:'pages/design/user_profile_creation.html',
        controller:'design_Controller'
    });
    $routeProvider.when('/Tree',{
        templateUrl:'pages/design/treeView.html',
        controller:'treeController'
    });
    $routeProvider.when('/BusinessProcess',{
        templateUrl:'pages/hethistudio/admin/business_process1.html',
        controller:'businessProcessController'
    });
    $routeProvider.when('/cloud_plug',{
        templateUrl:'pages/free/cloud_plug.html',
        controller:'appHomeController'
    });
    $routeProvider.when('/Banner',{
        templateUrl:'pages/NewHome.html',
        controller:'NewHomeController'
    });
    $routeProvider.when('/Contact',{
        templateUrl:'pages/contact.html',
        controller:'NewHomeController'
    });
    $routeProvider.when('/verify',{
        templateUrl:'pages/verification.html',
        controller:'verificationController'
    });
    $routeProvider.when('/verifyUser',{
        templateUrl:'pages/userVerification.html',
        controller:'userVerificationController'
    });

};

hethi.config(routeConfig);
hethi.run(function($rootScope,$location,$http,$route,logger){

//alert('work reminder: \n  pending stencil artist_home.html @ LN:925 ');


    $rootScope.refillRoute=function() {
        $http.get("scripts/routedata.json").success(function (data) {
            var iLoop = 0, currentRoute;
            for (iLoop = 0; iLoop < data.records.length; iLoop++) {
                currentRoute = data.records[iLoop];
                var routeName = currentRoute.KeyName;
                $route.when(routeName, {
                    templateUrl: currentRoute.PageUrls
                });
            }
            $route.otherwise({
                redirectTo: "/"
            });
            $route.reload();
        });

    };
    $rootScope.refillRoute();

    $rootScope.spring_rest_service='http://localhost:9999';


    //$rootScope.spring_rest_service='http://server:999';

    $rootScope.createCookie=function(name,value,days) {
        if (days) {
            var date = new Date();
            date.setTime(date.getTime()+(days*24*60*60*1000));
            var expires = "; expires="+date.toGMTString();
        }
        else var expires = "";
        document.cookie = name+"="+value+expires+"; path=/";
    };

    $rootScope.readCookie=function(name) {
        var nameEQ = name + "=";
        var ca = document.cookie.split(';');
        for(var i=0;i < ca.length;i++) {
            var c = ca[i];
            while (c.charAt(0)==' ') c = c.substring(1,c.length);
            if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
        }
        return null;
    };

    $rootScope.eraseCookie=function(name) {
        $rootScope.createCookie(name,"",-1);
    };

    $rootScope.checkCookie=function() {
        var hethi_secret_key=$rootScope.readCookie('hethi_secret_key');
        if (hethi_secret_key!="" && hethi_secret_key!= "null" && hethi_secret_key!=undefined) {
            $rootScope.loginedUserData=JSON.parse(hethi_secret_key);
            $rootScope.homepage_chooser=$rootScope.loginedUserData.role_id;
            //$rootScope.homepage_url=""+$rootScope.loginedUserData.role_homepage
            //alert($rootScope.homepage_chooser);
            $rootScope.isSigned=true;
        }
        else
        {
            $rootScope.loginedUserData=[];
            $rootScope.homepage_chooser=0;
            $rootScope.isSigned=false;
            //$location.path('/');
        }
    };
    $rootScope.checkCookie();


    $rootScope.generatePreview=function(data){

        if(data.stencil_id!=0){
            $http({
                method: 'POST',
                url: $rootScope.spring_rest_service+'/stencilservices/preview_efs',
                dataType:'jsonp',
                data:{form_stencid:data.stencil_id}
            }).success(function(res) {
                if (res[0][0].result == "Success"){
                    $rootScope.previewContainer=res[0][0];
                    $http({
                        method: 'GET',
                        url: res[0][0].eFS_XSD_location
                    }).success(function(xml){
                        console.log("xml : "+xml);
                        var x2js = new X2JS();
                        $rootScope.previewContainer.data=data;
                        $rootScope.previewContainer.metadata= x2js.xml_str2json(xml );
                        console.log("xml2Js : "+JSON.stringify($rootScope.previewContainer.metadata.fieldset.field));
                        $rootScope.previewContainer.metadata=  $rootScope.previewContainer.metadata.fieldset.field;
                        if($rootScope.previewContainer.metadata.length==undefined){
                            var temp=$rootScope.previewContainer.metadata;
                            $rootScope.previewContainer.metadata=[temp];
                        }
                    });
                }
                else
                {
                    $rootScope.previewContainer=false;
                }
            });
        }
        else
        {

            alert("stenciling not completed");
            alert("Please try later");
        }

    };

    $rootScope.setPath=function(p) {
       $location.path(p);
        console.log('path change to '+p)
    };


});


