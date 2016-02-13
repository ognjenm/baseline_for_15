'use strict';


hethi.controller('hethi_artist_home_Controller', ['$http','$scope','$filter','$rootScope','$location','logger', function ($http,$scope,$filter,$rootScope,$location,logger){
    $scope.searchKeywordsIndexer = '';
    $scope.filteredStoresIndexer = [];
    $scope.rowIndexer = '';
    $scope.models = {
        selected: null,
        lists: {"A": [], "B": []}
    };
    //var temp=['PO-Inventory','PO-Expense','NPO','EOB','HCFA','PO-Inventory','PO-Expense','NPO','EOB','HCFA','PO-Inventory'];
    //for (var i = 1; i <= 3; ++i) {
    //    var input={
    //        "id":$scope.models.lists.A.length+1,
    //        "form_stencid":i,
    //        "form_type":temp[i],
    //        "form_ownerid":i,
    //        "form_bsource":'qwerty',
    //        "form_bclass":'qwerty',
    //        "efslob_id":i
    //    };
    //
    //    $scope.models.lists.A.push(input);
    //}
    //{ trueSize: [876,900] }
    $scope.selectedSizes=[{size_name:"A4",width:"876",Height:"900"},{size_name:"Letter",width:"612",Height:"792"}]
    $scope.formSize=$scope.selectedSizes[0];
    $scope.mxsdLocation=[{Key:['mxsd','form','header','group'],Value:"header"},
        {Key:['mxsd','form','footer','group'],Value:"footer"},
        {Key:['mxsd','form','body','group'],Value:"body"},
        {Key:['mxsd','form','body','group','fieldlist'],Value:"lineitem"}];
    $scope.mxsdDataType=[{Key:"label field",Value:"label field"},
    {Key:"data field",Value:"data field"},
    {Key:"image field",Value:"image field"},
    {Key:"1Dbarcode field",Value:"1Dbarcode field"},
    {Key:"2DQRcode field",Value:"2DQRcode field"},
    {Key:"3DQRcode field",Value:"3DQRcode field"},
    {Key:"OMCheckbox field",Value:"OMCheckbox field"},
    {Key:"OM Radiobutton field",Value:"OM Radiobutton field"},
    {Key:"OCRA field",Value:"OCRA field"},
    {Key:"OCRB field",Value:"OCRB field"},
    {Key:"MICR",Value:"MICR"}];

    $scope.mxsdFieldType=[{Key:"label",Value:"label"},{Key:"data",Value:"data"}];
    $scope.indexingValues=[{"indexToClassify":"No","indexToReject":"No","indexToSplitMerge":"No"}];
    $scope.selectedValue=$scope.indexingValues[0];
    //$scope.ixsdFields=[{ixsdPath:"po/header/buyer/invoice_number",ixsdFieldName:"invoice_number",group:"buyer"},
    //    {ixsdPath:"po/header/buyer/invoice_date",ixsdFieldName:"invoice_date",group:"buyer"},
    //    {ixsdPath:"po/footer/invoice_total",ixsdFieldName:"invoice_total",group:""}];
    $scope.selectedMxsdPath="";
    $scope.selectedIxsd="";
    $scope.fieldType="";
    $scope.dataType="";
    $scope.selectedMxsdPathChanged=function(value){
        $scope.selectedMxsdPath=value;
        $scope.showIxml=false;
    };
    $scope.selectedIxsdChanged=function(value){
        $scope.selectedIxsd=value;
        $scope.showIxml=false;
    };
    $scope.fieldTypeChanged=function(value){
        $scope.fieldType=value;
        $scope.showIxml=false;
    };
    $scope.dataTypeChanged=function(value){
        $scope.dataType=value;
        $scope.showIxml=false;
    };
    $scope.onFilterChangeIndexer = function() {
        $scope.selectIndexer(1);
        $scope.currentPageIndexer = 1;
        return $scope.rowIndexer = '';
    };
    $scope.onNumPerPageChangeIndexer = function(num) {
        $scope.numPerPageIndexer=(num);
        $scope.selectIndexer(1);
        return $scope.currentPageIndexer = 1;
    };
    $scope.onOrderChangeIndexer = function() {
        $scope.selectIndexer(1);

        return $scope.currentPageIndexer = 1;
    };
    $scope.searchIndexer = function() {
        $scope.filteredStoresIndexer = $filter('filter')($scope.hethi_artist_task_list, $scope.searchKeywordsIndexer);
        return $scope.onFilterChangeIndexer();
    };
    $scope.orderIndexer = function(rowName) {
        if ($scope.rowIndexer === rowName) {
            return;
        }
        $scope.rowIndexer = rowName;
        $scope.filteredStoresIndexer = $filter('orderBy')($scope.hethi_artist_task_list, rowName);
        return $scope.onOrderChangeIndexer();
    };
    $scope.selectIndexer = function(page) {
        var end, start;
        start = (page - 1) *  $scope.numPerPageIndexer;
        end = start +  $scope.numPerPageIndexer;
        $scope.currentPageStoresIndexer = $scope.filteredStoresIndexer.slice(start,end);
        return $scope.currentPageStoresIndexer;
    };
    $scope.numPerPageOptIndexer = [3,5,10,20];
    $scope.numPerPageIndexer = $scope.numPerPageOptIndexer[1];
    $scope.currentPageIndexer = 1;
    $scope.currentPageStoresIndexer = [];
    var init;
    init = function() {
        $scope.searchIndexer();
        return $scope.selectIndexer($scope.currentPageIndexer);
    };



    $scope.delete = function(data) {
        data.nodes = [];
    };
    $scope.add = function(data) {
        var post = data.nodes.length + 1;
        var newName = data.name + '-' + post;
        data.nodes.push({name: newName,nodes: []});
    };
    $scope.tree = [{name: "Node", nodes: []}];

    // Generate initial model
    //for (var i = 1; i <= 3; ++i) {
    //    $scope.models.lists.A.push({label: "Item A" + i});
    //    $scope.models.lists.B.push({label: "Item B" + i});
    //}

    // Model to JSON for demo purpose
    $scope.$watch('models', function(model) {
        $scope.modelAsJson = angular.toJson(model, true);
    }, true);

    $scope.loadMxsd=function(mxsdPath){
    $http({
        method: 'GET',
        url:mxsdPath
    }).success(function(xml) {
        //console.log("xml : " + xml);
        var x2js = new X2JS();
        var js= x2js.xml_str2json(xml);

        $scope.mxsd={"efsuin":{
            "header":
            {"position":{"top":"","left":"","width":"","height":""},
                "field":[]},
            "footer":
            {"position":{"top":"","left":"","width":"","height":""},
                "field":[]},
            "body":
            {"table":
            {"header":
            {"field":[]},
                "lineitem":
                {"field":[]},
                "footer":
                {"field":[]}
            },
                "field":[]}
        }};
        //console.log("xml2Js : " + JSON.stringify(js));
        //var H=js.efsuin.header;
        //var F=js.efsuin.footer;
        //var B=js.efsuin.body;
        //
        //var headerData= { name: 'Header', folders: [] ,lab: [{ name: 'asdsd'},{ name: 'dsadsadasata'}] };
        //H.field.forEach(function(r){
        //    var tempH={ name: r.name, files: [{ name: 'label',label: r.label},{ name: 'data',data: r.data}] };
        //    headerData.folders.push(tempH);
        //});
        //var footerData= { name: 'Footer', folders: [] };
        //F.field.forEach(function(r){
        //    var tempF= { name: r.name, files: [{ name: 'label',data: r.label},{ name: 'data',data: r.data}] };
        //    footerData.folders.push(tempF);
        //});
        //var bodyData= { name: 'Body', folders: [] };
        //var bt={ name: 'Table',folders:[],files: [{ name: 'label'},{ name: 'data'}]};
        //B.table.header.field.forEach(function(r){
        //    var tempB= { name: r.name, files: [{ name: 'label',data: r.label},{ name: 'data',data: r.data}] };
        //    bt.folders.push(tempB);
        //});
        //if( B.table.lineitem.field.length!=undefined){
        //    B.table.lineitem.field.forEach(function(r){
        //        var tempB= { name: r.name, files:[{ name: 'label',data: r.label},{ name: 'data',data: r.data}] };
        //        bt.folders.push(tempB);
        //    });
        //};
        //
        //if( B.table.footer.field.length!=undefined){
        //    B.table.footer.field.forEach(function(r){
        //        var tempB= { name: r.name, files: [{ name: 'label',data: r.label},{ name: 'data',data: r.data}]};
        //        bt.folders.push(tempB);
        //    });
        //};
        //
        //
        //bodyData.folders.push(bt);
        //$scope.field_data_structure = { folders: []} ;
        //$scope.field_data_structure.folders.push(headerData);
        //$scope.field_data_structure.folders.push(footerData);
        //$scope.field_data_structure.folders.push(bodyData);
    });
};
    var host=$location.$$host+':'+$location.$$port;

$scope.loadMxsd('http://'+host+'/images/ixsd/mxsd.xml');
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
    for(var k in ob){
        var t={name:k,files:ob[k]};
        if(IsJsonString(JSON.stringify(ob))){
            d.push(t);
            getKeyValue(ob[k]);
        }
    };
    return d;
};



    function visit(object) {
        if (isIterable(object)) {
            forEachIn(object, function (accessor, child) {

                visit(child);
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
        return angular.isArray(element);
        //return element.constructor == Array;
    }

    function isObject(element) {
        return angular.isObject(element);
        //return element.constructor == Object;
    }
$scope.loadMasterForm=function(path){
        $http({
            method: 'GET',
            url:path
        }).success(function(xml) {
            var x2js = new X2JS();
            var js = x2js.xml_str2json(xml);
            $scope.ixmlFormFields=js;
            //visit(js);
            //var result = JSONTree.create(js);
            //document.getElementById("masterList").innerHTML = result;
            //var nd=getKeyValue(js);
            //nd.forEach(function(r){
            //    var z=getKeyValue(r.files);
            //});
            //var nd2=getKeyValue(nd.files);
            //var nd3=getKeyValue(nd2.files);
            //var nd4=getKeyValue(nd3.files);

        });
    };
    $scope.loadMasterFormStart=function(){
        var host=$location.$$host+':'+$location.$$port;
        $scope.loadMasterForm('http://'+host+'/images/ixsd/po.xml');
    };

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
        return $scope.isArray(element) || $scope.isObject(element);
    };
    $scope.selectedNodeCrumb = [''];
    $scope.folderSelected=function(key,val,parent){
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

        //val.added=true;
        //$scope.selectedNodeCrumb.push(key)

    };

    $scope.selectedNodeCrumb1=[''];

    $scope.folderSelected1=function(key,val,parent){
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

        //val.added=true;
        //$scope.selectedNodeCrumb.push(key)

    };
    $scope.deleteFieldNode=function(key,val,parent){
        var breadcrumbs = [];
        var nodeScope = parent;
        while (nodeScope.key) {
            breadcrumbs.push(nodeScope.key);
            nodeScope = nodeScope.$parent.$parent.$parent.$parent;
        }
        deleteObject($scope.mxsd.efsuin)
        function deleteObject(object){
            var stack = breadcrumbs.reverse();
            while(stack.length>1){
                object = object[stack.shift()];
            }
            delete object[stack.shift()];
        }
    };
    $scope.deleteParentNode=function(key,val,parent){
        var breadcrumbs = [];
        var nodeScope = parent;
        while (nodeScope.key) {
            breadcrumbs.push(nodeScope.key);
            nodeScope = nodeScope.$parent.$parent.$parent.$parent;
        }
        deleteObject($scope.masterFormFields)
        function deleteObject(object){
            var stack = breadcrumbs.reverse();
            while(stack.length>2){
                object = object[stack.shift()];
            }
            delete object[stack.shift()];
        }
    };
    $scope.viewModel=function(){
        jQuery('#modalview').modal('show');
    }



    $scope.folderSelected2=function(key,val,parent){
        var breadcrumbs = [];
        var nodeScope = parent;
        $scope.selectedNodeCrumb1=[''];
        while (nodeScope.key) {
            breadcrumbs.push(nodeScope.key);
            nodeScope = nodeScope.$parent.$parent.$parent.$parent;
        }
        //nodeScope.show=!nodeScope.show;
        var a='';
        breadcrumbs.reverse().forEach(function(row){
            a+=row+'.';
            $scope.selectedNodeCrumb1.push(row);

        });
        a=a.substring(0, a.length-1);
        //$scope.selectedValue=val;
        val.show=!val.show;

    };

    $scope.folderSelected3=function(key,val,parent){
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
        val.show=!val.show;
    };
    $scope.fileSelected3=function(key,val,parent){

        var breadcrumbs = [];
        var nodeScope = parent;
        $scope.selectedNodeCrumb=[''];
        while (nodeScope.key) {
            breadcrumbs.push(nodeScope.key);
            nodeScope = nodeScope.$parent.$parent.$parent.$parent;
        }
        var a='';
        breadcrumbs.reverse().forEach(function(row){
            a+=row+'/';
            $scope.selectedNodeCrumb.push(row);

        });
        a=a.substring(0, a.length-1);

        //{group:"buyer"}
        $scope.selectedIxsd={ixsdPath:a,ixsdFieldName:$scope.selectedNodeCrumb[$scope.selectedNodeCrumb.length-1]};
        $scope.showIxml=false;

        //val.added=true;
        //$scope.selectedNodeCrumb.push(key)

    };


    //$scope.selectedNodeCrumb = [''];
    //$scope.folderSelected=function(key,val){
    //    val.show=!val.show;
    //    $scope.selectedNodeCrumb.push(key)
    //};
    //$scope.fileSelected=function(key,val){
    //
    //    val.added=true;
    //    $scope.selectedNodeCrumb.push(key)
    //
    //};

    $scope.selectedNodes = [''];



    //Tree Ends

    $scope.gotoButton=function(){
        $(window).ready(function(){
            $('html, body').animate({
                scrollTop: $("#gotoButton").offset().top -0
            }, 1000);
        });
    };

    $scope.setTab=function(tab){
        $scope.hethi_artist_home=tab;
    };
    $scope.convertToDate=function(date){
        date=new Date(date);
        return date;
    };
    $scope.load_hethi_artist_task_list=function(){

        var input={
            'business_artist': $rootScope.loginedUserData.user_id
        };
        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service+'/load_jobs',
            dataType:'jsonp',
            data:input
        }).success(function(data) {
            //logger.log(JSON.stringify(data));
            if(data[0][0].result == "Success"){
                $rootScope.hethi_artist_task_list=data[0];
                init();
                return init();
                //$rootScope.hethi_artist_task_list_grouped = _.groupBy($rootScope.hethi_artist_task_list, function (elemet) {
                //    return elemet.upload_id;
                //});
            }
            else
            {
                $rootScope.hethi_artist_task_list=false;
            }
        });
    };
    $scope.load_hethi_efs_list=function() {
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
                $scope.hethi_efs_list = data[0];
                $scope.hethi_efs_bundle=data[1];
                $scope.hethi_efs_forms=data[2];
                $scope.hethi_bundle_type=[];
                var index=data[0].length-1;
                data[0][index].form_type='Attachment';
                var lastRow=JSON.stringify(data[0][index]);
                $scope.hethi_efs_list.push(lastRow);
                $scope.hethi_efs_bundle.forEach(function(bundle){
                    var bundle_type='';
                    var form_names='';
                    if(bundle.form_primary!=''){
                        $scope.hethi_efs_forms.forEach(function(efs){
                            if(efs.efslob_id==bundle.form_primary){
                                bundle_type=efs.form_type;
                                return false;
                            }
                        })
                    }
                    if(bundle.form_attach1!=''){
                        $scope.hethi_efs_forms.forEach(function(efs1){
                            if(efs1.efslob_id==bundle.form_attach1){
                                bundle_type=bundle_type+" +/- "+efs1.form_type;
                                return false;
                            }
                        })
                    }
                    if(bundle.form_attach2!=''){
                        $scope.hethi_efs_forms.forEach(function(efs1){
                            if(efs1.efslob_id==bundle.form_attach2){
                                bundle_type=bundle_type+" +/- "+efs1.form_type;
                                return false;
                            }
                        })
                    }
                    if(bundle.form_attach3!=''){
                        $scope.hethi_efs_forms.forEach(function(efs1){
                            if(efs1.efslob_id==bundle.form_attach3){
                                bundle_type=bundle_type+" +/- "+efs1.form_type;
                                return false;
                            }
                        })
                    }
                    if(bundle.form_attach4!=''){
                        $scope.hethi_efs_forms.forEach(function(efs1){
                            if(efs1.efslob_id==bundle.form_attach4){
                                bundle_type=bundle_type+" +/- "+efs1.form_type;
                                return false;
                            }
                        })
                    }
                    $scope.hethi_bundle_type.push({efslob_id:bundle.efslob_id,bundle_id:bundle.formbundle_id,bundle_name:bundle_type})
                });
            }
            else{
                $scope.hethi_efs_list=false;
            }
        });

    };
    $rootScope.selectedFormBundle=[];
    $rootScope.selectedBundleList=[];
    $scope.setFormBundleToUploads=function(bundle){
        var input={
            tfs_uin:bundle.bundle_id,
            customer_id:1,
            bundle_name:bundle.bundle_name,
            efslob_id:bundle.efslob_id
        };
        $rootScope.selectedFormBundle.push(input);
        var index=1;
        $scope.models.lists.B.forEach(function(f){
            var input1={
                id:index,
                form_stencid: f.form_stencid,
                form_type: f.form_type,
                form_ownerid: f.form_ownerid,
                efslob_id: f.efslob_id,
                tfs_uin:bundle.bundle_id,
                bundle_name:bundle.bundle_name
            };
            if( f.form_type!='Attachments')
              $rootScope.selectedBundleList.push(input1);
            index++;
        });
        $scope.models.lists.B=[];
        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service + '/save_tfs_uin',
            dataType: 'jsonp',
            data: input
        }).success(function (data) {
            logger.log("Successfully saved !!")

        });
    };
    $scope.bundleformList=[];
    $scope.selectBundleForms=function(bundle){
        $scope.bundleformList=[];
        console.log(bundle.bundle_name);
        var formList=[];
        var efslob=[],index= 0;
        $rootScope.selectedBundleList.forEach(function(f){
            if(f.tfs_uin==bundle.tfs_uin){
                formList[index]= f.form_type;
                efslob[index]= f.efslob_id;
                index++;
            }
        });
        for(var i=0;i<formList.length;i++){
            var efs_uin='';
            $scope.hethi_efs_list.forEach(function(f){
                if(efslob[i]== f.efslob_id){
                    efs_uin= f.efs_uin;
                    return false;
                }
            });
            var input={
                efs_uin:efs_uin,
                form:formList[i],
                tfs_uin:bundle.tfs_uin
            };
            if(formList[i]!='Attachments')
                $scope.bundleformList.push(input)
        }
        console.log(JSON.stringify($scope.bundleformList))
    };
    $rootScope.totalFormFields=[];
    $scope.assignFormToMetadata=function(selectedForm){
        var input={
            table_name:'ixsd_'+selectedForm.efs_uin
        };
        $rootScope.selectEfsUin=selectedForm.efs_uin;
        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service + '/select_ixsd_efs',
            dataType: 'jsonp',
            data: input
        }).success(function (data) {
            $scope.masterFormFields={};
            $rootScope.currentEfsUin=(data[1][0]);
            $scope.masterFormFields[selectedForm.form]=(data[1][0]);
            var input1={
                efs_uin :selectedForm.efs_uin,
                tfs_uin:selectedForm.tfs_uin
            };
            $http({
                method: 'POST',
                url: $rootScope.spring_rest_service + '/change_mxsd_tree',
                dataType: 'jsonp',
                data: input1
            }).success(function (reponse) {
                if(reponse[0][0].result!='Success') {
                    $scope.masterFormFields[selectedForm.form]=(data[1][0]);
                    $rootScope.totalFormFields.push({form_type:selectedForm.efs_uin})
                }
                else{
                    $scope.masterFormFields[selectedForm.form]=(data[1][0]);
                    $rootScope.totalFormFields.push({form_type:selectedForm.form})
                }
            });
        });
    };
    $rootScope.artist_job_container={};
    $scope.load_hethi_artist_task_list();
    $scope.load_hethi_efs_list();
    $scope.startFormPlay=function(data){

        var input1={
            customer_id:data.customer_id
        };

        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service+'/load_cserviceplay',
            dataType:'jsonp',
            data:input1
        }).success(function(res) {
            if(res[0][0].length!=0){
                data.serviceplays=res[0];
            }
            else{
                data.serviceplays='';
            }
        });
        var input2={
            upload_id:data.upload_id
        };

        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service+'/load_uploaded_files',
            dataType:'jsonp',
            data:input2
        }).success(function(files) {
            if(files[0][0].length!=0){

                files[0].forEach(function(f){
                    f.form_type=''
                });
                data.uploaded_files=files[0];
                $rootScope.artist_job_container.selectedForm=files[0][0];
            }
            else
            {
                data.uploaded_files='';
            }
        });
        $scope.hethi_artist_home="viewForms"; //viewServices
        $rootScope.artist_job_container=data;
    };
    $scope.selectImportedForm=function(file){
        $rootScope.artist_job_container.selectedForm=file;
        $rootScope.artist_job_container.file_location=file.file_location;
    };

    $scope.setFormToUploads=function(form){

        $rootScope.artist_job_container.uploaded_files.forEach(function(f){
            if(f.file_id == $rootScope.artist_job_container.selectedForm.file_id){
                f.efs_uin=form.efs_uin;
                f.form_type=form.form_type;
                f.efslob_id=form.efslob_id;
                f.efs_uin=form.efs_uin;
            }
        });
        var input={
            "id":$scope.models.lists.A.length+1,
            "form_stencid":form.form_stencid,
            "form_type":form.form_type,
            "form_ownerid":form.form_ownerid,
            "form_bsource":form.form_bsource,
            "form_bclass":form.form_bclass,
            "efslob_id":form.efslob_id
        };
        $scope.models.lists.A.push(input);
        console.log(JSON.stringify( $scope.models.lists))



    };
    $scope.formPlay_1=function(data){
        $scope.hethi_artist_home="viewForms";//viewForms

    };
    $scope.formPlay_2=function(data){
        $scope.hethi_artist_home="viewBundle";//viewForms
        $(document).ready(function () {

            $(window).scrollTop(0);
            return false;

        });
    };
    $scope.formPlay_3=function(data){
        $(document).ready(function () {

            $(window).scrollTop(0);
            return false;

        });
        $rootScope.totalFormFields=[];

        $scope.efs_groups = _.groupBy(data.uploaded_files, function (elemet) {
            return elemet.efs_uin;
        });
        $scope.stencilingForms=[];
        for (var efs in $scope.efs_groups) {
            var row=$scope.efs_groups[efs];
            var data={efs_uin:efs,form_type:row[0].form_type,forms:row};
            $scope.stencilingForms.push(data) ;
        };
        //$scope.setStencilingForm($scope.stencilingForms[0]);
        $scope.hethi_artist_home="createMetaForm";//viewForms
    };
    //$scope.formPlay_5=function(data){
    //    $scope.hethi_artist_home="classifyIndex";//viewForms
    //};
    $scope.formPlay_5=function(data){
        $(document).ready(function () {

            $(window).scrollTop(0);
            return false;

        });
        $scope.hethi_artist_home="Preview";//viewForms
    };
    $scope.formPlay_4=function(data){
        $(document).ready(function () {
            $(window).scrollTop(0);
            return false;

        });
        $scope.selectedFormType=[];
        $scope.efs_groups = _.groupBy(data.uploaded_files, function (elemet) {
            return elemet.form_type;
        });
        //$scope.test= _.groupBy($rootScope.selectedBundleList,function(element){
        //    return element.bundle_name;
        //});
        //$scope.formsToStencil={};
        //for(var key in $scope.test){
        //    $scope.form_types=[];
        //    for(var i=0;i<$scope.test[key].length;i++){
        //
        //        for(var key1 in $scope.test[key][i]){
        //            if(key1=='form_type'){
        //                for(var key2 in $scope.efs_groups){
        //                    if($scope.test[key][i][key1]==key2){
        //                        $scope.form_types.push($scope.efs_groups[key2]);
        //                        $scope.form_types[0][0].efs_uin=key2;
        //                    }
        //                }
        //            }
        //        }
        //        $scope.formsToStencil[key]=$scope.form_types;
        //    }
        //}
        //$rootScope.formBundleToStencil=[];
        //for(var key in $scope.formsToStencil){
        //    var bundle_name='';
        //    $scope.formTpes={};
        //    for(var i=0;i<$scope.formsToStencil[key].length;i++){
        //        var form_type=$scope.formsToStencil[key][i][0].form_type;
        //        $scope.formTpes[form_type]=$scope.formsToStencil[key][i];
        //        if(i==$scope.formsToStencil[key].length-1){
        //            $scope.formTpes['bundle_name']=key;
        //            //$scope.formTpes['class']=false;
        //        }
        //    }
        //    $rootScope.formBundleToStencil.push($scope.formTpes)
        //}
        //var firstFormType='',index=0;
        //$scope.temp=[];
        //for(var key in $rootScope.formBundleToStencil[0]){
        //    var input='';
        //    if(index==0){
        //        firstFormType=key;
        //        input=$rootScope.formBundleToStencil[0][key];
        //
        //    }
        //    else if(key!='bundle_name'){
        //        input=$rootScope.formBundleToStencil[0][key];
        //    }
        //    $scope.temp.push(input);
        //    index++;
        //}
        //$rootScope.focusedFormType=firstFormType;
        //$rootScope.selectedTfs=$rootScope.selectedBundleList[0].tfs_uin;
        //$rootScope.selectedFormBundleType= $rootScope.formBundleToStencil[0];
        var firstProp;
        for(var key in $scope.efs_groups) {
            if($scope.efs_groups.hasOwnProperty(key)) {
                firstProp = key;
                break;
            }
        }
        $scope.setStencilingForm($scope.efs_groups[firstProp]);
        $scope.hethi_artist_home="viewStecil";

    };
    $scope.keys = function(obj){
        var keys=[];
        Object.keys(obj).forEach(function(k){
            if(k!=='$$hashKey'){
                keys.push(''+k);
            };
        });
        return keys;
        //return obj? Object.keys(obj) : [];
    };
    $scope.selectFormBundle=function(formBundle){
        var selected='',firstFormType='';
        $rootScope.formBundleToStencil.forEach(function(f){
            if(f.bundle_name==formBundle.bundle_name){
                selected=f;
                var index= 0;
                for(var key in f) {
                    if (index == 0) {
                        firstFormType = key;
                        break;
                    }
                }
            }
        });
        $rootScope.selectedTfs=formBundle.tfs_uin;
        $rootScope.selectedFormBundleType=selected;
        $scope.setStencilingForm(firstFormType);
    };

    $scope.stencilingPages=[];

    $scope.setStencilingForm=function(firstFormType){
        var stencil='',upload_id='',file_id='',efs_uin;

        $rootScope.focusedFormType=firstFormType;
        firstFormType.forEach(function(f){
            f.class=false;
        })
        stencil=firstFormType;
        upload_id=firstFormType[0].upload_id;
        file_id=firstFormType[0].file_id;
        efs_uin=firstFormType[0].efs_uin;
        firstFormType[0].class=true;

        var input2={
            upload_id:upload_id,
            file_id:file_id,
            efs_uin:efs_uin,
            customer_id:$rootScope.loginedUserData.customer_id
        };
        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service+'/select_efs_template',
            dataType:'jsonp',
            data:input2
        }).success(function(response) {
            var x2js = new X2JS();
            var host=$location.$$host+':'+$location.$$port;
            //response[0][0].eFS_XSD_location=='stencil id not found' ?
                $http({
                    method: 'GET',
                    url:'http://'+host+'/images/ixsd/mxsd.xml'
                }).success(function(xml) {
                        //console.log("xml : " + xml);


                    setmxsd(x2js.xml_str2json(xml));
                    });
                //:setmxsd(x2js.xml_str2json(response[0][0].eFS_XSD));
            //mxsd.business.industry||bpaas
            //mxsd.formdemo.efsuin
            function setmxsd(js) {
                if (!isArray(js.mxsd.form.header.group)) {
                    js.mxsd.form.header.group=isObject(js.mxsd.form.header.group)? [js.mxsd.form.header.group]:[];
                }
                if (!isArray(js.mxsd.form.footer.group)) {
                    js.mxsd.form.footer.group=isObject(js.mxsd.form.footer.group)? [js.mxsd.form.footer.group]:[];
                }
                if (!isArray(js.mxsd.form.body.group)) {
                    js.mxsd.form.body.group=isObject(js.mxsd.form.body.group)? [js.mxsd.form.body.group]:[];
                }
                js.mxsd.form.header.group.forEach(function (row, i) {
                    if (!isArray(row.field)) {
                        js.mxsd.form.header.group[i].field=isObject(js.mxsd.form.header.group[i].field)? [js.mxsd.form.header.group[i].field]:[];
                    }
                })
                js.mxsd.form.footer.group.forEach(function (row, i) {
                    if (!isArray(row.field)) {
                        js.mxsd.form.footer.group[i].field=isObject(js.mxsd.form.footer.group[i].field)? [js.mxsd.form.footer.group[i].field]:[];
                    }
                })
                js.mxsd.form.body.group.forEach(function (row, i) {
                    if (!isArray(row.field)) {
                        js.mxsd.form.body.group[i].field=isObject(js.mxsd.form.body.group[i].field)? [js.mxsd.form.body.group[i].field]:[];
                    }
                    if(!isArray(row.fieldlist.field)){
                        js.mxsd.form.body.group[i].fieldlist.field=isObject(js.mxsd.form.body.group[i].fieldlist.field)? [js.mxsd.form.body.group[i].fieldlist.field]:[];
                    }
                })
                console.log(JSON.stringify(js));
                $scope.masterFormFields = js;
            }
        });

        $scope.stencilingPages=stencil;
        $scope.setStencilingPage($scope.stencilingPages[0]);

    };
    $scope.stencilForm=[];
    $scope.setStencilingPage=function(form_page){
        $scope.stencilingPages.forEach(function(f){
            f.class=false;
        });
        var input={
            upload_id:form_page.upload_id,
            file_id:form_page.file_id,
            user_id:form_page.lastupuser,
            file_location:form_page.file_location
        };
        $scope.stencilForm.push(input);
        $rootScope.currentPage=form_page.file_name;
        $rootScope.selectedFile_id=form_page.file_id;
        $rootScope.selectedUpload_id=form_page.upload_id;
        $rootScope.selectedUser_id=form_page.lastupuser;
        $rootScope.selectedImage=form_page.file_location;
        form_page.class=true;
        $scope.stencilingPage=form_page;
        //$('#stencilingImage').attr('src',$rootScope.selectedImage).attr('src');
        //$('img').click(function(){
            $('#stencilingImage').attr('src', $(this).attr('src'));
            //$.Jcrop('#stencilingImage');

            $('.jcrop-holder img').attr('src', $rootScope.selectedImage);
        //});

        //$('#stencilingImage').attr('src', $rootScope.selectedImage).load(function(){
            //this.width;   // Note: $(this).width() will not work for in memory images

        //});
        //destroyCanvas();
        //enableDrawing();
    };


    $scope.formDatakeys=[{"fielddisplayname":"Vendor Company Name","fieldvalue":"VendorCompanyName"},{"fielddisplayname":"Vendor Street Address","fieldvalue":"VendorStreetAddress"},{"fielddisplayname":"Vendor City ","fieldvalue":"VendorCity "},{"fielddisplayname":"Vendor State","fieldvalue":"VendorState "},{"fielddisplayname":"Vendor ZipCode","fieldvalue":"VendorZip "},{"fielddisplayname":"Vendor Phone","fieldvalue":"VendorPhone "},{"fielddisplayname":"Vendor Email","fieldvalue":"VendorEmail "},{"fielddisplayname":"Supplier Company Name","fieldvalue":"SupplierCompanyName"},{"fielddisplayname":"Supplier Street Address","fieldvalue":"SupplierStreetAddress"},{"fielddisplayname":"Supplier City","fieldvalue":"SupplierCity "},{"fielddisplayname":"Supplier State","fieldvalue":"SupplierState "},{"fielddisplayname":"Supplier ZipCode","fieldvalue":"SupplierZip "},{"fielddisplayname":"Supplier Phone","fieldvalue":"SupplierPhone "},{"fielddisplayname":"Supplier Email ","fieldvalue":"SupplierEmail "},{"fielddisplayname":"ShipTo Company Name","fieldvalue":"ShipToCompanyName"},{"fielddisplayname":"ShipTo Street Address","fieldvalue":"ShipToStreetAddress"},{"fielddisplayname":"ShipTo City" ,"fieldvalue":"ShipToCity"},{"fielddisplayname":"ShipTo State","fieldvalue":"ShipToState "},{"fielddisplayname":"ShipTo ZipCode" ,"fieldvalue":"ShipToZip "},{"fielddisplayname":"ShipTo Phone" ,"fieldvalue":"ShipToPhone "},{"fielddisplayname":"ShipTo Email ","fieldvalue":"ShipToEmail "},{"fielddisplayname":"Invoice Date","fieldvalue":"InvoiceDate"},{"fielddisplayname":"Invoice Number","fieldvalue":"InvoiceNumber"},{"fielddisplayname":"Purchase Order Number","fieldvalue":"PONumber"},{"fielddisplayname":"Item","fieldvalue":"Item"},{"fielddisplayname":" Description","fieldvalue":"Description"},{"fielddisplayname":" Unit Price","fieldvalue": "Rate"},{"fielddisplayname":" Quantity","fieldvalue": "Quantity"},{"fielddisplayname":" Line Total","fieldvalue": "LineTotal"},{"fielddisplayname":"Subtotal","fieldvalue":"Subtotal"},{"fielddisplayname":" Sales Tax","fieldvalue": "SalesTax"},{"fielddisplayname":" Shipping & Handling Charge","fieldvalue":"S&H"},{"fielddisplayname":" Discount","fieldvalue": "Discount"},{"fielddisplayname":" Total","fieldvalue": "Total"}];
    $scope.formFieldDataList=[{"name":"Company_Code"},{"name":"Department_Code"},{"name":"Branch_Location"},{"name":"Vendor_Class"},{"name":"Invoice_Number"},{"name":"Invoice_Date"},{"name":"PO_Number"},{"name":"PO_Lookup_Flag"},{"name":"Vendor_Number"},{"name":"Vendor_Name"},{"name":"Vendor_Address01"},{"name":"Vendor_Address02"},{"name":"Vendor_City"},{"name":"Vendor_State"},{"name":"Vendor_Zip_5"},{"name":"Vendor_Zip_4"},{"name":"Vendor_Lookup_Flag"},{"name":"Address_Mismatch_Flag"},{"name":"Dept_Lookup_Flag"},{"name":"PaymentTerms"},{"name":"Invoice_Sub_Total"},{"name":"Invoice_Amount"},{"name":"Credit_Original_Invoice"},{"name":"Credit_Category"},{"name":"ReturnMailCategory"},{"name":"Currency"},{"name":"Incoming_Type"},{"name":"Last_Update_Date"},{"name":"PO_Type"},{"name":"Tax_Flag"},{"name":"PO_Vcost"},{"name":"Freight_Term"},{"name":"Duplicate_Flag"}];

    $scope.loadDefaultValues=function(){
        $scope.field_attributes={classify:"yes",split:"no",merge:"no",reject:"yes"};
        $scope.fieldData='';
    };
    $scope.loadDefaultValues();
    $scope.stenciledFieldList=[];

    $scope.addFieldCoord=function(fieldData){
        var x1=$('#x1').val(),
            x2=$('#x2').val(),
            y1=$('#y1').val(),
            y2=$('#y2').val(),
            w =$('#w').val(),
            h =$('#h').val();
        if((x1!="")&&(x2!="")&&(y1!="")&&(y2!="")&&(w!="")&&(h!="")){
            if(fieldData!=undefined) {


                var n=fieldData.name;
                var data={"name":n,"form_coords":{"top":y1,"left":x1,"width":w,"height":h},field_data:n+'_DATA',classify:$scope.field_attributes.classify,split:$scope.field_attributes.split,merge:$scope.field_attributes.merge,reject:$scope.field_attributes.reject};
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
                logger.logWarning('Please select field name');
            }
        }
        else
        {
            logger.logError('Please select a portion of image ');
        }


    };
    $scope.removeFieldCoords=function(i){
        $scope.stenciledFieldList.splice(i,1);
    };
    $scope.getMetadata=function(){
        $scope.generatePreview($scope.fileStencilingData);
    };
    $scope.completedStenciling=function(){
        //$scope.previewContainer
        var input2={
            upload_id:$scope.stencilForm[0].upload_id,
            file_id:$scope.stencilForm[0].file_id,
            user_id:$scope.stencilForm[0].user_id,
            nextqueue:3  //stenciling completed
        };

        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service+'/updatedocumentque',
            dataType:'jsonp',
            data:input2
        }).success(function(res) {

            $scope.previewImage=res[1][0].file_location;

            var image=new Image();
            image.src=res[1][0].file_location;
            $scope.height='886px';
            $scope.width='629px';
            $scope.hethi_artist_home="Preview";

            if (res[0][0].result == "Success"){

                logger.logSuccess('completed');
            }
            else{
                logger.logWarning('failed');
            }



        });
    };
    $scope.completeStenciling=function(){
        $scope.height='886px';
        $scope.width='629px';
        if($scope.masterFormFields.mxsd!=0)
        {
            $scope.completeStencilingProcess();
        }
        else
        {
            logger.logWarning('Please map form');
        }
    };
    $scope.ShowStencilCompleted=false;
    $scope.backToStencil=function(){
        $scope.ShowStencilCompleted=false;
    };
    $scope.saveStenciling=function(){
        $scope.position_cordinates.forEach(function(f){
            if(f.position_name='header'){
                $scope.efs_data_header.forEach(function(fun){
                    if(fun.ixsdfieldname== f.keyName){
                        fun.data.content= f.value;
                    }
                });
            }
            if(f.position_name='footer'){
                $scope.efs_data_footer.forEach(function(fun){
                    if(fun.ixsdfieldname== f.keyName){
                        fun.data.content= f.value;
                    }
                });
            }
        });
        var input={};
        for(var key in $rootScope.currentEfsUin){
            var flag= 0,value='';
            $scope.position_cordinates.forEach(function(fun){
                if(fun.keyName==key){
                    value=fun.value;
                    flag=1;
                }
            });
            if((key.lastIndexOf('date'))==-1){
                input[key]=value;
            }
            else if((key.lastIndexOf('date'))!=-1 && flag==1){
                var cur=new Date(value).getFullYear()+"-"+(new Date(value).getMonth()+1)+"-"+
                        new Date(value).getDate()+" "+new Date(value).getHours()+":"+new Date(value).getMinutes()+
                        ":"+new Date(value).getSeconds()+".0";
                input[key]=cur;
            }
            else{
                input[key]='';
            }
        }
        input['efs_uin']='cefs100101';
        input['din']=1;
        input['uid']=10;
        input['version']=1;
        //input['lastupdtm']='';
        $scope.mxsd.efsuin.header.field=$scope.efs_data_header;
        $scope.mxsd.efsuin.footer.field=$scope.efs_data_footer;
        var x2js = new X2JS();
        var xml = x2js.json2xml_str($scope.mxsd);
        var input1={
            tfs_uin:$rootScope.selectedTfs,
            efs_uin:'cefs100101',
            upload_id:$rootScope.selectedUpload_id,
            din:1,
            customer_id:1,
            lastUpuser:$rootScope.selectedUser_id,
            mxml:xml,
            mxml_location:'',
            file_id:$rootScope.selectedFile_id
        };
        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service+'/stencilservices/save_stencil_data',
            dataType:'jsonp',
            data:input
        }).success(function(res) {
            $http({
                method: 'POST',
                url: $rootScope.spring_rest_service+'/stencilservices//save_mxml_data',
                dataType:'jsonp',
                data:input1
            }).success(function(res) {
                $scope.hethi_artist_home='thankyou';
            });
        });

    };
    $scope.completeStencilingProcess=function(){
        if($scope.masterFormFields.mxsd!=0)
        {
            var jsData=$scope.masterFormFields;
            //var obj=[];
            //if(isArray(jsData.efsuin.body.field)){}
            //if(isObject(jsData.efsuin.body.field)){
            //    obj.push(jsData.efsuin.body.field)
            //    jsData.efsuin.body.field=obj;
            //}else{
            //    jsData.efsuin.body.field=[]
            //}
            //obj=[]
            //if(isArray(jsData.efsuin.body.table.footer.field)){}
            //if(isObject(jsData.efsuin.body.table.footer.field)){
            //    obj.push(jsData.efsuin.body.table.footer.field)
            //    jsData.efsuin.body.table.footer.field=obj;
            //}else{
            //    jsData.efsuin.body.table.footer.field=[]
            //}
            //obj=[]
            //if(isArray(jsData.efsuin.body.table.header.field)){}
            //if(isObject(jsData.efsuin.body.table.header.field)){
            //    obj.push(jsData.efsuin.body.table.header.field)
            //
            //    jsData.efsuin.body.table.header.field=obj;
            //}else{
            //    jsData.efsuin.body.table.header.field=[]
            //}
            //obj=[]
            //if(isArray(jsData.efsuin.body.table.lineitem.field)){}
            //if(isObject(jsData.efsuin.body.table.lineitem.field)){
            //    obj.push(jsData.efsuin.body.table.lineitem.field)
            //    jsData.efsuin.body.table.lineitem.field=obj;
            //}else{
            //    jsData.efsuin.body.table.lineitem.field=[]
            //}
            //obj=[]
            //if(isArray(jsData.efsuin.header.field)){}
            //if(isObject(jsData.efsuin.header.field)){
            //    obj.push(jsData.efsuin.header.field)
            //    jsData.efsuin.header.field=obj;
            //}else{
            //    jsData.efsuin.header.field=[]
            //}
            //obj=[]
            //if(isArray(jsData.efsuin.footer.field)){}
            //if(isObject(jsData.efsuin.footer.field)){
            //    obj.push(jsData.efsuin.footer.field)
            //    jsData.efsuin.footer.field=obj;
            //}else{
            //    jsData.efsuin.footer.field=[]
            //}
            console.log(JSON.stringify(jsData));
            var x2js =new X2JS();
            var xml=x2js.json2xml_str(jsData);
            console.log(xml);

            var input={
                upload_id:$scope.stencilForm[0].upload_id,
                file_id:$scope.stencilForm[0].file_id,
                user_id:$scope.stencilForm[0].user_id,
                nextqueue:3 ,
                efs_content:xml//stenciling completed
            };


                $http({
                    method: 'POST',
                    url: $rootScope.spring_rest_service+'/save_formdata',
                    dataType:'jsonp',
                    data:input
                }).success(function(data) {
                    if (data[0][0].result == "Success"){

                        var formData={
                            'form_stencid':data[0][0].form_stencid,
                            'file_path':$scope.stencilingPage.file_location
                        };
                        $http({
                            method: 'POST',
                            url: $rootScope.spring_rest_service+'/stencilservices/generate_stencil',
                            dataType:'jsonp',
                            data:formData
                        }).success(function(s) {
                            console.log(JSON.stringify(s));

                            $scope.ShowStencilCompleted=true;
                            logger.logSuccess("stenciling completed");
                            $scope.efs_data=[];
                            $scope.position_cordinates=[];

                            $scope.efs_data_header=s.mxsd.form.header;
                            $scope.efs_data_footer=s.mxsd.form.footer;
                            $scope.efs_data_body=s.mxsd.form.body;

                            console.log("efsuin : "+JSON.stringify(s.mxsd.form.efsuin));
                            console.log("header : "+JSON.stringify(s.mxsd.form.header));

                            /************HEADER START************/
                            var headerGroup=[];
                            if($scope.isObject($scope.efs_data_header.group))
                            {headerGroup=[$scope.efs_data_header.group];}
                            else if($scope.isArray($scope.efs_data_header.group))
                            {headerGroup=$scope.efs_data_header.group;}
                            if(headerGroup.length!=0){
                                if($scope.isArray(headerGroup[0])){
                                    headerGroup=headerGroup[0];
                                }
                                var index= 0,value='';
                                headerGroup.forEach(function(row,i){
                                    var groupField=[];
                                    if($scope.isObject(row.field))
                                    {groupField=[row.field];}
                                    else if($scope.isArray(row.field))
                                    {groupField=row.field;}

                                    if(groupField.length!=0) {
                                        if($scope.isArray(groupField[0])){
                                            groupField=groupField[0];
                                        }
                                        groupField.forEach(function (f,j) {
                                            value = '';
                                                    var positionInput = {
                                                        top: Math.ceil(629/$scope.formSize.width*f.data.position.top),
                                                        left: Math.ceil(886/$scope.formSize.Height*f.data.position.left),
                                                        width: Math.ceil(629/$scope.formSize.width*f.data.position.width),
                                                        height: Math.ceil(886/$scope.formSize.Height*f.data.position.height),
                                                        value: f.data.content,
                                                        keyName: f.ixsdfieldname,
                                                        position_name: 'header',
                                                        group_name: row.name
                                                    };
                                                    $scope.position_cordinates.push(positionInput);
                                                    var positionInput = {
                                                        top: Math.ceil(629/$scope.formSize.width*f.label.position.top),
                                                        left: Math.ceil(886/$scope.formSize.Height*f.label.position.left),
                                                        width: Math.ceil(629/$scope.formSize.width*f.label.position.width),
                                                        height: Math.ceil(886/$scope.formSize.Height*f.label.position.height),
                                                        value: f.label.content,
                                                        keyName: f.ixsdfieldname,
                                                        position_name: 'header',
                                                        group_name: row.name
                                                    };
                                                    $scope.position_cordinates.push(positionInput);
                                        });
                                    }
                                });

                            }
                            /************HEADER END************/

                            /************FOOTER START************/
                            var footerGroup=[];
                            if($scope.isObject($scope.efs_data_footer.group))
                            {footerGroup=[$scope.efs_data_footer.group];}
                            else if($scope.isArray($scope.efs_data_footer.group))
                            {footerGroup=$scope.efs_data_footer.group;}
                            if(footerGroup.length!=0){
                                if($scope.isArray(footerGroup[0])){
                                    footerGroup=footerGroup[0];
                                }
                                var index= 0,value='';
                                footerGroup.forEach(function(row,i){
                                    var groupField=[];
                                    if($scope.isObject(row.field))
                                    {groupField=[row.field];}
                                    else if($scope.isArray(row.field))
                                    {groupField=row.field;}
                                    if(groupField.length!=0) {
                                        if($scope.isArray(groupField[0])){
                                            groupField=groupField[0];
                                        }
                                        groupField.forEach(function (f,j) {
                                            value = '';
                                                    var positionInput = {
                                                        top: Math.ceil(629/$scope.formSize.width*f.data.position.top),
                                                        left: Math.ceil(886/$scope.formSize.Height*f.data.position.left),
                                                        width: Math.ceil(629/$scope.formSize.width*f.data.position.width),
                                                        height: Math.ceil(886/$scope.formSize.Height*f.data.position.height),
                                                        value: f.data.content,
                                                        keyName: f.ixsdfieldname,
                                                        position_name: 'footer',
                                                        group_name: row.name
                                                    };
                                                    $scope.position_cordinates.push(positionInput);
                                                    var positionInput = {
                                                        top: Math.ceil(629/$scope.formSize.width*f.label.position.top),
                                                        left: Math.ceil(886/$scope.formSize.Height*f.label.position.left),
                                                        width: Math.ceil(629/$scope.formSize.width*f.label.position.width),
                                                        height: Math.ceil(886/$scope.formSize.Height*f.label.position.height),
                                                        value: f.label.content,
                                                        keyName: f.ixsdfieldname,
                                                        position_name: 'footer',
                                                        group_name: row.name
                                                    };
                                                    $scope.position_cordinates.push(positionInput);
                                        });
                                    }
                                });

                            }
                            /************FOOTER END************/

                            /************BODY START************/
                            var bodyGroup=[];
                            if($scope.isObject($scope.efs_data_body.group))
                            {bodyGroup=[$scope.efs_data_body.group];}
                            else if($scope.isArray($scope.efs_data_body.group))
                            {bodyGroup=$scope.efs_data_body.group;}
                            if(bodyGroup.length!=0){
                                if($scope.isArray(bodyGroup[0])){
                                    bodyGroup=bodyGroup[0];
                                }
                                var index= 0,value='';
                                bodyGroup.forEach(function(row,i){
                                    var groupField=[];
                                    if($scope.isObject(row.field))
                                    {groupField=[row.field];}
                                    else if($scope.isArray(row.field))
                                    {groupField=row.field;}

                                    if(groupField.length!=0) {
                                        if($scope.isArray(groupField[0])){
                                            groupField=groupField[0];
                                        }
                                        groupField.forEach(function (f,j) {
                                            value = '';
                                                    var positionInput = {
                                                        top: Math.ceil(629/$scope.formSize.width*f.data.position.top),
                                                        left: Math.ceil(886/$scope.formSize.Height*f.data.position.left),
                                                        width: Math.ceil(629/$scope.formSize.width*f.data.position.width),
                                                        height: Math.ceil(886/$scope.formSize.Height*f.data.position.height),
                                                        value: f.data.content,
                                                        keyName: f.ixsdfieldname,
                                                        position_name: 'body',
                                                        group_name: row.name
                                                    };
                                                    $scope.position_cordinates.push(positionInput);
                                                    var positionInput = {
                                                        top: Math.ceil(629/$scope.formSize.width*f.label.position.top),
                                                        left: Math.ceil(886/$scope.formSize.Height*f.label.position.left),
                                                        width: Math.ceil(629/$scope.formSize.width*f.label.position.width),
                                                        height: Math.ceil(886/$scope.formSize.Height*f.label.position.height),
                                                        value: f.label.content,
                                                        keyName: f.ixsdfieldname,
                                                        position_name: 'body',
                                                        group_name: row.name
                                                    };
                                                    $scope.position_cordinates.push(positionInput);
                                        });
                                    }
                                    var groupFieldlist=[];
                                    if($scope.isObject(row.fieldlist.field))
                                    {groupFieldlist=[row.fieldlist.field];}
                                    else if($scope.isArray(row.fieldlist.field))
                                    {groupFieldlist=row.fieldlist.field;}

                                    if(groupFieldlist.length!=0) {
                                        if($scope.isArray(groupFieldlist[0])){
                                            groupFieldlist=groupFieldlist[0];
                                        }
                                        groupFieldlist.forEach(function (f,j) {
                                            value = '';
                                                    var positionInput = {
                                                        top: Math.ceil(629/$scope.formSize.width*f.data.position.top),
                                                        left: Math.ceil(886/$scope.formSize.Height*f.data.position.left),
                                                        width: Math.ceil(629/$scope.formSize.width*f.data.position.width),
                                                        height: Math.ceil(886/$scope.formSize.Height*f.data.position.height),
                                                        value: f.data.content,
                                                        keyName: f.ixsdfieldname,
                                                        position_name: 'lineitem',
                                                        group_name: row.name
                                                    };
                                                    $scope.position_cordinates.push(positionInput);
                                                    var positionInput = {
                                                        top: Math.ceil(629/$scope.formSize.width*f.label.position.top),
                                                        left: Math.ceil(886/$scope.formSize.Height*f.label.position.left),
                                                        width: Math.ceil(629/$scope.formSize.width*f.label.position.width),
                                                        height: Math.ceil(886/$scope.formSize.Height*f.label.position.height),
                                                        value: f.label.content,
                                                        keyName: f.ixsdfieldname,
                                                        position_name: 'lineitem',
                                                        group_name: row.name
                                                    };
                                                    $scope.position_cordinates.push(positionInput);
                                        });
                                    }
                                });

                            }
                            /************BODY START************/

                            $scope.completedStenciling();
                        });


                    }
                    else
                    {
                        logger.logWarning('unable to submit formdata, please try again');
                    }
                    //
                    //
                });




        }
        else{
            logger.logWarning('Please map form');
        }
    };

    $rootScope.viewPreviewForWork=function(file){
        $rootScope.generatePreview(file);
        $location.path('StartWorkflow');
    };


    $scope.load_ccore_serviceplays=function(){
        var input={
            'customer_id':$rootScope.loginedUserData.customer_id
        };
        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service+'/load_ccore_serviceplays',
            dataType:'jsonp',
            data: input
        }).success(function(data) {
            $scope.servicePlaysQue=data[0];
            //console.log(JSON.stringify(data[0]));
        });

    };

    $scope.load_ccore_serviceplays();

    $scope.jumpToWorkflow=function(q){



        var nq=q.hethi_subservicecode;
        var hethi_subservicecode=nq.replace(/ /g,'');
        console.log("selected q:"+JSON.stringify(q));
        console.log("nextQ Name:"+q.hethi_subservicecode+",nextQ:"+hethi_subservicecode);
        var sfs_uin= q.sfs_UIN;
        $rootScope.startWorkflow(sfs_uin,hethi_subservicecode);

    };
    $rootScope.ProceedToWorkflow=function(){
        var sfs_uin='csfs100101';
        var hethi_subservicecode='daas_channel';
        $rootScope.startWorkflow(sfs_uin,hethi_subservicecode);
    };
    $scope.getWorkflowLog=true;
    $rootScope.startWorkflow=function(sfs_uin,hethi_subservicecode){

        logger.log('Workflow Started');
        $scope.getWorkflowLog=false;
        if($rootScope.previewContainer!=undefined){


            var formData={
                'customer_id':$rootScope.loginedUserData.customer_id,
                'efs_uin':$rootScope.previewContainer.efs_uin,
                'sfs_uin':sfs_uin,
                'current_channel':hethi_subservicecode
            };
            $http({
                method: 'POST',
                url: $rootScope.spring_rest_service+'/startWorkFlow',
                dataType:'jsonp',
                data:formData
            }).success(function(res) {
                //console.log("response: " +res);
                var log=res.description;
                var i=log.length;
                i=i-1;
                var description="["+log.substring(0,i)+"]";
                console.log("log: " +description);
                $scope.getWorkflowLog=JSON.parse(description);
                logger.logSuccess('Workflow completed ');
            }).error(function(err){
                logger.logError('Unable to complete workflow  , Please try again !');
                $scope.getWorkflowLog=true;
            });
        }
        else
        {
            logger.logError('please select a file to process');
        }

    };

    $scope.copyItem=function(one,item){
        var a={};
        if(angular.isArray(item[one])) {
            a=myArray(item[one]);
            return a;
        }else if(angular.isObject(item[one])) {
            a=myObject(item[one]);
            return a;
        }else{
            a=myItem(item[one]);
            return a;
        }
        function myArray(val){
            val.forEach(function(rows){
                for(var key in rows){
                    if(angular.isArray(rows[key])){
                        myArray(rows[key]);
                    }else if(angular.isObject(rows[key])) {
                        myObject(rows[key]);
                    }else{
                        myItem(rows[key]);
                    }
                }
            });
            return val;
        }
        function myObject(val){
            for(var key in val){
                if(angular.isArray(val[key])){
                    myArray(val[key]);
                }else if(angular.isObject(val[key])) {
                    myObject(val[key]);
                }else{
                    myItem(val[key]);
                }
            }
            return val;
        }
        function myItem(val){
            val={
                "name": "",
                "ixsdfieldname": ""+one,
                "value":"",
                "label": {
                    "content":"",
                    "position": {
                        "top": "",
                        "left": "",
                        "width": "",
                        "height": ""
                    },
                    "classify": {
                        "toreject": "",
                        "tosplit": "",
                        "tomerge": "",
                        "tomXSD": ""
                    }
                },
                "data": {
                    "content":"",
                    "position": {
                        "top": "",
                        "left": "",
                        "width": "",
                        "height": ""
                    },
                    "classify": {
                        "toreject": "",
                        "tosplit": "",
                        "tomerge": "",
                        "tomXSD": ""
                    }
                }};
            return val;
        }
    };

    $scope.keys = function(obj){
        var keys=[];
        Object.keys(obj).forEach(function(k){
            if(k!=='$$hashKey'){
                keys.push(''+k);
            };
        });
        return keys;
        //return obj? Object.keys(obj) : [];
    };

    $scope.save_mxsd=function(data) {

        var input = {
            'customer_id': $rootScope.loginedUserData.customer_id,
            'user_id': $rootScope.loginedUserData.user_id,
            'efs_uin': $rootScope.selectEfsUin,
            'data': JSON.stringify($scope.mxsd)
        };
        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service + '/stencilservices/save_mxsd',
            dataType: 'jsonp',
            data: input
        }).success(function (data) {
        });
    };
    $scope.addTomxsd=function(selectedValue){
        //if(selectedValue.position){
        //    var x1=Math.ceil($scope.formSize.width/600*$('#x1').val());
        //    var y1=Math.ceil($scope.formSize.Height/850*$('#y1').val());
        //    var w=Math.ceil($scope.formSize.width/600*$('#w').val());
        //    var h=Math.ceil($scope.formSize.Height/850*$('#h').val());
        //    //x1=$('#x1').val(),y1=$('#y1').val(),w=$('#w').val(),h=$('#h').val();
        //    selectedValue.position.top= x1;
        //    selectedValue.position.left=y1;
        //    selectedValue.position.width=w;
        //    selectedValue.position.height=h;
        //}
        //var a='';
        //$scope.selectedNodeCrumb1.forEach(function(rows,i){
        //    if(i!=0){
        //        a=a+rows;
        //    }
        //});
        //a= a.substring(0, a.length-1);
        //Object.byString = function(o, s) {
        //    s = s.replace(/\[(\w+)\]/g, '.$1'); // convert indexes to properties
        //    s = s.replace(/^\./, '');           // strip a leading dot
        //    var a = s.split('.');
        //    for (var i = 0, n = a.length; i < n; ++i) {
        //        var k = a[i];
        //        if (k in o) {
        //            o = o[k];
        //        } else {
        //            return;
        //        }
        //    }
        //    return o;
        //};
        //function updateObject(object, newValue, path){
        //
        //    var stack = path.split('.');
        //
        //    while(stack.length>1){
        //        object = object[stack.shift()];
        //    }
        //
        //    object[stack.shift()] = newValue;
        //
        //}
        ////updateObject($scope.mxsd.efsuin,selectedValue,a);
        //logger.logSuccess("Successfully Added");


    }
    $scope.addTocustomxsd=function(selectedValue){
        var groupname='default';
        if($scope.selectedMxsdPath.Value=="header"){
            groupname="header"
        }else if($scope.selectedMxsdPath.Value=="footer"){
            groupname="summary"
        }else if($scope.selectedMxsdPath.Value=="body"){
            groupname="lineitem"
        }else if($scope.selectedMxsdPath.Value=="lineitem"){
            groupname="lineitem"
        }
        //var groupname=$scope.selectedIxsd.group==""?'default':$scope.selectedIxsd.group;
        var added=false,fieldExists=false;
        $scope.selectedIxsd.group=groupname;
        if($scope.selectedMxsdPath.Value!='lineitem') {
            $scope.masterFormFields.mxsd.form[$scope.selectedMxsdPath.Value].group.forEach(function(rows,i){
                if(rows._name==groupname) {
                    $scope.masterFormFields.mxsd.form[$scope.selectedMxsdPath.Value].group[i].field.forEach(function (row, j) {
                        if (row.ixsdfieldname == $scope.selectedIxsd.ixsdFieldName && row.ixsdxpath == $scope.selectedIxsd.ixsdPath) {
                            var x1=Math.ceil($scope.formSize.width/600*$('#x1').val());
                            var y1=Math.ceil($scope.formSize.Height/850*$('#y1').val());
                            var w=Math.ceil($scope.formSize.width/600*$('#w').val());
                            var h=Math.ceil($scope.formSize.Height/850*$('#h').val());
                            $scope.masterFormFields.mxsd.form[$scope.selectedMxsdPath.Value].group[i].field[j][$scope.fieldType.Value].position.top = ""+x1;
                            $scope.masterFormFields.mxsd.form[$scope.selectedMxsdPath.Value].group[i].field[j][$scope.fieldType.Value].position.left = ""+y1;
                            $scope.masterFormFields.mxsd.form[$scope.selectedMxsdPath.Value].group[i].field[j][$scope.fieldType.Value].position.width = ""+w;
                            $scope.masterFormFields.mxsd.form[$scope.selectedMxsdPath.Value].group[i].field[j][$scope.fieldType.Value].position.height = ""+h;
                            $scope.masterFormFields.mxsd.form[$scope.selectedMxsdPath.Value].group[i].field[j].Indexing={
                                "Classify":selectedValue.indexToClassify,
                                "Reject":selectedValue.indexToReject,
                                "SplitMerge":selectedValue.indexToSplitMerge
                            };
                            fieldExists = true;
                            added = true;
                        }
                    });
                    if (!fieldExists) {
                        var x1=Math.ceil($scope.formSize.width/600*$('#x1').val());
                        var y1=Math.ceil($scope.formSize.Height/850*$('#y1').val());
                        var w=Math.ceil($scope.formSize.width/600*$('#w').val());
                        var h=Math.ceil($scope.formSize.Height/850*$('#h').val());
                        $scope.fieldType.Value=="label"?
                        $scope.masterFormFields.mxsd.form[$scope.selectedMxsdPath.Value].group[i].field.push({
                            "name": " ",
                            "ixsdfieldname": $scope.selectedIxsd.ixsdFieldName,
                            "ixsdxpath": $scope.selectedIxsd.ixsdPath,
                            "type": $scope.dataType.Value,
                            "Indexing":{
                                "Classify":selectedValue.indexToClassify,
                                "Reject":selectedValue.indexToReject,
                                "SplitMerge":selectedValue.indexToSplitMerge
                            },
                            "label": {
                                "sequence": " ",
                                "position": {
                                    "top":""+x1,
                                    "left":""+y1,
                                    "width":""+w,
                                    "height":""+h
                                },
                                "content": " "
                            },
                            "data": {
                                "sequence": " ",
                                "position": {
                                    "top": " ",
                                    "left": " ",
                                    "width": " ",
                                    "height": " "
                                },
                                "content": " "
                            }
                        }):
                            $scope.masterFormFields.mxsd.form[$scope.selectedMxsdPath.Value].group[i].field.push({
                                "name": " ",
                                "ixsdfieldname": $scope.selectedIxsd.ixsdFieldName,
                                "ixsdxpath": $scope.selectedIxsd.ixsdPath,
                                "type": $scope.dataType.Value,
                                "Indexing":{
                                    "Classify":selectedValue.indexToClassify,
                                    "Reject":selectedValue.indexToReject,
                                    "SplitMerge":selectedValue.indexToSplitMerge
                                },
                                "label": {
                                    "sequence": " ",
                                    "position": {
                                        "top":" ",
                                        "left":" ",
                                        "width":" ",
                                        "height":" "
                                    },
                                    "content": " "
                                },
                                "data": {
                                    "sequence": " ",
                                    "position": {
                                        "top":""+x1,
                                        "left":""+y1,
                                        "width":""+w,
                                        "height":""+h
                                    },
                                    "content": " "
                                }
                            });
                        added = true;
                    }

                }
            });
            if(!added){
                var x1=Math.ceil($scope.formSize.width/600*$('#x1').val());
                var y1=Math.ceil($scope.formSize.Height/850*$('#y1').val());
                var w=Math.ceil($scope.formSize.width/600*$('#w').val());
                var h=Math.ceil($scope.formSize.Height/850*$('#h').val());
                $scope.selectedMxsdPath.Value!='body'?
                $scope.fieldType.Value=="label"?
                $scope.masterFormFields.mxsd.form[$scope.selectedMxsdPath.Value].group.push(
                {"field":[{
                    "name":" ",
                    "ixsdfieldname":$scope.selectedIxsd.ixsdFieldName,
                    "ixsdxpath":$scope.selectedIxsd.ixsdPath,
                    "type":$scope.dataType.Value,
                    "Indexing":{
                        "Classify":selectedValue.indexToClassify,
                        "Reject":selectedValue.indexToReject,
                        "SplitMerge":selectedValue.indexToSplitMerge
                    },
                    "label":{
                        "sequence":" ",
                        "position":{
                            "top":""+x1,
                            "left":""+y1,
                            "width":""+w,
                            "height":""+h},
                        "content":" "},
                    "data":{
                        "sequence":" ",
                        "position":{
                            "top":" ",
                            "left":" ",
                            "width":" ",
                            "height":" "},
                        "content":" "}
                }],
                    "_name":groupname
                }):
                    $scope.masterFormFields.mxsd.form[$scope.selectedMxsdPath.Value].group.push(
                        {"field":[{
                            "name":" ",
                            "ixsdfieldname":$scope.selectedIxsd.ixsdFieldName,
                            "ixsdxpath":$scope.selectedIxsd.ixsdPath,
                            "type":$scope.dataType.Value,
                            "Indexing":{
                                "Classify":selectedValue.indexToClassify,
                                "Reject":selectedValue.indexToReject,
                                "SplitMerge":selectedValue.indexToSplitMerge
                            },
                            "label":{
                                "sequence":" ",
                                "position":{
                                    "top":" ",
                                    "left":" ",
                                    "width":" ",
                                    "height":" "},
                                "content":" "},
                            "data":{
                                "sequence":" ",
                                "position":{
                                    "top":""+x1,
                                    "left":""+y1,
                                    "width":""+w,
                                    "height":""+h},
                                "content":" "}
                        }],
                            "_name":groupname
                        }):
                    $scope.fieldType.Value=="label"?
                        $scope.masterFormFields.mxsd.form[$scope.selectedMxsdPath.Value].group.push(
                            {"field":[{
                                "name":" ",
                                "ixsdfieldname":$scope.selectedIxsd.ixsdFieldName,
                                "ixsdxpath":$scope.selectedIxsd.ixsdPath,
                                "type":$scope.dataType.Value,
                                "Indexing":{
                                    "Classify":selectedValue.indexToClassify,
                                    "Reject":selectedValue.indexToReject,
                                    "SplitMerge":selectedValue.indexToSplitMerge
                                },
                                "label":{
                                    "sequence":" ",
                                    "position":{
                                        "top":""+x1,
                                        "left":""+y1,
                                        "width":""+w,
                                        "height":""+h},
                                    "content":" "},
                                "data":{
                                    "sequence":" ",
                                    "position":{
                                        "top":" ",
                                        "left":" ",
                                        "width":" ",
                                        "height":" "},
                                    "content":" "}
                            }],
                                "fieldlist":{
                                    "field":[ ]
                                },
                                "_name":groupname
                            }):
                        $scope.masterFormFields.mxsd.form[$scope.selectedMxsdPath.Value].group.push(
                            {"field":[{
                                "name":" ",
                                "ixsdfieldname":$scope.selectedIxsd.ixsdFieldName,
                                "ixsdxpath":$scope.selectedIxsd.ixsdPath,
                                "type":$scope.dataType.Value,
                                "Indexing":{
                                    "Classify":selectedValue.indexToClassify,
                                    "Reject":selectedValue.indexToReject,
                                    "SplitMerge":selectedValue.indexToSplitMerge
                                },
                                "label":{
                                    "sequence":" ",
                                    "position":{
                                        "top":" ",
                                        "left":" ",
                                        "width":" ",
                                        "height":" "},
                                    "content":" "},
                                "data":{
                                    "sequence":" ",
                                    "position":{
                                        "top":""+x1,
                                        "left":""+y1,
                                        "width":""+w,
                                        "height":""+h},
                                    "content":" "}
                            }],
                                "fieldlist":{
                                    "field":[]
                                },
                                "_name":groupname
                            });


                added=true;
            }

        }else{
            $scope.masterFormFields.mxsd.form.body.group.forEach(function(rows,i){
                if(rows._name==groupname) {
                    $scope.masterFormFields.mxsd.form.body.group[i].fieldlist.field.forEach(function (row, j) {
                        if (row.ixsdfieldname == $scope.selectedIxsd.ixsdFieldName && row.ixsdxpath == $scope.selectedIxsd.ixsdPath) {
                            var x1=Math.ceil($scope.formSize.width/600*$('#x1').val());
                            var y1=Math.ceil($scope.formSize.Height/850*$('#y1').val());
                            var w=Math.ceil($scope.formSize.width/600*$('#w').val());
                            var h=Math.ceil($scope.formSize.Height/850*$('#h').val());
                            $scope.masterFormFields.mxsd.form.body.group[i].fieldlist.field[j][$scope.fieldType.Value].position.top = ""+x1;
                            $scope.masterFormFields.mxsd.form.body.group[i].fieldlist.field[j][$scope.fieldType.Value].position.left = ""+y1;
                            $scope.masterFormFields.mxsd.form.body.group[i].fieldlist.field[j][$scope.fieldType.Value].position.width = ""+w;
                            $scope.masterFormFields.mxsd.form.body.group[i].fieldlist.field[j][$scope.fieldType.Value].position.height = ""+h;
                            $scope.masterFormFields.mxsd.form.body.group[i].fieldlist.field[j].Indexing={
                                "Classify":selectedValue.indexToClassify,
                                    "Reject":selectedValue.indexToReject,
                                    "SplitMerge":selectedValue.indexToSplitMerge
                            };
                            fieldExists = true;
                            added = true;
                        }
                    });
                    if (!fieldExists) {
                        var x1=Math.ceil($scope.formSize.width/600*$('#x1').val());
                        var y1=Math.ceil($scope.formSize.Height/850*$('#y1').val());
                        var w=Math.ceil($scope.formSize.width/600*$('#w').val());
                        var h=Math.ceil($scope.formSize.Height/850*$('#h').val());
                        $scope.fieldType.Value=="label"?
                            $scope.masterFormFields.mxsd.form.body.group[i].fieldlist.field.push({
                                "name": " ",
                                "ixsdfieldname": $scope.selectedIxsd.ixsdFieldName,
                                "ixsdxpath": $scope.selectedIxsd.ixsdPath,
                                "type": $scope.dataType.Value,
                                "Indexing":{
                                    "Classify":selectedValue.indexToClassify,
                                    "Reject":selectedValue.indexToReject,
                                    "SplitMerge":selectedValue.indexToSplitMerge
                                },
                                "label": {
                                    "sequence": " ",
                                    "position": {
                                        "top":""+x1,
                                        "left":""+y1,
                                        "width":""+w,
                                        "height":""+h
                                    },
                                    "content": " "
                                },
                                "data": {
                                    "sequence": " ",
                                    "position": {
                                        "top": " ",
                                        "left": " ",
                                        "width": " ",
                                        "height": " "
                                    },
                                    "content": " "
                                }
                            }):
                            $scope.masterFormFields.mxsd.form.body.group[i].fieldlist.field.push({
                                "name": " ",
                                "ixsdfieldname": $scope.selectedIxsd.ixsdFieldName,
                                "ixsdxpath": $scope.selectedIxsd.ixsdPath,
                                "type": $scope.dataType.Value,
                                "Indexing":{
                                    "Classify":selectedValue.indexToClassify,
                                    "Reject":selectedValue.indexToReject,
                                    "SplitMerge":selectedValue.indexToSplitMerge
                                },
                                "label": {
                                    "sequence": " ",
                                    "position": {
                                        "top":" ",
                                        "left":" ",
                                        "width":" ",
                                        "height":" "
                                    },
                                    "content": " "
                                },
                                "data": {
                                    "sequence": " ",
                                    "position": {
                                        "top":""+x1,
                                        "left":""+y1,
                                        "width":""+w,
                                        "height":""+h
                                    },
                                    "content": " "
                                }
                            });
                        added = true;
                    }

                }
            });
            if(!added){
                var x1=Math.ceil($scope.formSize.width/600*$('#x1').val());
                var y1=Math.ceil($scope.formSize.Height/850*$('#y1').val());
                var w=Math.ceil($scope.formSize.width/600*$('#w').val());
                var h=Math.ceil($scope.formSize.Height/850*$('#h').val());
                $scope.fieldType.Value=="label"?
                    $scope.masterFormFields.mxsd.form.body.group.push(
                        {
                            "field":[ ],
                            "fieldlist":{
                                "field":[{
                            "name":" ",
                            "ixsdfieldname":$scope.selectedIxsd.ixsdFieldName,
                            "ixsdxpath":$scope.selectedIxsd.ixsdPath,
                            "type":$scope.dataType.Value,
                                    "Indexing":{
                                        "Classify":selectedValue.indexToClassify,
                                        "Reject":selectedValue.indexToReject,
                                        "SplitMerge":selectedValue.indexToSplitMerge
                                    },
                            "label":{
                                "sequence":" ",
                                "position":{
                                    "top":""+x1,
                                    "left":""+y1,
                                    "width":""+w,
                                    "height":""+h},
                                "content":" "},
                            "data":{
                                "sequence":" ",
                                "position":{
                                    "top":" ",
                                    "left":" ",
                                    "width":" ",
                                    "height":" "},
                                "content":" "}
                        }]},
                            "_name":groupname
                        }):
                    $scope.masterFormFields.mxsd.form[$scope.selectedMxsdPath.Value].group.push(
                        {"field":[{
                            "name":" ",
                            "ixsdfieldname":$scope.selectedIxsd.ixsdFieldName,
                            "ixsdxpath":$scope.selectedIxsd.ixsdPath,
                            "type":$scope.dataType.Value,
                            "Indexing":{
                                "Classify":selectedValue.indexToClassify,
                                "Reject":selectedValue.indexToReject,
                                "SplitMerge":selectedValue.indexToSplitMerge
                            },
                            "label":{
                                "sequence":" ",
                                "position":{
                                    "top":" ",
                                    "left":" ",
                                    "width":" ",
                                    "height":" "},
                                "content":" "},
                            "data":{
                                "sequence":" ",
                                "position":{
                                    "top":""+x1,
                                    "left":""+y1,
                                    "width":""+w,
                                    "height":""+h},
                                "content":" "}
                        }],
                            "_name":groupname
                        });


                added=true;
            }
        }
        $scope.selectedValue=$scope.indexingValues[0];

        logger.logSuccess("Successfully Added");


    }
    $scope.showIxmlChange=function(e){

        $('#ixml').css({
            position: "absolute",
            top: 100,
            left:10,
            display: "flex",
            "z-index": "401",
            "border": "black solid 1px"
        });
        $scope.showIxml=!$scope.showIxml;
    }
    $scope.viewDemo=function() {
        var coords = [];
        if ($scope.masterFormFields.mxsd.form.header.group.length != 0) {

            $scope.masterFormFields.mxsd.form.header.group.forEach(function (row) {
                if(row.field.length!=0) {
                    row.field.forEach(function(rows)
                    {
                       coords.push({
                            x: (850/$scope.formSize.Height * rows.label.position.left),
                            y: ( 600/$scope.formSize.width * rows.label.position.top),
                            width: (600/$scope.formSize.width * rows.label.position.width),
                            height: (850/$scope.formSize.Height  * rows.label.position.height)
                        });
                        coords.push({
                            x: (850/$scope.formSize.Height * rows.data.position.left),
                            y: (600/$scope.formSize.width * rows.data.position.top),
                            width: (600/$scope.formSize.width * rows.data.position.width),
                            height: (850/$scope.formSize.Height * rows.data.position.height)
                        });
                    })
                }
            });
        }
        if ($scope.masterFormFields.mxsd.form.footer.group.length != 0) {

            $scope.masterFormFields.mxsd.form.footer.group.forEach(function (row) {
                if (row.field.length != 0) {
                    row.field.forEach(function (rows) {
                        coords.push({
                            x: (850 / $scope.formSize.Height * rows.label.position.left),
                            y: (600 / $scope.formSize.width * rows.label.position.top),
                            width: (600 / $scope.formSize.width * rows.label.position.width),
                            height: (850 / $scope.formSize.Height * rows.label.position.height)
                        });
                        coords.push({
                            x: (850 / $scope.formSize.Height * rows.data.position.left),
                            y: (600 / $scope.formSize.width * rows.data.position.top),
                            width: (600 / $scope.formSize.width * rows.data.position.width),
                            height: (850 / $scope.formSize.Height * rows.data.position.height)
                        });
                    });
                }
            });
        }
        if ($scope.masterFormFields.mxsd.form.body.group.length != 0) {

            $scope.masterFormFields.mxsd.form.body.group.forEach(function (row) {
                if (row.field.length != 0) {
                    row.field.forEach(function (rows) {
                        coords.push({
                            x: (850 / $scope.formSize.Height * rows.label.position.left),
                            y: (600 / $scope.formSize.width * rows.label.position.top),
                            width: (600 / $scope.formSize.width * rows.label.position.width),
                            height: (850 / $scope.formSize.Height * rows.label.position.height)
                        });
                        coords.push({
                            x: (850 / $scope.formSize.Height * rows.data.position.left),
                            y: (600 / $scope.formSize.width * rows.data.position.top),
                            width: (600 / $scope.formSize.width * rows.data.position.width),
                            height: (850 / $scope.formSize.Height * rows.data.position.height)
                        });
                    });
                }
                $scope.mathCeil=function(x){return Math.ceil(x);};
                if(row.fieldlist.field.length!=0){
                    row.fieldlist.field.forEach(function (rows) {
                        coords.push({
                            x: (850 / $scope.formSize.width * rows.label.position.left),
                            y: (600 / $scope.formSize.width * rows.label.position.top),
                            width: (600 / $scope.formSize.width * rows.label.position.width),
                            height: (850 / $scope.formSize.width * rows.label.position.height)
                        });
                        coords.push({
                            x: (850 / $scope.formSize.width * rows.data.position.left),
                            y: (600 / $scope.formSize.width * rows.data.position.top),
                            width: (600 / $scope.formSize.width * rows.data.position.width),
                            height: (850 / $scope.formSize.width * rows.data.position.height)
                        });
                    });
                }
            })
        }
        $scope.myTemplate=coords;

    };
    $scope.viewAutoStenciling=function(){
        var input={
            file_location:$scope.stencilForm[0].file_location
        }
        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service + '/autoStenciling',
            dataType: 'jsonp',
            data: input
        }).success(function (data) {
            console.log(JSON.stringify(data[0]));
            $scope.autoStencilData=data[0];
        });
    };
    $scope.setY=function(row){
        row.yedited=(+row.y + +15);
    }
    function debugQtyAreas (event, id, areas) {
        console.log(areas.length + " areas", arguments);
    };
    $scope.JcropLoader=function() {
        $.Jcrop('#stencilingImage');
}


    }]);



hethi.directive('collection', function ($compile) {
    return {
        restrict: "E",
        replace: true,
        scope: {
            collection: '=',
            options:'=options',
            drag:"=?drag"
        },
        template: "<ul  style='list-style-type: none;'>" +
            //"<member  ng-if='isArray(collection)==false' ng-repeat='(key,val) in collection' key='key' val='val'></member>" +
        "</ul>",
        controller:function(){

            this.changed=function(options){

            }
        },
        link: function (scope, element, attrs,controller) {
            controller.changed=function(options) {
                scope.options=options;
                scope.$watch(function() { return scope.options; }, function () {
                    //console.log(path);
                });
            };
            if(scope.drag){
                attrs.$set('dndList',"collection");}
            if(angular.isArray(scope.collection)) {
                scope.drag ?
                    element.append("<span ng-repeat='row in collection'><member ng-repeat='(key,val) in row' key='key' val='val' expanded='false' path='options' drag='true'></member></span>"):
                    element.append("<span ng-repeat='row in collection'><member ng-repeat='(key,val) in row' key='key' val='val' expanded='false' path='options'></member></span>");


                //element.append("<span ng-repeat='row in collection'><member ng-repeat='(key,val) in row' key='key' val='val' expanded='false' path='options'></member></span>");
                $compile(element.contents())(scope);
            }
            else
            if (angular.isObject(scope.collection))
            {
                scope.drag?
                    element.append("<member ng-repeat='(key,val) in collection' key='key' val='val' expanded='false' path='options' drag='true'></member>"):
                    element.append("<member ng-repeat='(key,val) in collection' key='key' val='val' expanded='false' path='options'></member>");
                //element.append("<member ng-repeat='(key,val) in collection' key='key' val='val' expanded='false' path='options'></member>");
                $compile(element.contents())(scope);
            }else{
                scope.drag?
                    element.append("<member ng-repeat='(key,val) in collection' key='key' val='val' expanded='false' path='options' drag='true'></member>"):
                    element.append("<member ng-repeat='(key,val) in collection' key='key' val='val' expanded='false' path='options'></member>");
                //element.append("<member ng-repeat='(key,val) in collection' key='key' val='val' expanded='false' path='options'></member>");
                $compile(element.contents())(scope);
            }
        }
    };
})

    .directive('member', function ($compile) {
        return {
            restrict: "E",
            replace: true,
            require: '^collection',
            scope: {
                val: '=',
                key: '=',
                path:'=?path',
                drag:'=?drag'
            },
            template: "<li ></li>",
            link: function (scope, element, attrs,collectionController) {
                var collapsible;
                scope.expanded = collapsible == false;

                scope.folderSelected=function(key,val,parent){
                    var breadcrumbs = [];
                    var nodeScope = parent;
                    scope.selectedNodeCrumb=[''];
                    while (nodeScope.key) {
                        breadcrumbs.push(nodeScope.key);
                        nodeScope = nodeScope.$parent.$parent.$parent;
                    }
                    var a='';
                    breadcrumbs.reverse().forEach(function(row){
                        a+=row+'.';
                        scope.selectedNodeCrumb.push(row);

                    });
                    scope.path=scope.selectedNodeCrumb;
                    collectionController.changed(scope.path);
                    a=a.substring(0, a.length-1);
                    scope.expanded==false?scope.expanded=true:scope.expanded=false;
                };

                scope.fileSelected=function(key,val,parent){

                    var breadcrumbs = [];
                    var nodeScope = parent;
                    scope.selectedNodeCrumb=[''];
                    while (nodeScope.key) {
                        breadcrumbs.push(nodeScope.key);
                        nodeScope = nodeScope.$parent.$parent.$parent;
                    }
                    var a='';
                    breadcrumbs.reverse().forEach(function(row){
                        a+=row+'.';
                        scope.selectedNodeCrumb.push(row);

                    });
                    scope.path=scope.selectedNodeCrumb;
                    collectionController.changed(scope.path);
                    a=a.substring(0, a.length-1);
                    //val.added=true;
                    //$scope.selectedNodeCrumb.push(key)
                };

                if(scope.drag){
                    attrs.$set('dndDraggable',"{'"+scope.key+"':'"+scope.val+"'}");
                    attrs.$set('dndEffectAllowed',"move");
                    attrs.$set('dndSelected',"models.selected = item");
                    attrs.$set('ngClass',"{'selected': models.selected === item}");
                }

                if(angular.isArray(scope.val)) {
                    scope.drag?
                        element.append('<span    class="text-14  font_b " >'+
                        '<span ng-repeat="node in val"><li ng-repeat="(key,val) in node"' +
                        'dnd-draggable={"{{key}}":val}'+
                        'dnd-effect-allowed="move"'+
                        'dnd-selected="models.selected = item"'+
                        'ng-class={"selected": models.selected === item}" >' +
                        '<span    class="text-14  font_b  "  >'+
                        '<span class=" "  >'+
                        '<span ng-if="expanded==false" ng-click="folderSelected(key,val,$parent)" class="fa fa-folder ">' +
                        '<span class="">{{key}}</span></span>'+
                        '<span ng-if="expanded==true" ng-click="folderSelected(key,val,$parent)"class="fa fa-folder-open "> ' +
                        '<span class="">{{key}}</span></span>' +
                        '<collection ng-show="expanded" collection="val" options="path" drag="true"></collection>'+
                        '</span>'+
                        '</span>' +
                        '</li></span>'):
                        element.append('<span    class="text-14  font_b " >'+
                        '<span ng-repeat="node in val"><li ng-repeat="(key,val) in node" >' +
                        '<span    class="text-14  font_b  "  >'+
                        '<span class=" "  >'+
                        '<span ng-if="expanded==false" ng-click="folderSelected(key,val,$parent)" class="fa fa-folder ">' +
                        '<span class="">{{key}}</span></span>'+
                        '<span ng-if="expanded==true" ng-click="folderSelected(key,val,$parent)"class="fa fa-folder-open "> ' +
                        '<span class="">{{key}}</span></span>' +
                        '<collection ng-show="expanded" collection="val" options="path"></collection>'+
                        '</span>'+
                        '</span>' +
                        '</li></span>');
                    //element.append('<span    class="text-14  font_b " >'+
                    //'<span ng-repeat="node in val"><li ng-repeat="(key,val) in node" >' +
                    //'<span    class="text-14  font_b  "  >'+
                    //'<span class=" "  >'+
                    //'<span ng-if="expanded==false" ng-click="folderSelected(key,val,$parent)" class="fa fa-folder ">' +
                    //'<span class="">{{key}}</span></span>'+
                    //'<span ng-if="expanded==true" ng-click="folderSelected(key,val,$parent)"class="fa fa-folder-open "> ' +
                    //'<span class="">{{key}}</span></span>' +
                    //'<collection ng-show="expanded" collection="val" options="path"></collection>'+
                    //'</span>'+
                    //'</span>' +
                    //'</li></span>')
                    //element.append("<span ng-class='val.show ? "+'"fa fa-folder-open "'+' : '+'"fa fa-folder "'+"' data-ng-click='folderSelected(key,val,$parent)'>{{key}}<span ng-repeat='node in val'><tree collection='node'></tree></span></span>");
                    $compile(element.contents())(scope);
                }else
                if (angular.isObject(scope.val)) {
                    scope.drag?
                        element.append('<span    class="text-14  font_b ">'+
                        '<span class="" >'+
                        '<span ng-if="expanded==false"  ng-click="folderSelected(key,val,$parent)" class="fa fa-folder ">' +
                        '<span class="">{{key}}</span></span>'+
                        '<span ng-if="expanded==true"  ng-click="folderSelected(key,val,$parent)" class="fa fa-folder-open "> ' +
                        '<span class="">{{key}}</span></span>' +
                        '<collection ng-show="expanded" collection="val" options="path" drag="true"></collection>'+
                        '</span>'+
                        '</span>'):
                        element.append('<span    class="text-14  font_b ">'+
                        '<span class="" >'+
                        '<span ng-if="expanded==false"  ng-click="folderSelected(key,val,$parent)" class="fa fa-folder ">' +
                        '<span class="">{{key}}</span></span>'+
                        '<span ng-if="expanded==true"  ng-click="folderSelected(key,val,$parent)" class="fa fa-folder-open "> ' +
                        '<span class="">{{key}}</span></span>' +
                        '<collection ng-show="expanded" collection="val" options="path"></collection>'+
                        '</span>'+
                        '</span>');
                    //    element.append('<span    class="text-14  font_b ">'+
                    //    '<span class="" >'+
                    //    '<span ng-if="expanded==false"  ng-click="folderSelected(key,val,$parent)" class="fa fa-folder ">' +
                    //    '<span class="">{{key}}</span></span>'+
                    //    '<span ng-if="expanded==true"  ng-click="folderSelected(key,val,$parent)" class="fa fa-folder-open "> ' +
                    //    '<span class="">{{key}}</span></span>' +
                    //    '<collection ng-show="expanded" collection="val" options="path"></collection>'+
                    //    '</span>'+
                    //'</span>');
                    //element.append("<span ng-class='val.show ? "+'"fa fa-folder-open "'+' : '+'"fa fa-folder"'+"' data-ng-click='folderSelected(key,val,$parent)'>{{key}}<tree collection='val'></tree></span>");
                    $compile(element.contents())(scope);
                }
                else{
                    scope.drag?
                        element.append('<span data-ng-click="fileSelected(key,val,$parent)" class="">'+
                        '<span class=""><i class="fa fa-file"></i> {{key}}</span>' +
                            //'<span  class="fa fa-file-image-o " > {{key}}  </span>'+
                            //'<span class="fa color-green fa- fa-check-circle" ></span>'+
                        '</span>'):
                        element.append('<span data-ng-click="fileSelected(key,val,$parent)" class="">'+
                        '<span class=""><i class="fa fa-file"></i> {{key}}</span>' +
                            //'<span  class="fa fa-file-image-o " > {{key}}  </span>'+
                            //'<span class="fa color-green fa- fa-check-circle" ></span>'+
                        '</span>');

                    //element.append('<span data-ng-click="fileSelected(key,val,$parent)" class="">'+
                    //'<span class=""><i class="fa fa-file"></i> {{key}}</span>' +
                    //'<span  class="fa fa-file-image-o " > {{key}}  </span>'+
                    //'<span class="fa color-green fa- fa-check-circle" ></span>'+
                    //'</span>');
                    //element.append("<span ng-class='fa fa-file ' data-ng-click='fileSelected(key,value,$parent)' >{{key}}</span>");
                    $compile(element.contents())(scope);
                }
            }
        };

    });

//{
//    "name":"",
//    "ixsdfieldname":"",
//    "ixsdxpath":"",
//    "type":"",
//    "label":{
//    "sequence":"",
//        "position":{
//        "top":"",
//            "left":"",
//            "width":"",
//            "height":""},
//    "content":""},
//    "data":{
//    "sequence":"",
//        "position":{
//        "top":"",
//            "left":"",
//            "width":"",
//            "height":""},
//    "content":""}
