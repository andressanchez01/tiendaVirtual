<%-- 
    Document   : peticionesVendedor
    Created on : 20-sep-2022, 22:17:11
    Author     : Lenovo
--%>

<%@page import="logica.vendedor"%>
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
            int idVendedor=Integer.parseInt(request.getParameter("idVendedor"));
            int idProducto=Integer.parseInt(request.getParameter("idProducto"));
            String nombreVendedor=request.getParameter("nombreVendedor");
            
            
            
            vendedor a= new vendedor (idVendedor, idProducto, nombreVendedor);
            if (a.guardarVendedor()) { 
                respuesta += "\"" + procesos + "\": true";
            } else {
                respuesta += "\"" + procesos + "\": false";
            }

        } else if (procesos.equals("eliminar")) {
        //Solicitud de parámetros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
            //creación de objeto y llamado a método eliminar
            int idVendedor=Integer.parseInt(request.getParameter("idVendedor"));
            vendedor a= new vendedor();
            a.setIdVendedor(idVendedor);
            if (a.eliminarVendedor()) {
                respuesta += "\"" + procesos + "\": true";
            } else {
                respuesta += "\"" + procesos + "\": false";
            }

        } else if (procesos.equals("listar")) {
        //Solicitud de parámetros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
           //creación de objeto y llamado al metodo listar
            try {
                vendedor a= new vendedor();
                List<vendedor> lista = a.consultarVendedor();
                respuesta += "\"" + procesos + "\": true,\"vendedores\":" + new Gson().toJson(lista);
            } catch (Exception ex) {
                respuesta += "\"" + procesos + "\": true,\"vendedores\":[]";
                Logger.getLogger(vendedor.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (procesos.equals("actualizar")) {
            //creación de objeto y llamado al metodo actualizar
            int idVendedor=Integer.parseInt(request.getParameter("idVendedor"));
            int idProducto=Integer.parseInt(request.getParameter("idProducto"));
            String nombreVendedor=request.getParameter("nombreVendedor");
            
            vendedor a= new vendedor (idVendedor,idProducto,nombreVendedor);
            if (a.actualizarVendedor()) {                     
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
