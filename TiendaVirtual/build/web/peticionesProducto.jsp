<%-- 
    Document   : peticionesProducto
    Created on : 14-sep-2022, 20:52:53
    Author     : Lenovo
--%>

<%@page import="logica.producto"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="application/json;charset=iso-8859-1" language="java" pageEncoding="iso-8859-1" session="true"%>

<%    // Iniciando respuesta JSON.
    String respuesta = "{";

    //Lista de procesos o tareas a realizar 
    List<String> tareas = Arrays.asList(new String[]{
        "guardar",
        "eliminar",
        "actualizar",
        "listar"
	
    });

    String proceso = "" + request.getParameter("proceso");

    // Validación de parámetros utilizados en todos los procesos.
    if (tareas.contains(proceso)) {
        respuesta += "\"ok\": true,";
        // ------------------------------------------------------------------------------------- //
        // -----------------------------------INICIO PROCESOS----------------------------------- //
        // ------------------------------------------------------------------------------------- //
        if (proceso.equals("guardar")) {

            //Solicitud de parámetros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
            // creación de objeto y llamado a método guardar           
            int idProducto=Integer.parseInt(request.getParameter("idProducto"));
            int cedulaCliente=Integer.parseInt(request.getParameter("cedulaCliente"));
            String nombreProducto=request.getParameter("nombreProducto");
            String precioCompra=request.getParameter("precioCompra");
            int precioVenta=Integer.parseInt(request.getParameter("precioVenta"));
            int idCategoria=Integer.parseInt(request.getParameter("idCategoria")) ;
            String descripcionProducto=request.getParameter("descripcionProducto");
            
            
            producto a= new producto (idProducto, cedulaCliente, nombreProducto, precioCompra, precioVenta, idCategoria, descripcionProducto);
            if (a.guardarProducto()) { 
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }

        } else if (proceso.equals("eliminar")) {
        //Solicitud de parámetros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
            //creación de objeto y llamado a método eliminar
            int idProducto=Integer.parseInt(request.getParameter("idProducto"));
            producto a= new producto();
            a.setIdProducto(idProducto);
            if (a.eliminarProducto()) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }

        } else if (proceso.equals("listar")) {
        //Solicitud de parámetros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
           //creación de objeto y llamado al metodo listar
            try {
                producto a= new producto();
                List<producto> lista = a.consultarProducto();
                respuesta += "\"" + proceso + "\": true,\"productos\":" + new Gson().toJson(lista);
            } catch (Exception ex) {
                respuesta += "\"" + proceso + "\": true,\"productos\":[]";
                Logger.getLogger(producto.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (proceso.equals("actualizar")) {
            //creación de objeto y llamado al metodo actualizar
            int idProducto=Integer.parseInt(request.getParameter("idProducto"));
            int cedulaCliente=Integer.parseInt(request.getParameter("cedulaCliente"));
            String nombreProducto=request.getParameter("nombreProducto");
            String precioCompra=request.getParameter("precioCompra");
            int precioVenta=Integer.parseInt(request.getParameter("precioVenta"));
            int idCategoria=Integer.parseInt(request.getParameter("idCategoria")) ;
            String descripcionProducto=request.getParameter("descripcionProducto");
            
            producto a= new producto (idProducto,cedulaCliente,nombreProducto,precioCompra,precioVenta,idCategoria,descripcionProducto);
            if (a.actualizarProducto()) {                     
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }
        }

        // ------------------------------------------------------------------------------------- //
        // -----------------------------------FIN PROCESOS-------------------------------------- //
        // ------------------------------------------------------------------------------------- //
        // Proceso desconocido.
    } else {
        respuesta += "\"ok\": false,";
        respuesta += "\"error\": \"INVALID\",";
        respuesta += "\"errorMsg\": \"Lo sentimos, los datos que ha enviado,"
                + " son inválidos. Corrijalos y vuelva a intentar por favor.\"";
    }    
    // Responder como objeto JSON codificación ISO 8859-1.
    respuesta += "}";
    response.setContentType("application/json;charset=iso-8859-1");
    out.print(respuesta);
%>
