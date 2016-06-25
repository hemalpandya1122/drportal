<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
   <head>
      <title>Dr Portal Appointment Booking</title>
      <style>
         .username.ng-valid {
         background-color: lightgreen;
         }
         .username.ng-dirty.ng-invalid-required {
         background-color: red;
         }
         .username.ng-dirty.ng-invalid-minlength {
         background-color: yellow;
         }
         .email.ng-valid {
         background-color: lightgreen;
         }
         .email.ng-dirty.ng-invalid-required {
         background-color: red;
         }
         .email.ng-dirty.ng-invalid-email {
         background-color: yellow;
         }
      </style>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
      <link href="<c:url value='/static/css/app.css' />" rel="stylesheet">
      </link>
      <link href="<c:url value='/static/css/datepicker.css' />" rel="stylesheet">
      </link>
   </head>
   <body ng-app="myApp" class="ng-cloak">
      <div class="generic-container" ng-controller="UserController as ctrl">
      <div class="panel panel-default">
         <div class="panel-heading"><span class="lead">Patient Appointment Form </span></div>
         <div class="formcontainer">
            <form ng-submit="ctrl.submit()" name="appointmentForm" class="form-horizontal">
               <input type="hidden" ng-model="ctrl.user.id" />
               <div class="row">
                  <div class="form-group col-md-12">
                     <label class="col-md-2 control-lable" for="file">Name</label>
                     <div class="col-md-7">
                        <input type="text" ng-model="ctrl.patientname" name="name" class="username form-control input-sm" placeholder="Enter your name" required ng-minlength="3"/>
                        <div class="has-error" ng-show="appointmentForm.$dirty">
                           <span ng-show="appointmentForm.name.$error.required">This is a required field</span>
                           <span ng-show="appointmentForm.name.$error.minlength">Minimum length required is 3</span>
                           <span ng-show="appointmentForm.name.$invalid">This field is invalid </span>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="row">
                  <div class="form-group col-md-12">
                     <label class="col-md-2 control-lable" for="file">Mobile No</label>
                     <div class="col-md-7">
                        <input type="number" class="form-control" ng-minlength="10" ng-maxlength="10"  name="mobile" ng-model="ctrl.user.mobile" class="form-control input-sm" placeholder="Enter your Mobile No"/>
                        <div class="has-error" ng-show="appointmentForm.$dirty">
                           <span ng-show="appointmentForm.mobile.$error.required">This is a required field</span>
                           <span ng-show="appointmentForm.mobile.$error.minlength">Minimum length required is 10</span>
                           <span ng-show="appointmentForm.mobile.$invalid">This field is invalid </span>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="row">
                  <div class="form-group col-md-12">
                     <label class="col-md-2 control-lable" for="file">Patient Type</label>
                     <div class="col-md-7">
                        <div class="btn-group" data-toggle="buttons">
                           <label id="newPatient" class="btn btn-default">
                           <input type="radio" id="q159" name="quality[25]" value="4" onclick="$('#newPatient').addClass('active');$('#existingPatient').removeClass('active');"> New
                           </label>
                           <label id="existingPatient" class="btn btn-default">
                           <input type="radio" id="q160" name="quality[25]" value="5" onclick="$('#existingPatient').addClass('active');$('#newPatient').removeClass('active');"> Existing
                           </label>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="row">
                  <div class="form-group col-md-12">
                     <label class="col-md-2 control-lable" for="file">Email</label>
                     <div class="col-md-7">
                        <input type="email" ng-model="ctrl.user.email" name="email" class="email form-control input-sm" placeholder="Enter your Email" required/>
                        <div class="has-error" ng-show="appointmentForm.$dirty">
                           <span ng-show="appointmentForm.email.$error.required">This is a required field</span>
                           <span ng-show="appointmentForm.email.$invalid">This field is invalid </span>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="row">
                  <div class="form-group col-md-12">
                     <label class="col-md-2 control-lable" for="file">Select Date</label>
                     <div class="col-md-7">
                        <input class="form-control input-sm" type="text" placeholder="click to select date"  id="datetimepicker1" ng-model="ctrl.patient.wishdate" >
                     </div>
                  </div>
               </div>
               <div class="row">
                  <div class="form-actions">
                     <input type="submit"  value="Confirm Appointment" class="btn btn-primary btn-sm" ng-disabled="appointmentForm.$invalid">
                     <button type="button" ng-click="ctrl.reset()" class="btn btn-warning btn-sm" ng-disabled="appointmentForm.$pristine">Reset Form</button>
                  </div>
               </div>
            </form>
         </div>
      </div>
      <!--    <div class="panel panel-default">
         Default panel contents
         <div class="panel-heading"><span class="lead">List of Users </span></div>
         <div class="tablecontainer">
           <table class="table table-hover">
               <thead>
                   <tr>
                       <th>ID.</th>
                       <th>Name</th>
                       <th>Address</th>
                       <th>Email</th>
                       <th width="20%"></th>
                   </tr>
               </thead>
               <tbody>
                   <tr ng-repeat="u in ctrl.users">
                       <td><span ng-bind="u.id"></span></td>
                       <td><span ng-bind="u.username"></span></td>
                       <td><span ng-bind="u.address"></span></td>
                       <td><span ng-bind="u.email"></span></td>
                       <td>
                       <button type="button" ng-click="ctrl.edit(u.id)" class="btn btn-success custom-width">Edit</button>  <button type="button" ng-click="ctrl.remove(u.id)" class="btn btn-danger custom-width">Remove</button>
                       </td>
                   </tr>
               </tbody>
           </table>
         </div>
         </div>
         </div> -->
      <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
      <script src="<c:url value='/static/js/app.js' />"></script>
      <script src="<c:url value='/static/js/service/user_service.js' />"></script>
      <script src="<c:url value='/static/js/controller/user_controller.js' />"></script>
      <script src="http://code.jquery.com/jquery-latest.min.js"></script>
      <script src="<c:url value='/static/js/bootstrap-datepicker.js' />"></script> 
      <script type="text/javascript">
         // When the document is ready
         $(document).ready(function () {
             
              $('#datetimepicker1').datepicker({
              	format: "dd/mm/yyyy"
              });
              
         });
      </script>
   </body>
</html>