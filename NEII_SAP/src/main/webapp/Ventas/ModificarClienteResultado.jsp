<%-- 
    Document   : ModificarClienteResultado
    Created on : 22/04/2019, 01:00:21 PM
    Author     : Windows 10 Pro
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(request.getSession().getAttribute("usuario") == null){
        response.sendRedirect("../errorSesion.jsp");
    }else{
        if(!request.getSession().getAttribute("area").equals("4")&&!request.getSession().getAttribute("area").equals("6")){
            response.sendRedirect("../errorSesion.jsp");
        }
    }
    HttpSession sesion = request.getSession(true);
    ArrayList lista = (ArrayList) sesion.getAttribute("clienteMod");
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
                                        <a class="nav-link text-white" href="GestionarCliente.jsp">Gestionar&nbsp;cliente</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a href="#" class="nav-link dropdown-toggle text-white" id="venta" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Venta</a>
                                    <div class="dropdown-menu bg-primary" aria-labelledby="venta">
                                        <a class="nav-link text-white" href="RegistrarVenta.jsp">Registrar&nbsp;venta</a>
                                        <a class="nav-link text-white" href="GestionarVenta.jsp">Gestionar&nbsp;venta</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a href="#" class="nav-link dropdown-toggle text-white" id="contratacion" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Contrataci&oacute;n</a>
                                    <div class="dropdown-menu bg-primary" aria-labelledby="contratacion">
                                        <a class="nav-link text-white" href="RegistrarContratacion.jsp">Registrar&nbsp;contrataci&oacute;n</a>
                                        <a class="nav-link text-white" href="GestionarContratacion.jsp">Gestionar&nbsp;contrataci&oacute;n</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a href="#" class="nav-link dropdown-toggle text-white" id="contratacion" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Promociones</a>
                                    <div class="dropdown-menu bg-primary" aria-labelledby="contratacion">
                                        <a class="nav-link text-white" href="RegistrarPromocion.jsp">Registrar&nbsp;promoci&oacute;n</a>
                                        <a class="nav-link text-white" href="GestionarPromocion.jsp">Gestionar&nbsp;promoci&oacute;n</a>
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
                    <form class="form-control" method="POST" autocomplete="off" action="../GuardarModCliente">
                        <table>
                            <tbody>
                                <tr>
                                    <td>
                                        ID
                                    </td>
                                    <td>
                                        <input type="text" id="idCliModR" name="idCliModR" value="<%= lista.get(0) %>" class='form-control form-control-sm' required="required" readonly="readonly">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Nombre
                                    </td>
                                    <td>
                                        <input type="text" id="nombreCliMod" name="nombreCliMod" value="<%= lista.get(1) %>" class='form-control form-control-sm' required="required">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Direcci&oacute;n
                                    </td>
                                    <td>
                                        <input type="text" id="dirCliMod" name="dirCliMod" value="<%= lista.get(2) %>" class='form-control form-control-sm' required="required">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Rol&nbsp;de&nbsp;la&nbsp;empresa
                                    </td>
                                    <td>
                                        <input type="text" id="rolCliMod" name="rolCliMod" value="<%= lista.get(3) %>" class='form-control form-control-sm' required="required">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Puesto
                                    </td>
                                    <td>
                                        <input type="text" id="puestoCliMod" name="puestoCliMod" value="<%= lista.get(4) %>" class='form-control form-control-sm' required="required">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Correo
                                    </td>
                                    <td>
                                        <input type="email" id="correoCliMod" name="correoCliMod" value="<%= lista.get(5) %>" class='form-control form-control-sm' required="required">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Tel&eacute;fono
                                    </td>
                                    <td>
                                        <input type="number" step="any" id="telCliMod" name="telCliMod" value="<%= lista.get(6) %>" class='form-control form-control-sm' required="required">
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