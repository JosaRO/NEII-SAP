<%-- 
    Document   : AgregarOrden
    Created on : 1/03/2019, 08:47:51 PM
    Author     : Windows 10 Pro
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="neii.sap.conexion.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(request.getSession().getAttribute("usuario") == null){
        response.sendRedirect("../errorSesion.jsp");
    }else{
        if(!request.getSession().getAttribute("area").equals("1")&&!request.getSession().getAttribute("area").equals("6")){
            response.sendRedirect("../errorSesion.jsp");
        }
    }
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
        <title>Compras</title>
    </head>
    <body onload="regreso();">
        <div class="row"><!-- INICIO DE NAVBAR -->
            <div class="container-fluid">
                <header class="sticky-top">
                    <nav class="navbar navbar-expand-lg navbar-light bg-primary">
                        <a href="#" class="navbar-brand text-white">Compras</a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#com_navbar" aria-controls="com_navbar" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="con_navbar">
                            <ul class="navbar-nav mr-auto">
                                <li class="nav-item dropdown">
                                    <a href="#" class="nav-link dropdown-toggle text-white" id="proveedor" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Proveedor</a>
                                    <div class="dropdown-menu bg-primary" aria-labelledby="proveedor">
                                        <a class="nav-link text-white" href="AgregarProveedor.jsp">Agregar&nbsp;proveedor</a>
                                            <a class="nav-link text-white" href="BuscarProveedor.jsp">Gestionar&nbsp;proveedor</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a href="#" class="nav-link dropdown-toggle text-white" id="producto" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Producto</a>
                                    <div class="dropdown-menu bg-primary" aria-labelledby="producto">
                                        <a class="nav-link text-white" href="AgregarProducto.jsp">Agregar&nbsp;producto</a>
                                        <a class="nav-link text-white" href="BuscarProducto.jsp">Gestionar&nbsp;producto</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a href="#" class="nav-link dropdown-toggle text-white" id="orden" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Orden&nbsp;de&nbsp;compra</a>
                                    <div class="dropdown-menu bg-primary" aria-labelledby="orden">
                                        <a class="nav-link text-white" href="AgregarOrden.jsp">Agregar&nbsp;orden</a>
                                        <a class="nav-link text-white" href="BuscarOrden.jsp">Gestionar&nbsp;orden</a>
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
                    <form class="form-control" method="POST" autocomplete="off" action="../AgregarOrden">
                        <table>
                            <tbody>
                                <tr>
                                    <td>
                                        Proveedor
                                    </td>
                                    <td>
                                        <input type="number" step="any" class="form-control form-control-sm" id="provOrden" name="provOrden" required="required">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Producto
                                    </td>
                                    <td>
                                        <input type="text" class="form-control form-control-sm" id="prodOrden" name="prodOrden" required="required">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Cantidad
                                    </td>
                                    <td>
                                        <input type="text" class="form-control form-control-sm" id="cantOrden" name="cantOrden" required="required">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Total
                                    </td>
                                    <td>
                                        <input type="text" class="form-control form-control-sm" id="totalOrden" name="totalOrden" required="required">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <center>
                                            <input type="submit" class="btn btn-success" value="Solicitar">
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
