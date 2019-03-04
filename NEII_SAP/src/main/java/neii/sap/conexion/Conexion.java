package neii.sap.conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.Properties;
import neii.sap.clases.Area;
import neii.sap.clases.Cliente;
import neii.sap.clases.Productos;
import neii.sap.clases.Servicios;

public class Conexion {
    
    public Connection conn;
    
    public Conexion() throws ClassNotFoundException, SQLException {
        Class.forName("org.postgresql.Driver");
    }

    /**
     * inicio de conexion de la base de datos con postgres
     * @throws SQLException
     */
    public void openDB() throws SQLException {
        Properties connProp = new Properties();
        connProp.put("user", "postgres");
        connProp.put("password", "root");
        conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/ALQUILER", connProp);
    }
        

    /**
    * Cierra la conexión con la base de datos
    * @throws SQLException
    */    
    public void closeDB() throws SQLException {
        conn.close();
    }
    
    public Integer insertar(String campos, String tabla, String valores) throws SQLException {
        openDB();
        PreparedStatement ps;
        ps=conn.prepareStatement("INSERT INTO "+tabla+" ("+campos+") VALUES ("+valores+")");
        Integer rs = ps.executeUpdate();
        closeDB();
        return rs;
    }
    
    public ArrayList consulta(String campos, String tabla, String condicion, int cantidad) throws SQLException {
        openDB();
        ArrayList r=new ArrayList();
        PreparedStatement ps;
        ps=conn.prepareStatement("SELECT "+campos+" FROM "+tabla+" WHERE "+condicion);
        ResultSet rs= ps.executeQuery();        
            while(rs.next()){
                for(int i = 1 ; i <= cantidad ; i++){
                    r.add(rs.getObject(i));
                }
            }        
        
        closeDB();        
        return r;
    }
    
    public Integer borrar(String tabla, String referencia) throws SQLException {
        openDB();
        PreparedStatement ps;
        ps=conn.prepareStatement("DELETE FROM "+tabla+" WHERE "+referencia);
        Integer rs = ps.executeUpdate();
        closeDB();
        return rs;
    }
    
    public Integer actualizar(String campos, String tabla, String referencia) throws SQLException {
        openDB();
        PreparedStatement ps;
        ps=conn.prepareStatement("UPDATE "+tabla+" SET "+campos+" WHERE "+referencia);
        Integer rs = ps.executeUpdate();
        closeDB();
        return rs;
    }
    
    public LinkedList area() throws SQLException{
        LinkedList<Area> lista = new LinkedList<>();
        Statement stmt;        
        stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM area");
            while (rs.next()) {
                Area a = new Area();
                a.setId(rs.getInt("id"));             
                a.setNombre(rs.getString("descripcion"));                
                lista.add(a);
            }                    
        return lista;
    }
    
    public LinkedList servicio() throws SQLException{
        LinkedList<Servicios> lista = new LinkedList<>();
        Statement stmt;        
        stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT id,nombre FROM servicio");
            while (rs.next()) {
                Servicios a = new Servicios();
                a.setId(rs.getInt("id"));             
                a.setNombre(rs.getString("nombre"));                
                lista.add(a);
            }                    
        return lista;
    }
    
    public LinkedList producto() throws SQLException{
        LinkedList<Productos> lista = new LinkedList<>();
        Statement stmt;        
        stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT id,nombre FROM producto WHERE disponibles != 0");
            while (rs.next()) {
                Productos a = new Productos();
                a.setId(rs.getInt("id"));             
                a.setNombre(rs.getString("nombre"));
                lista.add(a);
            }                    
        return lista;
    }
    
    public LinkedList cliente() throws SQLException{
        LinkedList<Cliente> lista = new LinkedList<>();
        Statement stmt;        
        stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT id,nombre FROM cliente");
            while (rs.next()) {
                Cliente a = new Cliente();
                a.setId(rs.getInt("id"));             
                a.setNombre(rs.getString("nombre"));                
                lista.add(a);
            }                    
        return lista;
    }
}