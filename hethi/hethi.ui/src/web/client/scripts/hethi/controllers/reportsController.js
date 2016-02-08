
'use strict';


hethi.controller('reportsController', ['$http','$scope','$filter','$location','$rootScope','logger', function ($http,$scope,$filter,$location,$rootScope,logger){



    var init;

    $scope.exportData = function () {
        alasql('SELECT * INTO XLSX("export.xlsx",{headers:true}) FROM ?',[$scope.reportsIndexer]);
    };
    $scope.exportCSV=function(){
        alasql("SELECT * INTO CSV('mydata.csv', {headers:true}) FROM ?",[$scope.reportsIndexer]);
    };
    $scope.exportPDF=function(){
        alasql("SELECT * INTO PDF('mydata1.pdf', {headers:true}) FROM ?",[$scope.reportsIndexer]);
    };

    $scope.reportsIndexer = [
        {
            Code: '1331',
            UPCcode: 'SUP-102',
            SupplierName: 'Supplier Name',
            InvoiceType: 'PO',
            Status:'pending',
            AssignedTo:'ABC',
            PONumber:'66000031',
            InvoiceDate:'3//17/2015',
            PaymentDate:'4/16/2015',
            DeliveryDate:'3/17/2015',
            Channel:'Fax',
            Curr:'INR',
            NetTotal:'64',
            TotalTaxAmount:'0',
            GrandTotal:'64',
            GLCode:'GL-105',
            UID:'UID-1045',
            Reference1:'Ref 1',
            Reference2:'Ref 2',
            Reference3:'Ref 3',
            Reference4:'Ref 4',
            Reference5:'Ref 5',
            BuyerID:'C-102'
        }, {
            InvoiceNumber: '131',
            SupplierID: 'SUP-103',
            SupplierName: 'Supplier Name',
            InvoiceType: 'PO',
            Status:'active',
            AssignedTo:'ABC',
            PONumber:'66000031',
            InvoiceDate:'3//17/2015',
            PaymentDate:'4/16/2015',
            DeliveryDate:'3/17/2015',
            Channel:'Fax',
            Curr:'INR',
            NetTotal:'64',
            TotalTaxAmount:'0',
            GrandTotal:'64',
            GLCode:'GL-105',
            UID:'UID-1045',
            Reference1:'Ref 1',
            Reference2:'Ref 2',
            Reference3:'Ref 3',
            Reference4:'Ref 4',
            Reference5:'Ref 5',
            BuyerID:'C-102'
        }, {
            InvoiceNumber: '132',
            SupplierID: 'SUP-104',
            SupplierName: 'Supplier Name',
            InvoiceType: 'PO',
            Status:'active',
            AssignedTo:'ABC',
            PONumber:'66000031',
            InvoiceDate:'3//17/2015',
            PaymentDate:'4/16/2015',
            DeliveryDate:'3/17/2015',
            Channel:'Fax',
            Curr:'INR',
            NetTotal:'64',
            TotalTaxAmount:'0',
            GrandTotal:'64',
            GLCode:'GL-105',
            UID:'UID-1045',
            Reference1:'Ref 1',
            Reference2:'Ref 2',
            Reference3:'Ref 3',
            Reference4:'Ref 4',
            Reference5:'Ref 5',
            BuyerID:'C-102'
        }, {
            InvoiceNumber: '133',
            SupplierID: 'SUP-105',
            SupplierName: 'Supplier Name',
            InvoiceType: 'PO',
            Status:'active',
            AssignedTo:'ABC',
            PONumber:'66000031',
            InvoiceDate:'3//17/2015',
            PaymentDate:'4/16/2015',
            DeliveryDate:'3/17/2015',
            Channel:'Fax',
            Curr:'INR',
            NetTotal:'64',
            TotalTaxAmount:'0',
            GrandTotal:'64',
            GLCode:'GL-105',
            UID:'UID-1045',
            Reference1:'Ref 1',
            Reference2:'Ref 2',
            Reference3:'Ref 3',
            Reference4:'Ref 4',
            Reference5:'Ref 5',
            BuyerID:'C-102'
        },  {
            InvoiceNumber: '137',
            SupplierID: 'SUP-106',
            SupplierName: 'Supplier Name',
            InvoiceType: 'PO',
            Status:'active',
            AssignedTo:'ABC',
            PONumber:'66000031',
            InvoiceDate:'3//17/2015',
            PaymentDate:'4/16/2015',
            DeliveryDate:'3/17/2015',
            Channel:'Fax',
            Curr:'INR',
            NetTotal:'64',
            TotalTaxAmount:'0',
            GrandTotal:'64',
            GLCode:'GL-105',
            UID:'UID-1045',
            Reference1:'Ref 1',
            Reference2:'Ref 2',
            Reference3:'Ref 3',
            Reference4:'Ref 4',
            Reference5:'Ref 5',
            BuyerID:'C-102'
        }, {
            InvoiceNumber: '138',
            SupplierID: 'SUP-107',
            SupplierName: 'Supplier Name',
            InvoiceType: 'PO',
            Status:'active',
            AssignedTo:'ABC',
            PONumber:'66000031',
            InvoiceDate:'3//17/2015',
            PaymentDate:'4/16/2015',
            DeliveryDate:'3/17/2015',
            Channel:'Fax',
            Curr:'INR',
            NetTotal:'64',
            TotalTaxAmount:'0',
            GrandTotal:'64',
            GLCode:'GL-105',
            UID:'UID-1045',
            Reference1:'Ref 1',
            Reference2:'Ref 2',
            Reference3:'Ref 3',
            Reference4:'Ref 4',
            Reference5:'Ref 5',
            BuyerID:'C-102'
        }
    ];

    $scope.searchKeywordsIndexer = '';
    $scope.filteredReportsIndexer = [];
    $scope.rowIndexer = '';


    $scope.selectIndexer = function(page) {
//        logger.log(page) ;

        var end, start;
        start = (page - 1) * $scope.numPerPageIndexer;
        end = start + $scope.numPerPageIndexer;
        return $scope.currentPageReportsIndexer = $scope.filteredReportsIndexer.slice(start, end);
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
        $scope.filteredReportsIndexer = $filter('filter')($scope.reportsIndexer, $scope.searchKeywordsIndexer);
        return $scope.onFilterChangeIndexer();
    };
    $scope.orderIndexer = function(rowName) {
        if ($scope.rowIndexer === rowName) {
            return;
        }
        $scope.rowIndexer = rowName;
        $scope.filteredReportsIndexer = $filter('orderBy')($scope.reportsIndexer, rowName);
        return $scope.onOrderChangeIndexer();
    };
    $scope.numPerPageOptIndexer = [3, 5, 10, 20];
    $scope.numPerPageIndexer = $scope.numPerPageOptIndexer[1];
    $scope.currentPageIndexer = 1;
    $scope.filteredReportsIndexer = [];
    init = function() {
        $scope.searchIndexer();
        return $scope.selectIndexer($scope.currentPageIndexer);
    };

    return init();

//    **************************************


}]);