<%-- 
    Document   : BuscarOrdenResultado
    Created on : 2/03/2019, 05:00:16 PM
    Author     : Windows 10 Pro
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion = request.getSession(true);
    ArrayList lista = (ArrayList) sesion.getAttribute("ordenConsulta");
    if(lista.isEmpty()){
        response.sendRedirect("BuscarOrden.jsp");
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
        <div class="container"><!-- INICIO DE SECCION PRINCIPAL -->
                <form class="form-control" method="POST" autocomplete="off" action="../BuscarOrden">
                    <table style="width: 100%;">
                        <tr>
                            <td>
                                <input class="form-control form-control-sm" type="number" step="any" id="ordenBuscada" name="ordenBuscada" autocomplete="off">
                            </td>
                            <td>
                                <input class="btn btn-success" type="submit" id="buscarOrden" name="buscarOrden" value="Buscar">
                            </td>
                        </tr>
                    </table>
                </form>
            <scroll-container>
                <table class="tabla">
                    <tr>
                        <td style="text-align: center;"><b>Producto</b></td>
                        <td style="text-align: center;"><b>Proveedor</b></td>
                        <td style="text-align: center;"><b>ID</b></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <%
                            for(int i = 0 ; i <= lista.size() ; i++){
                                if(i%3 == 0 && i != 0){
                        %>
                                    <td>
                                        <center>
                                            <form autocomplete="off" method="POST" action="../Devolucion">
                                                <input type="text" id="idOrdenDev" name="idOrdenDev" value="<%= lista.get(i-1) %>" hidden="true">
                                                <input type="submit" class="btn btn-danger" value="Devolucion">
                                            </form>
                                        </center>
                                    </td>
                                    <td>
                                    <center>
                                        <form autocomplete="off" method="POST" action="../ModificarOrden">
                                            <input type="text" id="idOrdenMod" name="idOrdenMod" value="<%= lista.get(i-1) %>" hidden="true">
                                            <input type="submit" class="btn btn-success" value="Modificar">
                                        </form>
                                    </center>
                                    </td>
                    </tr>
                    <tr>
                        <%
                                }
                                if(i < lista.size()){
                        %>
                                <td style="text-align: center;"><%= lista.get(i) %></td>
                        <%
                                }
                            }
                        %>
                    </tr>
                </table>
            </scroll-container>
        </div><!-- FIN DE SECCION PRINCIPAL -->
    </body>
</html>
