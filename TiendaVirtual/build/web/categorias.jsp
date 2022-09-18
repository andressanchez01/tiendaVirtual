<%-- 
    Document   : categorias
    Created on : 17-sep-2022, 19:12:45
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

        <div class="container-fluid" ng-app="categoria" ng-controller="categoriasController as a">

            <div class="row">
                <div class="col-6">
                    <h3>Formulario</h3>

                    <div class="row">
                        <div class="col-6">
                            <label >Id Categoria:</label>
                            <input type="text" class="form-control" ng-model="a.idCategoria">
                        </div>
                        <div class="col-6">
                            <label >Nombre Categoria:</label>
                            <input type="text" class="form-control" ng-model="a.nombreCategoria">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label >Tipo Categoria</label>
                            <input type="text" class="form-control" ng-model="a.tipoCategoria">
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
                                <th scope="col">Id Categoria</th>
                                <th scope="col">Nombre Categoria</th>
                                <th scope="col">Tipo Categoria</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr ng-repeat="ax in a.categoria">                               
                                <td>{{ax.idCategoria}}</td>
                                <td>{{ax.nombreCategoria}}</td>
                                <td>{{ax.tipoCategoria}}</td>                              
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
            var app=angular.module('categoria',[]);
            app.controller('categoriasController',['$http', controladorCategorias]);
            function controladorCategorias($http){
                var a=this;

                a.consultarr = function () {
                    var parametros = {
                        procesos: 'listar'
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesCategoria.jsp',
                        params: parametros
                    }).then(function (resp) {
                        a.categoria = resp.data.categorias;
                    });
                };

                a.guardarr = function () {
                    var parametros = {
                        procesos: 'guardar',
                        idCategoria: a.idCategoria,
                        nombreCategoria: a.nombreCategoria,
                        tipoCategoria: a.tipoCategoria
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesCategoria.jsp',
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
                        idCategoria: a.idCategoria,
                        nombreCategoria: a.nombreCategoria,
                        tipoCategoria: a.tipoCategoria                       
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesCategoria.jsp',
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
                        idCategoria: a.idCategoria
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesCategoria.jsp',
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
