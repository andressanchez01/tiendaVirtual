 <%-- 
    Document   : producto
    Created on : 14-sep-2022, 20:53:21
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
        <title>Producto</title>
        <style>
/*            div{
                border: solid 2px;
            }*/
        </style>

    </head>
    <body>

        <div class="container-fluid" ng-app="producto" ng-controller="productosController as a">

            <div class="row">
                <div class="col-6">
                    <h3>Formulario</h3>

                    <div class="row">
                        <div class="col-6">
                            <label >Id Producto:</label>
                            <input type="text" class="form-control" ng-model="a.idProducto">
                        </div>
                        <div class="col-6">
                            <label >Cedula Cliente:</label>
                            <input type="text" class="form-control" ng-model="a.cedulaCliente">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label >Nombre Producto</label>
                            <input type="text" class="form-control" ng-model="a.nombreProducto">
                        </div>
                        <div class="col-6">
                            <label >Precio Compra</label>
                            <input type="text" class="form-control" ng-model="a.precioCompra">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label >Precio Venta</label>
                            <input type="text" class="form-control" ng-model="a.precioVenta">
                        </div>
                        <div class="col-6">
                            <label >Id Categoria</label>
                            <input type="text" class="form-control" ng-model="a.idCategoria">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label >Descripcion Producto</label>
                            <input type="text" class="form-control" ng-model="a.descripcionProducto">
                        </div>
                        <div class="col-6">-</div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-3">
                            <button type="button" class="btn btn-success" ng-click="a.guardar()">Guardar</button>
                        </div>
                        <div class="col-3">
                            <button type="button" class="btn btn-primary" ng-click="a.consultar()">Consultar</button>
                        </div>
                        <div class="col-3">
                            <button type="button" class="btn btn-warning" ng-click="a.actualizar()">Actualizar</button>
                        </div>
                        <div class="col-3">
                            <button type="button" class="btn btn-danger" ng-click="a.eliminar()">Eliminar</button>
                        </div>
                    </div>
                </div>

                <div class="col-6">
                    <h3>Tabla</h3>
                    <table class="table">
                        <thead>
                            <tr>                                
                                <th scope="col">Id Producto</th>
                                <th scope="col">Cedula Cliente</th>
                                <th scope="col">Nombre Producto</th>
                                <th scope="col">Precio Compra</th>
                                <th scope="col">Precio Venta</th>
                                <th scope="col">Id Categoria</th>
                                <th scope="col">Descripcion Producto</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr ng-repeat="ax in a.producto">                               
                                <td>{{ax.idProducto}}</td>
                                <td>{{ax.cedulaCliente}}</td>
                                <td>{{ax.nombreProducto}}</td>
                                <td>{{ax.precioCompra}}</td>
                                <td>{{ax.precioVenta}}</td>
                                <td>{{ax.idCategoria}}</td>
                                <td>{{ax.descripcionProducto}}</td>
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
            var app=angular.module('producto',[]);
            app.controller('productosController',['$http', controladorProductos]);
            function controladorProductos($http){
                var a=this;

                a.consultar = function () {
                    var parametros = {
                        proceso: 'listar'
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesProducto.jsp',
                        params: parametros
                    }).then(function (resp) {
                        a.producto = resp.data.productos;
                    });
                };

                a.guardar = function () {
                    var parametros = {
                        proceso: 'guardar',
                        idProducto: a.idProducto,
                        cedulaCliente: a.cedulaCliente,
                        nombreProducto: a.nombreProducto,
                        precioCompra: a.precioCompra,
                        precioVenta: a.precioVenta,
                        idCategoria: a.idCategoria,
                        descripcionProducto: a.descripcionProducto
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesProducto.jsp',
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
                a.actualizar = function () {
                    var parametros = {
                        proceso: 'actualizar',
                        idProducto: a.idProducto,
                        cedulaCliente: a.cedulaCliente,
                        nombreProducto: a.nombreProducto,
                        precioCompra: a.precioCompra,
                        precioVenta: a.precioVenta,
                        idCategoria: a.idCategoria,
                        descripcionProducto: a.descripcionProducto
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesProducto.jsp',
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
                a.eliminar = function () {
                    var parametros = {
                        proceso: 'eliminar',
                        idProducto: a.idProducto
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesProducto.jsp',
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
