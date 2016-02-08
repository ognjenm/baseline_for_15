/**
 * Created by haseeb on 11/11/2015.
 */


'use strict';


hethi.controller('design_Controller', ['$http','$scope','$filter','$location','$rootScope','logger', function ($http,$scope,$filter,$location,$rootScope,logger){

    $scope.gotoHome=function(){

        $(window).ready(function(){
            $('html, body').animate({
                scrollTop: $("#home").offset().top -0
            }, 1000);
        });

    };

    $scope.divShow=false;
    $scope.tabText='addUser';
    //Tab Headings


    $scope.updateUserProfile=function(profile){
       profile['userName']=profile.name+profile.last_name;
       var json=new X2JS();
       var profileTempXml={ data: profile};
       var profile_xml = "<root>" + json.json2xml_str(profileTempXml) + "</root>";
       var input={
           data:profile_xml
       };
       $http({
           method: 'POST',
           url: $rootScope.spring_rest_service +'/profile_updation',
           dataType:'jsonp',
           data: input
       }).success(function(data) {
           $scope.comboFlag=false;
           var flag='';
           if(data[0][0].result=="Success") {
               logger.logSuccess('Profile updated..');
               var secret = JSON.stringify(data[0][0]);
               $rootScope.createCookie('hethi_secret_key', secret, 30);
               $rootScope.checkCookie();
           }
           else{
               logger.logError("User not registered");
           }
       });
   };
    $scope.addUser=function(user){

        var input={
            customer_id:$rootScope.customer_id,
            username:user.username,
            role:user.role
        };
        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service +'/addPlatformUser',
            dataType:'jsonp',
            data: input
        }).success(function(data) {
            if(data.result=='Success'){
                $scope.user=[];
                logger.logSuccess(data.result);
            }
            else{
                logger.logError(data.result);
            }

        });

    };
    $scope.checkPassword=function(user){
        $scope.showFlag=true;
        if(user.password.length>6){
            $scope.message1="Password is Strong";
            $scope.colorFlag=0;
        }
        else{
            $scope.message1="Password is not strong";
            $scope.colorFlag=1;
        }
    };
    $scope.prefix=true;
    $scope.checkRePassword=function(user){
        if(user.password.length>6){
            $scope.message1="Password is Strong";
            $scope.colorFlag=0;
        }
        else{
            $scope.message1="Password is not strong";
            $scope.colorFlag=1;
        }
        if(user.password.length < user.re_password.length){
            $scope.message2="Mismatch in password";
            $scope.colorFlag1=1;
            user.re_password='';
            $scope.showFlag=true;
        }
        else if(user.password!=user.re_password){
            $scope.message2="Mismatch in password";
            $scope.colorFlag1=1;
            $scope.showFlag=true;
        }
        else{
            $scope.message2="Password is match";
            $scope.colorFlag1=0;
            $scope.showFlag=false;
        }
    };
    $scope.changeRole=function(users,index){
        users.flagOn=false;
        $scope.currentIndex=index;
    };
    $scope.cur_index=0;
    $scope.saveChanges=function(index){
        $rootScope.availableRoles.forEach(function(rows,i){
            if(i==$scope.currentIndex){
                if(angular.isObject(rows.role_name)){
                    var role=rows.role_name;
                    rows.role_name=role.role_name;
                    rows.role_id=role.role_id;
                }
                rows.flagOn=true;
            }
        });
        var x2js =new X2JS();
        var xml=x2js.json2xml_str({"root":{"data":$rootScope.availableRoles[$scope.currentIndex]}});
        var userData={userData:xml};
        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service +'/updateRoleByAdmin',
            dataType:'jsonp',
            data:userData
        }).success(function(data) {
            $rootScope.availableRoles=data[0];
            logger.logSuccess('Role has updated..');
            $rootScope.availableRoles.forEach(function(row){
                row['flagOn']=true;
                row['length']=(row.role_name.length * 11)+'px';
            })
        });
    };
    $scope.changeSex=function(flag){
        $scope.namePrefix=flag;
    };
    $scope.loadUserDetails=function(){
        $rootScope.customerProfile=JSON.parse($rootScope.readCookie('hethi_secret_key'));
        $rootScope.customer_id=$rootScope.customerProfile.customer_id;
        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service +'/loadAvailableRoles',
            dataType:'jsonp',
            data:{customer_id:$rootScope.customer_id}
        }).success(function(data) {
            $rootScope.roleList=data[0];
            $rootScope.availableRoles=data[1];
            $rootScope.availableRoles.forEach(function(row){
                row['flagOn']=true;
                row['length']=(row.role_name.length * 11)+'px';
            })
        });
    };
    if($scope.isSigned)
       $scope.loadUserDetails();
    else logger.logError('please sign in first');
    $scope.comboFlag=false;
    $scope.showCombo=function(){
        $scope.comboFlag=true;
    };

    $scope.editProfile=function(){
        $rootScope.customerProfile=JSON.parse($rootScope.readCookie('hethi_secret_key'));
        $scope.profiles={};
        if($rootScope.customerProfile.user_prefix=='Mr'){
            $scope.namePrefix=true;
            $scope.profiles['name_prefix']='Mr'
        }
        else{
            $scope.namePrefix=false;
            $scope.profiles['name_prefix']='Mrs'
        }

        $scope.profiles['user_login_password']=$rootScope.customerProfile.user_login_password;
        $scope.profiles['business_address']=$rootScope.customerProfile.business_address;
        $scope.profiles['customer_id']=$rootScope.customerProfile.customer_id;
        $scope.profiles['lastupuser']=$rootScope.customerProfile.lastupuser;
        $scope.profiles['user_id']=$rootScope.customerProfile.user_id;
        $scope.profiles['role_description']=$rootScope.customerProfile.role_description;
        $scope.profiles['addressid']=$rootScope.customerProfile.addressid;
        $scope.profiles['role_homepage']=$rootScope.customerProfile.role_homepage;
        $scope.profiles['address_type']=$rootScope.customerProfile.address_type;
        $scope.profiles['role_id']=$rootScope.customerProfile.role_id;
        $scope.profiles['user_address']=$rootScope.customerProfile.user_address;


        $scope.profiles['name']=$rootScope.customerProfile.user_firstname;
        $scope.profiles['last_name']=$rootScope.customerProfile.user_lastname;
        $scope.profiles['business_name']=$rootScope.customerProfile.business_name;
        $scope.profiles['contact_name']=$rootScope.customerProfile.contact_name;
        $scope.profiles['contact_number']=$rootScope.customerProfile.contact_number;
        $scope.profiles['login_id']=$rootScope.customerProfile.user_login_id;
        $scope.profiles['role_name']=$rootScope.customerProfile.role_name;
        $scope.profiles['business_email']=$rootScope.customerProfile.business_email;
        $scope.profiles['business_fax']=$rootScope.customerProfile.business_fax;

        $scope.profiles['address1']=$rootScope.customerProfile.address1;
        $scope.profiles['address2']=$rootScope.customerProfile.address2;
        $scope.profiles['contact_email']=$rootScope.customerProfile.contact_email;
        $scope.profiles['contact_fax']=$rootScope.customerProfile.contact_fax;
        $scope.profiles['contact_tel']=$rootScope.customerProfile.contact_tel;
        $scope.profiles['country']=$rootScope.customerProfile.cust_country;

        $scope.profiles['location']=$rootScope.customerProfile.cust_loc_zip;
        $scope.profiles['gps_coords']=$rootScope.customerProfile.gps_coordinate;
        $scope.profiles['social_type']=$rootScope.customerProfile.contact_email;
        $scope.profiles['linkedin']=$rootScope.customerProfile.linkedin;
        $scope.profiles['whatsapp']=$rootScope.customerProfile.whatsapp;
    };
    $scope.configDataService="Capture";
    $scope.customiseWorkflow="Manage";
    $scope.DefineOutput="Deliver";
    $scope.ErpIntegration="Integrate";
    $scope.DefineAnalytics="Analytics";
    $scope.DefineStorage="Storage";
    $scope.Businessdemography="Demography";
    $scope.ServiceLevelAgrmnt="Summary";


    $scope.freemiumTab=1;
    $scope.selectWizard=function(step){
        $scope.freemiumTab=step;
    };

    $scope.goToFree=function(){
        //alert("Success");
        $location.path('/free')
    };

    $scope.myInterval = 5000;
    var slides = $scope.slides = [];
    $scope.slides = [
        {image: 'images/industry/retail.jpg',text: 'Kitten.'},
        {image: 'images/industry/retail.jpg',text: 'Kitty!'},
        {image: 'images/industry/retail.jpg',text: 'Cat.'},
        {image: 'images/industry/retail.jpg',text: 'Feline!'},
        {image: 'images/industry/POInventory.jpg',text: 'Cat.'},
        {image: 'images/industry/retail.jpg',text: 'Feline!'}
    ];
    //$scope.addSlide = function() {
    //    var newWidth = 600 + slides.length + 1;
    //    slides.push({
    //        image: 'http://placekitten.com/' + newWidth + '/300',
    //        text: ['More','Extra','Lots of','Surplus'][slides.length % 4] + ' ' +
    //        ['Cats', 'Kittys', 'Felines', 'Cutes'][slides.length % 4]
    //    });
    //};
    //for (var i=0; i<4; i++) {
    //    $scope.addSlide();
    //}



    //$scope.myInterval = 5000;
    //$scope.slides = [
    //    {image: 'images/industry/retail.jpg',text: 'Kitten.'},
    //    {image: 'images/industry/retail.jpg',text: 'Kitty!'},
    //    {image: 'images/industry/retail.jpg',text: 'Cat.'},
    //    {image: 'images/industry/retail.jpg',text: 'Feline!'},
    //    {image: 'images/industry/POInventory.jpg',text: 'Cat.'},
    //    {image: 'images/industry/retail.jpg',text: 'Feline!'}
    //];
    //
    //
    //$scope.$watch('slides', function(values) {
    //
    //    var i, a = [], b;
    //
    //
    //    for (i = 0; i < $scope.slides.length; i += 2) {
    //        b = { image1: $scope.slides[i] };
    //
    //        if ($scope.slides[i + 1]) {
    //            b.image2 = $scope.slides[i + 1];
    //        }
    //
    //        a.push(b);
    //    }
    //
    //    $scope.groupedSlides = a;
    //
    //}, true);


    //$scope.addSlide = function() {
    //    $scope.slides.push({
    //        image: 'http://placekitten.com/'+(200+25*Math.floor(Math.random()*4))+'/200',
    //        text: ['More','Extra','Lots of','Surplus'][Math.floor(Math.random()*4)] + ' ' +
    //        ['Cats', 'Kittys', 'Felines', 'Cutes'][Math.floor(Math.random()*4)]
    //    });
    //};


//    ****************************   WIZARD 3 Controls     *********************************************************************************************
    $scope.businessTab=1;
    $scope.selectBusiness=function(step){
        $scope.businessTab=step;
    };

    $scope.oneAtATime = true;
    $scope.status = {
        isFirstOpen: true,
        isFirstOpen1: true,
        isFirstOpen2: true,
        isFirstOpen3: true,
        isFirstOpen4: true,
        isFirstOpen5: true,
        isFirstOpen6: true
    };
    $scope.localeShow=true;

    $scope.showLocale=function(){
        $scope.localeShow=true;
    };
    $scope.nextBusinessCalender=function(){
        $scope.localeShow=false;
        $scope.calendarShow=true;
        $(document).ready(function(){
            $('html, body').animate({
                scrollTop: $("#locale").offset().top -9
            }, 1000);
        });
    };
    $scope.nextImageAspects=function(){
        //$scope.localeShow=false;
        $scope.calendarShow=false;
        $scope.imageShow=true;
        $(document).ready(function(){
            $('html, body').animate({
                scrollTop: $("#calender").offset().top -9
            }, 1000);
        });

    };
    $scope.nextDailyVolume=function(){
        $scope.imageShow=false;
        $scope.volumeShow=true;
        $(document).ready(function(){
            $('html, body').animate({
                scrollTop: $("#image").offset().top -9
            }, 1000);
        });

    };
    $scope.nextDeliveryAspects=function(){

        $scope.volumeShow=false;
        $scope.deliveryShow=true;
        $(document).ready(function(){
            $('html, body').animate({
                scrollTop: $("#volume").offset().top -9
            }, 1000);
        });
    };
    $scope.nextDefineCompliance=function(){
        $scope.deliveryShow=false;
        $scope.showCompliance=true;
        $(document).ready(function(){
            $('html, body').animate({
                scrollTop: $("#delivery").offset().top -9
            }, 1000);
        });
    }
//Configure Data Service

    $scope.IOChannelShow=true;

    $scope.InputChannel=function(){
        $scope.IOChannelShow=true;
    };
    $scope.nextInputFormat=function(){

        $scope.IOChannelShow=false;
        $scope.IOFormatShow=true;

    };
    $scope.nextOutputFormat=function(){

        //$scope.IOChannelShow=false;
        $scope.IOFormatShow=false;
        $scope.OutputContentShow=true;

    };
    $scope.nextOutputChannel=function(){

        $scope.OutputContentShow=false;
        $scope.OutputChannelShow=true;

    };
    $scope.fieldContainer=function(data){
    data=='false'?$scope.containerShow=false:$scope.containerShow=true;$scope.ContainerIndex=data;

};
    $scope.IOfieldContainer=function(data){
        data=='false'?$scope.InputcontainerShow=false:$scope.InputcontainerShow=true;$scope.InputContainerIndex=data;

    };
    $scope.row1=true;
    $scope.InputChannel=[{name:'Email',value:'no',fields:[
        {label:'serviceprovider',type:'text',value:''},
        {label:'Email',type:'email',value:''},
        {label:'Password',type:'password',value:''}
    ]},
        {name:'Fax',value:'no',fields:[
            {label:'Service Provider',type:'text',value:''},
            {label:'Fax Email Address',type:'text',value:''},
            {label:'Password',type:'text',value:''}
        ]},
        {name:'FTP',value:'no',fields:[
            {label:'Host Name',type:'text',value:''},
            {label:'Port No',type:'text',value:''},
            {label:'Ftp UserID',type:'text',value:''},
            {label:'Ftp Password',type:'text',value:''}
        ]},
        //{name:'FTP',value:'no',fields:[
        //    {label:'FTP Port',type:'text',value:''},
        //    {label:'Name',type:'text',value:''}
        //]},
        {name:'sFtp',value:'no',fields:[
            {label:'Host Name',type:'text',value:''},
            {label:'Port No',type:'text',value:''},
            {label:'sFtp UserID',type:'text',value:''},
            {label:'sFtp Password',type:'text',value:''}
        ]},
        //{name:'Web Upload',value:'no',fields:[
        //    {label:'URL',type:'text',value:''},
        //    {label:'Name',type:'text',value:''}
        //]},
        {name:'Web Service',value:'no',fields:[
            {label:'Proxy URL',type:'text',value:''},
            {label:'UserID',type:'text',value:''},
            {label:'Password',type:'text',value:''}
        ]}
        //{name:'JSON',value:'no',fields:[
        //    {label:'Port',type:'text',value:''},
        //    {label:'Name',type:'text',value:''}
        //]},
        //{name:'Cloud plug',value:'no',fields:[
        //    {label:'URL',type:'text',value:''},
        //    {label:'Name',type:'text',value:''}
        //]}
    ];
    $scope.InputFormat=[
        {name:'JPG',value:'no'},
        {name:'JPEG',value:'no'},
        {name:'TIF',value:'no'},
        {name:'PDF',value:'no'},
        {name:'MS-WORD',value:'no'},
        {name:'MS-EXCEL',value:'no'},
        {name:'ANSI',value:'no'},
        {name:'EDI',value:'no'}
    ];


    $scope.OutputChannelFieldContainer=function(data){
        data=='false'?$scope.OutputChannelContainer=false:$scope.OutputChannelContainer=true;$scope.OutputChannelContainerIndex=data;

    };
    $scope.OutPutChannel=[
        {name:'email',value:'no',fields:[
            {label:'Service Provider',type:'text',value:''},
            {label:'Email',type:'text',value:''},
            {label:'Password',type:'password',value:''}
        ]},
        {name:'fax',value:'no',fields:[
            {label:'Service Provider',type:'text',value:''},
            {label:'Fax Email',type:'text',value:''},
            {label:'Password',type:'text',value:''}
        ]},
        {name:'ftp',value:'no',fields:[
            {label:'Host Name',type:'text',value:''},
            {label:'Port No',type:'text',value:''},
            {label:'Ftp UserID',type:'text',value:''},
            {label:'Password',type:'password',value:''}
        ]},
        {name:'sftp',value:'no',fields:[
            {label:'Host Name',type:'text',value:''},
            {label:'Port No',type:'text',value:''},
            {label:'sFtp UserID',type:'text',value:''},
            {label:'Password',type:'password',value:''}
        ]},
        {name:'webservice',value:'no',fields:[
            {label:'Proxy URL',type:'url',value:''},
            {label:'UserID',type:'text',value:''},
            {label:'Password',type:'password',value:''}
        ]}
    ];

    $scope.OutPutFormat=[
        {name:'HML',value:'yes'},{name:'ANSI',value:'no'},
        {name:'EDI',value:'no'}
    ];


//User management ADD MODIFY DELETE TABLE DATA


    $scope.IsVisible = false;
    $scope.ShowHide = function () {
        //If DIV is visible it will be hidden and vice versa.
        $scope.IsVisible = $scope.IsVisible ? false : true;
        $scope.editBtn=false;

        $scope.IsVisibleBulkUser = false;

    };
    $scope.editBtn=false;
    $scope.edit=function(){
    $scope.IsVisible =true;
    $scope.editBtn=true;

    $(document).ready(function(){
        $('html, body').animate({
            scrollTop: $("#editScreen").offset().top -75
        }, 1000);
    });

};
    //Customise Workflow
    $scope.IsVisibleProcess = false;
    $scope.IsVisibleRule=false;
    $scope.showProcess = function () {
        //If DIV is visible it will be hidden and vice versa.
        $scope.IsVisibleProcess = $scope.IsVisibleProcess ? false : true;
        //$scope.editBtn=false;
    };
    $scope.showRules=function(){

        $scope.IsVisibleRule = $scope.IsVisibleRule ? false : true;

    };

    $scope.IsVisibleBulkUser = false;
    $scope.ShowHideBulkUser = function () {
        //If DIV is visible it will be hidden and vice versa.
        $scope.IsVisibleBulkUser = $scope.IsVisibleBulkUser ? false : true;
        $scope.IsVisible = false;
    };

    //Tab Controller

    //$scope.tabs = [
    //    {
    //        title: "Dynamic Title 1",
    //        content: "Dynamic content 1.  Consectetur adipisicing elit. Nihil, quidem, officiis, et ex laudantium sed cupiditate voluptatum libero nobis sit illum voluptates beatae ab. Ad, repellendus non sequi et at."
    //    }, {
    //        title: "Disabled",
    //        content: "Dynamic content 2.  Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil, quidem, officiis, et ex laudantium sed cupiditate voluptatum libero nobis sit illum voluptates beatae ab. Ad, repellendus non sequi et at.",
    //        disabled: true
    //    }
    //];
    //return $scope.navType = "pills";

    $scope.formImage=[
    {
        images:"images/industry/healthcare.jpg",
        service:"Business Process",
        industry:"Health Care",
        form:"form"
    },
    {
        images:"images/industry/lifeInsurance.jpg",
        service:"Business Process",
        industry:"life Insurance",
        form:"form"
    },
    {
        images:"images/industry/manufacturing.jpg",
        service:"Business Process",
        industry:"Manufacturing",
        form:"form"
    },
    {
        images:"images/industry/onlineBanking.jpg",
        service:"Business Process",
        industry:"Online Banking",
        form:"form"
    },
    {
        images:"images/industry/POInventory.jpg",
        service:"Business Process",
        industry:"Po Inventory",
        form:"form"
    },
    {
        images:"images/industry/retail.jpg",
        service:"Business Process",
        industry:"Retail",
        form:"form"
    }
];
    $scope.proceedFreemium=function(){
        alert("sdff")
        $(document).ready(function(){
            $('html, body').animate({
                scrollTop: $("#proceedBtn").offset().top -9
            }, 1000);
        });

    };



    // Pagination
    //    ****************************************************
    var init;

    $scope.exportData = function () {
        alasql('SELECT * INTO XLSX("export.xlsx",{headers:true}) FROM ?',[$scope.storesIndexer]);
    };
    $scope.exportCSV=function(){
        alasql("SELECT * INTO CSV('mydata.csv', {headers:true}) FROM ?",[$scope.storesIndexer]);
    };
    $scope.exportPDF=function(){
        alasql("SELECT * INTO PDF('mydata1.pdf', {headers:true}) FROM ?",[$scope.storesIndexer]);
    };

    $scope.storesIndexer = [
        {
            UserName: 'Willaims',
            Name: 'Mark William',
            Email: 'markwillaim@yahoo.com',
            Role: 'Manager',
            Status:'active',
            Posts:'ABC'
        }, {
            UserName: 'AfsalKhan',
            Name: 'Afsal',
            Email: 'afsal@gmail.com',
            Role: 'manager',
            Status:'active',
            Posts:'ABC'
        }, {
            UserName: 'JaseerAhmad',
            Name: 'Jaseer',
            Email: 'jaseerahmad@rediffmail.com',
            Role: 'Operator',
            Status:'active',
            Posts:'ABC'
        }, {
            UserName: 'Jacob',
            Name: 'Glen Jacob',
            Email: 'glenjacob@hotmail.com',
            Role: 'operator',
            Status:'active',
            Posts:'ABC'
        },  {
            UserName: 'Martin',
            Name: 'Joe Martin',
            Email: 'martinjoe@gmail.com',
            Role: 'PO',
            Status:'active',
            Posts:'ABC'
        }, {
            UserName: 'Shabeer',
            Name: 'Shabeer Muhammed',
            Email: 'shabeermuhammed@rediffmail.com',
            Role: 'Manager',
            Status:'active',
            Posts:'ABC'

        }
    ];

    $scope.searchKeywordsIndexer = '';
    $scope.filteredStoresIndexer = [];
    $scope.rowIndexer = '';


    $scope.selectIndexer = function(page) {
//        alert(page) ;

        var end, start;
        start = (page - 1) * $scope.numPerPageIndexer;
        end = start + $scope.numPerPageIndexer;
        return $scope.currentPageStoresIndexer = $scope.filteredStoresIndexer.slice(start, end);
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
        $scope.filteredStoresIndexer = $filter('filter')($scope.storesIndexer, $scope.searchKeywordsIndexer);
        return $scope.onFilterChangeIndexer();
    };
    $scope.orderIndexer = function(rowName) {
        if ($scope.rowIndexer === rowName) {
            return;
        }
        $scope.rowIndexer = rowName;
        $scope.filteredStoresIndexer = $filter('orderBy')($scope.storesIndexer, rowName);
        return $scope.onOrderChangeIndexer();
    };
    $scope.numPerPageOptIndexer = [3, 5, 10, 20];
    $scope.numPerPageIndexer = $scope.numPerPageOptIndexer[1];
    $scope.currentPageIndexer = 1;
    $scope.currentPageStoresIndexer = [];
    init = function() {
        $scope.searchIndexer();
        return $scope.selectIndexer($scope.currentPageIndexer);
    };



    return init();

//

    $scope.numPerPageOptIndexer


}]).controller('userVerificationController', ['$http','$scope','$filter','$location','$rootScope','logger','base64', function ($http,$scope,$filter,$location,$rootScope,logger,base64){
    $scope.listenVerivication=function(){

        var data=$rootScope.readCookie('hethi_secret_user_key');
        if(data!=null){
            var cookieData=JSON.parse(base64.decode(data));
            $rootScope.hethi_user_reg_data=cookieData;
        }
        else
        {
            $rootScope.hethi_user_reg_data=true;
            //alert('You do not have sufficient permissions to access this page');
            //logger.logWarning('You do not have sufficient permissions to access this page ,redirecting to homepage');
            //$location.path('/');

        }

    };
    $scope.completeRegistrationProcess=function(data){



        if(data.password == data.re_password){
            var signIn_input={
                username:data.userName,
                password:data.password
            };
            if(data.name_prefix==undefined)
              data.name_prefix='Mr';
            data.user_name=data.customer_fname+data.customer_lname;
            var x2js =new X2JS();
            var xml=x2js.json2xml_str({"root":{"data":data}});
            var userData={userData:xml};
            $http({
                method: 'POST',
                url: $rootScope.spring_rest_service +'/complete_user_registration',
                dataType:'jsonp',
                data: userData
            }).success(function(resp){
                if(resp[0][0].result=='Success'){
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

    };
    var qs=$location.$$search;
    $location.search({});
    if(qs.q!=undefined){
        $scope.today=new Date().getTime();
        var qString=qs.q;
        qString = qString.replace('-','=' ).replace('_',' ').replace("|","=+$");
        var temp=JSON.parse(base64.decode(qString));
        console.log(temp.tommorow+" "+$scope.today);
        if(temp.tommorow > $scope.today){
            alert('Sorry , link has expired..')
        }
        else{
            $rootScope.createCookie('hethi_secret_user_key', qString,1);
            $scope.listenVerivication();
        }


    }
    else
    {
        $scope.listenVerivication();
    }
    $scope.checkPassword=function(user){
        $scope.showFlag=true;
        if(user.password.length>6){
            $scope.message1="Password is Strong";
            $scope.colorFlag=0;
        }
        else{
            $scope.message1="Password is not strong";
            $scope.colorFlag=1;
        }
    };
    $scope.prefix=true;
    $scope.checkRePassword=function(user){
        if(user.password.length>6){
            $scope.message1="Password is Strong";
            $scope.colorFlag=0;
        }
        else{
            $scope.message1="Password is not strong";
            $scope.colorFlag=1;
        }
        if(user.password.length < user.re_password.length){
            $scope.message2="Mismatch in password";
            $scope.colorFlag1=1;
            user.re_password='';
            $scope.showFlag=true;
        }
        else if(user.password!=user.re_password){
            $scope.message2="Mismatch in password";
            $scope.colorFlag1=1;
            $scope.showFlag=true;
        }
        else{
            $scope.message2="Password is match";
            $scope.colorFlag1=0;
            $scope.showFlag=false;
        }
    };





}]).directive('ngFileModel',[
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
