<%-- 
    Document   : VerTransaccion
    Created on : 3/02/2019, 12:48:07 PM
    Author     : Windows 10 Pro
--%>

<%@page import="neii.sap.conexion.Conexion"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(request.getSession().getAttribute("usuario") == null){
        response.sendRedirect("../errorSesion.jsp");
    }else{
        if(!request.getSession().getAttribute("area").equals("5")&&!request.getSession().getAttribute("area").equals("6")){
            response.sendRedirect("../errorSesion.jsp");
        }
    }
    Conexion c = new Conexion();
    ArrayList lista = c.consulta("movimiento.id,empleado.nombre,movimiento.cantidad,movimiento.fecha", "movimiento,empleado",
            "movimiento.id is not null AND movimiento.responsable = empleado.id", 4);
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
        <title>Contabilidad</title>
    </head>
    <body onload="regreso();">
        <div class="row"><!-- INICIO DE NAVBAR -->
            <div class="container-fluid">
                <header class="sticky-top">
                    <nav class="navbar navbar-expand-lg navbar-light bg-primary">
                        <a href="#" class="navbar-brand text-white">Contabilidad</a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#con_navbar" aria-controls="con_navbar" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="con_navbar">
                            <ul class="navbar-nav mr-auto">
                                <li class="nav-item dropdown">
                                    <a href="#" class="nav-link dropdown-toggle text-white" id="movimiento" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Transacci&oacute;n</a>
                                    <div class="dropdown-menu bg-primary" aria-labelledby="movimiento">
                                        <a class="nav-link text-white" href="VerTransaccion.jsp">Ver&nbsp;transacciones</a>
                                        <a class="nav-link text-white" href="BuscarTransaccion.jsp">Buscar&nbsp;transacci&oacute;n</a>
                                        <a class="nav-link text-white" href="BalanceGeneral.jsp">Balance&nbsp;general</a>
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
                    <scroll-container>
                        <table align="center">
                            <tr>
                                <td>ID</td>
                                <td>Responsable</td>
                                <td>Cantidad</td>
                                <td>Fecha</td>
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
