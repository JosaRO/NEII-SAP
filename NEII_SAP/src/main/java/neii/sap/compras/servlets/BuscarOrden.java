/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package neii.sap.compras.servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import neii.sap.conexion.Conexion;

/**
 *
 * @author Windows 10 Pro
 */
@WebServlet(name = "BuscarOrden", urlPatterns = {"/BuscarOrden"})
public class BuscarOrden extends HttpServlet {

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
        String orden = request.getParameter("ordenBuscada");
        Conexion c = new Conexion();
        ArrayList lista = c.consulta("producto.nombre,proveedor.nombre,orden.id", "orden,producto,proveedor,devolucion",
            "orden.id = "+orden+" AND orden.producto = producto.id AND orden.proveedor = proveedor.id AND orden.id != devolucion.id", 3);
        HttpSession sesion = request.getSession(true);
        if(!lista.isEmpty()){
            sesion.setAttribute("ordenConsulta", lista);
        response.sendRedirect("Compras/BuscarOrdenResultado.jsp");
        }else{
            response.sendRedirect("Compras/BuscarOrden.jsp");
        }
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
            Logger.getLogger(BuscarOrden.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(BuscarOrden.class.getName()).log(Level.SEVERE, null, ex);
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
