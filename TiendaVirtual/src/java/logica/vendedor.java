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
public class vendedor {
    private int idVendedor;
    private int idProducto;
    private String nombreVendedor;

    public vendedor() {
    }

    public vendedor(int idVendedor, int idProducto, String nombreVendedor) {
        this.idVendedor = idVendedor;
        this.idProducto = idProducto;
        this.nombreVendedor = nombreVendedor;
    }

    public int getIdVendedor() {
        return idVendedor;
    }

    public void setIdVendedor(int idVendedor) {
        this.idVendedor = idVendedor;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public String getNombreVendedor() {
        return nombreVendedor;
    }

    public void setNombreVendedor(String nombreVendedor) {
        this.nombreVendedor = nombreVendedor;
    }

    @Override
    public String toString() {
        return "vendedor{" + "idVendedor=" + idVendedor + ", idProducto=" + idProducto + ", nombreVendedor=" + nombreVendedor + '}';
    }
    
    public List<vendedor> consultarVendedor() {
        List<vendedor> vendedor = new ArrayList<>();
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT * FROM vendedor;";
        ResultSet rs = conexion.consultarBD(sql);
        try {
            vendedor a;
            while (rs.next()) {
                a = new vendedor();
                a.setIdVendedor(rs.getInt("idVendedor"));
                a.setIdProducto(rs.getInt("idProducto"));
                a.setNombreVendedor(rs.getString("nombreVendedor"));
                vendedor.add(a);
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            conexion.cerrarConexion();
        }

        return vendedor;
    }

    public boolean guardarVendedor() {
        boolean exito = false;
        ConexionBD conexion = new ConexionBD();
        String sql="INSERT INTO vendedor (idVendedor, idProducto, nombreVendedor) VALUES('"+idVendedor+"','"+idProducto+"','"+nombreVendedor+"');";
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

    
     public boolean actualizarVendedor() {
        boolean exito = false;
        ConexionBD conexion = new ConexionBD();
        String sql="UPDATE vendedor SET idVendedor='"+idVendedor+"', idProducto='"+idProducto+"' WHERE idVendedor='"+idVendedor+"';";
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
     
     public boolean eliminarVendedor() {
        boolean exito = false;
        ConexionBD conexion = new ConexionBD();
        String sql="DELETE FROM vendedor WHERE idVendedor='"+idVendedor+"';";
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
