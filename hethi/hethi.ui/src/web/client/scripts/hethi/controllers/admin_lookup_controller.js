hethi.controller('admin_lookup_controller', ['$http','$scope','$location','$rootScope','logger', function ($http,$scope,$location,$rootScope,logger){
    $http({
        method: 'POST',
        url: $rootScope.spring_rest_service+'/loadCustomerName',
        dataType:'jsonp'
    }).success(function(data) {
        $rootScope.loadCustomerName=data[0];
    });
    $scope.checkType=function(choice){
        if(choice.type==undefined){
            choice.size='';
            logger.logWarning('Select a type')
        }
    };
    $scope.hideText=false;
    $scope.hideSize=function(choice){
        choice.size='';
        if(choice.type=='text' || choice.type=='date' || choice.type=='datetime'){
            $scope.hideText=true;
        }
        else{
            $scope.hideText=false;
        }
    };
    $scope.result=false;
    $scope.rows=[];
    $scope.isExist=false;
    $scope.showReferenceData=function(){
        $scope.criteriaList=[];
        $scope.metaData.forEach(function(respo){
            if(respo.textData!=undefined){
                if(respo.textData!=''){
                    var input={
                        column:respo.column,
                        criteria:respo.textData
                    };
                    $scope.criteriaList.push(input)
                }
            }
        });
        var queryInput={
            table_name:$scope.customer+"_"+$scope.lookup+"_lookup",
            criteria: $scope.criteriaList
        };
        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service+'/search_reference_data',
            dataType:'jsonp',
            data:queryInput
        }).success(function(data) {

            if(data[0][0].result=="No Data"){
                $scope.isExist=true;
                $scope.result=true;
            }
            if(data[0][0].result=="Success"){
                $scope.isExist=false;
                $scope.result=true;
                $rootScope.referenceData=[];
                data[0].forEach(function(response){
                    $scope.rows=[];
                    $scope.metaData.forEach(function(row){
                        for(var key in response){
                            if(row["column"]==key){
                               if(key!="result") {
                                   var input = {
                                       column: response[key]
                                   };
                                   $scope.rows.push(input);
                               }
                            }
                        }
                    });
                    $rootScope.referenceData.push($scope.rows);
                });
            }
        });

    };
    $scope.inputBoxes=[];
    $scope.showText=function(index){
        if($scope.metaData[index].hideText==true){
            $scope.metaData[index].hideText=false;
            $scope.metaData[index].textData='';
        }
        else if($scope.metaData[index].hideText==false)
            $scope.metaData[index].hideText=true;
        if($scope.inputBoxes.length>0){
            var flag= 0,i=0;
            $scope.inputBoxes.forEach(function(respo){
                if(respo.id==index){
                    flag=1;
                    $scope.inputBoxes.splice(i,1);
                }
                i++;
            });
            if(flag==0){
                $scope.inputBoxes.push({id:index})
            }
        }
        else{
            $scope.inputBoxes.push({id:index})
        }

    };
    $scope.tableExists=false;
    $scope.showTable=function(){
        var searchInput={
           customer_id:$scope.customer,
           lookup_type:$scope.lookup
        };
        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service+'/search_lookup_storage',
            dataType:'jsonp',
            data:searchInput
        }).success(function(data) {

            if(data[0][0].result=='Success'){
                $scope.metaData=[];
                $scope.result=false;
                $scope.rows=[];
                data[1].forEach(function(respo){
                    var input={
                        column:respo.column,
                        hideText:false
                    };
                    $scope.metaData.push(input);
                });
                $scope.tableExists=true;
            }
            if(data[0][0].result=="Error"){
                $scope.tableExists=false;
                $scope.result=false;
                $scope.rows=[];
            }
        });
    };
    $scope.items = [];
    $scope.createTable=function(){
        $scope.attributes=[];

        $scope.choices.forEach(function(respo){
            if(respo.inlineChecked==undefined)
                respo.inlineChecked='no';
            if(!(isNaN(respo.size)) && respo.size.length>0){
                respo.type=respo.type+"("+respo.size+")";
            }
            else
                respo.type=respo.type;
            if(respo.size.length==0 && respo.type=='varchar')
                respo.type=respo.type+"(255)";
            $scope.attributes.push({columnName:respo.columnName,columnType:respo.type,pk:respo.inlineChecked});
        });
        var tableContent={
            customer_id:$scope.customer,
            lookup_type:$scope.lookup,
            attributes:$scope.attributes
        };
        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service+'/create_lookup_storage',
            dataType:'jsonp',
            data:tableContent
        }).success(function(data) {
            logger.logSuccess(data[0].result)
        });
    };
    //$scope.add = function () {
    //    $scope.items.push({
    //        inlineChecked: false,
    //        columnName: "",
    //        type: "",
    //        size:"",
    //        questionPlaceholder: "foo"
    //
    //    });
    //};


//    Dynamically create inputs

    $scope.choices = [{id: 'choice1'}];

    $scope.addNewChoice = function() {
        var newItemNo = $scope.choices.length+1;
        $scope.choices.push({'id':'choice'+newItemNo});
    };
    $scope.UploadImage=function() {

        var fd = new FormData();
        fd.append("file", $scope.ImagePath[0]);
        fd.append("customer_id", $scope.customer);
        fd.append("lookup_type", $scope.lookup);

        $http.post($rootScope.spring_rest_service + '/upload_reference_data', fd, {
            transformRequest: angular.identity,
            headers: {"Content-Type": undefined}
        }).success(function (res) {
            logger.log(JSON.stringify(res[0].result))
        });
    };
    $scope.removeChoice = function() {
        var lastItem = $scope.choices.length-1;
        $scope.choices.splice(lastItem);
    };

}]);
