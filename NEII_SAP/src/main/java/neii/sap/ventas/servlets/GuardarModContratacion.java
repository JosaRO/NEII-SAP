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
@WebServlet(name = "GuardarModContratacion", urlPatterns = {"/GuardarModContratacion"})
public class GuardarModContratacion extends HttpServlet {

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
        Conexion c = new Conexion();
        String id = request.getParameter("idContModG");
        String servicio = request.getParameter("servContratacionMod");
        String cliente = request.getParameter("clienteContratacionMod");
        Date fecha = new Date();
        DateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
        
        Double precio = Double.parseDouble(c.consulta("precio", "servicio", "id = "+servicio, 1).toString());
        
        c.actualizar("servicio = "+servicio+",total = "+precio+",fecha = '"+formato.format(fecha)+"',cliente = "+cliente,
                "contratacion_servicio", "id = "+id);
        
        out.println("<script type=\"text/javascript\">");
        out.println("alert('Contratacion registrada');");
        out.println("location='Ventas/GestionarContratacion.jsp';");
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
            Logger.getLogger(GuardarModContratacion.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(GuardarModContratacion.class.getName()).log(Level.SEVERE, null, ex);
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
