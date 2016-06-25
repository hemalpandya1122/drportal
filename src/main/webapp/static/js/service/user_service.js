'use strict';

App.factory('UserService', ['$http', '$q', function($http, $q){

	return {
		
		    creatAppointment: function(user){
				return $http.post('http://localhost:8080/DrWebPortal/user/', user)
				.then(
						function(response){
							return response.data;
						}, 
						function(errResponse){
							console.error('Error while creating user');
							return $q.reject(errResponse);
						}
				);
		    }
	};

}]);
