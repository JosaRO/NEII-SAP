<%-- 
    Document   : BuscarProvResultado
    Created on : 2/03/2019, 04:54:57 PM
    Author     : Windows 10 Pro
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion = request.getSession(true);
    ArrayList lista = (ArrayList) sesion.getAttribute("empleados");
    if(lista.isEmpty()){
        response.sendRedirect("ConsultarProducto.jsp");
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
                        <div class="collapse navbar-collapse" id="com_navbar">
                            <ul class="navbar-nav mr-auto">
                                <li class="nav-item dropdown">
                                    <a href="#" class="nav-link dropdown-toggle text-white" id="proveedor" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Proveedor</a>
                                    <div class="dropdown-menu bg-primary" aria-labelledby="proveedor">
                                        <a class="nav-link text-white" href="AgregarProveedor.jsp">Agregar&nbsp;proveedor</a>
                                        <a class="nav-link text-white" href="ModificarProveedor.jsp">Modificar&nbsp;proveedor</a>
                                        <a class="nav-link text-white" href="BuscarProveedor.jsp">Buscar&nbsp;proveedor</a>
                                        <a class="nav-link text-white" href="EliminarProveedor.jsp">Eliminar&nbsp;proveedor</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a href="#" class="nav-link dropdown-toggle text-white" id="producto" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Proveedor</a>
                                    <div class="dropdown-menu bg-primary" aria-labelledby="producto">
                                        <a class="nav-link text-white" href="AgregarProducto.jsp">Agregar&nbsp;producto</a>
                                        <a class="nav-link text-white" href="ModificarProducto.jsp">Modificar&nbsp;producto</a>
                                        <a class="nav-link text-white" href="BuscarProducto.jsp">Buscar&nbsp;producto</a>
                                        <a class="nav-link text-white" href="EliminarProducto.jsp">Eliminar&nbsp;producto</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a href="#" class="nav-link dropdown-toggle text-white" id="orden" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Orden&nbsp;de&nbsp;compra</a>
                                    <div class="dropdown-menu bg-primary" aria-labelledby="orden">
                                        <a class="nav-link text-white" href="AgregarOrden.jsp">Agregar&nbsp;orden</a>
                                        <a class="nav-link text-white" href="ModificarOrden.jsp">Modificar&nbsp;orden</a>
                                        <a class="nav-link text-white" href="BuscarOrden.jsp">Buscar&nbsp;orden</a>
                                        <a class="nav-link text-white" href="Devolucion.jsp">Devoluci&oacute;n</a>
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
            <div class="div-interno-centrado">
                <div class="form-centrado">
                    <scroll-container>
                        <table align="center">
                            <tr>
                                <td>ID</td>
                                <td>Nombre</td>
                                <td>Tel&eacute;fono</td>
                                <td>Status</td>
                            </tr>
                            <tr>
                                <%
                                    for(int i = 0 ; i < lista.size() ; i++){
                                        if(i%4 == 0){
                                            %>
                            </tr>
                            <tr>
                                            <%
                                        }%>
                                        <td><%= lista.get(i) %></td>
                                <%
                                    }
                                %>
                            </tr>
                        </table>
                    </scroll-container>
                </div>
            </div>
        </div><!-- FIN DE SECCION PRINCIPAL -->
    </body>
</html>