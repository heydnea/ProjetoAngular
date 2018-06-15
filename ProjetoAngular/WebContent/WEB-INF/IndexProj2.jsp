<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<script src-"angularjs/angular.min.js"></script>
<link rel="stylesheet" type="text/css"
     href= "bootstrap/css/bootstrap.css">

<body>
<br/><h1 align= "center">Controle de Carros</h1><br/>
  <div class="container" ng app= "myApp" ng-controller = "customerCtrl">
  <input type="butotn" class="btn btn-primary" value="inserir" ng-click="cadastrar()"/>
         <br/> <br/>
         <table class="table table-hover">
            <tr>
              <td><strong>ID</strong></td>
              <td><strong>Modelo</strong></td>
               <td><strong>Nome</strong></td>
               <td><strong>Opções</strong></td>
            </tr>
            <tr ng-repeat="x in names">
              <td>{{ x.id}}</td> 
              <td>{{ x.modelo}}</td>
              <td>{{ x.nome}}</td>  
              <td> <input tupe="button" class="btn btn-danger" value="Excluir" ng-click="del(x)"/>
              <input type="button" class="btn btn-warning" value="Alterar" ng-cluick="selectto(x)"/></td>
            </tr>  
           </table> 
          </div>
         <script> 
         
         var app = angular.module('myApp', []);
         var linkservice = "http://localhost/ProjwebInsertRest/REST/carro/"; 
       
              .controller(
            		  'customerCtrl', 
            		  function($scope, $http){
            			  $http
            			     .get(
            			    		linkservice + 'select')
            			    		then(function(response){
            			    			$scope.names = response.data:
            			    		});
            			  $scope.del = function(car){
            				  windows.sessionStorage.setItem('car', null);
            				  windows.location.href= "cadastro.jsp";
            			  }
            			  
            			  $scope.del = function(car){
            				  var msg = confirm("Tem certeza que deseja excluir este registro?");
                          
            				  if(msg==true){
            					  $http.post(linkservice + 'delete', car).then(function(data){
            						  alert('Registro Deletado!');
            					  })
            				  }
            			  }
            			  
            			  $scope.seletTo = function(car){
            				  windows.sessionStorage.setItem('car', JSON,stringify(car));
            				  windows.location.href='cadastro.jsp'
            			  }
            		  });
        </script>    			  
</body>
</html>