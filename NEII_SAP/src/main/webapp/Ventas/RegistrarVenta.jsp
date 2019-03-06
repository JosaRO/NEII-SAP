<%-- 
    Document   : RegistrarVenta
    Created on : 3/03/2019, 06:19:06 PM
    Author     : Windows 10 Pro
--%>

<%@page import="neii.sap.clases.Productos"%>
<%@page import="java.util.LinkedList"%>
<%@page import="neii.sap.clases.Cliente"%>
<%@page import="neii.sap.clases.Cliente"%>
<%@page import="neii.sap.conexion.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(request.getSession().getAttribute("usuario") == null){
        response.sendRedirect("../errorSesion.jsp");
    }else{
        if(!request.getSession().getAttribute("area").equals("4")&&!request.getSession().getAttribute("area").equals("6")){
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
        <title>Ventas</title>
    </head>
    <body onload="regreso();">
        <div class="row"><!-- INICIO DE NAVBAR -->
            <div class="container-fluid">
                <header class="sticky-top">
                    <nav class="navbar navbar-expand-lg navbar-light bg-primary">
                        <a href="#" class="navbar-brand text-white">Ventas</a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ven_navbar" aria-controls="ven_navbar" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="ven_navbar">
                            <ul class="navbar-nav mr-auto">
                                <li class="nav-item dropdown">
                                    <a href="#" class="nav-link dropdown-toggle text-white" id="cliente" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Cliente</a>
                                    <div class="dropdown-menu bg-primary" aria-labelledby="cliente">
                                        <a class="nav-link text-white" href="RegistrarCliente.jsp">Registrar&nbsp;cliente</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a href="#" class="nav-link dropdown-toggle text-white" id="venta" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Venta</a>
                                    <div class="dropdown-menu bg-primary" aria-labelledby="venta">
                                        <a class="nav-link text-white" href="RegistrarVenta.jsp">Registrar&nbsp;venta</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a href="#" class="nav-link dropdown-toggle text-white" id="contratacion" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Contrataci&oacute;n</a>
                                    <div class="dropdown-menu bg-primary" aria-labelledby="contratacion">
                                        <a class="nav-link text-white" href="RegistrarContratacion.jsp">Registrar&nbsp;contrataci&oacute;n</a>
                                    </div>
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
        <div class="container"<!-- INICIO DE SECCION PRINCIPAL -->
            <div class="div-interno-centrado">
                <div class="form-centrado">
                    <form class="form-control" method="POST" autocomplete="off" onsubmit="return registrarVenta();" action="../RegistrarVenta">
                        <table>
                            <tbody>
                                <tr>
                                    <td>
                                        Producto
                                    </td>
                                    <td>
                                        <select id='prodVenta' name="prodVenta" class='form-control form-control-sm' required="required">
                                            <option value='' selected='selected'>Selecciona&nbsp;una&nbsp;opci&oacute;n...</option>
                                            <%
                                                LinkedList<Productos> l = c.producto();
                                                for (int i=0;i<l.size();i++)
                                                {                                                                         
                                                   out.println("<option value='"+l.get(i).getId()+"'>"+l.get(i).getNombre()+"</td>");
                                                }
                                            %>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Cantidad
                                    </td>
                                    <td>
                                        <input type="number" step="any" id="cantVenta" name="cantVenta" class='form-control form-control-sm' required="required">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Cliente
                                    </td>
                                    <td>
                                        <select id='clienteVenta' name="clienteVenta" class='form-control form-control-sm' required="required">
                                            <option value='' selected='selected'>Selecciona&nbsp;una&nbsp;opci&oacute;n...</option>
                                            <%
                                                LinkedList<Cliente> li = c.cliente();
                                                for (int i=0;i<li.size();i++)
                                                {                                                                         
                                                   out.println("<option value='"+li.get(i).getId()+"'>"+li.get(i).getNombre()+"</td>");
                                                }
                                            %>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <center>
                                            <input type="submit" class="btn btn-success" value="Registrar">
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
