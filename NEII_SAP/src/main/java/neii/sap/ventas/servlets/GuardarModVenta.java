/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package neii.sap.ventas.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import neii.sap.conexion.Conexion;

/**
 *
 * @author Windows 10 Pro
 */
@WebServlet(name = "GuardarModVenta", urlPatterns = {"/GuardarModVenta"})
public class GuardarModVenta extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String id = request.getParameter("idVentaModG");
        String producto = request.getParameter("prodVentaMod");
        String cantidad = request.getParameter("cantVentaMod");
        String cliente = request.getParameter("clienteVentaMod");
        Date fecha = new Date();
        DateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
        Conexion c = new Conexion();
        
        Double precio = Double.parseDouble(c.consulta("precio", "producto", "id = "+producto, 1).toString());
        Double total = Double.parseDouble(cantidad) * precio;
        
        c.actualizar("producto = "+producto+",cantidad = "+cantidad+",total = "+total+",fecha = '"+formato.format(fecha)+"',cliente = "+cliente, "venta_producto", "id = "+id);
        
        out.println("<script type=\"text/javascript\">");
        out.println("alert('Venta registrada');");
        out.println("location='Ventas/RegistrarVenta.jsp';");
        out.println("</script>");
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(GuardarModVenta.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(GuardarModVenta.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
