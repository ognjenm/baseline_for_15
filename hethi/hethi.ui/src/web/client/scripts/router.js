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

    $rootScope.spring_rest_service='http://sys1094-pc:9999';

    $rootScope.createCookie=function(name,value,days) {
        var expires = "";
        if (days) {

            var date = new Date();
            date.setTime(date.getTime()+(days*24*60*60*1000));
            expires = "; expires="+date.toGMTString();
        }

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

                        if(angular.isObject($rootScope.previewContainer.metadata.mxsd.form.header.group)){
                            $rootScope.previewContainer.metadata.mxsd.form.header.group=[$rootScope.previewContainer.metadata.mxsd.form.header.group]
                        };
                        if(angular.isObject($rootScope.previewContainer.metadata.mxsd.form.header.group[0].field)){
                            $rootScope.previewContainer.metadata.mxsd.form.header.group[0].field=[$rootScope.previewContainer.metadata.mxsd.form.header.group[0].field]
                        };
                        console.log("xml2Js : "+JSON.stringify($rootScope.previewContainer.metadata.mxsd.form.header.group[0].field));
                        $rootScope.previewContainer.metadata=  $rootScope.previewContainer.metadata.mxsd.form.header.group[0].field;
                        if($rootScope.previewContainer.metadata.length==undefined){
                            var temp=$rootScope.previewContainer.metadata;
                            $rootScope.previewContainer.metadata=temp;
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


