/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package neii.sap.login;

import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "IniciarSesion", urlPatterns = {"/IniciarSesion"})
public class IniciarSesion extends HttpServlet {

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
        String usuario = request.getParameter("usuario");
        String pass = request.getParameter("pass");
        HttpSession sesion = request.getSession(true);
        ArrayList lista;
        Conexion c = new Conexion();
        
        lista = c.consulta("area", "empleado", "id = "+usuario+" AND contrasena = '"+pass+"'", 1);
        
        if(!lista.isEmpty()){
            sesion.setAttribute("usuario", usuario);
            sesion.setAttribute("area", lista.get(0).toString());
            switch(lista.get(0).toString()){
                case "1":
                    response.sendRedirect("Recursos Humanos/rh_index.jsp");
                    break;
                case "2":
                    response.sendRedirect("Compras/com_index.jsp");
                    break;
                case "3":
                    response.sendRedirect("Inventario/inv_index.jsp");
                    break;
                case "4":
                    response.sendRedirect("Ventas/ven_index.jsp");
                    break;
                case "5":
                    response.sendRedirect("Contabilidad/con_index.jsp");
                    break;
                case "6":
                    response.sendRedirect("Gerencia/ger_index.jsp");
                    break;
                default:
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Usuario o contraseña incorrectos');");
                    out.println("location='index.jsp';");
                    out.println("</script>");
                    break;
            }
        }else{
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Usuario o contraseña incorrectos');");
            out.println("location='index.jsp';");
            out.println("</script>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
            Logger.getLogger(IniciarSesion.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(IniciarSesion.class.getName()).log(Level.SEVERE, null, ex);
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
