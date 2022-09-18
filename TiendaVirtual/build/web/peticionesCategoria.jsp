<%-- 
    Document   : peticionesCategoria
    Created on : 17-sep-2022, 13:59:00
    Author     : Lenovo
--%>

<%@page import="logica.categoria"%>
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

    String procesos = "" + request.getParameter("procesos");

    // Validación de parámetros utilizados en todos los procesos.
    if (tareas.contains(procesos)) {
        respuesta += "\"ok\": true,";
        // ------------------------------------------------------------------------------------- //
        // -----------------------------------INICIO PROCESOS----------------------------------- //
        // ------------------------------------------------------------------------------------- //
        if (procesos.equals("guardar")) {

            //Solicitud de parámetros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
            // creación de objeto y llamado a método guardar           
            int idCategoria=Integer.parseInt(request.getParameter("idCategoria"));
            String nombreCategoria=request.getParameter("nombreCategoria");
            String tipoCategoria=request.getParameter("tipoCategoria");
            
            
            
            categoria a= new categoria (idCategoria, nombreCategoria, tipoCategoria);
            if (a.guardarCategoria()) { 
                respuesta += "\"" + procesos + "\": true";
            } else {
                respuesta += "\"" + procesos + "\": false";
            }

        } else if (procesos.equals("eliminar")) {
        //Solicitud de parámetros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
            //creación de objeto y llamado a método eliminar
            int idCategoria=Integer.parseInt(request.getParameter("idCategoria"));
            categoria a= new categoria();
            a.setIdCategoria(idCategoria);
            if (a.eliminarCategoria()) {
                respuesta += "\"" + procesos + "\": true";
            } else {
                respuesta += "\"" + procesos + "\": false";
            }

        } else if (procesos.equals("listar")) {
        //Solicitud de parámetros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
           //creación de objeto y llamado al metodo listar
            try {
                categoria a= new categoria();
                List<categoria> lista = a.consultarCategoria();
                respuesta += "\"" + procesos + "\": true,\"categorias\":" + new Gson().toJson(lista);
            } catch (Exception ex) {
                respuesta += "\"" + procesos + "\": true,\"categorias\":[]";
                Logger.getLogger(categoria.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (procesos.equals("actualizar")) {
            //creación de objeto y llamado al metodo actualizar
            int idCategoria=Integer.parseInt(request.getParameter("idCategoria"));
            String nombreCategoria=request.getParameter("nombreCategoria");
            String tipoCategoria=request.getParameter("tipoCategoria");
            
            categoria a= new categoria (idCategoria,nombreCategoria,tipoCategoria);
            if (a.actualizarCategoria()) {                     
                respuesta += "\"" + procesos + "\": true";
            } else {
                respuesta += "\"" + procesos + "\": false";
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
