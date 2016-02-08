'use strict';


hethi.controller('BPaas_upload_controller', ['$http','$scope','$rootScope','$location', function ($http,$scope,$rootScope,$location) {
    $scope.continueHide=false;
    $scope.uploadHide=true;
    $scope.BPS = [{
        "BPSid":1,
        "BPSName": "enroll,onboard to pay",
        "Title": "Title1",
        "Description": "DescriptionGoesHere... DescriptionGoesHere DescriptionGoesHere DescriptionGoesHere DescriptionGoesHere",
        "class":true

    },
        {
            "BPSid":2,
            "BPSName": "invoice process to pay",
            "Title": "Title2",
            "Description": "DescriptionGoesHere... DescriptionGoesHere DescriptionGoesHere DescriptionGoesHere DescriptionGoesHere",
            "class":false
        },
        {
            "BPSid":3,
            "BPSName": "claim process to pay",
            "Title": "Title3",
            "Description": "DescriptionGoesHere... DescriptionGoesHere DescriptionGoesHere DescriptionGoesHere DescriptionGoesHere",
            "class":false
        },
        {
            "BPSid":4,
            "BPSName": "loans to classify",
            "Title": "Title4",
            "Description": "DescriptionGoesHere... DescriptionGoesHere DescriptionGoesHere DescriptionGoesHere DescriptionGoesHere",
            "class":false
        },
        {
            "BPSid":5,
            "BPSName": "books to ePUB",
            "Title": "Title5",
            "Description": "DescriptionGoesHere... DescriptionGoesHere DescriptionGoesHere DescriptionGoesHere DescriptionGoesHere",
            "class":false
        }];
    $scope.Industry=[
        {"BPSid":1,"BPSName": "enroll,onboard to pay","IndustryID":1,"IndustryName":"Manufacturing","Status":false,
            "POInvoiceForms":[{"FormID":1,"FormName":"Inventory",Status:false},{"FormID":2,"FormName":"Expense",Status:false}],
            "NPOInvoiceForms":[{"FormID":1,"FormName":"Travel&Expenses",Status:false},{"FormID":2,"FormName":"Receipts&Bills",Status:false},
                {"FormID":3,"FormName":"Claims&Reimbursement",Status:false},{"FormID":4,"FormName":"Utility Bills",Status:false}],
            "ClaimForms":[{"FormID":1,"FormName":"HCFA5010+EOB",Status:false},{"FormID":2,"FormName":"UB5010+EOB",Status:false},
                {"FormID":3,"FormName":"HCFA5010 single",Status:false}],
            "Attachments":[{"FormID":1,"FormName":"Attach A",Status:false},{"FormID":2,"FormName":"Attach B",Status:false},
                {"FormID":3,"FormName":"Attach C",Status:false},{"FormID":4,"FormName":"Attach D",Status:false},{"FormID":5,"FormName":"Attach E",Status:false}]},
        {"BPSid":1,"BPSName": "enroll,onboard to pay","IndustryID":1,"IndustryName":"HealthCare","Status":false,
            "POInvoiceForms":[{"FormID":1,"FormName":"Inventory",Status:false},{"FormID":2,"FormName":"Expense",Status:false}],
            "NPOInvoiceForms":[{"FormID":1,"FormName":"Travel&Expenses",Status:false},{"FormID":2,"FormName":"Receipts&Bills",Status:false},
                {"FormID":3,"FormName":"Claims&Reimbursement",Status:false},{"FormID":4,"FormName":"Utility Bills",Status:false}],
            "ClaimForms":[{"FormID":1,"FormName":"HCFA5010+EOB",Status:false},{"FormID":2,"FormName":"UB5010+EOB",Status:false},
                {"FormID":3,"FormName":"HCFA5010 single",Status:false}],
            "Attachments":[{"FormID":1,"FormName":"Attach A",Status:false},{"FormID":2,"FormName":"Attach B",Status:false},
                {"FormID":3,"FormName":"Attach C",Status:false},{"FormID":4,"FormName":"Attach D",Status:false},{"FormID":5,"FormName":"Attach E",Status:false}]},
        {"BPSid":1,"BPSName": "enroll,onboard to pay","IndustryID":1,"IndustryName":"Retail","Status":false,"POInvoiceForms":[{"FormID":1,"FormName":"Inventory",Status:false},{"FormID":2,"FormName":"Expense",Status:false}],
            "NPOInvoiceForms":[{"FormID":1,"FormName":"Travel&Expenses",Status:false},{"FormID":2,"FormName":"Receipts&Bills",Status:false},
                {"FormID":3,"FormName":"Claims&Reimbursement",Status:false},{"FormID":4,"FormName":"Utility Bills",Status:false}],
            "ClaimForms":[{"FormID":1,"FormName":"HCFA5010+EOB",Status:false},{"FormID":2,"FormName":"UB5010+EOB",Status:false},
                {"FormID":3,"FormName":"HCFA5010 single",Status:false}],
            "Attachments":[{"FormID":1,"FormName":"Attach A",Status:false},{"FormID":2,"FormName":"Attach B",Status:false},
                {"FormID":3,"FormName":"Attach C",Status:false},{"FormID":4,"FormName":"Attach D",Status:false},{"FormID":5,"FormName":"Attach E",Status:false}]},
        {"BPSid":1,"BPSName": "enroll,onboard to pay","IndustryID":1,"IndustryName":"Insurance","Status":false,
            "POInvoiceForms":[{"FormID":1,"FormName":"Inventory",Status:false},{"FormID":2,"FormName":"Expense",Status:false}],
            "NPOInvoiceForms":[{"FormID":1,"FormName":"Travel&Expenses",Status:false},{"FormID":2,"FormName":"Receipts&Bills",Status:false},
                {"FormID":3,"FormName":"Claims&Reimbursement",Status:false},{"FormID":4,"FormName":"Utility Bills",Status:false}],
            "ClaimForms":[{"FormID":1,"FormName":"HCFA5010+EOB",Status:false},{"FormID":2,"FormName":"UB5010+EOB",Status:false},
                {"FormID":3,"FormName":"HCFA5010 single",Status:false}],
            "Attachments":[{"FormID":1,"FormName":"Attach A",Status:false},{"FormID":2,"FormName":"Attach B",Status:false},
                {"FormID":3,"FormName":"Attach C",Status:false},{"FormID":4,"FormName":"Attach D",Status:false},{"FormID":5,"FormName":"Attach E",Status:false}]},
        {"BPSid":1,"BPSName": "enroll,onboard to pay","IndustryID":1,"IndustryName":"Banking","Status":false,
            "POInvoiceForms":[{"FormID":1,"FormName":"Inventory",Status:false},{"FormID":2,"FormName":"Expense",Status:false}],
            "NPOInvoiceForms":[{"FormID":1,"FormName":"Travel&Expenses",Status:false},{"FormID":2,"FormName":"Receipts&Bills",Status:false},
                {"FormID":3,"FormName":"Claims&Reimbursement",Status:false},{"FormID":4,"FormName":"Utility Bills",Status:false}],
            "ClaimForms":[{"FormID":1,"FormName":"HCFA5010+EOB",Status:false},{"FormID":2,"FormName":"UB5010+EOB",Status:false},
                {"FormID":3,"FormName":"HCFA5010 single",Status:false}],
            "Attachments":[{"FormID":1,"FormName":"Attach A",Status:false},{"FormID":2,"FormName":"Attach B",Status:false},
                {"FormID":3,"FormName":"Attach C",Status:false},{"FormID":4,"FormName":"Attach D",Status:false},{"FormID":5,"FormName":"Attach E",Status:false}]},
        {"BPSid":1,"BPSName": "enroll,onboard to pay","IndustryID":1,"IndustryName":"Telecom","Status":false,
            "POInvoiceForms":[{"FormID":1,"FormName":"Inventory",Status:false},{"FormID":2,"FormName":"Expense",Status:false}],
            "NPOInvoiceForms":[{"FormID":1,"FormName":"Travel&Expenses",Status:false},{"FormID":2,"FormName":"Receipts&Bills",Status:false},
                {"FormID":3,"FormName":"Claims&Reimbursement",Status:false},{"FormID":4,"FormName":"Utility Bills",Status:false}],
            "ClaimForms":[{"FormID":1,"FormName":"HCFA5010+EOB",Status:false},{"FormID":2,"FormName":"UB5010+EOB",Status:false},
                {"FormID":3,"FormName":"HCFA5010 single",Status:false}],
            "Attachments":[{"FormID":1,"FormName":"Attach A",Status:false},{"FormID":2,"FormName":"Attach B",Status:false},
                {"FormID":3,"FormName":"Attach C",Status:false},{"FormID":4,"FormName":"Attach D",Status:false},{"FormID":5,"FormName":"Attach E",Status:false}]},
        {"BPSid":1,"BPSName": "enroll,onboard to pay","IndustryID":1,"IndustryName":"Transportation","Status":false,
            "POInvoiceForms":[{"FormID":1,"FormName":"Inventory",Status:false},{"FormID":2,"FormName":"Expense",Status:false}],
            "NPOInvoiceForms":[{"FormID":1,"FormName":"Travel&Expenses",Status:false},{"FormID":2,"FormName":"Receipts&Bills",Status:false},
                {"FormID":3,"FormName":"Claims&Reimbursement",Status:false},{"FormID":4,"FormName":"Utility Bills",Status:false}],
            "ClaimForms":[{"FormID":1,"FormName":"HCFA5010+EOB",Status:false},{"FormID":2,"FormName":"UB5010+EOB",Status:false},
                {"FormID":3,"FormName":"HCFA5010 single",Status:false}],
            "Attachments":[{"FormID":1,"FormName":"Attach A",Status:false},{"FormID":2,"FormName":"Attach B",Status:false},
                {"FormID":3,"FormName":"Attach C",Status:false},{"FormID":4,"FormName":"Attach D",Status:false},{"FormID":5,"FormName":"Attach E",Status:false}]},
        {"BPSid":2,"BPSName": "invoice process to pay","IndustryID":1,"IndustryName":"Manufacturing","Status":false},
        {"BPSid":2,"BPSName": "invoice process to pay","IndustryID":1,"IndustryName":"HealthCare","Status":false},
        {"BPSid":2,"BPSName": "invoice process to pay","IndustryID":1,"IndustryName":"Insurance","Status":false},
        {"BPSid":2,"BPSName": "invoice process to pay","IndustryID":1,"IndustryName":"Banking","Status":false},
        {"BPSid":2,"BPSName": "invoice process to pay","IndustryID":1,"IndustryName":"Telecom","Status":false},
        {"BPSid":3,"BPSName": "claim process to pay","IndustryID":1,"IndustryName":"Manufacturing","Status":false},
        {"BPSid":3,"BPSName": "claim process to pay","IndustryID":1,"IndustryName":"HealthCare","Status":false},
        {"BPSid":3,"BPSName": "claim process to pay","IndustryID":1,"IndustryName":"Retail","Status":false},
        {"BPSid":3,"BPSName": "claim process to pay","IndustryID":1,"IndustryName":"Insurance","Status":false},
        {"BPSid":3,"BPSName": "claim process to pay","IndustryID":1,"IndustryName":"Telecom","Status":false},
        {"BPSid":3,"BPSName": "claim process to pay","IndustryID":1,"IndustryName":"Transportation","Status":false},
        {"BPSid":4,"BPSName": "loans to classify","IndustryID":1,"IndustryName":"Manufacturing","Status":false},
        {"BPSid":4,"BPSName": "loans to classify","IndustryID":1,"IndustryName":"HealthCare","Status":false},
        {"BPSid":4,"BPSName": "loans to classify","IndustryID":1,"IndustryName":"Insurance","Status":false},
        {"BPSid":4,"BPSName": "loans to classify","IndustryID":1,"IndustryName":"Banking","Status":false},
        {"BPSid":4,"BPSName": "loans to classify","IndustryID":1,"IndustryName":"Telecom","Status":false},
        {"BPSid":4,"BPSName": "loans to classify","IndustryID":1,"IndustryName":"Transportation","Status":false},
        {"BPSid":5,"BPSName": "books to ePUB","IndustryID":1,"IndustryName":"Manufacturing","Status":false},
        {"BPSid":5,"BPSName": "books to ePUB","IndustryID":1,"IndustryName":"Retail","Status":false},
        {"BPSid":5,"BPSName": "books to ePUB","IndustryID":1,"IndustryName":"Insurance","Status":false},
        {"BPSid":5,"BPSName": "books to ePUB","IndustryID":1,"IndustryName":"Banking","Status":false},
        {"BPSid":5,"BPSName": "books to ePUBy","IndustryID":1,"IndustryName":"Transportation","Status":false},
    ];
    $scope.selectedBPS=$scope.BPS[0];
    var myVar = setInterval(timeout ,5000);
    function timeout() {

            var status=false;
            $scope.BPS.forEach(function(res,i){
                $scope.$apply(function(){
                if(res.class&&!status){
                    status=true;
                    $scope.BPS[i].class=false;
                    if($scope.BPS.length==(i+1)){
                        $scope.selectedBPS=$scope.BPS[0];
                        $scope.BPS[0].class=true;
                    }else{
                        $scope.selectedBPS=$scope.BPS[i+1];
                        $scope.BPS[i+1].class=true;
                    }
                    //logger.log(JSON.stringify( $scope.BPS))
                }
                });
            });
            // Do Something Here
            // Then recall the parent function to
            // create a recursive loop.
    }

    $scope.ChooseBPS=function(c){
        clearInterval(myVar);
        $scope.BPS.forEach(function(res,i) {
            $scope.BPS[i].class = false;
        });
        $scope.BPS[c].class = true;
        $scope.selectedBPS=$scope.BPS[c];
        $scope.stopClick(c);

    };

    var owl = $("#owl-demo");
    $scope.carouselInitializer = function() {
        owl.owlCarousel({
            items: 1,
            navigation: false,
            pagination: false,
            afterAction : afterAction,
            autoPlay: true
            ,navigationText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"]
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
    $scope.IndustryClick=function(data){
        $scope.Industry.forEach(function(row,i){
            if(row==data){
                $scope.selectedIndustry=row;
                $scope.Industry[i].Status =! $scope.Industry[i].Status;
            }
        })
    }



}]).directive('ngRepeatOwlCarousel', function() {
    return {
        restrict: 'A',
        scope: {
            carouselInit: '&'
        },
        link: function(scope, element, attrs) {
            if ((scope.$parent != null) && scope.$parent.$last) {
                return scope.carouselInit()();
            }
        }
    };
});