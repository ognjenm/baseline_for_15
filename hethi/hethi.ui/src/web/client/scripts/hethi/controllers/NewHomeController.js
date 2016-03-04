

'use strict';


hethi.controller('NewHomeController', ['$http','$scope','$location','$rootScope', function ($http,$scope,$location,$rootScope){

    $(document).ready(function(){

        var _scroll = true, _timer = false, _floatbox = $("#contact_form"), _floatbox_opener = $(".contact-opener") ;
        _floatbox.css("right", "-300px"); //initial contact form position

        //Contact form Opener button
        _floatbox_opener.click(function(){
            if (_floatbox.hasClass('visiable')){
                _floatbox.animate({"right":"-300px"}, {duration: 300}).removeClass('visiable');
            }else{
                _floatbox.animate({"right":"0px"},  {duration: 300}).addClass('visiable');
            }
        });

        //Effect on Scroll
        $(window).scroll(function(){
            if(_scroll){
                _floatbox.animate({"top": "30px"},{duration: 300});
                _scroll = false;
            }
            if(_timer !== false){ clearTimeout(_timer); }
            _timer = setTimeout(function(){_scroll = true;
                _floatbox.animate({"top": "20%"},{easing: "linear"}, {duration: 500});}, 400);
        });

        //reset previously set border colors and hide all message on .keyup()
        $("#contact_form  input[required=true], #contact_form textarea[required=true]").keyup(function() {
            $(this).css('border-color','');
            $("#result").slideUp();
        });


    });


    $scope.pageClass = 'page-home';
    //Accordion
    $scope.oneAtATime = true;
    $rootScope.megaFixed=true;
$rootScope.hideMegaMenu=function(){

  $rootScope.megaFixed=false;

    $rootScope.navcolor='';
    $scope.BpaaSActive="";
    $scope.SimplifiedActive="";


};
    //Banner Read More

    $scope.getHethiCloudPlug=function(){
        $('html, body').animate({
            scrollTop: $("#hethiCloudPlug").offset().top -150
        }, 1000);
        $scope.BpaaSActive="";
        $scope.SimplifiedActive="";

        $scope.hethiCloudPlug=true;
        $scope.hethiBpaasStudio=false;
        $scope.hethiMPC=false;
        $scope.hethiCloudPlay=false;

        $scope.showPlatformBPaaS=false;
        $scope.showBusinessSimplified=false;

    };
    $scope.getHethiCloudplay=function(){
        $('html, body').animate({
            scrollTop: $("#hethiCloudPlay").offset().top -150
        }, 1000);
        $scope.BpaaSActive="";
        $scope.SimplifiedActive="";
        $scope.hethiCloudPlug=false;
        $scope.hethiBpaasStudio=false;
        $scope.hethiMPC=false;
        $scope.hethiCloudPlay=true;

        $scope.showPlatformBPaaS=false;
        $scope.showBusinessSimplified=false;
    };
    $scope.getHethiBpaasStudio=function(){
        $('html, body').animate({
            scrollTop: $("#hethiBpaasStudio").offset().top -150
        }, 1000);
        $scope.BpaaSActive="";
        $scope.SimplifiedActive="";

        $scope.hethiCloudPlug=false;
        $scope.hethiBpaasStudio=true;
        $scope.hethiMPC=false;
        $scope.hethiCloudPlay=false;

        $scope.showPlatformBPaaS=false;
        $scope.showBusinessSimplified=false;
    };
    $scope.getHethiBpaasMpc=function(){
        $('html, body').animate({
            scrollTop: $("#hethiMPC").offset().top -150
        }, 1000);

        $scope.BpaaSActive="";
        $scope.SimplifiedActive="";

        $scope.hethiCloudPlug=false;
        $scope.hethiBpaasStudio=false;
        $scope.hethiMPC=true;
        $scope.hethiCloudPlay=false;

        $scope.showPlatformBPaaS=false;
        $scope.showBusinessSimplified=false;
    };

    //Mega Menu
    $scope.showPlatformBPaaS=false;
    $scope.showBusinessSimplified=false;
    $scope.SimplifiedActive="";

    $scope.getBpaasBusinessSimplified=function(){

        //alert("business simplified")
        $rootScope.navcolor='topnavcolor';
        $rootScope.megaFixed=true;

        $scope.BpaaSActive="active";
        $scope.SimplifiedActive="";

        $scope.showPlatformBPaaS=true;
        $scope.showBusinessSimplified=false;

        $scope.hethiCloudPlug=false;
        $scope.hethiBpaasStudio=false;
        $scope.hethiMPC=false;
        $scope.hethiCloudPlay=false;



        $('html, body').animate({
            scrollTop: $("#section1").offset().top -150
        }, 1000);
    };

    $scope.getBpaasBusinessPlatform=function(){


        $rootScope.navcolor='topnavcolor';
        $rootScope.megaFixed=true;
        $scope.BpaaSActive="";
        $scope.SimplifiedActive="active";

        $scope.showPlatformBPaaS=false;
        $scope.showBusinessSimplified=true;

        $scope.hethiCloudPlug=false;
        $scope.hethiBpaasStudio=false;
        $scope.hethiMPC=false;
        $scope.hethiCloudPlay=false;


        $('html, body').animate({
            scrollTop: $("#section1").offset().top -150
        }, 1000);

    };


    //landing page menu
    $scope.cloudPlugShow=true;
    $scope.cloudPlayShow=false;
    $scope.bpaasMpcShow=false;
    $scope.bpaasStudioShow=false;
    $scope.botCampShow=false;

    $scope.networkActive="snav-label-selected";
    $scope.designStudioActive="";
    $scope.premiseActive="";
    $scope.deliveryActive="";
    $scope.botActive="";

    $scope.hethiColNwPActive="hethiColMenuActive";
    $scope.hethiColDsActive="";
    $scope.hethiColPmActive="";
    $scope.hethiColDrActive="";
    $scope.hethiColBotActive="";


    $scope.GotoNetwork=function(){
        $scope.cloudPlugShow=true;
        $scope.cloudPlayShow=false;
        $scope.bpaasMpcShow=false;
        $scope.bpaasStudioShow=false;
        $scope.botCampShow=false;


        $scope.hethiColNwPActive="hethiColMenuActive";
        $scope.hethiColDsActive="";
        $scope.hethiColPmActive="";
        $scope.hethiColDrActive="";
        $scope.hethiColBotActive="";


        $scope.networkActive="snav-label-selected";
        $scope.designStudioActive="";
        $scope.premiseActive="";
        $scope.deliveryActive="";
        $scope.botActive="";

    };
    $scope.GotoDesignStudio=function(){
        $scope.cloudPlugShow=false;
        $scope.cloudPlayShow=true;
        $scope.bpaasMpcShow=false;
        $scope.bpaasStudioShow=false;
        $scope.botCampShow=false;


        $scope.hethiColNwPActive="";
        $scope.hethiColDsActive="hethiColMenuActive";
        $scope.hethiColPmActive="";
        $scope.hethiColDrActive="";
        $scope.hethiColBotActive="";


        $scope.networkActive="";
        $scope.designStudioActive="snav-label-selected";
        $scope.premiseActive="";
        $scope.deliveryActive="";
        $scope.botActive="";

    };
    $scope.GotoPremises=function(){
        $scope.cloudPlugShow=false;
        $scope.cloudPlayShow=false;
        $scope.bpaasMpcShow=true;
        $scope.bpaasStudioShow=false;
        $scope.botCampShow=false;


        $scope.hethiColNwPActive="";
        $scope.hethiColDsActive="";
        $scope.hethiColPmActive="hethiColMenuActive";
        $scope.hethiColDrActive="";
        $scope.hethiColBotActive="";


        $scope.networkActive="";
        $scope.designStudioActive="";
        $scope.premiseActive="snav-label-selected";
        $scope.deliveryActive="";
        $scope.botActive="";

    };
    $scope.GotoDelivery=function(){
        $scope.cloudPlugShow=false;
        $scope.cloudPlayShow=false;
        $scope.bpaasMpcShow=false;
        $scope.bpaasStudioShow=true;
        $scope.botCampShow=false;


        $scope.hethiColNwPActive="";
        $scope.hethiColDsActive="";
        $scope.hethiColPmActive="";
        $scope.hethiColDrActive="hethiColMenuActive";
        $scope.hethiColBotActive="";

        $scope.networkActive="";
        $scope.designStudioActive="";
        $scope.premiseActive="";
        $scope.deliveryActive="snav-label-selected";
        $scope.botActive="";
    };
    $scope.GotoBotCamp=function(){
        $scope.cloudPlugShow=false;
        $scope.cloudPlayShow=false;
        $scope.bpaasMpcShow=false;
        $scope.bpaasStudioShow=false;
        $scope.botCampShow=true;

        $scope.hethiColNwPActive="";
        $scope.hethiColDsActive="";
        $scope.hethiColPmActive="";
        $scope.hethiColDrActive="";
        $scope.hethiColBotActive="hethiColMenuActive";

        $scope.networkActive="";
        $scope.designStudioActive="";
        $scope.premiseActive="";
        $scope.deliveryActive="";
        $scope.botActive="snav-label-selected";
    };

    // the angularjs for BPaaS platform services CODE for ng-show and ng-hide begins here

    $scope.enrollProcessSection=true;
    $scope.invoiceProcessSection=false;
    $scope.partnerProcessSection=false;

    $scope.enrollProcessActive="snav-label-selected";
    $scope.invoiceProcessActive="";
    $scope.PartnerProcessActive="";

    $scope.hethiColEPActive="hethiColMenuActive";
    $scope.hethiColIPActive="";
    $scope.hethiColPPActive="";

    $scope.GetEnrollProcessPay=function(){

        $scope.hethiColEPActive="hethiColMenuActive";
        $scope.hethiColIPActive="";
        $scope.hethiColPPActive="";

        $scope.enrollProcessActive="snav-label-selected";
        $scope.invoiceProcessActive="";
        $scope.PartnerProcessActive="";

        $scope.enrollProcessSection=true;
        $scope.invoiceProcessSection=false;
        $scope.partnerProcessSection=false;
    };
    $scope.GetInvoiceProcessPay=function(){

        $scope.hethiColEPActive="";
        $scope.hethiColIPActive="hethiColMenuActive";
        $scope.hethiColPPActive="";

        $scope.enrollProcessActive="";
        $scope.invoiceProcessActive="snav-label-selected";
        $scope.PartnerProcessActive="";

        $scope.enrollProcessSection=false;
        $scope.invoiceProcessSection=true;
        $scope.partnerProcessSection=false;
    };
    $scope.GetPartnerProcessPay=function(){

        $scope.hethiColEPActive="";
        $scope.hethiColIPActive="";
        $scope.hethiColPPActive="hethiColMenuActive";

        $scope.enrollProcessActive="";
        $scope.invoiceProcessActive="";
        $scope.PartnerProcessActive="snav-label-selected";

        $scope.enrollProcessSection=false;
        $scope.invoiceProcessSection=false;
        $scope.partnerProcessSection=true;
    };



    $scope.free=function(){
        $location.path('/free');
    };
    $scope.goToFree=function(){
        //alert("Success");
        $location.path('/free')
    };
    $scope.goToFreemium=function(){
        //alert("Success");
        $location.path('/freemium')
    };

}])
    .controller('generateRFI_Controller', ['$http','$scope','$location','$rootScope', function ($http,$scope,$location,$rootScope){


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

//        owl carousal

        $scope.items=[
            {
                name:"services & delivery",description:"BpaaS_service_description_short",image:"images/industry/retail.jpg"
            },
            {
                name:"platform as a service",description:"BpaaS_PO_service_description_short",image:"images/industry/manufacturing.jpg"
            }, {
                name:"infrastructure as a service",description:"BpaaS_PO_service_description_short",image:"images/industry/healthcare.jpg"
            }
        ];
        $scope.BpaaS_service_industry_list=[
            {indus_service:"bpaas services",fa:"fa-shopping-cart"},{indus_service:"locale management",fa:"fa-building"},
            {indus_service:"organization structure",fa:"fa-medkit"},{indus_service:"service level agreement",fa:"fa-bank"},
            {indus_service:"complaince",fa:"fa-cog"}
        ];

//        ng show and ng hide angular code starts here the CODE begins here
        $scope.bpServices=false;
        $scope.lmServices=false;
        $scope.ogServices=false;
        $scope.slaServices=false;
        $scope.cmpServices=false;

        $scope.bpS=function(){

            $scope.bpServices=true;
            $scope.lmServices=false;
            $scope.ogServices=false;
            $scope.slaServices=false;
            $scope.cmpServices=false;

            $scope.bpSRoundActive="ul_round_active";
            $scope.lmSRoundActive="";
            $scope.ogSRoundActive="";
            $scope.slARoundActive="";
            $scope.cmPRoundActive="";

            $scope.item_head=false;

            $scope.it_fixed="fixed";
            $scope.it_rd_fixed="rounded_item_fixed";

            $scope.round="";
            $scope.fixed_round="round-topics-fixed";
        };
        $scope.lmS=function(){
            $scope.bpServices=false;
            $scope.lmServices=true;
            $scope.ogServices=false;
            $scope.slaServices=false;
            $scope.cmpServices=false;

            $scope.bpSRoundActive="";
            $scope.lmSRoundActive="ul_round_active";
            $scope.ogSRoundActive="";
            $scope.slARoundActive="";
            $scope.cmPRoundActive="";

            $scope.item_head=false;
            $scope.it_fixed="fixed";
            $scope.it_rd_fixed="rounded_item_fixed";
            $scope.round="";
            $scope.fixed_round="round-topics-fixed";
        };
        $scope.ogS=function(){
            $scope.bpServices=false;
            $scope.lmServices=false;
            $scope.ogServices=true;
            $scope.slaServices=false;
            $scope.cmpServices=false;

            $scope.bpSRoundActive="";
            $scope.lmSRoundActive="";
            $scope.ogSRoundActive="ul_round_active";
            $scope.slARoundActive="";
            $scope.cmPRoundActive="";

            $scope.item_head=false;
            $scope.it_fixed="fixed";
            $scope.it_rd_fixed="rounded_item_fixed";
            $scope.round="";
            $scope.fixed_round="round-topics-fixed";
        };
        $scope.slA=function(){
            $scope.bpServices=false;
            $scope.lmServices=false;
            $scope.ogServices=false;
            $scope.slaServices=true;
            $scope.cmpServices=false;

            $scope.bpSRoundActive="";
            $scope.lmSRoundActive="";
            $scope.ogSRoundActive="";
            $scope.slARoundActive="ul_round_active";
            $scope.cmPRoundActive="";

            $scope.item_head=false;
            $scope.it_fixed="fixed";
            $scope.it_rd_fixed="rounded_item_fixed";
            $scope.round="";
            $scope.fixed_round="round-topics-fixed";
        };
        $scope.cmP=function(){
            $scope.bpServices=false;
            $scope.lmServices=false;
            $scope.ogServices=false;
            $scope.slaServices=false;
            $scope.cmpServices=true;

            $scope.bpSRoundActive="";
            $scope.lmSRoundActive="";
            $scope.ogSRoundActive="";
            $scope.slARoundActive="";
            $scope.cmPRoundActive="ul_round_active";

            $scope.item_head=false;
            $scope.it_fixed="fixed";
            $scope.it_rd_fixed="rounded_item_fixed";
            $scope.round="";
            $scope.fixed_round="round-topics-fixed";
        };



//        ng show and ng hide angular CODE ends here

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


        $scope.item_head=true;
        $scope.showRFIscreen=function(){



            //$scope.rfi_form=true;
            $('html, body').animate({
                scrollTop: $("#freemium_scroll_1").offset().top -90
            }, 1000);
            $scope.platform_as_services=false;
            $scope.services_and_delivery=true;
        };

        //    Services and delivery

        $scope.bpaasData=[{name:'PO inventory'},{name:'PO expense'},{name:'NPO'},
            {name:'NPO-Travel & Expense'},{name:'NPO-Claim & Reimbursements'}
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


    }])

.controller('freemium_Controller', ['$http','$scope','$location','$rootScope', function ($http,$scope,$location,$rootScope){

        $scope.pageClass = 'page-about';
        //$scope.hideSliderclass1='slider_1_class';


        $scope.isExistingCustomer=false;
        $scope.existingCustomerMenu=[
            {
                id:1,
                name:"my BPaaS",
                description:"Load your forms, uploaded,upload form  ,download cloudplug  ",image:"images/industry/retail.jpg",
                sub_menu:[
                    {
                        id:1.1,
                        name:"Download cloudplug",
                        description:"Load your forms, uploaded,upload form  ,download cloudplug  ",
                        image:"images/icon/cloud_plug.png",
                        fa:'fa-cloud'
                    },
                    {
                        id:1.2,
                        name:"connect service partner  ",
                        description:"connect service partner,",
                        image:"images/industry/POInventory.jpg",
                        fa:'fa-plus'
                    }
                ]
            },
            {
                id:2, name:"Try more forms / EDI ",description:"try  new forms,",image:"images/industry/POInventory.jpg"
            },
            {
                id:3, name:"Generate RFI ",description:" generate RFI  ",image:"images/ui/DentalPatientforms.jpg"
            }
        ];

        $scope.set_sub_menu=function(data){
            $('html, body').animate({

                scrollTop: $("#existCloudPlug").offset().top -90
            }, 1000);
            $scope.downloadExistCloudPlug=true;
            $scope.mainslider=true;
        };

        $scope.BpaaS_service_industry_list=[
            {indus_service:"retail",fa:"fa-shopping-cart"},{indus_service:"manufacturing",fa:"fa-building"},{indus_service:"health care",fa:"fa-medkit"},{indus_service:"banking",fa:"fa-bank"}
        ];


        $scope.pageClass = 'page-about';
        //$scope.hideSliderclass1='slider_1_class';
        var input = {
            'customer_id': $rootScope.loginedUserData.customer_id
        };

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

        $scope.load_customer_uploaded_forms=function(){

            $http({
                method: 'POST',
                url: $rootScope.spring_rest_service+'/load_customer_uploaded_forms',
                dataType:'jsonp',
                data: $rootScope.loginedUserData

            }).success(function(data){
                if($rootScope.isSigned){
                    $scope.customer_uploaded_list=data[2];
                    $scope.customer_uploaded_list.forEach(function(row){
                        row.files=[];
                        data[3].forEach(function(r){
                            if(r.upload_id==row.upload_id){
                                row.files.push(r);
                            }

                        });
                    });


                }
                else
                {
                    logger.logError('no previous uploads for this customer ');
                    $scope.customer_uploaded_list=false;
                }
            })

        };


        $scope.load_customer_uploaded_forms();

$rootScope.getRfiForm=function(){
    $location.path('/generateRFI');

};




        $scope.class = "center_div";
        $scope.slider="freeSlider";

        $scope.itemClass = "h_box";

        $scope.mainslider = true;
        $scope.showMainSlider=function(){

            $(window).ready(function(){
                $('html, body').animate({
                    scrollTop: $("#freeSlider").offset().top -90
                }, 1000);
            });
            $scope.one = false;
            $scope.mainslider = false;

            $scope.one = false;
            $scope.mainslider = false;
        };

        $scope.showOne = function (){

            $scope.one =true;
            $scope.mainslider = true;

        };
        $scope.one = false;

        $scope.IsVisible = false;
        $scope.ShowHide = function () {
            $scope.IsVisible = $scope.IsVisible ? false : true;

        };


        $scope.GotoUpload=function(){


            $('html, body').animate({

                scrollTop: $("#formUpload").offset().top -90
            }, 1000);
            $scope.uploadForm=true;
            $scope.one=false;
            $scope.showCSP=true;
        };
        $scope.uploadForm=false;
        $scope.downloadCloudPlug=false;
        $scope.existingCustomerItem=true;
        $scope.GotoCSP=function(){

            $('html, body').animate({

                scrollTop: $("#formCSP").offset().top -90
            }, 1000);
            $scope.existingCustomerItem=false;
            $scope.one=false;
            $scope.downloadCloudPlug=false;
            $scope.showCSP=true;

        };
        $scope.connectSP=true;
        $scope.ConnectServicePartner=function(){

            $scope.connectSP=false;
            $scope.uploadForms=true;
            $scope.RFI=false;
        };
        $scope.generateRFI=function(){
            $(document).ready(function(){
                $(this).scrollTop(0);
            });
            $scope.connectSP=false;
            $scope.uploadForms=false;
            $scope.RFI=true;
        };
        $scope.proceedSubmit=function(){
            $(document).ready(function(){
                $(this).scrollTop(0);
            });
            $scope.connectSP=false;
            $scope.uploadForms=false;
            $scope.RFI=false;
            $scope.ProceedToSubmit=true;
        };
    }])

    .controller('FreeController', ['$http','$scope','$location','$rootScope','$route','logger', function ($http,$scope,$location,$rootScope,$route,logger){


        $scope.isExistingCustomer=false;
        $scope.existingCustomerMenu=[
            {
                id:1,
                name:"my BPaaS",
                description:"Load your forms, uploaded,upload form  ,download cloudplug  ",image:"images/industry/retail.jpg",
                sub_menu:[
                    {
                        id:1.1,
                        name:"Download cloudplug",
                        description:"Load your forms, uploaded,upload form  ,download cloudplug  ",
                        image:"images/icon/cloud_plug.png",
                        fa:'fa-cloud'
                    },
                    {
                        id:1.2,
                        name:"connect service partner  ",
                        description:"connect service partner,",
                        image:"images/industry/POInventory.jpg",
                        fa:'fa-plus'
                    }
                    ]
            },
            {
                id:2, name:"Try more forms / EDI ",description:"try  new forms,",image:"images/industry/POInventory.jpg"
            },
            {
                id:3, name:"find a business partner ",description:"find new  business partner  ",image:"images/ui/DentalPatientforms.jpg"
            }
        ];

        $scope.set_sub_menu=function(data){
            $('html, body').animate({

                scrollTop: $("#existCloudPlug").offset().top -90
            }, 1000);
            $scope.downloadExistCloudPlug=true;
            $scope.mainslider=true;
        };

        $scope.BpaaS_service_industry_list=[
            {indus_service:"retail",fa:"fa-shopping-cart"},{indus_service:"manufacturing",fa:"fa-building"},{indus_service:"health care",fa:"fa-medkit"},{indus_service:"banking",fa:"fa-bank"}
        ];


        $scope.pageClass = 'page-about';
        //$scope.hideSliderclass1='slider_1_class';
        var input = {
            'customer_id': $rootScope.loginedUserData.customer_id
        };

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

        $scope.load_customer_uploaded_forms=function(){

            $http({
                method: 'POST',
                url: $rootScope.spring_rest_service+'/load_customer_uploaded_forms',
                dataType:'jsonp',
                data: $rootScope.loginedUserData

            }).success(function(data){
                if($rootScope.isSigned){
                    $scope.customer_uploaded_list=data[2];
                    $scope.customer_uploaded_list.forEach(function(row){
                        row.files=[];
                        data[3].forEach(function(r){
                            if(r.upload_id==row.upload_id){
                                row.files.push(r);
                            }

                        });
                    });


                }
                else
                {
                    logger.logError('no previous uploads for this customer ');
                    $scope.customer_uploaded_list=false;
                }
            })

        };


        $scope.load_customer_uploaded_forms();


        $scope.class = "center_div";
        $scope.slider="freeSlider";

        $scope.itemClass = "h_box";


        $scope.showMainSlider=function(){
            //$(window).ready(function(){
            //    $('html, body').animate({
            //        scrollTop: $("#freeSlider").offset().top -0
            //    }, 10000);
            //});
            $scope.one = false;
            //$scope.mainslider = false;
            $scope.uploadForm=false;

        };

        $scope.showOne = function (index){
            //$(window).ready(function(){
            //$scope.one? $('html, body').animate({
            //        scrollTop: $("#industry").offset().top -200
            //    }, 1000):
            //    $('html, body').animate({
            //        scrollTop: $("#industry").offset().top -100
            //    }, 1000);
            //});

            $scope.selectedBpaaS=$scope.BpaaS_Service_List[index];
            $scope.selectedIndustryList=$scope.selectedBpaaS.BpaaS_service_industry_list[0];
            $scope.one = true;
            //$scope.mainslider = true;


        };
        $scope.setMainTab = function (data){
            $scope.mainTab = data;
        };
        $scope.set_sub_menu = function (data){
            $scope.mainTab.selected_sub_tab =data;
            $scope.mainTab.sub_menu.forEach(function(row){
                row.is_active=false;
                if(row.id==data.id){
                    row.is_active=true;
                }

            });
            $('html, body').animate({

                scrollTop: $("#sub_menu").offset().top -90
            }, 1000);

        };
        $scope.one = false;

        $scope.IsVisible = false;
        $scope.ShowHide = function () {
            $scope.IsVisible = $scope.IsVisible ? false : true;

        };

        $scope.selectedFormsChanged=function(item){
            $scope.selectedForms=item;
        };
        $scope.selectedIndustryListChanged=function(item){
            $scope.selectedIndustryList=item;
        };
        $scope.GotoUpload=function(c){

            $('html, body').animate({

                scrollTop: $("#formUpload").offset().top -90
            }, 1000);
            $scope.uploadForm=true;
            //$scope.one=false;
            //$scope.selectedIndustry=$scope.selectedBpaaS;
            $scope.selectedIndustryList=$scope.selectedBpaaS.BpaaS_service_industry_list[c];
            //$scope.selectedIndustry=
            $scope.downloadCloudPlug=true;

        };
        $scope.downloadExistCloudPlug=false;
        $scope.GotoExistUpload=function(){
            $('html, body').animate({

                scrollTop: $("#existCloudPlug").offset().top -90
            }, 1000);
            $scope.downloadExistCloudPlug=true;
            $scope.mainslider=true;
        };

        $scope.UploadImage=function(files) {
            //alert($scope.selectedForms)
            if($rootScope.loginedUserData == ''||$rootScope.loginedUserData == undefined)
                logger.logError("Please Login And Continue...");
            else if($scope.selectedIndustryList == null)
                logger.logError("Select an Industry and Upload again");
            else if($scope.selectedForms == undefined||$scope.selectedForms == null)
                logger.logError("Select a Form and Upload again");
            else {

                var fd = new FormData();
                fd.append("file", files[0]);
                fd.append("user_id", $rootScope.loginedUserData.user_id);
                fd.append("customer_id", $rootScope.loginedUserData.customer_id);
                fd.append("efs_uin", $scope.selectedForms.efs_uin);
                $scope.loading = true;

                $http.post($rootScope.spring_rest_service + '/dupload', fd, {
                    transformRequest: angular.identity,
                    headers: {"Content-Type": undefined}
                }).success(function (res) {
                    $scope.loading = false;

                    logger.log(JSON.stringify(res[0][0].result))
                    //$scope.GoToHome = true;
                    $location.path('/free');
                    $route.reload();

                });
            }
        }

    }])

    .directive("owlCarousel", function() {
        return {
restrict: 'E',
transclude: false,
link: function (scope) {
    scope.initCarousel = function(element) {
        // provide any default options you want
        var defaultOptions = {
        };
        var customOptions = scope.$eval($(element).attr('data-options'));
        // combine the two options objects

        for(var key in customOptions) {
if(key =='navigationText')
    customOptions[key]=['<i class="fa fa-chevron-left icon-white"></i>','<i class="fa fa-chevron-right icon-white"></i>'];
defaultOptions[key] = customOptions[key];
        }
        // init carousel
        $(element).owlCarousel(defaultOptions);
    };
}
        };
    })
    .directive('owlCarouselItem', [function() {
        return {
restrict: 'A',
transclude: false,
link: function(scope, element) {
    // wait for the last item in the ng-repeat then call init
    if(scope.$last) {
        scope.initCarousel(element.parent());
    }
}
        };
    }])
    .directive('owlCarouselItem1', [function() {
        return {
restrict: 'A',
transclude: false,
link: function(scope, element) {
    // wait for the last item in the ng-repeat then call init
    if(scope.$last) {
        scope.initCarousel(element.parent().parent());
    }
}
        };
    }])
    .directive('countrySelect', [function() {
        return {
restrict: 'A',
require:'ngModel',
scope:{data:'='},
link: function(scope, elem, attrs, ngModelCtrl) {
    //var data = [{"id":"AF","text":"Afghanistan"},{"id":"AX","text":"Åland Islands"},{"id":"AL","text":"Albania"},{"id":"DZ","text":"Algeria"},{"id":"AS","text":"American Samoa"},{"id":"AD","text":"Andorra"},{"id":"AO","text":"Angola"},{"id":"AI","text":"Anguilla"},{"id":"AQ","text":"Antarctica"},{"id":"AG","text":"Antigua and Barbuda"},{"id":"AR","text":"Argentina"},{"id":"AM","text":"Armenia"},{"id":"AW","text":"Aruba"},{"id":"AU","text":"Australia"},{"id":"AT","text":"Austria"},{"id":"AZ","text":"Azerbaijan"},{"id":"BS","text":"Bahamas"},{"id":"BH","text":"Bahrain"},{"id":"BD","text":"Bangladesh"},{"id":"BB","text":"Barbados"},{"id":"BY","text":"Belarus"},{"id":"BE","text":"Belgium"},{"id":"BZ","text":"Belize"},{"id":"BJ","text":"Benin"},{"id":"BM","text":"Bermuda"},{"id":"BT","text":"Bhutan"},{"id":"BO","text":"Bolivia"},{"id":"BQ","text":"Bonaire"},{"id":"BA","text":"Bosnia and Herzegovina"},{"id":"BW","text":"Botswana"},{"id":"BV","text":"Bouvet Island"},{"id":"BR","text":"Brazil"},{"id":"IO","text":"British Indian Ocean Territory"},{"id":"VG","text":"British Virgin Islands"},{"id":"BN","text":"Brunei"},{"id":"BG","text":"Bulgaria"},{"id":"BF","text":"Burkina Faso"},{"id":"BI","text":"Burundi"},{"id":"KH","text":"Cambodia"},{"id":"CM","text":"Cameroon"},{"id":"CA","text":"Canada"},{"id":"CV","text":"Cape Verde"},{"id":"KY","text":"Cayman Islands"},{"id":"CF","text":"Central African Republic"},{"id":"TD","text":"Chad"},{"id":"CL","text":"Chile"},{"id":"CN","text":"China"},{"id":"CX","text":"Christmas Island"},{"id":"CC","text":"Cocos (Keeling) Islands"},{"id":"CO","text":"Colombia"},{"id":"KM","text":"Comoros"},{"id":"CG","text":"Republic of the Congo"},{"id":"CD","text":"DR Congo"},{"id":"CK","text":"Cook Islands"},{"id":"CR","text":"Costa Rica"},{"id":"HR","text":"Croatia"},{"id":"CU","text":"Cuba"},{"id":"CW","text":"Curaçao"},{"id":"CY","text":"Cyprus"},{"id":"CZ","text":"Czech Republic"},{"id":"DK","text":"Denmark"},{"id":"DJ","text":"Djibouti"},{"id":"DM","text":"Dominica"},{"id":"DO","text":"Dominican Republic"},{"id":"EC","text":"Ecuador"},{"id":"EG","text":"Egypt"},{"id":"SV","text":"El Salvador"},{"id":"GQ","text":"Equatorial Guinea"},{"id":"ER","text":"Eritrea"},{"id":"EE","text":"Estonia"},{"id":"ET","text":"Ethiopia"},{"id":"FK","text":"Falkland Islands"},{"id":"FO","text":"Faroe Islands"},{"id":"FJ","text":"Fiji"},{"id":"FI","text":"Finland"},{"id":"FR","text":"France"},{"id":"GF","text":"French Guiana"},{"id":"PF","text":"French Polynesia"},{"id":"TF","text":"French Southern and Antarctic Lands"},{"id":"GA","text":"Gabon"},{"id":"GM","text":"Gambia"},{"id":"GE","text":"Georgia"},{"id":"DE","text":"Germany"},{"id":"GH","text":"Ghana"},{"id":"GI","text":"Gibraltar"},{"id":"GR","text":"Greece"},{"id":"GL","text":"Greenland"},{"id":"GD","text":"Grenada"},{"id":"GP","text":"Guadeloupe"},{"id":"GU","text":"Guam"},{"id":"GT","text":"Guatemala"},{"id":"GG","text":"Guernsey"},{"id":"GN","text":"Guinea"},{"id":"GW","text":"Guinea-Bissau"},{"id":"GY","text":"Guyana"},{"id":"HT","text":"Haiti"},{"id":"HM","text":"Heard Island and McDonald Islands"},{"id":"VA","text":"Vatican City"},{"id":"HN","text":"Honduras"},{"id":"HK","text":"Hong Kong"},{"id":"HU","text":"Hungary"},{"id":"IS","text":"Iceland"},{"id":"IN","text":"India"},{"id":"ID","text":"Indonesia"},{"id":"CI","text":"Ivory Coast"},{"id":"IR","text":"Iran"},{"id":"IQ","text":"Iraq"},{"id":"IE","text":"Ireland"},{"id":"IM","text":"Isle of Man"},{"id":"IL","text":"Israel"},{"id":"IT","text":"Italy"},{"id":"JM","text":"Jamaica"},{"id":"JP","text":"Japan"},{"id":"JE","text":"Jersey"},{"id":"JO","text":"Jordan"},{"id":"KZ","text":"Kazakhstan"},{"id":"KE","text":"Kenya"},{"id":"KI","text":"Kiribati"},{"id":"KW","text":"Kuwait"},{"id":"KG","text":"Kyrgyzstan"},{"id":"LA","text":"Laos"},{"id":"LV","text":"Latvia"},{"id":"LB","text":"Lebanon"},{"id":"LS","text":"Lesotho"},{"id":"LR","text":"Liberia"},{"id":"LY","text":"Libya"},{"id":"LI","text":"Liechtenstein"},{"id":"LT","text":"Lithuania"},{"id":"LU","text":"Luxembourg"},{"id":"MO","text":"Macau"},{"id":"MK","text":"Macedonia"},{"id":"MG","text":"Madagascar"},{"id":"MW","text":"Malawi"},{"id":"MY","text":"Malaysia"},{"id":"MV","text":"Maldives"},{"id":"ML","text":"Mali"},{"id":"MT","text":"Malta"},{"id":"MH","text":"Marshall Islands"},{"id":"MQ","text":"Martinique"},{"id":"MR","text":"Mauritania"},{"id":"MU","text":"Mauritius"},{"id":"YT","text":"Mayotte"},{"id":"MX","text":"Mexico"},{"id":"FM","text":"Micronesia"},{"id":"MD","text":"Moldova"},{"id":"MC","text":"Monaco"},{"id":"MN","text":"Mongolia"},{"id":"ME","text":"Montenegro"},{"id":"MS","text":"Montserrat"},{"id":"MA","text":"Morocco"},{"id":"MZ","text":"Mozambique"},{"id":"MM","text":"Myanmar"},{"id":"NA","text":"Namibia"},{"id":"NR","text":"Nauru"},{"id":"NP","text":"Nepal"},{"id":"NL","text":"Netherlands"},{"id":"NC","text":"New Caledonia"},{"id":"NZ","text":"New Zealand"},{"id":"NI","text":"Nicaragua"},{"id":"NE","text":"Niger"},{"id":"NG","text":"Nigeria"},{"id":"NU","text":"Niue"},{"id":"NF","text":"Norfolk Island"},{"id":"KP","text":"North Korea"},{"id":"MP","text":"Northern Mariana Islands"},{"id":"NO","text":"Norway"},{"id":"OM","text":"Oman"},{"id":"PK","text":"Pakistan"},{"id":"PW","text":"Palau"},{"id":"PS","text":"Palestine"},{"id":"PA","text":"Panama"},{"id":"PG","text":"Papua New Guinea"},{"id":"PY","text":"Paraguay"},{"id":"PE","text":"Peru"},{"id":"PH","text":"Philippines"},{"id":"PN","text":"Pitcairn Islands"},{"id":"PL","text":"Poland"},{"id":"PT","text":"Portugal"},{"id":"PR","text":"Puerto Rico"},{"id":"QA","text":"Qatar"},{"id":"XK","text":"Kosovo"},{"id":"RE","text":"Réunion"},{"id":"RO","text":"Romania"},{"id":"RU","text":"Russia"},{"id":"RW","text":"Rwanda"},{"id":"BL","text":"Saint Barthélemy"},{"id":"SH","text":"Saint Helena, Ascension and Tristan da Cunha"},{"id":"KN","text":"Saint Kitts and Nevis"},{"id":"LC","text":"Saint Lucia"},{"id":"MF","text":"Saint Martin"},{"id":"PM","text":"Saint Pierre and Miquelon"},{"id":"VC","text":"Saint Vincent and the Grenadines"},{"id":"WS","text":"Samoa"},{"id":"SM","text":"San Marino"},{"id":"ST","text":"São Tomé and Príncipe"},{"id":"SA","text":"Saudi Arabia"},{"id":"SN","text":"Senegal"},{"id":"RS","text":"Serbia"},{"id":"SC","text":"Seychelles"},{"id":"SL","text":"Sierra Leone"},{"id":"SG","text":"Singapore"},{"id":"SX","text":"Sint Maarten"},{"id":"SK","text":"Slovakia"},{"id":"SI","text":"Slovenia"},{"id":"SB","text":"Solomon Islands"},{"id":"SO","text":"Somalia"},{"id":"ZA","text":"South Africa"},{"id":"GS","text":"South Georgia"},{"id":"KR","text":"South Korea"},{"id":"SS","text":"South Sudan"},{"id":"ES","text":"Spain"},{"id":"LK","text":"Sri Lanka"},{"id":"SD","text":"Sudan"},{"id":"SR","text":"Suriname"},{"id":"SJ","text":"Svalbard and Jan Mayen"},{"id":"SZ","text":"Swaziland"},{"id":"SE","text":"Sweden"},{"id":"CH","text":"Switzerland"},{"id":"SY","text":"Syria"},{"id":"TW","text":"Taiwan"},{"id":"TJ","text":"Tajikistan"},{"id":"TZ","text":"Tanzania"},{"id":"TH","text":"Thailand"},{"id":"TL","text":"Timor-Leste"},{"id":"TG","text":"Togo"},{"id":"TK","text":"Tokelau"},{"id":"TO","text":"Tonga"},{"id":"TT","text":"Trinidad and Tobago"},{"id":"TN","text":"Tunisia"},{"id":"TR","text":"Turkey"},{"id":"TM","text":"Turkmenistan"},{"id":"TC","text":"Turks and Caicos Islands"},{"id":"TV","text":"Tuvalu"},{"id":"UG","text":"Uganda"},{"id":"UA","text":"Ukraine"},{"id":"AE","text":"United Arab Emirates"},{"id":"GB","text":"United Kingdom"},{"id":"US","text":"United States"},{"id":"UM","text":"United States Minor Outlying Islands"},{"id":"VI","text":"United States Virgin Islands"},{"id":"UY","text":"Uruguay"},{"id":"UZ","text":"Uzbekistan"},{"id":"VU","text":"Vanuatu"},{"id":"VE","text":"Venezuela"},{"id":"VN","text":"Vietnam"},{"id":"WF","text":"Wallis and Futuna"},{"id":"EH","text":"Western Sahara"},{"id":"YE","text":"Yemen"},{"id":"ZM","text":"Zambia"},{"id":"ZW","text":"Zimbabwe"}];
    elem.select2({
        data: scope.data
    });
}
        };
    }]);




