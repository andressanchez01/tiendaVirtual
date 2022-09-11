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
        producto a = new producto();
        a.setIdProducto(5);
        a.setCedulaCliente(12345678);
        a.setNombreProducto("Cera pisos");
        a.setPrecioCompra("8000");
        a.setPrecioVenta(10000);
        a.setIdCategoria(2);
        a.setDescripcionProducto("excelente brillo a sus pisos");
        a.guardarProducto();
  
     
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
    //  producto a = new producto();
        List<producto> productos = a.consultarProducto();
        for (producto ax : productos) {
            System.out.println(ax.toString());
        }
    }
    
}
