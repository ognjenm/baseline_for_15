hethi.controller('hethi_mapper_controller', ['$http','$scope','$rootScope','$q','logger', function ($http,$scope,$rootScope,$q,logger){



    $scope.loadUploadedContent=function(){
        if( localStorage.getItem("mapper_input_file")!=undefined){
            $scope.uploadedPath=JSON.parse(localStorage.getItem("mapper_input_file"));
            $http({
                method: 'GET',
                url: $scope.uploadedPath.file_location
            }).success(function(data) {
                console.log("data : " + data);
                $scope.uploadedPath.file_content=data;

            });
            $http({
                method: 'GET',
                url: $scope.uploadedPath.xml_file_location
            }).success(function(xdata) {
                console.log("xml_file : " + xdata);
                $scope.uploadedPath.xml_content=xdata;

                        var x2js = new X2JS();
                        var json=x2js.xml_str2json(xdata);
                        console.log("json : " + json);

                 $scope.uploadedPath.xml_content_json= json;


            });
        }
        else{
            $scope.uploadedPath=false;
        }

    };
    $scope.loadUploadedContent();
    $scope.clearUploads=function(){
        localStorage.removeItem("mapper_input_file") ;
        logger.logSuccess('upload cleared');
        $scope.loadUploadedContent();
    };
    $scope.uploadSampleInput=function(files){

        $scope.uploadStatus=true;
        var fd = new FormData();
        fd.append("file", files[0]);
        $http.post($rootScope.spring_rest_service+'/mapper_input_upload',fd,{transformRequest:angular.identity,headers:{"Content-Type":undefined}}).success(function(res) {

            alert(JSON.stringify(res));
            $scope.uploadStatus=false;
            var fn=res.file_location
            var ft=fn.substring(fn.lastIndexOf('.')+1,fn.length).toLowerCase();
            res.file_type=ft;
            localStorage.setItem("mapper_input_file",JSON.stringify(res));
            $scope.loadUploadedContent();


        });

    };

    $scope.load_input_ixml=function(){
        $http({
            method: 'GET',
            url: 'http://localhost:4141/images/ixsd/po.xml'
        }).success(function(xml) {
            console.log("xml : " + xml);
            var x2js = new X2JS();
            var json=x2js.xml_str2json(xml);
            console.log("json : " + json);
            $scope.ixml= json;
        });

    };

    var IsJsonString= function (str) {
        try {
            JSON.parse(str);
        } catch (e) {
            return false;
        }
        return true;
    };
    var d=[];
    var getKeyValue=function(ob){
        //console.log(JSON.stringify(ob));
        //alert(IsJsonString(JSON.stringify(ob)));
        for(var k in ob){
            var t={name:k,files:ob[k]};
            if(IsJsonString(JSON.stringify(ob))){
                d.push(t);
                alert(JSON.stringify(d));
                getKeyValue(ob[k]);
            }
        };
        return d;
    };



    function visit(object) {
        if (isIterable(object)) {
            forEachIn(object, function (accessor, child) {

                visit(child);
                //alert(accessor);
            });
        }
        else {
            var value = object;
            //console.log("value:"+value);
        }
    }

    function forEachIn(iterable, functionRef) {
        for (var accessor in iterable) {
            functionRef(accessor, iterable[accessor]);
        }
    }

    function isIterable(element) {
        return isArray(element) || isObject(element);
    }

    function isArray(element) {
        return element.constructor == Array;
    }

    function isObject(element) {
        return element.constructor == Object;
    }
    $scope.checkItratable=function(element) {
        if(isArray(element)){
            return "Array"
        }else if(isObject(element)){
            return "Object"
        }else{
            return "Other"
        }
    }
    $scope.isArray=angular.isArray;
    $scope.isObject=angular.isObject;
    $scope.isNumber=angular.isNumber;
    $scope.isUndefined=angular.isUndefined;

    $scope.isItratable=function(element){
        return isArray(element) || isObject(element);
    };
    $scope.selectedNodeCrumb = [''];
    $scope.folderSelected=function(key,val,parent){
        var breadcrumbs = [];
        var nodeScope = parent;
        $scope.selectedNodeCrumb=[''];
        while (nodeScope.key) {
            breadcrumbs.push(nodeScope.key);
            nodeScope = nodeScope.$parent.$parent.$parent.$parent;
            //alert(nodeScope.key);
        }
        var a='';
        breadcrumbs.reverse().forEach(function(row){
            a+=row+'.';
            $scope.selectedNodeCrumb.push(row);

        });
        a=a.substring(0, a.length-1);
        val.show=!val.show;
    };
    $scope.fileSelected=function(key,val,parent){

        var breadcrumbs = [];
        var nodeScope = parent;
        $scope.selectedNodeCrumb=[''];
        while (nodeScope.key) {
            breadcrumbs.push(nodeScope.key);
            nodeScope = nodeScope.$parent.$parent.$parent.$parent;
        }
        var a='';
        breadcrumbs.reverse().forEach(function(row){
            a+=row+'.';
            $scope.selectedNodeCrumb.push(row);

        });
        a=a.substring(0, a.length-1);

        //alert($scope.masterFormFields[a])
        alert(key);
        alert(JSON.stringify(val));
        val.added=true;
        //$scope.selectedNodeCrumb.push(key)

    };

    $scope.folderSelected1=function(key,val,parent){
        var breadcrumbs = [];
        var nodeScope = parent;
        $scope.selectedNodeCrumb1=[''];
        while (nodeScope.key) {
            breadcrumbs.push(nodeScope.key);
            nodeScope = nodeScope.$parent.$parent.$parent.$parent;
            //alert(nodeScope.key);
        }
        var a='';
        breadcrumbs.reverse().forEach(function(row){
            a+=row+'.';
            $scope.selectedNodeCrumb1.push(row);

        });
        a=a.substring(0, a.length-1);
        val.show=!val.show;
    };
    $scope.fileSelected1=function(key,val,parent){

        var breadcrumbs = [];
        var nodeScope = parent;
        $scope.selectedNodeCrumb1=[''];
        while (nodeScope.key) {
            breadcrumbs.push(nodeScope.key);
            nodeScope = nodeScope.$parent.$parent.$parent.$parent;
        }
        var a='';
        breadcrumbs.reverse().forEach(function(row){
            a+=row+'.';
            $scope.selectedNodeCrumb1.push(row);

        });
        a=a.substring(0, a.length-1);

        //alert($scope.masterFormFields[a])
        val.added=true;
        //$scope.selectedNodeCrumb.push(key)

    };



    $scope.folderSelected2=function(key,val,parent){
        var breadcrumbs = [];
        var nodeScope = parent;
        $scope.selectedNodeCrumb1=[''];
        while (nodeScope.key) {
            breadcrumbs.push(nodeScope.key);
            nodeScope = nodeScope.$parent.$parent.$parent.$parent;
            //alert(nodeScope.key);
        }
        var a='';
        breadcrumbs.reverse().forEach(function(row){
            a+=row+'.';
            $scope.selectedNodeCrumb1.push(row);

        });
        a=a.substring(0, a.length-1);
        $scope.selectedValue=val;
        val.show=!val.show;

    };




    $scope.selectedNodes = [''];


    $scope.options = {
        onNodeSelect: function (node, list) {
            $scope.selectedNodes = list;
            $scope.selectedNode = node;
            //alert(JSON.stringify(node));
        }
    };

    $scope.options2 = {
        collapsible: false
    };

    var iconClassMap = {
            txt: 'icon-file-text',
            jpg: 'icon-picture blue',
            png: 'icon-picture orange',
            gif: 'icon-picture'
        },
        defaultIconClass = 'icon-file';

    $scope.options3 = {
        mapIcon: function (file) {
            var pattern = /\.(\w+)$/,
                match = pattern.exec(file.name),
                ext = match && match[1];

            return iconClassMap[ext] || defaultIconClass;
        }
    };

    //Tree Ends




    $scope.convertToDate=function(date){
        date=new Date(date);
        return date;
    };



}]);
