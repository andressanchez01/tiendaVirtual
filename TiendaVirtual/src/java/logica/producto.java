/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package logica;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import persistencia.ConexionBD;

/**
 *
 * @author Lenovo
 */
public class producto {
    private int idProducto;
    private int cedulaCliente;
    private String nombreProducto;
    private String precioCompra;
    private int precioVenta;
    private int idCategoria;
    private String descripcionProducto;

    public producto() {
    }

    public producto(int idProducto, int cedulaCliente, String nombreProducto, String precioCompra, int precioVenta, int idCategoria, String descripcionProducto) {
        this.idProducto = idProducto;
        this.cedulaCliente = cedulaCliente;
        this.nombreProducto = nombreProducto;
        this.precioCompra = precioCompra;
        this.precioVenta = precioVenta;
        this.idCategoria = idCategoria;
        this.descripcionProducto = descripcionProducto;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public int getCedulaCliente() {
        return cedulaCliente;
    }

    public void setCedulaCliente(int cedulaCliente) {
        this.cedulaCliente = cedulaCliente;
    }

    public String getNombreProducto() {
        return nombreProducto;
    }

    public void setNombreProducto(String nombreProducto) {
        this.nombreProducto = nombreProducto;
    }

    public String getPrecioCompra() {
        return precioCompra;
    }

    public void setPrecioCompra(String precioCompra) {
        this.precioCompra = precioCompra;
    }

    public int getPrecioVenta() {
        return precioVenta;
    }

    public void setPrecioVenta(int precioVenta) {
        this.precioVenta = precioVenta;
    }

    public int getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(int idCategoria) {
        this.idCategoria = idCategoria;
    }

    public String getDescripcionProducto() {
        return descripcionProducto;
    }

    public void setDescripcionProducto(String descripcionProducto) {
        this.descripcionProducto = descripcionProducto;
    }

    @Override
    public String toString() {
        return "producto{" + "idProducto=" + idProducto + ", cedulaCliente=" + cedulaCliente + ", nombreProducto=" + nombreProducto + ", precioCompra=" + precioCompra + ", precioVenta=" + precioVenta + ", idCategoria=" + idCategoria + ", descripcionProducto=" + descripcionProducto + '}';
    }
    
    public List<producto> consultarProducto() {
        List<producto> producto = new ArrayList<>();
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT * FROM producto;";
        ResultSet rs = conexion.consultarBD(sql);
        try {
            producto a;
            while (rs.next()) {
                a = new producto();
                a.setIdProducto(rs.getInt("idProducto"));
                a.setCedulaCliente(rs.getInt("cedulaCliente"));
                a.setNombreProducto(rs.getString("nombreProducto"));
                a.setPrecioCompra(rs.getString("precioCompra"));
                a.setPrecioVenta(rs.getInt("precioVenta"));
                a.setIdCategoria(rs.getInt("idCategoria"));
                a.setDescripcionProducto(rs.getString("descripcionProducto"));
                producto.add(a);
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            conexion.cerrarConexion();
        }

        return producto;
    }

    public boolean guardarProducto() {
        boolean exito = false;
        ConexionBD conexion = new ConexionBD();
        String sql="INSERT INTO producto (idProducto, cedulaCliente, nombreProducto, precioCompra, precioVenta, idCategoria, descripcionProducto) VALUES('"+idProducto+"','"+cedulaCliente+"','"+nombreProducto+"','"+precioCompra+"','"+precioVenta+"','"+idCategoria+"','"+descripcionProducto+"');";
        if(conexion.setAutoCommitBD(false)){
            if(conexion.insertarBD(sql)){
                exito=true;
                conexion.commitBD();
                conexion.cerrarConexion();
            }else{
                conexion.rollbackBD();
                conexion.cerrarConexion();
            }
        }else{
            conexion.cerrarConexion();
        }
        return exito;
    }

    
     public boolean actualizarProducto() {
        boolean exito = false;
        ConexionBD conexion = new ConexionBD();
        String sql="UPDATE producto SET cedulaCliente='"+cedulaCliente+"', nombreProducto='"+nombreProducto+"', precioCompra='"+precioCompra+"', precioVenta='"+precioVenta+"', idCategoria='"+idCategoria+"', descripcionProducto='"+descripcionProducto+"' WHERE idProducto='"+idProducto+"';";
        if(conexion.setAutoCommitBD(false)){
            if(conexion.actualizarBD(sql)){
                exito=true;
                conexion.commitBD();
                conexion.cerrarConexion();
            }else{
                conexion.rollbackBD();
                conexion.cerrarConexion();
            }
        }else{
            conexion.cerrarConexion();
        }
        return exito;
    }
     
     public boolean eliminarProducto() {
        boolean exito = false;
        ConexionBD conexion = new ConexionBD();
        String sql="DELETE FROM producto WHERE idProducto='"+idProducto+"';";
        if(conexion.setAutoCommitBD(false)){
            if(conexion.actualizarBD(sql)){
                exito=true;
                conexion.commitBD();
                conexion.cerrarConexion();
            }else{
                conexion.rollbackBD();
                conexion.cerrarConexion();
            }
        }else{
            conexion.cerrarConexion();
        }
        return exito;
    }
    
}
