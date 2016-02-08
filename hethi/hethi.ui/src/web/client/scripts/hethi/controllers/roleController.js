


hethi.controller('roleController', ['$http','$scope','$location','$rootScope','logger', function ($http,$scope,$location,$rootScope,logger){

    $http({
        method: 'POST',
        url: $rootScope.spring_rest_service+'/loadCustomerName',
        dataType:'jsonp'
    }).success(function(data) {
        $rootScope.loadCustomerName=data[0];
    });
    $scope.selectUsers=function(){
        if($scope.customer!=undefined){
            var input={
                customer_id:$scope.customer
            };
            $http({
                method: 'POST',
                url: $rootScope.spring_rest_service+'/loadCustomerUsers',
                dataType:'jsonp',
                data:input
            }).success(function(data) {
                $rootScope.loadCustomerUsers=data[0];
            });
        }
        else
          logger.logWarning("Select any customer..");

    };
    //logger.log("group starts");
    $rootScope.hidef="";

    $rootScope.AdminColor='AdminTaskColor';
    $rootScope.RegisterColor='';
    $rootScope.abtcolor='';
    $rootScope.taskColor='';



    $scope.RoleData=[
        {
            RoleName:"Harison",
            RoleFullName:"David Harison",
            RoleEmail:"harison@gmail.com",
            IsActive:"active"

        }
    ];



    $scope.convertToDate=function(date){
        var dt=new Date(date);
        return dt;
    };
    $scope.RoleQueueTab=1;
    $scope.selectRoleQueueTab=function(tab){
        $scope.RoleQueueTab=tab;
    };

    $scope.load_hethi_role_task_list=function(){

        var input={
            'customer_id': $rootScope.loginedUserData.customer_id,
            'role_id': $rootScope.loginedUserData.role_id
        };
        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service+'/load_tasklist',
            dataType:'jsonp',
            data:input
        }).success(function(data) {
            //alert(JSON.stringify(data));
            if(data[0][0].result == "Success"){
                $rootScope.hethi_role_task_list=data[0];

            }
            else
            {
                $rootScope.hethi_role_task_list=false;
            }
        });
    };

    $scope.load_hethi_role_task_list();


    $scope.assignNextJob=function(data){

        var input={
            'customer_id': $rootScope.loginedUserData.customer_id,
            'user_id': $rootScope.loginedUserData.user_id,
            'upload_id':data.upload_id,
            'file_id':data.file_id,
            'job_id':$rootScope.loginedUserData.role_id,
            'next_job_id':data.next_job_id
        };
        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service+'/assign_task',
            dataType:'jsonp',
            data:input
        }).success(function(resp) {
            //alert(JSON.stringify(resp));
            logger.logSuccess('Task assigned to '+data.job_name);
            //$scope.load_hethi_role_task_list();
            if(resp[0][0].result == "Success"){

                data.showHistory=true;
                data.fileStatusHistory=resp[0];

            }
            else
            {
                data.showHistory=false;
            }
        });
    };


   var dt=new Date();
    var fileName=$rootScope.loginedUserData.user_name+"_Tasklist_"+dt.getDate()+"_"+dt.getMonth()+"_"+dt.getFullYear();

    $scope.exportData = function () {
        alasql("SELECT * INTO XLSX('"+fileName+".xlsx',{headers:true}) FROM ?",[ $rootScope.hethi_role_task_list]);
    };
    $scope.exportCSV=function(){
        alasql("SELECT * INTO CSV('"+fileName+".csv', {headers:true}) FROM ?",[ $rootScope.hethi_role_task_list]);
    };
    $scope.exportPDF=function(){
        //alasql("SELECT * INTO PDF('"+fileName+".pdf', {headers:true}) FROM ?",[ $rootScope.hethi_role_task_list]);

        var pdf = new jsPDF('p', 'pt', 'letter');
        // source can be HTML-formatted string, or a reference
        // to an actual DOM element from which the text will be scraped.
        source = $('#taskList')[0];

        // we support special element handlers. Register them with jQuery-style
        // ID selector for either ID or node name. ("#iAmID", "div", "span" etc.)
        // There is no support for any other type of selectors
        // (class, of compound) at this time.
        specialElementHandlers = {
            // element with id of "bypass" - jQuery style selector
            '#bypassme': function (element, renderer) {
                // true = "handled elsewhere, bypass text extraction"
                return true
            }
        };
        margins = {
            top: 80,
            bottom: 60,
            left: 40,
            width: 522
        };
        // all coords and widths are in jsPDF instance's declared units
        // 'inches' in this case
        pdf.fromHTML(
            source, // HTML string or DOM elem ref.
            margins.left, // x coord
            margins.top, { // y coord
                'width': margins.width, // max width of content on PDF
                'elementHandlers': specialElementHandlers
            },

            function (dispose) {
                // dispose: object with X, Y of the last line add to the PDF
                //          this allow the insertion of new lines after html
                pdf.save(fileName+'.pdf');
            }, margins);
    };



    //$scope.panes = [
    //    { title:"Events list", template:"pages/hethistudio/admin/admin_view.html" },
    //    { title:"Calendar", template:"pages/hethistudio/admin/admin_view.html" }
    //];

}]);


