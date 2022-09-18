/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package logica;

import java.util.List;

/**
 *
 * @author Lenovo
 */
public class Principal {
    public static void main(String[] args) {

    // insertar
    /**    producto a = new producto();
        a.setIdProducto(6);
        a.setCedulaCliente(12345678);
        a.setNombreProducto("Frijol");
        a.setPrecioCompra("5000");
        a.setPrecioVenta(6250);
        a.setIdCategoria(1);
        a.setDescripcionProducto("bola roja");
        a.guardarProducto();
    */
     
    // actualizar
    /** producto a = new producto();
        a.setIdProducto(5);
        a.setCedulaCliente(12345678);
        a.setNombreProducto("blanqueador");
        a.setPrecioCompra("2500");
        a.setPrecioVenta(3200);
        a.setIdCategoria(2);
        a.setDescripcionProducto("excelente blancura y desinfeccion");
        a.actualizarProducto();
     */
        
    // eliminar
    /**    producto a = new producto();
        a.setIdProducto(5);
        a.eliminarProducto();
     */
    
    // consultar   
    /**  producto a = new producto();
        List<producto> productos = a.consultarProducto();
        for (producto ax : productos) {
            System.out.println(ax.toString());
     */  
    
        categoria a = new categoria();
        a.setIdCategoria(3);
        a.setNombreCategoria("Trabajo");
        a.setTipoCategoria("Herramientas");
        a.guardarCategoria();
    
     //   categoria a = new categoria();
        List<categoria> categorias = a.consultarCategoria();
        for (categoria ax : categorias) {
            System.out.println(ax.toString());
        }
    }
    
}
