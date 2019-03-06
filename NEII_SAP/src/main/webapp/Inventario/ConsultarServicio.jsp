<%-- 
    Document   : ConsultarServicio
    Created on : 2/03/2019, 02:43:24 PM
    Author     : Windows 10 Pro
--%>

<%@page import="neii.sap.conexion.Conexion"%>
<%@page import="java.util.LinkedList"%>
<%@page import="neii.sap.clases.Servicios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(request.getSession().getAttribute("usuario") == null){
        response.sendRedirect("../errorSesion.jsp");
    }else{
        if(!request.getSession().getAttribute("area").equals("1")&&!request.getSession().getAttribute("area").equals("6")){
            response.sendRedirect("../errorSesion.jsp");
        }
    }
    Conexion c = new Conexion();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../Recursos/Bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../Recursos/Bootstrap/include/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="../Recursos/Bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../Recursos/Bootstrap/include/popper.min.js" type="text/javascript"></script>
        <link href="../Recursos/css/Estilos.css" rel="stylesheet" type="text/css"/>
        <script src="../Recursos/js/Validaciones.js" type="text/javascript"></script>
        <title>Inventario</title>
    </head>
    <body onload="regreso();">
        <div class="row"><!-- INICIO DE NAVBAR -->
            <div class="container-fluid">
                <header class="sticky-top">
                    <nav class="navbar navbar-expand-lg navbar-light bg-primary">
                        <a href="#" class="navbar-brand text-white">Inventario</a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#inv_navbar" aria-controls="inv_navbar" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="inv_navbar">
                            <ul class="navbar-nav mr-auto">
                                <li class="nav-item dropdown">
                                    <a class="nav-link bg-primary text-white" href="ConsultarProducto.jsp">Consultar&nbsp;producto</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link bg-primary text-white" href="ConsultarServicio.jsp">Consultar&nbsp;servicios</a>
                                </li>
                                <li class="nav-item">
                                    <a href="../CerrarSesion" class="nav-link bg-primary text-white">Cerrar&nbsp;sesi&oacute;n</a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                </header>
            </div>
        </div>
        <!-- FIN DE NAVBAR -->
        <div class="container"><!-- INICIO DE SECCION PRINCIPAL -->
            <div class="div-interno-centrado">
                <div class="form-centrado-sup">
                    <form class="form-control" method="POST" autocomplete="off" action="../ConsultarServicio">
                        <table>
                            <tbody>
                                <tr>
                                    <td>
                                        Servicio
                                    </td>
                                    <td>
                                        <select id='servicioBuscar' name="servicioBuscar" class='form-control form-control-sm' required="required">
                                            <option value='' selected='selected'>Selecciona&nbsp;una&nbsp;opci&oacute;n...</option>
                                            <%
                                                LinkedList<Servicios> l = c.servicio();
                                                for (int i=0;i<l.size();i++)
                                                {                                                                         
                                                   out.println("<option value='"+l.get(i).getId()+"'>"+l.get(i).getNombre()+"</td>");

                                                }
                                            %>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <center>
                                            <input type="submit" class="btn btn-success" value="Buscar">
                                        </center>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                </div>
                <div class="form-centrado-inf">
                    <form class="form-control" method="POST" autocomplete="off" action="../ConsultarServicioG">
                        <table>
                            <tbody>
                                <tr>
                                    <td colspan="2">
                                        <center>
                                            <input type="submit" class="btn btn-success" value="Busqueda general">
                                        </center>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                </div>
            </div>
        </div><!-- FIN DE SECCION PRINCIPAL -->
    </body>
</html>
