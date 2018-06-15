<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<script src="angularjs/angular.min.js"></script>


<link rel="stylesheet" type="text/css"
     href="bootstrap/css/bootstrap.css">
     
<body>
    <br />
    <br />
    <h1 align="center">Controle de Carros</h1>
    <br />
    <div class="form" ng-app="myCar" ng-controller="carFormController">
      <div>
       <form name="carForm">
         <div class="container">
          <div class="form-group">
           <label for="name">Nome</label> <input id="name" name="nome"
              type="text" class="form-control" maxlength="50"
              ng-model="car,nome" required ng-minlength="2" ng-maxlength="50" />
              <br /> <label for="modelo">Modelo</label> <input id="modelo"
              name=""modelo"" type="text" class="form-control" maxlength="50"
              ng-model="car.modelo" required ng-minlength="2" ng-maxlength="50" />
           
            </div>
            <div class="buttons">
             <button ng-click="save()" class= "btn btn-primary">Salvar</button>
             <button ng-click="voltar()" class="btn btn-default">Voltar</button>>
         </div>
        </div>
       </form>
      </div>
     </div> 
     
     <script>
       var app = angular.module('myCar', []);
       var linkservice = "http://localhodt:8080/ProjwebInsertRest/REST/carro/";
       
       app.controller('carFormController', function($scope, $http){
       
       $scope.save = function(){
        
        if (!$scope.car.id){
        	$http.post(linkservice + 'save', $scope.car).then(function(data){
        		alert('Registro Inserido!');
        		window.location = "index.jsp";
        		});
        }else{
        	$http.post(linkservice + 'update', $scope.car).then(function(data){
        		alert('Registro Alterado!');
        		window.location = "index.jsp";
        	})
        }
    });
       $scope.voltar = function(){
    	   window.location = "index.jsp"; //acredito que esse index que ele usa aqui no cadastro seja o indexproj2 tem que testar
       }
        	
       });
 </script>
       
</body>
</html>