<%-- 
    Document   : vendedores
    Created on : 20-sep-2022, 22:57:22
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
        <title>Categoria</title>
        <style>
/*            div{
                border: solid 2px;
            }*/
        </style>

    </head>
    <body>

        <div class="container-fluid" ng-app="vendedor" ng-controller="vendedoresController as a">

            <div class="row">
                <div class="col-6">
                    <h3>Formulario</h3>

                    <div class="row">
                        <div class="col-6">
                            <label >Id Vendedor:</label>
                            <input type="text" class="form-control" ng-model="a.idVendedor">
                        </div>
                        <div class="col-6">
                            <label >Id Producto:</label>
                            <input type="text" class="form-control" ng-model="a.idProducto">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label >Nombre Vendedor</label>
                            <input type="text" class="form-control" ng-model="a.nombreVendedor">
                        </div>
                        <div class="col-6">
                            <div class="col-6">-</div>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-3">
                            <button type="button" class="btn btn-success" ng-click="a.guardarr()">Guardar</button>
                        </div>
                        <div class="col-3">
                            <button type="button" class="btn btn-primary" ng-click="a.consultarr()">Consultar</button>
                        </div>
                        <div class="col-3">
                            <button type="button" class="btn btn-warning" ng-click="a.actualizarr()">Actualizar</button>
                        </div>
                        <div class="col-3">
                            <button type="button" class="btn btn-danger" ng-click="a.eliminarr()">Eliminar</button>
                        </div>
                    </div>
                </div>

                <div class="col-6">
                    <h3>Tabla</h3>
                    <table class="table">
                        <thead>
                            <tr>                                
                                <th scope="col">Id Vendedor</th>
                                <th scope="col">Id Producto</th>
                                <th scope="col">Nombre Vendedor</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr ng-repeat="ax in a.vendedor">                               
                                <td>{{ax.idVendedor}}</td>
                                <td>{{ax.idProducto}}</td>
                                <td>{{ax.nombreVendedor}}</td>                              
                            </tr>

                        </tbody>
                    </table>
                    <!--                    {{a.idAutor}}
                                        {{a.nombre}}
                                        {{a.nacionalidad}}-->
                </div>
            </div>

        </div>
        <script>
            var app=angular.module('vendedor',[]);
            app.controller('vendedoresController',['$http', controladorVendedores]);
            function controladorVendedores($http){
                var a=this;

                a.consultarr = function () {
                    var parametros = {
                        procesos: 'listar'
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesVendedor.jsp',
                        params: parametros
                    }).then(function (resp) {
                        a.vendedor = resp.data.vendedores;
                    });
                };

                a.guardarr = function () {
                    var parametros = {
                        procesos: 'guardar',
                        idVendedor: a.idVendedor,
                        idProducto: a.idProducto,
                        nombreVendedor: a.nombreVendedor
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesVendedor.jsp',
                        params: parametros
                    }).then(function (resp) {
                        if (resp.data.ok === true) {
                            if (resp.data.guardar === true) {
                                alert('Guardó');
                            } else {
                                alert('No Guardó');
                            }

                        } else {
                            alert(resp.data.errorMsg);
                        }
                    });
                };
                a.actualizarr = function () {
                    var parametros = {
                        procesos: 'actualizar',
                        idVendedor: a.idVendedor,
                        idProducto: a.idProducto,
                        nombreVendedor: a.nombreVendedor                       
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesVendedor.jsp',
                        params: parametros
                    }).then(function (resp) {
                        if (resp.data.ok === true) {
                            if (resp.data.actualizar===true){
                                alert('Actualizó');
                            } else {
                                alert('No Actualizó');
                            }

                        } else {
                            alert(resp.data.errorMsg);
                        }
                    });
                };
                a.eliminarr = function () {
                    var parametros = {
                        procesos: 'eliminar',
                        idVendedor: a.idVendedor
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesVendedor.jsp',
                        params: parametros
                    }).then(function (resp) {
                        if (resp.data.ok === true) {
                            if (resp.data.eliminar === true) {
                                alert('Eliminó');
                            } else {
                                alert('No Eliminó');
                            }

                        } else {
                            alert(resp.data.errorMsg);
                        }
                    });
                };
            }
        </script>

    </body>
</html>
