'use strict';


hethi.controller('hethi_home_Controller', ['$http','$scope','$rootScope','$location','logger', function ($http,$scope,$rootScope,$location,logger){

    if($rootScope.hethiUserTab==undefined){
        $rootScope.hethiUserTab='dashboard';
    };
    if($rootScope.StencilTab==undefined){
        $rootScope.StencilTab='1';
    };
    $rootScope.hideDocument=function(file){
        var hideInput={
            fileid:file.file_id,
            uploadid:file.upload_id,
            userid:$rootScope.loginedUserData.user_id,
            nextqueue:404
        };
        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service+'/updatedocumentque',
            dataType:'jsonp',
            data: hideInput
        }).success(function(data) {
            var input={
                'userid':$rootScope.loginedUserData.user_id,
                'status':"0"
            };
            $http({
                method: 'POST',
                url: $rootScope.spring_rest_service+'/load_document',
                dataType:'jsonp',
                data: input
            }).success(function(data){
                if (data[0][0].result == "Success"){
                    $scope.stencilingPendingList=data[0];

                }
                else{
                    $scope.stencilingPendingList=false;
                }
            });

        });
    };
    $scope.GoToHome=true;

    $scope.chooseOpt=function(){
        $scope.GoToHome=false;
        $scope.showCloud=false;
        $scope.ShowUpload=false;
    };
    $scope.showCloudplug=function(){
      $scope.GoToHome=true;
        $scope.showCloud=true
    };
    $scope.showUpload=function(){
        $scope.GoToHome=true;
        $scope.ShowUpload=true
    };
    $rootScope.selectHethiUserTab=function(tab){
        $rootScope.hethiUserTab=tab;
    };
    $rootScope.selectStencilTab=function(tab){
        $rootScope.StencilTab=tab;
    };
    $scope.continueHide=false;
    $scope.uploadHide=true;
    if(($location.$$path!="/free")&&($location.$$path!="/")) {
        var input = {
            'userid': $rootScope.loginedUserData.user_id,
            'status': "0"
        };
        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service + '/load_document',
            dataType: 'jsonp',
            data: input
        }).success(function (data) {
            if (data[0][0].result == "Success") {
                $scope.stencilingPendingList = data[0];
            }
            else {
                $scope.stencilingPendingList = false;
            }
        });
        var input = {
            'customer_id': $rootScope.loginedUserData.customer_id
        };
        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service + '/load_userlist',
            dataType: 'jsonp',
            data: input
        }).success(function (data) {
            $rootScope.userlist = data;
        });
    }
        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service + '/load_home_content',
            dataType: 'jsonp',
            data: input
        }).success(function (data) {


            if (data[0][0].result == "Success") {
                $scope.business_process_list = data[0];
                $scope.BpaaS_Service_categories = _.groupBy($scope.business_process_list, function (elemet) {
                    return elemet.BpaaS_id;
                });
                $scope.BpaaS_Service_List = [];
                var i = 0;
                for (var Service_key in $scope.BpaaS_Service_categories) {
                    i++;
                    $scope.BpaaS_Service_List_industry = [];
                    $scope.BpaaS_Service_categories_currentRow = $scope.BpaaS_Service_categories[Service_key];
                    var currentRow = $scope.BpaaS_Service_categories_currentRow[0];
                    $scope.BpaaS_Service_categories_industry_list = _.groupBy($scope.BpaaS_Service_categories_currentRow, function (elemet) {
                        return elemet.indus_id;
                    });
                    for (var industry_key in $scope.BpaaS_Service_categories_industry_list) {
                        $scope.BpaaS_Service_List_industry_forms = [];
                        $scope.BpaaS_Service_categories_industry_list_currentRow = $scope.BpaaS_Service_categories_industry_list[industry_key];
                        var industry_currentRow = $scope.BpaaS_Service_categories_industry_list_currentRow[0];

                        $scope.BpaaS_Service_categories_industry_form_list = _.groupBy($scope.BpaaS_Service_categories_industry_list_currentRow, function (elemet) {
                            return elemet.efslob_id;
                        });
                        for (var efslob_key in $scope.BpaaS_Service_categories_industry_form_list) {
                            $scope.BpaaS_Service_categories_industry_form_list_currentRow = $scope.BpaaS_Service_categories_industry_form_list[efslob_key];
                            var efslob__currentRow = $scope.BpaaS_Service_categories_industry_form_list_currentRow[0];
                            $scope.BpaaS_Service_categories_industry_form_list_currentRow.forEach(function (row) {
                                $scope.BpaaS_Service_List_industry_forms.push(row);
                            });


                        }
                        var industryData = {
                            indus_service: industry_currentRow.indus_service,
                            industry_decription_short: industry_currentRow.industry_decription_short,
                            industry_decription_long: industry_currentRow.industry_decription_long,
                            industry_image_id: industry_currentRow.industry_image_id,
                            industry_status: industry_currentRow.industry_status,
                            industry_image_type_id: industry_currentRow.industry_image_type_id,
                            industry_image_path: industry_currentRow.industry_image_path,
                            industry_image_alt_text: industry_currentRow.industry_image_alt_text,
                            industry_form_list: $scope.BpaaS_Service_List_industry_forms
                        }
                        $scope.BpaaS_Service_List_industry.push(industryData);


                    }
                    var active_class = false;
                    if (i == 1) {
                        active_class = true;
                    }
                    else {

                    }
                    var data = {
                        BpaaS_id: Service_key,
                        BpaaS_service: currentRow.BpaaS_service,
                        BpaaS_service_image_id: currentRow.BpaaS_service_image_id,
                        BpaaS_service_description_short: currentRow.BpaaS_service_description_short,
                        BpaaS_service_description_long: currentRow.BpaaS_service_description_long,
                        BpaaS_service_status: currentRow.BpaaS_service_status,
                        BpaaS_service_image_type_id: currentRow.BpaaS_service_image_type_id,
                        BpaaS_service_image_path: currentRow.BpaaS_service_image_path,
                        BpaaS_service_image_alt_text: currentRow.BpaaS_service_image_alt_text,
                        BpaaS_service_industry_list: $scope.BpaaS_Service_List_industry,
                        class: active_class
                    };

                    $scope.BpaaS_Service_List.push(data);

                }
                //logger.log(JSON.stringify( $scope.BpaaS_Service_List))
                $scope.selectedBpaaS = $scope.BpaaS_Service_List[0];
                $scope.selectedIndustryList=$scope.selectedBpaaS.BpaaS_service_industry_list[0];
                $scope.selectedBpaaS.BpaaS_service_industry_list[0].class=true;
            }
            else {
                $scope.business_process_list = false;
            }
        });

        var myVar = setInterval(timeout, 5000);

        function timeout() {

            var status = false;
            $scope.BpaaS_Service_List.forEach(function (res, i) {
                $scope.$apply(function () {
                    if (res.class && !status) {
                        status = true;
                        $scope.BpaaS_Service_List[i].class = false;
                        if ($scope.BpaaS_Service_List.length == (i + 1)) {
                            $scope.selectedBpaaS = $scope.BpaaS_Service_List[0];
                            $scope.selectedIndustryList=$scope.selectedBpaaS.BpaaS_service_industry_list[0];
                            $scope.BpaaS_Service_List[0].class = true;
                            $scope.selectedBpaaS.BpaaS_service_industry_list[0].class=true;
                        } else {
                            $scope.selectedBpaaS = $scope.BpaaS_Service_List[i + 1];
                            $scope.selectedIndustryList=$scope.selectedBpaaS.BpaaS_service_industry_list[0];
                            $scope.BpaaS_Service_List[i + 1].class = true;
                            $scope.selectedBpaaS.BpaaS_service_industry_list[0].class=true;
                        }
                        //logger.log(JSON.stringify( $scope.BPS))
                    }
                });
            });

        }

    $scope.select_business_process=function(c){
        $(document).ready(function(){
            $('html, body').animate({
                scrollTop: $("#selectform").offset().top -90
            }, 1000);
        });
        clearInterval(myVar);
        $scope.BpaaS_Service_List.forEach(function(res,i) {
            $scope.BpaaS_Service_List[i].class = false;
        });
        $scope.BpaaS_Service_List[c].class = true;
        $scope.selectedBpaaS=$scope.BpaaS_Service_List[c];
        $scope.selectedIndustryList=$scope.selectedBpaaS.BpaaS_service_industry_list[0];
        $scope.selectedBpaaS.BpaaS_service_industry_list[0].class=true;

    };
    //$(document).ready(function() {
    //    $("#owl-demo").owlCarousel({
    //        autoPlay: 3000,
    //        items : 4,
    //        itemsDesktop : [1199,3],
    //        itemsDesktopSmall : [979,3]
    //    });
    //
    //});
    //var owl = $("#owl-demo2");
    //$scope.carouselInitializer = function() {
    //    owl.owlCarousel({
    //        items: 1,
    //        navigation: false,
    //        pagination: false,
    //        afterAction : afterAction,
    //        autoPlay: true
    //        ,navigationText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"]
    //    });
    //};
    var owl = $("#owl-demo");
    $scope.carouselInitializer = function() {
        owl.owlCarousel({
            autoPlay: 3000,
                    items : 4,
                    itemsDesktop : [1199,3],
                    itemsDesktopSmall : [979,3]
            //,navigationText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"]
        });
    };
    //,
    //animateOut: 'slideOutDown',
    //    smartSpeed:450,
    //    animateIn: 'flipInX'
    function updateResult(pos,value){
        $scope[pos]=value;
    }
    function afterAction(){
        updateResult("owlItems", this.owl.owlItems.length);
        updateResult("currentItem", this.owl.currentItem);
        updateResult("prevItem", this.prevItem);
        updateResult("visibleItems", this.owl.visibleItems);
        updateResult("dragDirection", this.owl.dragDirection);
    }
    $scope.stopClick =function(i) {
        owl.stop();
        logger.log($scope.currentItem);
    };

    $scope.showFormsOfIndustry=function(industry,c){
        //$scope.focusElement = "input1";
        //haseeb
        $(document).ready(function(){
            $('html, body').animate({
                scrollTop: $("#industry_form").offset().top -120
            }, 1000);
        });

        clearInterval(myVar);
        $scope.selectedBpaaS.BpaaS_service_industry_list.forEach(function(res,i) {
            $scope.selectedBpaaS.BpaaS_service_industry_list[i].class = false;
        });
        $scope.selectedBpaaS.BpaaS_service_industry_list[c].class = !$scope.selectedBpaaS.BpaaS_service_industry_list[c].class;
        $scope.selectedIndustryList=$scope.selectedBpaaS.BpaaS_service_industry_list[c];


    };
    $scope.selectForms=function(forms,c){

        clearInterval(myVar);
        $scope.selectedIndustryList.industry_form_list.forEach(function(res,i) {
            $scope.selectedIndustryList.industry_form_list[i].class = false;
        });
        $scope.selectedIndustryList.industry_form_list[c].class = !$scope.selectedIndustryList.industry_form_list[c].class;
        $scope.selectedForms=$scope.selectedIndustryList.industry_form_list[c];
    };
    $scope.continueClick=function(){
        if($scope.selectedForms!=undefined){$scope.uploadHide=false;}else{logger.log('Select a Form')}
        $(document).ready(function () {

            $(window).scrollTop(0);
            return false;

        });
    };
    $rootScope.startStenciling=function(file){
        $rootScope.fileStencilingData=file;
        $location.path('Stencil');
    };
    $rootScope.showImagePreview=function(file){
       window.location.href=file.file_location;
    };
    $scope.shoI=false;
    $scope.showI=function(){
      $scope.shoI=true;
    };

    //$http({
    //    method: 'POST',
    //    url: $rootScope.spring_rest_service+'/getindustryformfieldlist',
    //    dataType:'jsonp',
    //    data:{industryid:1}
    //}).success(function(data) {
    //    if(data[0][0].length!=0){
    //        $rootScope.formDatakeys=data[0];
    //    }
    //    else
    //    {
    //        logger.log('no field data');
            $rootScope.formDatakeys=[{"fielddisplayname":"Vendor Company Name","fieldvalue":"VendorCompanyName"},{"fielddisplayname":"Vendor Street Address","fieldvalue":"VendorStreetAddress"},{"fielddisplayname":"Vendor City ","fieldvalue":"VendorCity "},{"fielddisplayname":"Vendor State","fieldvalue":"VendorState "},{"fielddisplayname":"Vendor ZipCode","fieldvalue":"VendorZip "},{"fielddisplayname":"Vendor Phone","fieldvalue":"VendorPhone "},{"fielddisplayname":"Vendor Email","fieldvalue":"VendorEmail "},{"fielddisplayname":"Supplier Company Name","fieldvalue":"SupplierCompanyName"},{"fielddisplayname":"Supplier Street Address","fieldvalue":"SupplierStreetAddress"},{"fielddisplayname":"Supplier City","fieldvalue":"SupplierCity "},{"fielddisplayname":"Supplier State","fieldvalue":"SupplierState "},{"fielddisplayname":"Supplier ZipCode","fieldvalue":"SupplierZip "},{"fielddisplayname":"Supplier Phone","fieldvalue":"SupplierPhone "},{"fielddisplayname":"Supplier Email ","fieldvalue":"SupplierEmail "},{"fielddisplayname":"ShipTo Company Name","fieldvalue":"ShipToCompanyName"},{"fielddisplayname":"ShipTo Street Address","fieldvalue":"ShipToStreetAddress"},{"fielddisplayname":"ShipTo City" ,"fieldvalue":"ShipToCity"},{"fielddisplayname":"ShipTo State","fieldvalue":"ShipToState "},{"fielddisplayname":"ShipTo ZipCode" ,"fieldvalue":"ShipToZip "},{"fielddisplayname":"ShipTo Phone" ,"fieldvalue":"ShipToPhone "},{"fielddisplayname":"ShipTo Email ","fieldvalue":"ShipToEmail "},{"fielddisplayname":"Invoice Date","fieldvalue":"InvoiceDate"},{"fielddisplayname":"Invoice Number","fieldvalue":"InvoiceNumber"},{"fielddisplayname":"Purchase Order Number","fieldvalue":"PONumber"},{"fielddisplayname":"Item","fieldvalue":"Item"},{"fielddisplayname":" Description","fieldvalue":"Description"},{"fielddisplayname":" Unit Price","fieldvalue": "Rate"},{"fielddisplayname":" Quantity","fieldvalue": "Quantity"},{"fielddisplayname":" Line Total","fieldvalue": "LineTotal"},{"fielddisplayname":"Subtotal","fieldvalue":"Subtotal"},{"fielddisplayname":" Sales Tax","fieldvalue": "SalesTax"},{"fielddisplayname":" Shipping & Handling Charge","fieldvalue":"S&H"},{"fielddisplayname":" Discount","fieldvalue": "Discount"},{"fielddisplayname":" Total","fieldvalue": "Total"}];
    //    }
    //
    //});
    $scope.loadDefaultValues=function(){
        $scope.field_attributes={classify:"yes",split:"no",merge:"no",reject:"yes"};
        $scope.fieldData='';
    };
    $scope.loadDefaultValues();
    $rootScope.stenciledFieldList=[];

    $rootScope.addFieldCoords=function(){
       if($scope.fieldData.fieldvalue!=undefined) {
           var x1=$('#x1').val(),
               x2=$('#x2').val(),
               y1=$('#y1').val(),
               y2=$('#y2').val(),
               w =$('#w').val(),
               h =$('#h').val();

           var n=$scope.fieldData.fieldvalue;
           var data={"name":n,"form_coords":{"top":x1,"left":y1,"width":w,"height":h},classify:$scope.field_attributes.classify,split:$scope.field_attributes.split,merge:$scope.field_attributes.merge,reject:$scope.field_attributes.reject};
           $scope.stenciledFieldList.push(data);
           //logger.log(JSON.stringify($scope.stenciledFieldList))
               $('#x1').val("");
               $('#x2').val("");
               $('#y1').val("");
               $('#y2').val("");
               $('#w').val("");
               $('#h').val("");
           destroySelection();
           $scope.loadDefaultValues();
       }
        else
       {
           logger.log('Please select field name');
       }

    };
    $rootScope.removeFieldCoords=function(i){
        $scope.stenciledFieldList.splice(i,1);
    };
    $rootScope.getMetadata=function(){
        $rootScope.generatePreview($rootScope.fileStencilingData);
    };
    $rootScope.completedStenciling=function(){
        //$rootScope.previewContainer
        var input={
            'uploadid':$rootScope.fileStencilingData.upload_id,
            'fileid':$rootScope.fileStencilingData.file_id,
            userid:$rootScope.loginedUserData.user_id,
            nextqueue:10  //stenciling completed
        };
        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service+'/updatedocumentque',
            dataType:'jsonp',
            data:input
        }).success(function(res) {
            if (res[0][0].result == "Success"){

                logger.log('completed');
                $location.path('Hethi');
            }
            else{
                logger.log('failed');
            }



        });
    };
    $rootScope.completeStenciling=function(){
        if($rootScope.stenciledFieldList.length!=0)
        {
            $rootScope.selectStencilTab(2);

        }
        else{
            logger.log('Please map form');
        }
    };
    $rootScope.completeStencilingProcess=function(){
        if($rootScope.stenciledFieldList.length!=0)
        {
            var jsData={"root":{"field":$rootScope.stenciledFieldList}};
            var x2js =new X2JS();
            var xml=x2js.json2xml_str(jsData)
            logger.log(xml);
            var input={
                documentpath:$rootScope.fileStencilingData.file_location,
                xml:xml
            };
            $http.defaults.headers.post["Content-Type"] = "application/json";
            $http.post('/get_form_metadata',input).success(function(resp) {

                logger.log(JSON.stringify(resp));
                var formdata=[{"value":"New World Company","name":"VendorCompanyName"},{"value":"Floor 100 ,Main Street","name":"VendorStreetAddress"},{"value":"Global City ","name":"VendorCity "},{"value":"Global land","name":"VendorState "},{"value":"1000","name":"VendorZip "},{"value":"(09) 9999 99999","name":"VendorPhone "},{"value":"Graham H Smith","name":"SupplierCompanyName"},{"value":"12 South Road","name":"SupplierStreetAddress"},{"value":"Global city East","name":"SupplierCity "},{"value":"Global land","name":"SupplierState "},{"value":"1001","name":"SupplierZip "},{"value":"(09) 88888 999999","name":"SupplierPhone "},{"value":"Christepher Jones","name":"ShipToCompanyName"},{"value":"254 East Road","name":"ShipToStreetAddress"},{"value":"Global City" ,"name":"ShipToCity"},{"value":"SGlobal Land","name":"ShipToState "},{"value":"1002" ,"name":"ShipToZip "},{"value":"26/06/2001","name":"InvoiceDate"},{"value":"859652","name":"InvoiceNumber"},{"value":"98750-96","name":"PONumber"},{"value":"APIAPT103","name":"Item"},{"value":" Baamboo Blinds","name":"Description"},{"value":" 1020.00","name": "Rate"},{"value":" 10","name": "Quantity"},{"value":"10200.00","name": "LineTotal"},{"value":"10200.00","name":"Subtotal"},{"value":"95643","name": "SalesTax"},{"value":" 10200.00","name": "Total"}];
                var input={
                    'userid':$rootScope.loginedUserData.user_id,
                    'uploadid':$rootScope.fileStencilingData.upload_id,
                    'fileid':$rootScope.fileStencilingData.file_id,
                    'formdata': JSON.stringify(formdata),
                     ixml:xml

                };
                //
                $http({
                    method: 'POST',
                    url: $rootScope.spring_rest_service+'/save_formdata',
                    dataType:'jsonp',
                    data:input
                }).success(function(data) {
                    if (data[0][0].result == "Success"){
                        $rootScope.selectStencilTab(3);
                        $rootScope.getMetadata();
                    }
                    else
                    {
                        logger.log('unable to submit formdata, please try again');
                    }
                //
                //
                });


            });

        }
        else{
            logger.log('Please map form');
        }
    };
    $rootScope.isSigned=false;
    $scope.SignInToHethi=function(signin){
        var signIn_input={
            username:signin.username,
            password:signin.password
        };
        $http({
            method: 'POST',
            url: 'http://localhost:9999/signIn',
            dataType:'jsonp',
            data: signIn_input
        }).success(function(data) {
            if(data[0][0].result=="Success") {
                logger.log("Successfully signed in");
                var secret = JSON.stringify(data[0][0]);
                if (signin.remember == true) {

                    $rootScope.createCookie('hethi_secret_key', secret, 30);
                }
                else {
                    $rootScope.createCookie('hethi_secret_key', secret, 30);
                }

                $rootScope.checkCookie();
                console.log("secret :" + secret);
                $rootScope.isSigned=true;
            }
            else{
                logger.log("Invalid Username or Password");
            }

        });
    };

    $scope.RegisterToHethi=function(register){
        if(register.password==register.verify_password) {
            var register_input = {
                customer_name: register.customer_name,
                contact_name: register.contact_name,
                password: register.password,
                contact_number: register.contact_number,
                business_name: register.business_name,
                user_login_id: register.user_login_id,
                business_email: register.business_email
            };
            $http({
                method: 'POST',
                url: $rootScope.spring_rest_service+'/register',
                dataType: 'jsonp',
                data: register_input
            }).success(function (data) {
                if(data[0][0].result=="Success") {
                    logger.log("Successfully signed in");
                    var secret = JSON.stringify(data[0][0]);
                    $rootScope.createCookie('hethi_secret_key', secret, 30);
                    $rootScope.checkCookie();
                    console.log("secret :" + secret);
                    $rootScope.isSigned=true;
                }
                else{
                    logger.log("Invalid Username or Password");
                }

            });
        }else{
            logger.log("please verify your password..")
        }
    };

    $scope.UploadImage=function(files){

        var fd = new FormData();
        fd.append("file", files[0]);
        fd.append("user_id",$rootScope.loginedUserData.user_id);
        fd.append("customer_id",$rootScope.loginedUserData.customer_id);
        fd.append("efs_uin",$scope.selectedForms.efs_uin);

        $http.post($rootScope.spring_rest_service+'/dupload',fd,{transformRequest:angular.identity,headers:{"Content-Type":undefined}}).success(function(res) {


            logger.log(JSON.stringify(res[0][0].result))
            $scope.GoToHome=true;
            $location.path('/');

        });
        //$http.post("/imageUpload",fd,{transformRequest:angular.identity,headers:{"Content-Type":undefined}}).success(function(res) {
        //    logger.log(JSON.stringify(res));
            //if(res.status=="complete"){
            //    var documentpath=res.url;
            //    //logger.log(JSON.stringify($rootScope.loginedUserData));
            //    var input={
            //        'documentpath':documentpath,
            //        'userid':$rootScope.loginedUserData.user_id,
            //        'file_name':res.file_name,
            //        'file_type':res.file_type,
            //        'file_size':res.file_size,
            //        'BpaaS_id':$scope.selectedForms.BpaaS_id,
            //        'indus_id':$scope.selectedForms.indus_id,
            //        'form_stencid':$scope.selectedForms.form_stencid,
            //        'customer_id':$rootScope.loginedUserData.customer_id
            //    };
            //
            //
            //    $http({
            //        method: 'POST',
            //        url: $rootScope.spring_rest_service+'/upload_doc',
            //        dataType:'jsonp',
            //        data: input
            //    }).success(function(data) {
            //        $scope.GoToHome=true;
            //        //$location.path('/');
            //        //logger.log(JSON.stringify(data))
            //    });
            //}
            //else{
            //
            //}
            //


        //});
    };
    $scope.goToHomeClick=function(){
        $location.path('/');
    }


}]);
    //.directive('myFocus', function () {
    //    return {
    //        restrict: 'A',
    //        link: function postLink(scope, element, attrs) {
    //            if (attrs.myFocus == "") {
    //                attrs.myFocus = "focusElement";
    //            }
    //            scope.$watch(attrs.myFocus, function(value) {
    //                if(value == attrs.id) {
    //                    element[0].focus();
    //                }
    //            });
    //            element.on("blur", function() {
    //                scope[attrs.myFocus] = "";
    //                scope.$apply();
    //            })
    //        }
    //    };
    //});
