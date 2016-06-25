'use strict';

App.controller('UserController', ['$scope', 'UserService', function($scope, UserService) {
          var self = this;
          self.user={id:null,patientname:'',mobile:'',email:''};
          self.users=[];

          self.creatAppointment = function(user){
              UserService.creatAppointment(user)
		              .then(
                      self.fetchAllUsers, 
				              function(errResponse){
					               console.error('Error while creating User.');
				              }	
                  );
          };

          self.submit = function() {
        	  console.log('Creating new appointment', self.user);
        	  self.creatAppointment(self.user);
          };
         
          
          self.reset = function(){
              self.user={id:null,username:'',address:'',email:''};
              $scope.myForm.$setPristine(); //reset Form
          };

      }]);
