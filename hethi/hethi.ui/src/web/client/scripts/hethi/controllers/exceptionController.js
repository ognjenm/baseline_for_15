'use strict';


hethi.controller('exceptionController', ['$http','$scope','$filter','$location','$rootScope', function ($http,$scope,$filter,$location,$rootScope){
    $scope.searchKeywordsIndexer = '';
    $scope.filteredStoresIndexer = [];
    $scope.rowIndexer = '';
    $scope.POLineItem=[];
    $scope.GLCoding=[];
    $scope.Exception=[];
    $scope.ContentHistory=[];
    $scope.WorkItemHistory=[];

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
        $scope.filteredStoresIndexer = $filter('filter')($scope.ContentHistory, $scope.searchKeywordsIndexer);
        return $scope.onFilterChangeIndexer();
    };
    $scope.orderIndexer = function(rowName) {
        if ($scope.rowIndexer === rowName) {
            return;
        }
        $scope.rowIndexer = rowName;
        $scope.filteredStoresIndexer = $filter('orderBy')($scope.ContentHistory, rowName);
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

    $scope.setIxsdFormData=function(efs_uin){
        if($rootScope.ixsd_form_data!=undefined){
            localStorage.setItem('storesIndexers',JSON.stringify($rootScope.ixsd_form_data));
            $rootScope.ixsd_form_data.forEach(function(data){
                if(localStorage.getItem('din')==data.din){
                    $rootScope.ixsd_history.push(data)
                }
            });
            $rootScope.ixsd_history_last=[];
            $rootScope.ixsd_history.forEach(function(resp){
                if(resp.efs_uin==efs_uin){
                    $rootScope.ixsd_history_last=[];
                    for(var keys in resp){
                        var val=resp[keys];
                        if(keys!="Success" && val.length>0 ){
                            $rootScope.ixsd_history_last.push({
                                key: keys,
                                value:val
                            })
                        }
                    }
                }
            });
        }
        else{
            $rootScope.ixsd_history=[];
            $rootScope.ixsd_form_data=JSON.parse(localStorage.getItem('storesIndexers'));
            $rootScope.ixsd_form_data.forEach(function(data){
                if(localStorage.getItem('din')==data.din){
                    $rootScope.ixsd_history.push(data)
                }
            });
            console.log(JSON.stringify(($rootScope.ixsd_history)));
            $rootScope.ixsd_history_last=[];
            $rootScope.ixsd_history.forEach(function(resp){
                if(resp.efs_uin==efs_uin){
                    $rootScope.ixsd_history_last=[];
                    for(var keys in resp){
                        var val=resp[keys];
                        if(keys!="Success" && val.length>0 ){
                            $rootScope.ixsd_history_last.push({
                                key: keys,
                                value:val
                            })
                        }
                    }
                }
            });
        }
    };
    $rootScope.hidef="";
    $scope.index=0;
    if($rootScope.din!=undefined){
        localStorage.setItem('din',$rootScope.din);
    }
    if($rootScope.uid!=undefined){
        localStorage.setItem('uid',$rootScope.uid);
    }
    if($rootScope.index_value!=undefined){
        localStorage.setItem('index_value',$rootScope.index_value);
    }
    if($rootScope.user_details!=undefined){
        localStorage.setItem('user_details',JSON.stringify($rootScope.user_details));
    }
    $rootScope.ixsd_efs_uin=[];
    $rootScope.ixsd_history=[];
    $rootScope.ixsd_din_efs=[];
    $scope.setIxsdHistoryData=function(efs_uin) {
        $scope.ContentHistory=[];
        $rootScope.ixsd_din= _.groupBy($rootScope.ixsd_form_data,function(element){
            return element.din;
        });
        $rootScope.ixsd_din_efs=_.groupBy($rootScope.ixsd_din[localStorage.getItem('din')],function(element){
            return element.efs_uin;
        });
        var lastRow='',row='';
        $rootScope.ixsd_din_efs[efs_uin].forEach(function(currentRow){
            if(lastRow==''){
                lastRow=currentRow;
                if($rootScope.ixsd_din_efs[efs_uin].length==1){
                    for(var key1 in lastRow){
                        ind++;
                        for(var key2 in lastRow){
                            if(key1==key2 && key1!='lastupdtm'){
                                if(lastRow[key1]!=lastRow[key1]){
                                    $rootScope.user_details=JSON.parse(localStorage.getItem('user_details'));
                                    var username='';
                                    $rootScope.user_details.forEach(function(row){
                                        if(row.user_id==lastRow.lastupuser){
                                            username=row.user_name;
                                            return false;
                                        }
                                    });
                                    var input={
                                        FieldName:key2,
                                        OldValue:lastRow[key2],
                                        NewValue:lastRow[key2],
                                        WorkItemStatus:lastRow.workflowstatus,
                                        UserName:username,
                                        DateModified:lastRow.lastupdtm
                                    };
                                    $scope.ContentHistory.push(input);
                                    break;
                                }
                            }
                        }
                    }

                }
            }
            else{
                row=lastRow;
                lastRow=currentRow;
                var ind=0;
                for(var key1 in row){
                    ind++;
                    for(var key2 in currentRow){
                        if(key1==key2 && key1!='lastupdtm'){
                            if(row[key1]!=currentRow[key1]){
                                $rootScope.user_details=JSON.parse(localStorage.getItem('user_details'));
                                var username='';
                                $rootScope.user_details.forEach(function(row){
                                    if(row.user_id==currentRow.lastupuser){
                                        username=row.user_name;
                                        return false;
                                    }
                                });
                                var input={
                                    FieldName:key2,
                                    OldValue:row[key2],
                                    NewValue:currentRow[key2],
                                    WorkItemStatus:currentRow.workflowstatus,
                                    UserName:username,
                                    DateModified:currentRow.lastupdtm
                                };
                                $scope.ContentHistory.push(input);
                                break;
                            }
                        }
                    }
                }
            }
        });
        init();
        return init();
    };
    $scope.setIxsdWorkflowItem=function(efs_uin){
        $scope.WorkItemHistory=[];
        $rootScope.ixsd_din= _.groupBy($rootScope.ixsd_form_data,function(element){
            return element.din;
        });
        $rootScope.ixsd_din_efs=_.groupBy($rootScope.ixsd_din[localStorage.getItem('din')],function(element){
            return element.efs_uin;
        });
        var lastRow='',row='';
        $rootScope.ixsd_din_efs[efs_uin].forEach(function(currentRow){
            if(lastRow==''){
                lastRow=currentRow;
                if($rootScope.ixsd_din_efs[efs_uin].length==1){
                    var dt1 = currentRow.workflowstartdate.split(' ')[0].split('-'),
                        dt2 = currentRow.wfremovedate.split(' ')[0].split('-'),
                        one = new Date(dt1[2], dt1[1]-1, dt1[0]),
                        two = new Date(dt2[2], dt2[1]-1, dt2[0]);
                    var millisecondsPerDay = 1000 * 60 * 60 * 24;
                    var millisBetween = two.getTime() - one.getTime();
                    var days = millisBetween / millisecondsPerDay;
                    var input = {
                        QueueName: currentRow.queue,
                        UserName: currentRow.lastupuser,
                        StartDate: currentRow.workflowstartdate,
                        EndDate: currentRow.wfremovedate,
                        Duration: Math.floor(days),
                        WorkItemStatus: currentRow.workflowstatus
                    };
                    $scope.WorkItemHistory.push(input);
                }
            }
            else{
                row=lastRow;
                lastRow=currentRow;
                var inde=0;
                for(var key1 in row){
                    if(key1=="workflowstartdate") {
                        for (var key2 in currentRow) {
                            if (key1 == key2) {
                                if (row[key1] != currentRow[key1]) {
                                    var dt1 = currentRow.workflowstartdate.split(' ')[0].split('-'),
                                        dt2 = currentRow.wfremovedate.split(' ')[0].split('-'),
                                        one = new Date(dt1[2], dt1[1]-1, dt1[0]),
                                        two = new Date(dt2[2], dt2[1]-1, dt2[0]);
                                    var millisecondsPerDay = 1000 * 60 * 60 * 24;
                                    var millisBetween = two.getTime() - one.getTime();
                                    var days = millisBetween / millisecondsPerDay;
                                    var input = {
                                        QueueName: currentRow.queue,
                                        UserName: currentRow.lastupuser,
                                        StartDate: currentRow.workflowstartdate,
                                        EndDate: currentRow.wfremovedate,
                                        Duration: Math.floor(days),
                                        WorkItemStatus: currentRow.workflowstatus
                                    };
                                    $scope.WorkItemHistory.push(input);
                                    break;
                                }
                                else{
                                    if(inde==0){
                                        var dt1 = currentRow.workflowstartdate.split(' ')[0].split('-'),
                                            dt2 = currentRow.wfremovedate.split(' ')[0].split('-'),
                                            one = new Date(dt1[2], dt1[1]-1, dt1[0]),
                                            two = new Date(dt2[2], dt2[1]-1, dt2[0]);
                                        var millisecondsPerDay = 1000 * 60 * 60 * 24;
                                        var millisBetween = two.getTime() - one.getTime();
                                        var days = millisBetween / millisecondsPerDay;
                                        var input = {
                                            QueueName: currentRow.queue,
                                            UserName: currentRow.lastupuser,
                                            StartDate: currentRow.workflowstartdate,
                                            EndDate: currentRow.wfremovedate,
                                            Duration: Math.floor(days),
                                            WorkItemStatus: currentRow.workflowstatus
                                        };
                                        $scope.WorkItemHistory=[];
                                        $scope.WorkItemHistory.push(input);
                                        inde++;
                                        break;
                                    }
                                }
                            }
                        }
                    }
                    else{
                        console.log("Other data")
                    }
                }
            }
        });
    };
    $scope.setStencilingForm=function(form,index){
        $rootScope.noDocument = false;
        $rootScope.efs_image_show=true;
        var flag=false;
        $scope.count=0;
        $rootScope.efs_uin_images.forEach(function(data){
            if(data.efs_uin==form.efs_uin){
                if(flag==false){
                    flag=true;
                    $rootScope.selectedimage=data.file_location;
                    data.filePosition='tile_active';
                }
                $scope.count++;
            }
            else{
                data.filePosition='tile';
            }
        });
        $rootScope.attachments_image_show=false;
        localStorage.setItem('efs_Uin'+index,$rootScope.efs_uin_a[index].efs_uin);
        localStorage.setItem('form_type',$rootScope.efs_uin_a[index].form_type);
        $rootScope.selectedefs_uin=$rootScope.efs_uin[index].efs_uin;

        if( $scope.POtab==1)
            $scope.table='lineitem';
        else if( $scope.POtab==2)
            $scope.table='exception';
        $scope.index=index;
        var i=0;
        $rootScope.efs_uin.forEach(function(row){
            if(i==index){
                row.className='tile_active'
            }
            else{
                row.className=''
            }
            i++;
            $scope.classNames='tile';
        });
        $scope.loadIxsd_data($scope.index);
        $scope.setIxsdFormData($rootScope.selectedefs_uin);
        $scope.setIxsdHistoryData($rootScope.selectedefs_uin);
    };
    $scope.showAttachments=function(){
        $rootScope.efs_uin.forEach(function(row){
            row.className='tile';
            $scope.classNames='tile_active'
        });
        $scope.count=0;
        $rootScope.attachments.forEach(function(data){
            if($scope.count==0){
                data.filePosition='tile_active';
                $rootScope.selectedimage=data.file_location;
            }
            else{
                data.filePosition='tile';
            }
            $scope.count++;
        });

        $rootScope.efs_image_show=false;
        $rootScope.attachments_image_show=true;
        if($rootScope.attachments.length==0){
            $rootScope.noDocument =true;
            $rootScope.selectedimage='';
        }
        else {
            $rootScope.noDocument = false;
        }
    };
    var indexes=0;
    $scope.changeImage=function(files,index){
        $rootScope.noDocument = false;
        $rootScope.selectedimage=files.file_location;
        $rootScope.efs_uin_images.forEach(function(data){
            if(data.file_name==files.file_name){
                data.filePosition='tile_active'
            }
            else{
                data.filePosition='tile'
            }
        });
    };
    $rootScope.efs_uin=[];
    $rootScope.efs_uin_images=[];
    $rootScope.attachments=[];
    if($rootScope.efs_uin_a!=undefined){
        $rootScope.efs_image_show=true;
        $rootScope.attachments_image_show=false;
        localStorage.setItem('efs_uin_a',JSON.stringify($rootScope.efs_uin_a));
        $rootScope.efs_uin_a.forEach(function(rows){
            var className='';
            if(indexes==0){
                className='tile_active';
                $rootScope.selectedefs_uin=rows.efs_uin;
                localStorage.setItem("efs_Uin0",rows.efs_uin);
                $scope.setIxsdFormData(rows.efs_uin);
            }
            else
                className='tile';
            var input={
                efs_uin:rows.efs_uin,
                form_type:rows.form_type,
                file_name:rows.file_name,
                file_location:rows.file_location,
                className:className
            };
            var datas=JSON.parse(rows.files);
            var i=0;
            datas.forEach(function(data){
                var filePosition='';
                if(data.file_location==$rootScope.selectedimage){
                    filePosition='tile_active'
                }
                else
                    filePosition='tile';
                var input1={
                    file_name:data.file_name,
                    file_location:data.file_location,
                    efs_uin:data.efs_uin,
                    filePosition:filePosition
                };
                if(data.efs_uin==""){
                    var flag=0;
                    if($rootScope.attachments.length>0){
                        $rootScope.attachments.forEach(function(item){
                            if(data.file_location==item.file_location){
                                flag=1;
                            }
                        });
                        if(flag==0){
                            $rootScope.attachments.push(input1);
                        }
                    }
                    else{
                        $rootScope.attachments.push(input1);
                    }
                }
                else{
                    var flag=0;
                    if($rootScope.efs_uin_images.length>0){
                        $rootScope.efs_uin_images.forEach(function(item){
                            if(data.file_location==item.file_location){
                                flag=1;
                            }
                        });
                        if(flag==0){
                            $rootScope.efs_uin_images.push(input1);
                        }
                    }
                    else{
                        $rootScope.efs_uin_images.push(input1);
                    }
                }
                i++;
            });

            var flag=false;
            $scope.count=0;
            $rootScope.efs_uin_images.forEach(function(data){
                if(data.efs_uin==$rootScope.selectedefs_uin){
                    if(flag==false){
                        flag=true;
                        $rootScope.selectedimage=data.file_location;
                        data.filePosition='tile_active';
                    }
                    $scope.count++;
                }
                else{
                    data.filePosition='tile';
                }
            });
            $rootScope.efs_uin.push(input);
            localStorage.setItem('efs_uin_images',JSON.stringify($rootScope.efs_uin_images));
            indexes++;
        });
    }
    else{
        $rootScope.efs_image_show=true;
        $rootScope.attachments_image_show=false;
        $rootScope.efs_uin_a=JSON.parse(localStorage.getItem('efs_uin_a'));
        $rootScope.efs_uin_a.forEach(function(rows){
            var className='';
            if(indexes==0){
                className='tile_active';
                $rootScope.selectedefs_uin=rows.efs_uin;
                $rootScope.selectedimage=rows.file_location;
                $scope.setIxsdFormData(rows.efs_uin);
            }
            else
                className='tile';
            var input={
                efs_uin:rows.efs_uin,
                form_type:rows.form_type,
                file_name:rows.file_name,
                file_location:rows.file_location,
                className:className
            };
            var datas=JSON.parse(rows.files);
            var i=0;
            datas.forEach(function(data){
                var filePosition='';
                if(i==0){
                    filePosition='tile_active'
                }
                else
                    filePosition='tile';
                var input1={
                    file_name:data.file_name,
                    file_location:data.file_location,
                    efs_uin:data.efs_uin,
                    filePosition:filePosition
                };
                if(data.efs_uin==""){
                    var flag=0;
                    if($rootScope.attachments.length>0){
                        $rootScope.attachments.forEach(function(item){
                            if(data.file_location==item.file_location){
                                flag=1;
                            }
                        });
                        if(flag==0){
                            $rootScope.attachments.push(input1);
                        }
                    }
                    else{
                        $rootScope.attachments.push(input1);
                    }
                }
                else{
                    var flag=0;
                    if($rootScope.efs_uin_images.length>0){
                        $rootScope.efs_uin_images.forEach(function(item){
                            if(data.file_location==item.file_location){
                                flag=1;
                            }
                        });
                        if(flag==0){
                            $rootScope.efs_uin_images.push(input1);
                        }
                    }
                    else{
                        $rootScope.efs_uin_images.push(input1);
                    }
                }
            });
            i++;

            localStorage.setItem('efs_uin_images',JSON.stringify($rootScope.efs_uin_images));
            $rootScope.efs_uin.push(input);
            //$scope.loadIxsd_data($scope.index);
            //$scope.setIxsdFormData($rootScope.selectedefs_uin);
            //$scope.setIxsdHistoryData($rootScope.selectedefs_uin);
            indexes++;
        });
    }

    indexes=0;
    $scope.table='lineitem';
    $scope.loadIxsd_data=function(index){
        var input={
            table_name:$scope.table,
            efs_uin:localStorage.getItem('efs_Uin'+index),
            din:localStorage.getItem('din')
        };
        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service+'/search_ixsd_content_lineitem',
            dataType:'jsonp',
            data:input
        }).success(function(data) {
            alert(JSON.stringify(data));
            $scope.POLineItem=[];
            if($scope.POtab==1){
                var last=data.length- 1;
                data.forEach(function(row){
                    $scope.POLineItem.push([]);
                    for(var key in row){
                        $scope.POLineItem[$scope.POLineItem.length-1].push({key:key,value:row[key]})
                    }
                });

            }
            else if($scope.POtab==2)
                $scope.Exception=data;
        });
    };
    $scope.loadIxsd_data($scope.index);
    $scope.POtab=1;
    $scope.selectPO=function(step){
        $scope.POtab=step;
        if(step==1)
            $scope.table='lineitem';
        else if(step==2)
            $scope.table='exception';
        else if(step==3){
            $scope.setIxsdWorkflowItem($rootScope.selectedefs_uin);
        }
        else if(step==4){
            $scope.filteredStoresIndexer=[];
            $scope.setIxsdHistoryData($rootScope.selectedefs_uin);
        }
        $scope.loadIxsd_data($scope.index);
    };


    // gets the template to ng-include for edit and save / item

    $scope.getTemplate = function (indexer) {
        if (contact.id === $scope.model.selected.id) return 'edit';
        else return 'display';
    };

    $scope.txtshow=false;

    $scope.saveTxtvalue = function (jsonitem1,jsonitem2) {
        console.log("Saving contact");
        jsonitem2.forEach(function(row){
            if(row.key=="version"){
                row.value= +row.value+1;
            }
        })
        jsonitem1.forEach(function(row){
            if(row.key=="version"){
                row.value= +row.value+1;
            }
        })
        var input={linitem:jsonitem1,table:jsonitem2};
       // alert("First value  ==> "+JSON.stringify(jsonitem1) +"Second value  ===> "+JSON.stringify(jsonitem2));
        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service+'/update_ixsd_content',
            dataType:'jsonp',
            data:input
        }).success(function(data) {



            //alert(data);


        });

    };

    $scope.reset = function () {
        $scope.model.selected = {};
    };


}]);