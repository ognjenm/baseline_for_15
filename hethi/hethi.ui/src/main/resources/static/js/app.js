var taskManagerModule = angular.module('taskManagerApp', ['ngAnimate']);

taskManagerModule.controller('taskManagerController', function ($scope,$http) {
	
	var urlBase="";
	$scope.toggle=true;
	$scope.selection = [];
	$scope.statuses=['ACTIVE','COMPLETED'];
	$scope.priorities=['HIGH','LOW','MEDIUM'];
	$scope.data={};
	$http.defaults.headers.post["Content-Type"] = "application/json";

    function findAllDocuments() {
        //get all tasks and display initially
        $http.get(urlBase + '/documents/search/findByTaskArchived?archivedfalse=0').
            success(function (data) {
                if (data._embedded != undefined) {
                    $scope.documents = data._embedded.documents;
                } else {
                    $scope.documents = [];
                }
                for (var i = 0; i < $scope.documents.length; i++) {
                    if ($scope.documents[i].taskStatus == 'COMPLETED') {
                        $scope.selection.push($scope.tasks[i].taskId);
                    }
                }
                $scope.taskName="";
                $scope.taskDesc="";
                $scope.taskPriority="";
                $scope.taskStatus="";
                $scope.toggle='!toggle';
            });
    }

    findAllDocuments();

	//add a new task
	$scope.addDocument = function addTask() {
		if($scope.companyName=="" || $scope.data=={} || $scope.documentPriority == "" ){
			alert("Insufficient Data! Please provide values for the document");
		}
		else{
//			data: $scope.data,
//			 documentPriority: $scope.documentPriority,
//			 documentStatus: 1
//			 
		 $http.post(urlBase + '/add?data='+JSON.stringify($scope.data)).
		  success(function(data, status, headers) {
			 alert("Document added");
             var newTaskUri = headers()["location"];
             console.log("Might be good to GET " + newTaskUri + " and append the task.");

             findAllDocuments();
		    });
		}
	};
		
	// toggle selection for a given task by task id
	  $scope.toggleSelection = function toggleSelection(taskUri) {
	    var idx = $scope.selection.indexOf(taskUri);

	    // is currently selected
        // HTTP PATCH to ACTIVE state
	    if (idx > -1) {
	      $http.patch(taskUri, { taskStatus: 'ACTIVE' }).
		  success(function(data) {
		      alert("Task unmarked");
              findAllDocuments();
		    });
	      $scope.selection.splice(idx, 1);
	    }

	    // is newly selected
        // HTTP PATCH to COMPLETED state
	    else {
	      $http.patch(taskUri, { taskStatus: 'COMPLETED' }).
		  success(function(data) {
			  alert("Task marked completed");
              findAllDocuments();
		    });
	      $scope.selection.push(taskUri);
	    }
	  };
	  
	
	// Archive Completed Tasks
	  $scope.archiveTasks = function archiveTasks() {
          $scope.selection.forEach(function(taskUri) {
              if (taskUri != undefined) {
                  $http.patch(taskUri, { taskArchived: 1});
              }
          });
          alert("Successfully Archived");
          console.log("It's risky to run this without confirming all the patches are done. when.js is great for that");
          findAllDocuments();
	  };
	
});

//Angularjs Directive for confirm dialog box
taskManagerModule.directive('ngConfirmClick', [
	function(){
         return {
             link: function (scope, element, attr) {
                 var msg = attr.ngConfirmClick || "Are you sure?";
                 var clickAction = attr.confirmedClick;
                 element.bind('click',function (event) {
                     if ( window.confirm(msg) ) {
                         scope.$eval(clickAction);
                     }
                 });
             }
         };
 }]);