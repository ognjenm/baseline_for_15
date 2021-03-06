'use strict';


hethi.controller('businessProcessController', ['$http','$scope','logger','$filter','$location','$rootScope', function ($http,$scope,logger,$filter,$location,$rootScope){
      //load("sfgdsfg");
    $scope.oneAt = false;
    $scope.isRuleDiv=true;
    $rootScope.currentTab='homePage';
    $scope.setRuleDiv=function(){
        $scope.isNewRule=true;
        $scope.showRuleForm=true;
        $scope.isRuleDiv=! $scope.isRuleDiv;
        $rootScope.currentTab='homePage';
    };
    $scope.processTabs=[{tabs:'homePage'}];
    $scope.setCurrentTab=function(value,r){
        var fields={'condition':[{name:'name'},{desc:'description'},{industry:'industry'},{form_types:'form types'}],
                    'summary':[{startDate:'effective start date'},{endDate:'effective end date'}]};
        var flag= 0,errorKey='',stop = false;
        for(var key1 in fields){
            if(key1 == value){
                fields[key1].forEach(function(row){
                    for(var key2 in row){
                        if(stop == false ){
                            flag=0;
                            for(var key3 in r){
                                if(key3 != 'status' && key2 == key3){
                                    flag=1;
                                }
                            }
                            if(flag == 0){
                                errorKey=row[key2];
                                stop = true;
                            }
                        }
                    }
                });
                $scope.processTabs.push({tabs:key1});
                break;
            }
            else{
                $scope.processTabs.push({tabs:value});
                flag=1;
            }
        }
        if(flag==1){
            $scope.processTabs.forEach(function(current){
                if(current.tabs==value){
                    $rootScope.currentTab=value;
                }
            });

        }
        else
            logger.logError('please give input for rule '+errorKey)
    };

    $scope.setRuleName=function(ruleName){
        $scope.rule_name=ruleName;
    };
    $scope.isEditPackage=false;
    $scope.isFirstOpen = true;
    $scope.isOpen = false;

    $scope.locationNames=[
        {id:"Onboard",value:"On-board service"},
        {id:"Clubhouse",value:"Clubhouse"},
        {id:"Gate",value:"Gate"}
    ];

    $scope.incidentTypesList={
        Onboard:[
            {id:"IFE_faulty",value:"IFE faulty"},
            {id:"223",value:"No special meal as ordered"},
            {id:"Spoilt",value:"Spoilt/damaged belongings"}
        ],
        Clubhouse:[
            {id:"",value:"No appointments available"},
            {id:"",value:"Late/delayed transport service"},
            {id:"",value:"Facilities not available"}
        ]
    };
    $scope.incidentRuleList={
        IFE_faulty:[
            {id:"IFE ",value:"IFE "},
            {id:"222",value:"ordered"},
            {id:"4344",value:"Spoilt"}
        ],
        Spoilt:[
            {id:"",value:"appointments"},
            {id:"",value:"Late/transport service"},
            {id:"",value:"not available"}
        ],
        223:[
            {id:"",value:"223 text"},
            {id:"",value:"223/transport service"},
            {id:"",value:"223/ not available"}
        ]
    };

    // Data
    $scope.removePackage=function(){
        var input={
           package_id:$rootScope.currentPackage_id
        };
        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service+'/deleteRulesPackage',
            dataType:'jsonp',
            data:input
        }).success(function(data) {
            $scope.loadPackages();
        });
    };
    $scope.closePackageSettings=function(){
        $scope.loadPackages();
        $('#editPackage').modal('hide');

    };
    $scope.removeWorkSet=function(){
        var input={
            package_id:$rootScope.currentPackage_id,
            workSet_id:$rootScope.currentWorkSet_id
        };
        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service+'/deleteRulesWorkSet',
            dataType:'jsonp',
            data:input
        }).success(function(data) {
            $scope.loadPackages();
        });
    };
    $scope.removeRuleSet=function(){
        var input={
            package_id:$rootScope.currentPackage_id,
            workSet_id:$rootScope.currentWorkSet_id,
            ruleSet_id:$rootScope.currentRuleSet_id
        };
        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service+'/deleteRulesSet',
            dataType:'jsonp',
            data:input
        }).success(function(data) {
            $scope.loadPackages();
        });
    };
    $scope.showPackage=false;
    $scope.changeRadioStatus=function(status){
        if(status){
            $scope.showPackage=true;
            document.getElementById('label1').innerHTML="Derived Package Name";
        }
        else{
            $scope.showPackage=false;
            document.getElementById('label1').innerHTML="New Package Name";
        }
    };
    $scope.selectWorkSet=function(packageId){
        $scope.workSetTemp= _.groupBy($scope.worksetList,function(element){
            return element.crulespackage_id;
        });
        var flag=0;
        for(var key in $scope.workSetTemp){
            if(key==packageId){
                flag=1;
                $scope.WorkSetLists=$scope.workSetTemp[key];
            }
        }
        if(flag==0){
            $scope.WorkSetLists=[];
        }

    };
    $scope.selectRuleSet=function(workset){
        $scope.ruleSetTemp= _.groupBy($scope.rulesetList,function(element){
            return element.workset_id;
        });
        var flag=0;
        for(var key in $scope.ruleSetTemp){
            if(key==workset){
                flag=1;
                $scope.RuleSetLists=$scope.ruleSetTemp[key];
            }
        }
        if(flag==0){
            $scope.RuleSetLists=[];
        }
    };
    $scope.downRuleSetOrder=function(index){
        var lastIndex=0;
        $scope.ruleSetSequence.forEach(function(fun,i){
            if(i==index){
                $scope.ruleSetSequence[i+1].ruleset_order=fun.ruleset_order;
                fun.ruleset_order = +fun.ruleset_order + +1;
                return false;
            }
            lastIndex=i;
        });
        $scope.temp=$scope.ruleSetSequence;
        $scope.ruleSetSequence=[];
        $scope.temp.forEach(function(fun){
            $scope.ruleSetSequence[fun.ruleset_order-1] =fun;
        })

    };
    $scope.upRuleSetOrder=function(index){
        var lastIndex=0;
        $scope.ruleSetSequence.forEach(function(fun,i){
            if(i==index){
                $scope.ruleSetSequence[lastIndex].ruleset_order=fun.ruleset_order;
                fun.ruleset_order = +fun.ruleset_order - +1;
                return false;
            }
            lastIndex=i;
        });
        $scope.temp=$scope.ruleSetSequence;
        $scope.ruleSetSequence=[];
        $scope.temp.forEach(function(fun){
            $scope.ruleSetSequence[fun.ruleset_order-1] =fun;
        })

    };
    $scope.upWorkSetOrder=function(index){
        var lastIndex=0;
        $scope.workSetSequence.forEach(function(fun,i){
            if(i==index){
                $scope.workSetSequence[lastIndex].workset_order=fun.workset_order;
                fun.workset_order = +fun.workset_order - +1;
                return false;
            }
            lastIndex=i;
        });
        $scope.temp=$scope.workSetSequence;
        $scope.workSetSequence=[];
        $scope.temp.forEach(function(fun){
            $scope.workSetSequence[fun.workset_order-1] =fun;
        })

    };

    $scope.downWorkSetOrder=function(index){
        var lastIndex=0;
        $scope.workSetSequence.forEach(function(fun,i){
            if(i==index){
                $scope.workSetSequence[i+1].workset_order=fun.workset_order;
                fun.workset_order = +fun.workset_order + +1;
                return false;
            }
            lastIndex=i;
        });
        $scope.temp=$scope.workSetSequence;
        $scope.workSetSequence=[];
        $scope.temp.forEach(function(fun){
            $scope.workSetSequence[fun.workset_order-1] =fun;
        })

    };
    $scope.saveSequence=function(){
        var json=new X2JS();
        var workSetTempXml={ data: $scope.workSetSequence};
        var workSetSequence_xml = "<root>" + json.json2xml_str(workSetTempXml) + "</root>";
        json=new X2JS();
        var ruleSetTempXml={ data: $scope.ruleSetSequence};
        var ruleSetSequence_xml = "<root>" + json.json2xml_str(ruleSetTempXml) + "</root>";

        json=new X2JS();
        var rules=JSON.stringify($scope.ruleSequence).replace("\\\"","'");
        var ruleTempXml={ data: rules};
        var ruleSequence_xml = "<root>" + json.json2xml_str(ruleTempXml) + "</root>";
        var input={
            packageId:$scope.currentPackage,
            worksetId:$scope.currentWorkset,
            ruleSetSequence_xml:ruleSetSequence_xml,
            workSetSequence:workSetSequence_xml,
            ruleSequence:ruleSequence_xml
        };
        //alert(JSON.stringify(input));
        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service+'/saveSequence',
            dataType:'jsonp',
            data:input
        }).success(function(data) {
            logger.logSuccess(data[0][0].result)
            $scope.rulesetList=data[0];
            $scope.rulesetList.forEach(function(response,index){
                if(response.ruleset_id==$scope.currentRuleset) {
                    $scope.ruleSetTemp.push((response));
                    $scope.ruleSequence.push(response)
                }
            });
            $scope.ruleSetSequence.isRuleSetOpen=false;
            $scope.temp=$scope.ruleSetSequence;
            $scope.ruleSetSequence=[];
            $scope.temp.forEach(function(fun){
                $scope.ruleSetSequence[fun.ruleset_order-1] =fun;
            });
            $scope.worksetList=data[1];
            $scope.worksetList.forEach(function(response,index){
                if(response.crulespackage_id==$scope.currentPackage) {
                    $scope.workSetTemp.push((response));
                    $scope.workSetSequence.push(response)
                }
            });
            $scope.workSetSequence.isWorkSetOpen=false;
            $scope.temp=$scope.workSetSequence;
            $scope.workSetSequence=[];
            $scope.temp.forEach(function(fun){
                $scope.workSetSequence[fun.workset_order-1] =fun;
            })


        });
    };
    $scope.openRuleSet=function(rule,index){
        $scope.ruleSetSequence.forEach(function(element,i){
            if(i==index){
                element.isRuleSetOpen=!element.isRuleSetOpen;
            }
            else{
                element.isRuleSetOpen=false;
            }
        });
        $scope.ruleset=[];
        $scope.ruleset.name=rule.crulesset_name;
        $scope.ruleset.description=rule.cruleset_desc;
        $scope.ruleset.startdate=rule.effective_startdate;
        $scope.ruleset.enddate=rule.effective_enddate;
    };
    $scope.fieldArray=[{id:$scope.fieldArray+1,status:true,tableIndex:true}];
    $scope.updateRuleSet=function(ruleset,index){
        var input={
            cruleset_id:$scope.ruleSetSequence[index].cruleset_id,
            ruleset_name:ruleset.name,
            ruleset_description:ruleset.description,
            ruleset_effective_startdate:ruleset.startdate,
            ruleset_effective_enddate:ruleset.enddate
        };
        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service+'/updateRuleset',
            dataType:'jsonp',
            data:input
        }).success(function(data) {
            $scope.ruleSetTemp=[];
            $scope.ruleSetSequence=[];
            data[0].forEach(function(response,index){
                if(response.workset_id==$scope.currentWorkset){
                    $scope.ruleSetTemp.push(response);
                    $scope.ruleSetSequence.push(response);
                }
            });
            $scope.ruleSetSequence.isRuleSetOpen=false;
            $scope.temp=$scope.ruleSetSequence;
            $scope.ruleSetSequence=[];
            $scope.temp.forEach(function(fun){
                $scope.ruleSetSequence[fun.ruleset_order-1] =fun;
            });
        });
    };
    $scope.selectOperators=function(id){
        for(var key in $scope.typeOfOperators){
            if(key==id){
                $scope.operators=$scope.typeOfOperators[key];
                //alert(JSON.stringify($scope.operators))
                if($scope.operators[0].type==5){
                    $scope.isLookUp=true;
                    $scope.funType=5;
                }
                else{
                    $scope.isLookUp=false;
                    $scope.funType=4;
                }
            }
        }

    };
    $scope.created=false;
    $scope.condition='';
    $scope.actionEvent='';
    $scope.formActionStatement=function(field){
        var firstLetter=$scope.field.substring(0,1).toUpperCase();
        var remains=$scope.field.substring(1,$scope.field.length);
        var setter=firstLetter+remains;
        firstLetter=field.substring(0,1).toUpperCase();
        remains=field.substring(1,field.length);
        var setter1=firstLetter+remains;
        $scope.actionEvent=$scope.actionEvent+"form.set"+setter+"(form.get"+setter1+"());";
    };
    $scope.formFailureStatement=function(field){
        var firstLetter=$scope.field.substring(0,1).toUpperCase();
        var remains=$scope.field.substring(1,$scope.field.length);
        var setter=firstLetter+remains;
        firstLetter=field.substring(0,1).toUpperCase();
        remains=field.substring(1,field.length);
        var setter1=firstLetter+remains;
        $scope.failureEvent=$scope.failureEvent+"form.set"+setter+"(form.get"+setter1+"());";
    };
    $scope.fException=true;
    $scope.fMapping=false;
    $scope.fQueue=false;
    $scope.fIsReturn=false;
    $scope.fRule=false;
    $scope.fDefault=false;
    $scope.tabText='exception';
    $scope.failureTab='fException';
    $scope.setSuccessTab=function(text){

        if(text=='exception'){
            $scope.exception=true;
            $scope.mapping=false;
            $scope.queue=false;
            $scope.isReturn=false;
            $scope.rule=false;
            $scope.default=false;
        }
        else if(text=='mapping'){
            $scope.exception=false;
            $scope.mapping=true;
            $scope.queue=false;
            $scope.isReturn=false;
            $scope.rule=false;
            $scope.default=false;
        }
        else if(text=='queue'){
            $scope.exception=false;
            $scope.mapping=false;
            $scope.queue=true;
            $scope.isReturn=false;
            $scope.rule=false;
            $scope.default=false;
        }
        else if(text=='isReturn'){
            $scope.exception=false;
            $scope.mapping=false;
            $scope.queue=false;
            $scope.isReturn=true;
            $scope.rule=false;
            $scope.default=false;
        }
        else if(text=='rule'){
            $scope.exception=false;
            $scope.mapping=false;
            $scope.queue=false;
            $scope.isReturn=false;
            $scope.rule=true;
            $scope.default=false;
        }
        else if(text=='default'){
            $scope.exception=false;
            $scope.mapping=false;
            $scope.queue=false;
            $scope.isReturn=false;
            $scope.rule=false;
            $scope.default=true;
        }
        $scope.tabText=text;
    };
    $scope.setFailureTab=function(text){

        if(text=='fException'){
            $scope.fException=true;
            $scope.fMapping=false;
            $scope.fQueue=false;
            $scope.fIsReturn=false;
            $scope.fRule=false;
            $scope.fDefault=false;
        }
        else if(text=='fMapping'){
            $scope.fException=false;
            $scope.fMapping=true;
            $scope.fQueue=false;
            $scope.fIsReturn=false;
            $scope.fRule=false;
            $scope.fDefault=false;
        }
        else if(text=='fQueue'){
            $scope.fException=false;
            $scope.fMapping=false;
            $scope.fQueue=true;
            $scope.fIsReturn=false;
            $scope.fRule=false;
            $scope.fDefault=false;
        }
        else if(text=='fIsReturn'){
            $scope.fException=false;
            $scope.fMapping=false;
            $scope.fQueue=false;
            $scope.fIsReturn=true;
            $scope.fRule=false;
            $scope.fDefault=false;
        }
        else if(text=='fRule'){
            $scope.fException=false;
            $scope.fMapping=false;
            $scope.fQueue=false;
            $scope.fIsReturn=false;
            $scope.fRule=true;
            $scope.fDefault=false;
        }
        else if(text=='fDefault'){
            $scope.fException=false;
            $scope.fMapping=false;
            $scope.fQueue=false;
            $scope.fIsReturn=false;
            $scope.fRule=false;
            $scope.fDefault=true;
        }
        $scope.failureTab=text;
    };
    $scope.isField='custom';

    $scope.setFieldType=function(flag,index){
        var len= $scope.dynamicRule.length-1;
        $scope.dynamicRule[len].fieldArray.forEach(function(ele,i){
            if(i==index){
                ele.tableIndex=flag;
            }
        });
    };
    $scope.setFunctionCall=function(table){
        $scope.functionParameter=JSON.parse(table).operation_name;
    };

    $scope.addProcessQueue=function(queue){
        var processQueue='';
        processQueue=$scope.actionEvent+"ip.setNext_channel('"+queue+"');";
        $scope.actionEvent=processQueue;
    };

    $scope.addFailureProcessQueue=function(queue){
        var processQueue='';
        processQueue=$scope.failureEvent+"ip.setNext_channel('"+queue+"');";
        $scope.failureEvent=processQueue;
    };
    $scope.showKeyDetails=function(field,outerIndex,index){
        $scope.ruleRepo[outerIndex].showDetails=true;
        $scope.index=index;

    };
    $scope.enableEdit=function(rule,index){
        $scope.ruleTemp.forEach(function(data,i){
            if(i == index){
                data.editMode=true;
            }
            else{
                data.editMode=false;
            }
        });
    };
    $scope.editThisRule=function(rule){
        var condition_list=rule.rule_condition.split('ixsd_'+rule.efs_uin)[1];
        var searchKey=condition_list.substring(condition_list.indexOf("(")+1,
            condition_list.lastIndexOf(")")).split(',');
        var searchKeyAfter='';
        for(var i=0;i < searchKey.length;i++){
            if(isNaN($scope.fieldList[i].value)){
                if($scope.fieldList[i].fieldStatus.length > 0){
                    $scope.fieldList[i].value='form.get'+$scope.fieldList[i].value.substring(0,1).toUpperCase()+
                                     $scope.fieldList[i].value.substring(1)+"()";
                    $scope.fieldList[i].reserved_value='form.get'+$scope.fieldList[i].reserved_value.substring(0,1).toUpperCase()+
                                     $scope.fieldList[i].reserved_value.substring(1)+"()";
                }
            };
            searchKey[i]=searchKey[i].replace($scope.fieldList[i].reserved_value,$scope.fieldList[i].value);
            if(i == 0){
                searchKeyAfter=searchKey[i];
            }
            else searchKeyAfter=searchKeyAfter+","+searchKey[i];
        }
        var subCond=condition_list.substring(condition_list.indexOf("(")+1,
            condition_list.lastIndexOf(")"));
        condition_list=condition_list.replace(subCond,searchKeyAfter);
        rule.rule_condition=rule.rule_condition.split('ixsd_'+rule.efs_uin)[0]+
                          'ixsd_'+rule.efs_uin+condition_list;
        rule.effective_startdate=new Date(rule.effective_startdate).getFullYear()+"-"+(new Date(rule.effective_startdate).getMonth()+1)+"-"+
                          new Date(rule.effective_startdate).getDate();
        rule.effective_enddate=new Date(rule.effective_enddate).getFullYear()+"-"+(new Date(rule.effective_enddate).getMonth()+1)+"-"+
                          new Date(rule.effective_enddate).getDate();
        $scope.updateExistingRule(rule);
        $scope.hideOthers($scope.fieldList[0].rule_index,rule,'load');

    };
    $scope.shows=false;
    $scope.negateShowDetails = function(index){
        $scope.ruleRepo[index].showDetails=false;
    };

    $scope.displayDaasRules=function(rule,ruleIndex){
        var condition_list=rule.rule_condition.split('ixsd_'+rule.efs_uin)[1];
        var searchKey=condition_list.substring(condition_list.indexOf("(")+1,
            condition_list.lastIndexOf(")")).split(',');
        $scope.fieldList=[];
        var field='',operation_name='',value='';
        for(var i=0;i < searchKey.length;i++){
            field='',operation_name='',value='';
            $scope.ruleOperators.forEach(function(data,j){
                if(data.type > 0 && data.operation_name !='in'){
                    if(searchKey[i].lastIndexOf("."+data.operation_name) > -1){
                        if(operation_name.length == 0)
                            operation_name=data.operation_name;
                        else if(operation_name.indexOf(data.operation_name) == -1)
                            operation_name=operation_name+","+data.operation_name;
                    }
                }
                else if(data.type == 0 && data.operation_name !='in'){
                    if(searchKey[i].lastIndexOf(data.operation_name) > -1){
                        if(operation_name.length == 0)
                            operation_name=data.operation_name;
                        else if(operation_name.indexOf(data.operation_name) == -1)
                            operation_name=operation_name+","+data.operation_name;
                    }
                }
            });

            var temp=searchKey[i];
            var index= 0,length=0;
            var searchOps=operation_name.split(",");
            var fieldStatus=' of ';
            for(var j=0;j<searchOps.length;j++){
                if(temp.indexOf(searchOps[j]) > -1){
                   temp = temp.split(searchOps[j]);
                   temp = temp[1];
                   if(j == searchOps.length-1){
                       value=temp.replace('(','').replace(')','').replace('\"','').replace('\"','').replace(' ','');
                       if(value.indexOf('form.get') > -1){
                           value= value.split('form.get')[1].toLowerCase().replace("(","").replace(")","");
                       }
                       else fieldStatus='';
                   }
                }
                else{
                    value=temp.replace('(','').replace(')','').replace('\"','').replace('\"','').replace(' ','');
                    if(value.indexOf('form.get') > -1){
                        value= value.split('form.get')[1].toLowerCase().replace("(","").replace(")","");
                    }
                    else fieldStatus='';
                }
            }
            temp=searchKey[i];
            for(var j=0;j<searchOps.length;j++){
                if(temp.indexOf(searchOps[j]) > -1){
                    temp = temp.split(searchOps[j]);
                    temp = temp[0];
                    if(j == searchOps.length-1){
                        field=temp.replace('(','').replace(')','').replace('\"','').replace('\"','').replace('.','');
                    }
                }
                else{
                    field=temp.replace('(','').replace(')','').replace('\"','').replace('\"','').replace('.','');;
                }
            }
            $scope.fieldList.push({fieldStatus:fieldStatus,reserved_value:value,value:value,field:field,operation_name:operation_name,index:index,stringlength:length,rule_index:ruleIndex})
        }
        $scope.selectFormField(rule.efs_uin);
        $scope.selectedEfsUin.forEach(function(entity,i){
            if(entity.column == value){
                $scope.selectedEntity=entity.column;
            }
        })
    };
    $scope.fieldList=[];
    $scope.displayBpaasRules=function(rule){
        $scope.fieldList=[];
        //var condition_list="'"+rule.rule_condition.split('ixsd_'+rule.efs_uin+"(ip.home(")[1]+"'";
        //var searchKey=condition_list.substring(condition_list.indexOf("\"")+1,
        //    condition_list.lastIndexOf("\"))"));
        //var input={},custom_value='';
        ////alert(searchKey[searchKey.indexOf('form')]);
        //var i=0;
        //while(searchKey.indexOf('form') >=-1 && i==0){
        //    //alert(searchKey.indexOf('form'))
        //    var beforeChange=searchKey.substring(searchKey.indexOf('form'),searchKey.indexOf(','))
        //    searchKey=searchKey.replace(beforeChange,"\""+beforeChange+"\"");
        //    //alert(searchKey)
        //    i=1;
        //}
        //searchKey=JSON.parse(searchKey);
        //$.each(searchKey['custom_inputs'],function(key,value){
        //    if(key =='custom_input'){
        //       custom_value=value ;
        //    }
        //});
        //searchKey['inputs'].forEach(function(row){
        //    input={};
        //    $.each(row,function(key,value){
        //        if(key !='mxml1' && key !='lookupTable'){
        //            input['field']=key;
        //        }
        //        else if(key =='mxml1' && value.length > 0){
        //            input['lookup']=value;
        //        }
        //    });
        //    input['fieldStatus']='';
        //    input['value']=custom_value;
        //    input['operation_name']=searchKey['operation'];
        //    $scope.fieldList.push(input)
        //});
        //alert(JSON.stringify($scope.fieldList))
    };
    $scope.hideOthers=function(index,rule,situation){
        if(rule.rule_category == 'daas'){
            $scope.displayDaasRules(rule,index);
        }
        else if(rule.rule_category == 'bpaas'){
            $scope.displayBpaasRules(rule,index);
        }
        var rule_uin='';
        $scope.ruleTemp.forEach(function(row,i){
            if(i==index){
                if(row.status && situation == 'open')row.status=false;
                else row.status=true;
                rule_uin=row.rule_uin;
            }
            else row.status=false;
        });
        var input={
            rule_uin:rule_uin
        };
        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service+'/loadRuleRepo',
            dataType:'jsonp',
            data:input
        }).success(function(data) {
            if(data[0][0].result =='Success'){
                $scope.ruleRepo=[];
                var lastRow='',row=[],rowToInsert={};
                data[0].forEach(function(rows,i){
                    row=[];
                    if(i == 0){
                        lastRow=rows;
                    }
                    else{
                        $.each(lastRow,function(key,value){
                            rowToInsert={};
                            if(key !='lastupdtm' && key !='repository_no'){
                                $.each(rows,function(key1,value1){
                                    if(key == key1 && value1 != value){
                                        rowToInsert['key']=key;
                                        rowToInsert['old_value']=lastRow[key];
                                        rowToInsert['updated_value']=rows[key1];
                                        row.push(rowToInsert);
                                    }
                                });
                            }
                        });
                        rowToInsert={};
                        if(row.length == 0){
                            rowToInsert['updatedKeys']='no changes';
                            rowToInsert['status']=false;
                        }
                        else{
                            rowToInsert['updatedKeys']=row;
                            rowToInsert['status']=true;
                        }
                        //var date=new Date();
                        rowToInsert['showDetails']=false;
                        rowToInsert['rule_name']=rows.rule_name;
                        rowToInsert['user_firstname']=rows.user_firstname;
                        rowToInsert['lastupdate']=rows.lastupdtm.split(" ")[0];
                        rowToInsert['lastuptime']=rows.lastupdtm.split(" ")[1].split(".")[0];
                        //rowToInsert['lastuptime']=$filter('date')(rows.lastupdtm, 'hh:mm:ss a');
                        $scope.ruleRepo.push(rowToInsert);
                        lastRow=rows;
                    }
                });
            }
            else
                $scope.ruleRepo=[];
        });
    };
    $scope.openWorkset=function(rule,index){
        $scope.workSetSequence.forEach(function(element,i){
            if(i==index){
                element.isWorkSetOpen=!element.isWorkSetOpen;
            }
            else{
                element.isWorkSetOpen=false;
            }
        });
        $scope.workset=[];
        $scope.workset.name=rule.workset_name;
        $scope.workset.description=rule.workset_desc;
        $scope.workset.startdate=rule.effective_startdate;
        $scope.workset.enddate=rule.effective_enddate;
    };
    $scope.updateWorkSet=function(workset,index){
        var input={
            workset_id:$scope.workSetSequence[index].workset_id,
            workset_name:workset.name,
            workset_description:workset.description,
            workset_effective_startdate:workset.startdate,
            workset_effective_enddate:workset.enddate
        };
        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service+'/updateWorkset',
            dataType:'jsonp',
            data:input
        }).success(function(data) {
            $scope.workSetTemp=[];
            $scope.workSetSequence=[];
            data[0].forEach(function(response,index){
                if(response.crulespackage_id==$scope.currentPackage){
                    $scope.workSetTemp.push(response);
                    $scope.workSetSequence.push(response);
                }
            });
            $scope.workSetSequence.isWorkSetOpen=false;
            $scope.temp=$scope.workSetSequence;
            $scope.workSetSequence=[];
            $scope.temp.forEach(function(fun){
                $scope.workSetSequence[fun.workset_order-1] =fun;
            });
        });
    };
    $scope.downOrder=function(index){
        var lastIndex=0;
        $scope.ruleSequence.forEach(function(fun,i){
            if(i==index){
                $scope.ruleSequence[i+1].rule_order=fun.rule_order;
                fun.rule_order = +fun.rule_order + +1;
                return false;
            }
            lastIndex=i;
        });
        $scope.temp=$scope.ruleSequence;
        $scope.ruleSequence=[];
        $scope.temp.forEach(function(fun){
            $scope.ruleSequence[fun.rule_order-1] =fun;
        })

    };
    $scope.upOrder=function(index){
        var lastIndex=0;
        $scope.ruleSequence.forEach(function(fun,i){
            if(i==index){
                $scope.ruleSequence[lastIndex].rule_order=fun.rule_order;
                fun.rule_order = +fun.rule_order - +1;
                return false;
            }
            lastIndex=i;
        });
        $scope.temp=$scope.ruleSequence;
        $scope.ruleSequence=[];
        $scope.temp.forEach(function(fun){
            $scope.ruleSequence[fun.rule_order-1] =fun;
        })

    };
    $scope.package_seq=false;
    $scope.workset_seq=true;
    $scope.ruleset_seq=false;
    $scope.rule_seq=false;
    $scope.enableStatus=function(rule){
        rule.status=1;
        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service+'/enableRulesStatus',
            dataType:'jsonp',
            data:rule
        }).success(function(data) {
             if(data[0][0].result=='Success'){
                 $scope.loadPackages();
             }
        });

    };
    $scope.showRuleList=function(rulesPack){
        $scope.ruleTemp=[];
        $scope.ruleSequence=[];
        var packId='',workId='',ruleSetId='';
        if(rulesPack==undefined){
            packId=$scope.currentPackage;
            workId=$scope.currentWorkset;
            ruleSetId=$scope.currentRuleset;
        }
        else{
            packId=rulesPack.packageId;
            $scope.currentPackage=rulesPack.packageId;
            workId = rulesPack.workSet;
            $scope.currentWorkset=rulesPack.workSet;
            ruleSetId = rulesPack.ruleSet;
            $scope.currentRuleset=rulesPack.ruleSet;
        }
        //alert(JSON.stringify($scope.ruleList));
        //alert(ruleSetId+" "+$scope.ruleList.length);
        $scope.ruleList.forEach(function(response,index){
           if(response.ruleset_id==ruleSetId) {
               response['status']=false;
               $scope.ruleTemp.push((response));
               $scope.ruleSequence.push(response)
           }
        });
        $scope.ruleTemp.forEach(function(data){
            data['editMode']=false;
        });
        $scope.temp=$scope.ruleSequence;
        $scope.ruleSequence=[];
        var index=1;
        $scope.temp.forEach(function(fun){
            fun['id']='id'+index;
            if(fun.rule_status == 1)
                fun['style']={'background-color': '#008BCB','color': 'white','padding': '10px'};
            else
                fun['style']={'background-color': '#add8e6','color': 'white','padding': '10px'};
            $scope.ruleSequence[fun.rule_order-1] =fun;
            index++;
        });

        $scope.ruleSetTemp=[];
        $scope.ruleSetSequence=[];
        $scope.RuleSetLists.forEach(function(response,index){
            if(response.workset_id==workId){
                $scope.ruleSetTemp.push(response);
                $scope.ruleSetSequence.push(response);
            }
        });
        $scope.ruleSetSequence.isRuleSetOpen=false;
        $scope.temp=$scope.ruleSetSequence;
        $scope.ruleSetSequence=[];
        $scope.temp.forEach(function(fun){
            $scope.ruleSetSequence[fun.ruleset_order-1] =fun;
        });

        $scope.workSetTemp=[];
        $scope.workSetSequence=[];
        $scope.WorkSetLists.forEach(function(response,index){
            if(response.crulespackage_id==packId){
                $scope.workSetTemp.push(response);
                $scope.workSetSequence.push(response);
            }
        });
        $scope.workSetSequence.isWorkSetOpen=false;
        $scope.temp=$scope.workSetSequence;
        $scope.workSetSequence=[];
        $scope.temp.forEach(function(fun){
            $scope.workSetSequence[fun.workset_order-1] =fun;
        });
        init = function() {
            $scope.searchIndexer();
            return $scope.selectIndexer($scope.currentPageIndexer);
        };

        return init();
    };

    $scope.saveRuleSequence=function(){

        var json=new X2JS();
        var ruleSetTempXml={ data: $scope.ruleSequence};
        var ruleSequence_xml = "<root>" + json.json2xml_str(ruleSetTempXml) + "</root>";
        var input={
            packageId: $scope.currentPackage,
            workSet:$scope.currentWorkset,
            ruleSet:$scope.currentRuleset,
            ruleSequence:ruleSequence_xml
        };
        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service+'/reorderRulesSequence',
            dataType:'jsonp',
            data:input
        }).success(function(data) {
            $scope.rulesetList=data;
            $scope.rulesetList.forEach(function(response,index){
                if(response.ruleset_id==$scope.currentRuleset) {
                    $scope.ruleSetTemp.push((response));
                    $scope.ruleSequence.push(response)
                }
            });
            $scope.temp=$scope.ruleSequence;
            $scope.ruleSequence=[];
            $scope.temp.forEach(function(fun){
                $scope.ruleSequence[+fun.rule_order - +1] =fun;
            });
        });
    };
    $scope.selectFormField=function(form_type){
        $scope.efs=form_type;

        var input={
            efs_uin:form_type
        };
        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service+'/loadEfsUin',
            dataType:'jsonp',
            data:input
        }).success(function(data) {
            $scope.selectedEfsUin=data[1];
            //alert("first "+JSON.stringify( $scope.selectedEfsUin))

        });
    };
    $scope.selectedEfsUin='';
    $scope.setQueueList=function(group){
        $scope.tempQueueGroup=[];
        for(var key in $scope.listOfQueue){
           if(key==group){
               $scope.tempQueueGroup=($scope.listOfQueue[key]);
           }
        }
    };
    $scope.exception=true;
    $scope.mapping=false;
    $scope.queue=false;
    $scope.isReturn=false;
    $scope.rule=false;
    $scope.default=false;
    $scope.isRequired=true;
    //$scope.actionEvent=''
    $scope.messageFlag=false;
    $scope.btnType='sum';
    $scope.message='enter sum output';

    $scope.selectEfs=function(industry){
        $scope.efsOfIndustry=[];
        for(var key in $scope.formsOfIndustry){
            if(key==industry){
                $scope.efsOfIndustry=$scope.formsOfIndustry[key];
            }
        }
    };
    $scope.loadPackages=function(){
        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service+'/loadRulesPackages',
            dataType:'jsonp'
        }).success(function(data) {
            $scope.rulePackageList=[];
            $scope.packageList= data[0];
            $scope.worksetList=data[1];
            $scope.rulesetList=data[2];
            $scope.ruleList=data[3];
            $scope.ruleOperators=data[4];
            $scope.formTypes=data[5];
            $scope.formsOfIndustry= _.groupBy($scope.formTypes,function(element){
                return element.indus_service;
            });
            $scope.industryList=[];
            for(var key in $scope.formsOfIndustry){
                $scope.industryList.push({industry:key})
            }
            $scope.queueGroup=data[6];
            $scope.queueList=data[7];
            $scope.exceptionList=data[8];
            $scope.operations=data[9];
            $scope.tempRow=[];
            $scope.operationList={opRow:[]};
            var index=0;
            $scope.operations.forEach(function(row,i){
                if(((i+1) % 4 ) != 0){
                    $scope.tempRow.push(row);
                    $scope.operationList['opRow'][index]=$scope.tempRow;
                }
                else if(((i+1) % 4 ) == 0){
                    $scope.tempRow.push(row);
                    $scope.operationList['opRow'][index]=$scope.tempRow;
                    index++;
                    $scope.tempRow=[];
                }
            });
            $scope.listOfQueue= _.groupBy($scope.queueList,function(element){
                return element.hethi_service_id;
            });
            $scope.typeOfOperators= _.groupBy($scope.ruleOperators,function(element){
                return element.category;
            });
            $scope.currentPackage= $scope.packageList[0].rule_package_id;
            $scope.currentWorkSet=$scope.worksetList[0].workset_id;
            $scope.currentRuleSet=$scope.rulesetList[0].cruleset_id;
            $scope.selectWorkSet($scope.packageList[0].rule_package_id);
            $scope.selectRuleSet($scope.worksetList[0].workset_id);
            var input={
                packageId: $scope.packageList[0].rule_package_id,
                workSet:$scope.worksetList[0].workset_id,
                ruleSet:$scope.rulesetList[0].cruleset_id
            };
            $scope.showRuleList(input);

        });
    };
    $scope.setException=function(exceptionField){
        var jsonArray=JSON.parse(exceptionField);
        $scope.actionEvent='';
        $scope.actionEvent=$scope.actionEvent+"form.setQueue('"+jsonArray.exception_queue+"');";
    };
    $scope.failureEvent='';
    $scope.setFailureException=function(exceptionField){
        var jsonArray=JSON.parse(exceptionField);
        $scope.failureEvent='';
        $scope.failureEvent=$scope.failureEvent+"form.setQueue('"+jsonArray.exception_queue+"');";
    };
    $scope.summaryTab=true;
    $scope.FieldArray=[{id:1,status:true,tableIndex:false}];
    $scope.isLookUp=false;
    $scope.changeTab=function(flag){
        if(flag==1)
           $scope.summaryTab=true;
        else
            $scope.summaryTab=false;
    };
    //$scope.ruleArray=[];
    $scope.disableRule=function(rule){
        var input={
            efs_uin:rule.efs_uin,
            rule_uin:rule.rule_uin,
            ruleset_id:rule.ruleset_id
        };
        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service+'/disableRule',
            dataType:'jsonp',
            data:input
        }).success(function(data) {
            logger.logSuccess('rule has disabled..');
            $scope.isRuleDiv=true;
            $http({
                method: 'POST',
                url: $rootScope.spring_rest_service+'/loadRulesPackages',
                dataType:'jsonp'
            }).success(function(data) {
                $scope.rulePackageList=[];
                $scope.packageList= data[0];
                $scope.worksetList=data[1];
                $scope.rulesetList=data[2];
                $scope.ruleList=data[3];
                $scope.ruleOperators=data[4];
                $scope.formTypes=data[5];
                $scope.formsOfIndustry= _.groupBy($scope.formTypes,function(element){
                    return element.indus_service;
                });

                $scope.queueGroup=data[6];
                $scope.queueList=data[7];
                $scope.exceptionList=data[8];
                //document.getElementById('NewRule');
                $scope.typeOfOperators = _.groupBy($scope.ruleOperators, function (element) {
                    return element.category;
                });
                $scope.currentPackage = $scope.packageList[0].rule_package_id;
                $scope.currentWorkSet = $scope.worksetList[0].workset_id;
                $scope.currentRuleSet = $scope.rulesetList[0].cruleset_id;
                $scope.selectWorkSet($scope.currentPackage);
                $scope.selectRuleSet($scope.currentWorkSet);
                var input = {
                    packageId: $scope.currentPackage,
                    workSet: $scope.currentWorkSet,
                    ruleSet: $scope.currentRuleSet
                };

                $scope.showRuleList(input);
                $scope.showSingle=false;
            });


        });
    };

    $scope.ruleType='computation';
    $scope.updateExistingRule= function(rule) {
        var flag = 0;
        if (flag == 0) {
            var startDate = '', endDate = '';
            if (rule.status == undefined)
                rule.status = 'true';
            if (rule.startDate == undefined)
                startDate = new Date().getFullYear() + "-" + (new Date().getMonth() + 1) + "-" + new Date().getDate();
            if (rule.endDate == undefined)
                endDate = new Date().getFullYear() + "-" + (new Date().getMonth() + 1) + "-" + new Date().getDate();
            startDate = rule.effective_startdate;
            endDate = rule.effective_enddate;
            var input = {
                rule_uin:rule.rule_uin,
                rule_order:rule.rule_order,
                rule_category:rule.rule_category,
                ruleset_id: rule.ruleset_id,
                rule_name: rule.rule_name,
                rule_desc: rule.rule_comments,
                rule_efs: rule.efs_uin,
                rule_type: 'header',
                rule_condition: rule.rule_condition,
                rule_action: rule.rule_action,
                rule_failure:rule.rule_failure,
                rule_effective_startdate: startDate,
                rule_effective_enddate: endDate,
                rule_status: rule.rule_status,
                lastUpUser: '1'
            };
            //alert(JSON.stringify(input));
            $http({
                method: 'POST',
                url: $rootScope.spring_rest_service + '/updateRule',
                dataType: 'jsonp',
                data: input
            }).success(function (data) {
                $scope.failureEvent = '';
                $scope.actionEvent = '';
                $scope.conditionList = '';
                $scope.isLookUp = false;
                $scope.dynamicRules = [{
                    'id': 1,
                    status: false,
                    inputFields: [{id: 1, status: false, tableRequired: false}]
                }];
                logger.logSuccess('rule updated successfully..');
                rule.editMode=false;
                $http({
                    method: 'POST',
                    url: $rootScope.spring_rest_service + '/loadRulesPackages',
                    dataType: 'jsonp'
                }).success(function (data) {
                    $scope.rulePackageList = [];
                    $scope.packageList = data[0];
                    $scope.worksetList = data[1];
                    $scope.rulesetList = data[2];
                    $scope.ruleList = data[3];
                    $scope.ruleOperators = data[4];
                    $scope.formTypes = data[5];
                    $scope.formsOfIndustry = _.groupBy($scope.formTypes, function (element) {
                        return element.indus_service;
                    });
                    $scope.queueGroup = data[6];
                    $scope.queueList = data[7];
                    $scope.exceptionList = data[8];
                    //document.getElementById('NewRule');
                    $scope.typeOfOperators = _.groupBy($scope.ruleOperators, function (element) {
                        return element.category;
                    });
                    $scope.currentPackage = $scope.packageList[0].rule_package_id;
                    $scope.currentWorkSet = $scope.worksetList[0].workset_id;
                    $scope.currentRuleSet = $scope.rulesetList[0].cruleset_id;
                    $scope.selectWorkSet($scope.currentPackage);
                    $scope.selectRuleSet($scope.currentWorkSet);
                    var input = {
                        packageId: $scope.currentPackage,
                        workSet: $scope.currentWorkSet,
                        ruleSet: $scope.currentRuleSet
                    };
                    $scope.showRuleList(input);
                    $scope.showSingle = false;
                });
            })
        }
    };
    $scope.addNewRule=function(rule){
        var flag=0;
        if($scope.conditionList == undefined || $scope.conditionList.length == 0 ) flag=1;
        if($scope.actionEvent == undefined || $scope.actionEvent.length == 0) flag=flag+2;
        if($scope.failureEvent == undefined || $scope.failureEvent.length == 0) flag=flag+4;
        if(flag == 1) logger.logError('condition must be set');
        else if(flag == 2) logger.logError('success action must be set');
        else if(flag == 3) logger.logError('condition and success action must be set');
        else if(flag == 4) logger.logError('failure action must be set');
        else if(flag == 5) logger.logError('condition and failure action must be set');
        else if(flag == 6) logger.logError('success action and failure action must be set');
        else if(flag == 7) logger.logError('condition , success action and failure action must be set');
        else if(flag == 0){
            var ruleFlag=0;
            if($scope.isNewRule == false){
                $scope.ruleList.forEach(function(rules){
                    if(rules.rule_name == rule.name || rules.rule_condition == $scope.conditionList){
                        ruleFlag=1
                    }
                });
            }
            if(ruleFlag == 1){
                logger.logError('this rule has already created..')
            }
            else{
                var rule_category='';
                if($scope.ruleType =='simple') rule_category='daas';
                else rule_category='bpaas';
                var startDate='', endDate='';
                if(rule.status==undefined)
                    rule.status='true';
                if(rule.startDate==undefined)
                    startDate=new Date().getFullYear()+"-"+(new Date().getMonth()+1)+"-"+new Date().getDate();
                if(rule.endDate==undefined)
                    endDate=new Date().getFullYear()+"-"+(new Date().getMonth()+1)+"-"+new Date().getDate();
                startDate=new Date(rule.startDate).getFullYear()+"-"+(new Date(rule.startDate).getMonth()+1)+"-"+new Date(rule.startDate).getDate();
                endDate=new Date(rule.endDate).getFullYear()+"-"+(new Date(rule.endDate).getMonth()+1)+"-"+new Date(rule.endDate).getDate();
                var input={
                    ruleset_id:$scope.currentRuleSet,
                    rule_name:rule.name,
                    rule_desc:rule.desc,
                    rule_efs:rule.form_types,
                    rule_type:'header',
                    rule_condition:$scope.conditionList,
                    rule_action:$scope.actionEvent,
                    rule_failure:$scope.failureEvent,
                    rule_effective_startdate:startDate,
                    rule_effective_enddate:endDate,
                    rule_status:rule.status,
                    lastUpUser:'1',
                    rule_category:rule_category
                };
                //alert(JSON.stringify(input));
                $http({
                    method: 'POST',
                    url: $rootScope.spring_rest_service+'/saveNewRule',
                    dataType:'jsonp',
                    data:input
                }).success(function(data) {
                    $scope.failureEvent='';
                    $scope.actionEvent='';
                    $scope.conditionList='';
                    $scope.isLookUp=false;
                    $scope.dynamicRules=[{'id':1,status:false,inputFields:[{id:1,status:false,tableRequired:false}]}];
                    logger.logSuccess('New rule has created..');
                    $scope.isRuleDiv=true;
                    $http({
                        method: 'POST',
                        url: $rootScope.spring_rest_service+'/loadRulesPackages',
                        dataType:'jsonp'
                    }).success(function(data) {
                        $scope.rulePackageList=[];
                        $scope.packageList= data[0];
                        $scope.worksetList=data[1];
                        $scope.rulesetList=data[2];
                        $scope.ruleList=data[3];
                        $scope.ruleOperators=data[4];
                        $scope.formTypes=data[5];
                        $scope.formsOfIndustry= _.groupBy($scope.formTypes,function(element){
                            return element.indus_service;
                        });

                        $scope.queueGroup=data[6];
                        $scope.queueList=data[7];
                        $scope.exceptionList=data[8];
                        //document.getElementById('NewRule');
                        $scope.typeOfOperators = _.groupBy($scope.ruleOperators, function (element) {
                            return element.category;
                        });
                        $scope.currentPackage = $scope.packageList[0].rule_package_id;
                        $scope.currentWorkSet = $scope.worksetList[0].workset_id;
                        $scope.currentRuleSet = $scope.rulesetList[0].cruleset_id;
                        $scope.selectWorkSet($scope.currentPackage);
                        $scope.selectRuleSet($scope.currentWorkSet);
                        var input = {
                            packageId: $scope.currentPackage,
                            workSet: $scope.currentWorkSet,
                            ruleSet: $scope.currentRuleSet
                        };

                        $scope.showRuleList(input);
                        $scope.showSingle=false;
                    });
                })
            }
        }
    };
    $scope.yes=false;

    $scope.formVariable='';
    $scope.showRuleForm=true;
    $scope.setRuleForm=function(form){
        $scope.formVariable='on';
        if(form == 'daas') $scope.ruleType='simple';
        else if(form == 'bpass') $scope.ruleType='computation';
        $scope.showRuleForm=false;
    };
    $scope.showList=true;
    $scope.changeOperator=function(opera,outer,index){

        $scope.tempDynamicRule.forEach(function(data,i){
            if(i == outer){
                data.status = true;
            }
            data.functions.forEach(function(row,ind){
                if(ind == index){
                    row.status = false;
                }
                else row.status = true;
            })
        })
    };
    $scope.enableOrDisable=function(index,value){
        if($scope.ruleTemp[index].editMode)
            $scope.ruleTemp[index].rule_status=value;
    };
    $scope.viewEditHistory=function(rule){
        $scope.showDetails=false;
        $('#ruleRepo').modal('show');
    };
    $scope.showSingle=false;
    $scope.showSingle2=true;
    $scope.showSingle3=true;
    $scope.addNewOperation=function(index,outerIndexVal){
        //$scope.dynamicRule.push({id:$scope.dynamicRule+1,status:false,
        //    functions:[{id:'opera'+1,status:true}],
        //    fieldArray:[{id:1,status:true,tableIndex:false}]})
        $scope.dynamicRule[outerIndexVal].functions.push({id:'opera'+1,status:true});
    };

    $scope.setFieldKey=function(){
        $scope.fieldsList=[];
        var len=$scope.dynamicRule.length-1;
        $scope.dynamicRule[len].fieldArray.forEach(function(ele){
            $scope.setter="form.get";
            var stmt={};
            var field=ele.field.substring(0,1).toUpperCase()+ele.field.substring(1,ele.field.length);
            $scope.setter=$scope.setter+field+"()";
            stmt[ele.field]=$scope.setter;
            $scope.fieldsList.push(stmt);
        });
    };

    $scope.addNewField=function(index,outerIndex){

        $scope.dynamicRule[outerIndex].fieldArray.push({id:$scope.dynamicRule[outerIndex].fieldArray.length+1,
            status:true,tableIndex:false});

    };
    $scope.setVariable=function(){
        $scope.showSingle1=false;
        $scope.showSingle=false;
        $scope.showSingle2=true;
        $scope.showSingle3=true;
    };
    $scope.setRuleType=function(rule_type){
       $scope.ruleType=rule_type;
       $scope.created=false;
        var len=$scope.dynamicRule.length-1;
        $scope.dynamicRule[len].condition_statement='';
    };
    $scope.dynamicOperations=[{id:'opera'+1,status:true}];
    $scope.tempDynamicRule=[{id:$scope.dynamicRule+1,status:false,
        functions:[{id:'opera'+1,status:true}],
        tableIndex:false}];
    $scope.dynamicRule=[{id:$scope.dynamicRule+1,status:false,
        functions:[{id:'opera'+1,status:true}],
        fieldArray:[{id:1,status:true,tableIndex:false}]}];
    $scope.loadPackages();
    $scope.removeCondition=function(index){
        $scope.dynamicRules.splice(index,1);
        $scope.dynamicRules[index-1].operator=undefined;
    };
    $scope.conditionList='';

    $scope.addNewCondition=function(index,symbol){
        $scope.created = true;
        if($scope.funType == 5 )
            $scope.dynamicRule[index].operator = symbol;
        else if($scope.funType == 4 )
            $scope.dynamicRule[index].operator = ',';
        var statement = '';
        var temp = '',lookupType='';
        $scope.dynamicRule.forEach(function (rule, index) {
            $scope.condition = "form:ixsd_" + $scope.efs + "(";
            var operator = '';
            var type = '';
            rule.functions.forEach(function (row) {
                type = JSON.parse(row.operator).type;
                lookupType=type;
                if (type == 0) {
                    operator = operator + JSON.parse(row.operator).operation_name;
                }
                else if (type == 1) {
                    operator = operator + "." + JSON.parse(row.operator).operation_name + "()";
                }
                else if (type == 2) {
                    operator = operator + "." + JSON.parse(row.operator).operation_name + "(";
                }
                else if (type == 3) {
                    operator = operator + "." + JSON.parse(row.operator).operation_name + "(";
                }

            });
            if(lookupType!=5){
                var condition='';
                $scope.field = rule.fieldArray[0].field;
                if (rule.entityValue != undefined) {
                    condition = rule.entityValue;
                    var lower=condition.substring(0,1).toUpperCase()+condition.substring(1);
                    lower='form.get'+lower+'()';
                    statement = $scope.field +operator+ lower + ")";
                }
                else if(rule.condition != undefined) condition=rule.condition;
                if (rule.condition !=undefined && isNaN(rule.condition)) {
                    statement = $scope.field +operator+ "'" + condition + "')";
                }
                else if(rule.condition !=undefined) {
                    statement = $scope.field + operator + condition + ")";
                }

            }
            //else{
            //    var input='[';
            //    $scope.fieldsList.forEach(function(row){
            //        for(var key in row){
            //            input=input+'{"'+key+'":'+row[key]+'}';
            //        }
            //    });
            //    input=input+']';
            //    statement=operator+input+'","'+$scope.functionParameter+'")';
            //}
            $scope.condition = $scope.condition + statement;
            if (index == 0)
                temp = temp + statement + ")";
            else {
                temp=temp.substring(0,temp.length-1);
                temp = temp + " " + rule.operator + " " + statement + ")";
            }
        });
        $scope.conditionList = 'ip:iPost() and ';
        $scope.conditionList = $scope.conditionList+"form:ixsd_" + $scope.efs + "(";
        $scope.conditionList = $scope.conditionList + temp;
        $scope.condition = $scope.condition + ")";
        $scope.dynamicRule[index].condition_statement = $scope.condition;
        //alert(JSON.stringify($scope.dynamicRule[index]));
        $scope.dynamicRule.push({
            id: $scope.dynamicRule + 1, status: false,
            functions: [{id: 'opera' + 1, status: true}],
            fieldArray: [{id: 1, status: true, tableIndex: false}]
        });
    };

    $scope.savePackage=function(new_package){
        var cur_package_id=$scope.packageList[$scope.packageList.length-1].rule_package_id;
        var temp=cur_package_id.substring(2,cur_package_id.length);
        cur_package_id=(cur_package_id.substring(0,2))+(++temp);
        var cur_workset_id=$scope.worksetList[$scope.worksetList.length-1].workset_id;
        var temp=cur_workset_id.substring(2,cur_workset_id.length);
        cur_workset_id=(cur_workset_id.substring(0,2))+(++temp);
        var cur_ruleset_id=$scope.rulesetList[$scope.rulesetList.length-1].cruleset_id;
        var temp=cur_ruleset_id.substring(2,cur_ruleset_id.length);
        cur_ruleset_id=(cur_ruleset_id.substring(0,2))+(++temp);
        var cur_rule_id=$scope.ruleList[$scope.ruleList.length-1].rule_id;
        var temp=cur_rule_id.substring(2,cur_rule_id.length);
        cur_rule_id=(cur_rule_id.substring(0,2))+(++temp);
        var input='';
        $scope.worksetTemp=[];
        $scope.rulesetTemp=[];
        $scope.ruleTemp=[];
        if($scope.showPackage){
            var temp_val=cur_workset_id;
            //alert(temp_val+" "+new_package.cloning);
            $scope.worksetList.forEach(function(fun){
                if(fun.crulespackage_id==new_package.cloning){
                    fun.crulespackage_id=cur_package_id;
                    fun.workset_id=temp_val;
                    temp_val=temp_val.substring(0,2)+(+temp_val.substring(2,temp_val.length) + +1);
                    $scope.worksetTemp.push(fun);
                }
            });

            var temp_ruleset_id=cur_ruleset_id;
            var temp_val=cur_workset_id;
            $scope.rulesetList.forEach(function(fun){
                if(fun.crulespackages_id==new_package.cloning) {
                    fun.crulespackages_id=cur_package_id;
                    fun.workset_id=temp_val ;
                    fun.cruleset_id=temp_ruleset_id;
                    temp_ruleset_id=temp_ruleset_id.substring(0,2)+(+temp_ruleset_id.substring(2,temp_ruleset_id.length) + +1);
                    $scope.rulesetTemp.push(fun);
                }
            });
            //alert(JSON.stringify($scope.rulesetTemp));
            var temp_val=cur_workset_id;
            var temp_ruleset_id=cur_ruleset_id;
            var ruleTempId=cur_rule_id;
            $scope.ruleList.forEach(function(fun){
                if(fun.crulespackage_id==new_package.cloning) {
                    fun.crulespackage_id=cur_package_id;
                    fun.cworkset_id=temp_val ;
                    fun.crulesset_id=temp_ruleset_id;
                    fun.rule_id=ruleTempId;
                    ruleTempId=ruleTempId.substring(0,2)+(+ruleTempId.substring(2,ruleTempId.length) + +1);
                    $scope.ruleTemp.push(fun);
                }
            });
            //alert(JSON.stringify($scope.ruleTemp));
            var json=new X2JS();
            var worksetTempXml={ data: $scope.worksetTemp};
            var worksetXml = "<root>" + json.json2xml_str(worksetTempXml) + "</root>";
            console.log(worksetXml)
            var rulesetTempXml={ data: $scope.rulesetTemp};
            var rulesetXml = "<root>" + json.json2xml_str(rulesetTempXml) + "</root>";
            //alert(rulesetXml)
            var ruleTempXml={ data: $scope.ruleTemp};
            var ruleXml = "<root>" + json.json2xml_str(ruleTempXml) + "</root>";
            console.log(ruleXml)
            input={
                package_name:new_package.name,
                package_id: cur_package_id,
                worksetXml:worksetXml,
                rulesetXml:rulesetXml,
                ruleXml:ruleXml,
                package_desc:new_package.description,
                user_id:1,
                cloning_package:new_package.cloning,
                cloning:$scope.showPackage
            };
        }
        else{
            input={
                package_name:new_package.name,
                package_id: cur_package_id,
                worksetXml:'',
                rulesetXml:'',
                ruleXml:'',
                package_desc:new_package.description,
                user_id:1,
                cloning_package:'',
                cloning:$scope.showPackage
            };
        }
        //alert(JSON.stringify(input));
        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service+'/saveRulesPackages',
            dataType:'jsonp',
            data:input
        }).success(function(data) {
            //alert(JSON.stringify(data));
            $scope.loadPackages();
        });
        //$scope.rulePackageList.push(input);
    };
    $scope.saveWorkset=function(workset){
        var cur_workset_id=$scope.worksetList[$scope.worksetList.length-1].workset_id;
        var temp=cur_workset_id.substring(2,cur_workset_id.length);
        cur_workset_id=(cur_workset_id.substring(0,2))+(++temp);
        var input={
            workset_name:workset.name,
            workset_id: cur_workset_id,
            workset_desc:workset.description,
            package_id: $rootScope.currentPackage_id,
            user_id:1
        };
        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service+'/saveRulesWorkset',
            dataType:'jsonp',
            data:input
        }).success(function(data) {
            $scope.loadPackages();
        });
    };
    $scope.saveRuleSet=function(ruleSet){
        if($scope.rulesetList[$scope.rulesetList.length-1].cruleset_id!=undefined) {
            var cur_ruleset_id = $scope.rulesetList[$scope.rulesetList.length - 1].cruleset_id;
            var temp=cur_ruleset_id.substring(2,cur_ruleset_id.length);
            cur_ruleset_id=(cur_ruleset_id.substring(0,2))+(++temp);
        }
        else
            var cur_ruleset_id='rs1001';

        var input={
            ruleSet_id:cur_ruleset_id,
            ruleSet_name:ruleSet.name,
            package_id: $rootScope.currentPackage_id,
            workset_id:$rootScope.currentWorkSet_id,
            ruleSet_desc:ruleSet.description,
            user_id:1
        };
        //alert(JSON.stringify(input));
        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service+'/saveRulesSet',
            dataType:'jsonp',
            data:input
        }).success(function(data) {
            $scope.loadPackages();
        });
    };

    $scope.changePackageStatus=function(rows){
        $rootScope.currentPackage=rows.packageName;
        $rootScope.currentPackage_id=rows.rule_package_id;
    };
    $scope.changeWorkSetStatus=function(rows){
        $rootScope.currentWorkSet=rows.WorkSetName;
        $rootScope.currentWorkSet_id=rows.workset_id;
    };
    $scope.changeRuleSetStatus=function(rows){
        $rootScope.currentRuleSet=rows.RuleSetName;
        $rootScope.currentRuleSet_id=rows.ruleset_id;
    };
    $scope.applyOperation=function(){
        var len=$scope.dynamicRules.length;
        if($scope.selected!=undefined){
            $scope.dynamicRules[len-1].opera=$scope.selected;
            $scope.selected=undefined;
            $scope.operationList.opRow.forEach(function(rows,i){
                rows.forEach(function(data){
                    data.status=0;
                });
            });
            $('#operationPalette').modal('hide');
        }
        else
           logger.logError('select any operation')

    };
    $scope.selectOption=function(index){
        $scope.custom_type_options.forEach(function(data,i){
            if(i == index){
                data.status=1
            }
            else
               data.status=0;
        })
    };
    $scope.dynamicRules=[{'id':1,status:false,inputFields:[{id:1,status:false,tableRequired:false}]}];
    $scope.setCondition=function(){
          var arrayLength=$scope.dynamicRules.length;
          var jsonArray={};
          jsonArray['inputs']='[';
          jsonArray['custom_inputs']={};
          jsonArray['output']='{';
          var message='';
          var conditions='';
          $scope.errorMessage=[];
          $scope.dynamicRules.forEach(function(data,i){
                jsonArray['operation'] = data.opera;
                var input='{';
                data.inputFields.forEach(function(rows,i){
                    var lookup=rows.lookup,lookupEntity=rows.lookupEntity;
                    if(rows.lookupEntity == undefined || !rows.tableRequired){
                        lookupEntity='';
                        lookup='';
                    }
                    else{
                        lookup='';
                        lookup='1_'+rows.lookup.toLowerCase()+'_lookup';
                    }
                    if(i > 0){
                        input=input+',{';
                    }
                    $scope.errorMessage.push({errorKey:rows.entity});
                    if(lookupEntity.length > 0){
                        $scope.errorMessage.push({errorKey:"lookup"});
                    }
                    $scope.value="form.get";
                    var field = rows.entity.substring(0,1).toUpperCase()+rows.entity.substring(1);
                    $scope.value=$scope.value+field+"()";
                    input=input+'"'+rows.entity+'"'+":"+$scope.value+",";
                    input=input+'"mxml1":"'+lookupEntity+'",';
                    input=input+'"lookupTable":"'+lookup+'"}';
                });
                jsonArray['inputs']=jsonArray['inputs']+input+"]";
                if($scope.custom_type_options.length == 0){
                    jsonArray['custom_inputs']['type']='first';
                    jsonArray['expression_type']='first';
                }
                else{
                    var index=0;
                    $scope.custom_type_options.forEach(function(rows,i){
                        if(rows.status == 1){
                            index=i;
                        }
                    });
                    if(index ==0 ){
                        jsonArray['custom_inputs']['type']='first';
                        jsonArray['expression_type']='first';
                    }
                    else {
                        jsonArray['custom_inputs']['type'] = 'second';
                        jsonArray['expression_type'] = 'second';
                    }
                }
                if(data.customInput == undefined || data.customInput.length == 0){ data.customInput=''; }
                else $scope.errorMessage.push({errorKey:"custom_input"});
                jsonArray['custom_inputs']['custom_input']=data.customInput;
                data['jsonArray']=jsonArray;
                if(data.outputEntity !=undefined){
                    $scope.errorMessage.push({errorKey:data.outputEntity});
                    var field=data.outputEntity.substring(0,1).toUpperCase()+data.outputEntity.substring(1);
                    $scope.value='form.get'+field+'()';
                    jsonArray['output']=jsonArray['output']+'"'+data.outputEntity+'":'+$scope.value+'}';
                }
                else{
                    jsonArray['output']=jsonArray['output']+'}';
                }
                var temp=JSON.stringify(jsonArray).replace("\"[","[").replace("]\"","]");
                temp=temp.replace("output\":\"{","output\":{").replace("}\",\"","},\"");
                temp='"'+temp+'"';
                if(i == 0) conditions=conditions+'ip.home('+temp+')';
                else{
                    conditions=conditions+' , ip.home('+temp+')';
                }
          });
          $scope.errorKeys='';
          var errorFlag= 0,outputFlag=0;
          $scope.expression_key.forEach(function(exp,i){
               errorFlag=0;
               $scope.errorMessage.forEach(function(error,j){
                    if(error.errorKey.lastIndexOf(exp.exp_key) > -1){
                        errorFlag=1;
                        if(i==0) message=message+error.errorKey;
                        else if(message.lastIndexOf(error.errorKey) == -1)  message=message+","+error.errorKey
                    }
               });
               if(errorFlag == 0){
                    outputFlag=1;
                    if(i==0) $scope.errorKeys=$scope.errorKeys+exp.exp_key;
                    else $scope.errorKeys=$scope.errorKeys+","+exp.exp_key;
               }
          });
          if(outputFlag == 0){
              if($scope.rules_type == 'header')
                  $scope.conditionList="ip:iPost and form:ixsd_"+$scope.efs+'('+conditions+')';
              else if($scope.rules_type == 'table')
                  $scope.conditionList="ip:iPost and form:ixsd_"+$scope.efs+'_lineitem('+conditions+')';
              $scope.created=true;
              $scope.errorStatus=false;
              $scope.errorList=false;
              $scope.dynamicRules[arrayLength-1].condition_statement = message;
              $scope.dynamicRules.push({'id': $scope.dynamicRules.length+1,status:false,inputFields:[{id:1,status:false,tableRequired:false}]});
              $scope.requireValue=0;
          }
          else{
              $scope.errorStatus=true;
              $scope.created=false;
              $scope.dynamicRules[arrayLength-1].condition_statement = undefined;
          }
    };
    $scope.change=function(){
        $scope.errorList=!$scope.errorList;
    };
    $scope.errorList=false;
    $scope.selectLookupEntity=function(lookup){
        lookup='1_'+lookup+'_lookup';
        var input={
            table:lookup
        };
        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service+'/loadLookupEntities',
            dataType:'jsonp',
            data:input
        }).success(function(data) {
            $scope.selectedLookup=data[1];

        });
    };
    $scope.errorStatus=false;
    $scope.selectOperation=function(row,index){
        $scope.selected=row.operation_name;
        $scope.requireValue=row.custom_value;
        $scope.btnType1=row.custom_type;
        $scope.customInfo=row.custom_message;
        $scope.rules_type=row.rule_type;
        $scope.expression_key=[];
        $scope.expression_input=row.expression_input.split(',');
        for(var i=0;i<$scope.expression_input.length;i++){
            $scope.expression_key.push({exp_key:$scope.expression_input[i]});
        }
        $scope.custom_type_options=[];
        if(row.custom_type_options != undefined){
            $scope.options=row.custom_type_options.split(',');
            for(var i=0;i<$scope.options.length;i++){
                var status=0;
                if(i==0) status=1;
                $scope.custom_type_options.push({id:i+1,option:$scope.options[i],status:status})
            }
        }
        $scope.operationList.opRow.forEach(function(rows,i){
            rows.forEach(function(data,j){
                if(data.operation_name == (row.operation_name)){
                    $scope.displayItems=i;
                    data.status=1;
                }
                else{
                    data.status=0;
                }
            });
        });

    };
    $scope.outerIndex=0;
    $scope.changeStatus=function(status,index,outer){
        $scope.dynamicRules[outer].inputFields.forEach(function(inputs,i){
            if(index == i)
                inputs.tableRequired=status;
        });

    };
    $scope.changeDisplay=function(){
        var next=$scope.displayItems + +2;
        if((next) < $scope.operationList.opRow.length)
            $scope.displayItems = next;
        else
            $scope.displayItems=0;
   };

    $scope.searchOperation=function(operation){
        var flag=0;
        $scope.operationList.opRow.forEach(function(rows,i){
            rows.forEach(function(data){
                var length=operation.operation_name.length;
                if(data.operation_name == (operation.operation_name)){
                    $scope.displayItems=i;
                    flag=1;
                    data.status=1;
                }
                else{
                    flag++;
                    data.status=0;
                }
            });
        });

    };
    $scope.displayItems=0;

    $scope.oneAtATime = true;
    $scope.oneAtaTimeWorkset = true;
    $scope.oneAtaTimeRuleSet = true;
    $scope.oneAtaTimeRule = true;
    $scope.groups = [
        {
            title: "Package - 2",
            content: "WorkSet - 2",
            ruleSet: "RuleSet - 2",
            rule:"Rule - 2"
        }, {
            title: "Package - 3",
            content: "WorkSet - 3",
            ruleSet: "RuleSet - 3",
            rule:"Rule - 3"
        }, {
            title: "Package - 4",
            content: "WorkSet - 4",
            ruleSet: "RuleSet - 4",
            rule:"Rule - 3"
        }
    ];
    $scope.packages = {
        isFirstOpen: true,
        isFirstOpen1: true,
        isFirstOpen2: true,
        isFirstOpen3: true,
        isFirstOpen4: true,
        isFirstOpen5: true,
        isFirstOpen6: true
    };
    $scope.RuleSet = {
      isFirstOpen: false,
      isFirstOpen1: true,
       isFirstOpen2: true,
       isFirstOpen3: true,
        isFirstOpen4: true,
        isFirstOpen5: true,
        isFirstOpen6: true
    };
    $scope.workset = {
        isFirstOpen: false,
        isFirstOpen1: true,
        isFirstOpen2: true,
        isFirstOpen3: true,
        isFirstOpen4: true,
        isFirstOpen5: true,
        isFirstOpen6: true
    };
    $scope.items = ["Item 1", "Item 2", "Item 3"];
    $scope.status = {
        isFirstOpen: false,
        isFirstOpen1: true,
        isFirstOpen2: true,
        isFirstOpen3: true,
        isFirstOpen4: true,
        isFirstOpen5: true,
        isFirstOpen6: true
    };

    $scope.addItem=function(parentUL, branch) {
        for (var key in branch.children) {
            var item = branch.children[key];
            item = $('<li>', {
                id: "item" + item.id
            });
            $item.append($('<input>', {
                type: "checkbox",
                name: "item" + item.id
            }));
            $item.append($('<label>', {
                for: "item" + item.id,
                text: item.title
            }));
            parentUL.append($item);
            if (item.children) {
                var $ul = $('<ul>').appendTo($item);
                item.append();
                addItem($ul, item);
            }
        }
    };


    $scope.showBusinessRule=[true,false,false,false];
    $scope.OpenBusinessRule=function(index){
    $scope.showBusinessRule=[false,false,false,false];
    $scope.showBusinessRule[index]=true;
};

    $scope.selectedPackage={packageName:"Select Package"};
    $scope.setSelectedPackage = function (item) {
        $scope.selectedPackage = item;
    };

    $scope.PackageData=[
        {
            packageName:'Health Sector'
        },
        {packageName:'Finance'},
        {packageName:'Retail Sector'},
        {packageName:'Public Sector'}
    ];

    $scope.selectedWorkSet={WorkSetName:"Select WorkSet"};
    $scope.setSelectedWorkSet = function (item) {
        $scope.selectedWorkSet = item;
    };

    $scope.WorkSetData=[
        {
            WorkSetName:'WorkSet 1'
        },
        {WorkSetName:'WorkSet 2'},
        {WorkSetName:'WorkSet 3'},
        {WorkSetName:'WorkSet 4'}
    ];

    $scope.selectedRuleSet={WorkRuleName:"Select RuleSet"};
    $scope.setSelectedRuleSet = function (item) {
        $scope.selectedRuleSet = item;
    };

    $scope.WorkRuleData=[
        {
            WorkRuleName:'RuleSet 1'
        },
        {WorkRuleName:'RuleSet 2'},
        {WorkRuleName:'RuleSet 3'},
        {WorkRuleName:'RuleSet 4'}
    ];

    //Task List View Pagination
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
            RuleSet: 'Application Order rile',
            Type: 'Type Name',
            UpdateDate: '3//17/2015'

        }, {
            RuleSet: 'Credit Card Rule',
            Type: 'Type Name',
            UpdateDate: '5//17/2015'
        }, {
            RuleSet: 'Currency Rule',
            Type: 'Type Name',
            UpdateDate: '7//17/2015'
        }, {
            RuleSet: 'Country Rule',
            Type: 'Type Name',
            UpdateDate: '3//17/2015'
        },  {
            RuleSet: 'Tax payment Rule',
            Type: 'Type Name',
            UpdateDate: '8//17/2015'
        }, {
            RuleSet: 'ITax Rule',
            Type: 'Type Name',
            UpdateDate: '9//17/2015'
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
        $scope.currentPageIndexer = 2;
        return $scope.rowIndexer = '';
    };
    $scope.onNumPerPageChangeIndexer = function() {
        $scope.selectIndexer(1);
        return $scope.currentPageIndexer = 2;
    };
    $scope.onOrderChangeIndexer = function() {
        $scope.selectIndexer(1);
        return $scope.currentPageIndexer = 2;
    };
    $scope.searchIndexer = function() {
        //alert(JSON.stringify($scope.ruleSequence));
        $scope.filteredStoresIndexer = $filter('filter')($scope.ruleSequence, $scope.searchKeywordsIndexer);
        return $scope.onFilterChangeIndexer();
    };
    $scope.orderIndexer = function(rowName) {
        if ($scope.rowIndexer === rowName) {
            return;
        }
        //alert(JSON.stringify($scope.ruleSequence));
        $scope.rowIndexer = rowName;
        $scope.filteredStoresIndexer = $filter('orderBy')($scope.ruleSequence, rowName);
        return $scope.onOrderChangeIndexer();
    };
    $scope.numPerPageOptIndexer = [3, 5, 10, 20];
    $scope.numPerPageIndexer = $scope.numPerPageOptIndexer[2];
    $scope.currentPageIndexer = 2;
    $scope.currentPageStoresIndexer = [];


//    **************************************



}]).directive('tooltip', function(){
    return {
        restrict: 'A',
        link: function(scope, element, attrs){
            $(element).hover(function(){
                // on mouseenter
                $(element).tooltip('show');
            }, function(){
                // on mouseleave
                $(element).tooltip('hide');
            });
        }
    };
}).filter('startsWith', function() {
        return function(array, search) {
            var matches = [];
            for(var i = 0; i < array.length; i++) {
                if (array[i].indexOf(search) === 0 &&
                    search.length < array[i].length) {
                    matches.push(array[i]);
                }
            }
            return matches;
        };
    })
   ;