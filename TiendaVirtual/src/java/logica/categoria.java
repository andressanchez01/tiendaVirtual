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
public class categoria {
    private int idCategoria;
    private String nombreCategoria;
    private String tipoCategoria;

    public categoria() {
    }

    public categoria(int idCategoria, String nombreCategoria, String tipoCategoria) {
        this.idCategoria = idCategoria;
        this.nombreCategoria = nombreCategoria;
        this.tipoCategoria = tipoCategoria;
    }

    public int getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(int idCategoria) {
        this.idCategoria = idCategoria;
    }

    public String getNombreCategoria() {
        return nombreCategoria;
    }

    public void setNombreCategoria(String nombreCategoria) {
        this.nombreCategoria = nombreCategoria;
    }

    public String getTipoCategoria() {
        return tipoCategoria;
    }

    public void setTipoCategoria(String tipoCategoria) {
        this.tipoCategoria = tipoCategoria;
    }

    @Override
    public String toString() {
        return "Categoria{" + "idCategoria=" + idCategoria + ", nombreCategoria=" + nombreCategoria + ", tipoCategoria=" + tipoCategoria + '}';
    }
    
     public List<categoria> consultarCategoria() {
        List<categoria> categoria = new ArrayList<>();
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT * FROM categoria;";
        ResultSet rs = conexion.consultarBD(sql);
        try {
            categoria a;
            while (rs.next()) {
                a = new categoria();
                a.setIdCategoria(rs.getInt("idCategoria"));
                a.setNombreCategoria(rs.getString("nombreCategoria"));
                a.setTipoCategoria(rs.getString("tipoCategoria"));
                categoria.add(a);
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            conexion.cerrarConexion();
        }

        return categoria;
    }

    public boolean guardarCategoria() {
        boolean exito = false;
        ConexionBD conexion = new ConexionBD();
        String sql="INSERT INTO categoria (idCategoria, nombreCategoria, tipoCategoria) VALUES('"+idCategoria+"','"+nombreCategoria+"','"+tipoCategoria+"');";
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

    
     public boolean actualizarCategoria() {
        boolean exito = false;
        ConexionBD conexion = new ConexionBD();
        String sql="UPDATE categoria SET nombreCategoria='"+nombreCategoria+"', tipoCategoria='"+tipoCategoria+"' WHERE idCategoria='"+idCategoria+"';";
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
     
     public boolean eliminarCategoria() {
        boolean exito = false;
        ConexionBD conexion = new ConexionBD();
        String sql="DELETE FROM categoria WHERE idCategoria='"+idCategoria+"';";
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
