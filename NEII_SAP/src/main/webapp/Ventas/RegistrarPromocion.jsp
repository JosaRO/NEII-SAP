<%-- 
    Document   : RegistrarPromocion
    Created on : 22/04/2019, 11:08:51 AM
    Author     : Windows 10 Pro
--%>

<%@page import="java.util.ArrayList"%>
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
    ArrayList lista = c.consulta("id,nombre", "producto", "id is not null LIMIT 20", 2);
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
                                    <a href="#" class="nav-link dropdown-toggle text-white" id="promocion" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Promociones</a>
                                    <div class="dropdown-menu bg-primary" aria-labelledby="promocion">
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
                    <form class="form-control" method="POST" autocomplete="off" action="../RegistrarPromocion">
                        <table>
                            <tr>
                                <td>
                                    Producto
                                </td>
                                <td>
                                    <select id='prodProm' name="prodProm" class='form-control form-control-sm' required="required">
                                        <option value='' selected='selected'>Selecciona&nbsp;una&nbsp;opci&oacute;n...</option>
                                        <%
                                            int i = 0;
                                            while(i < lista.size())
                                            {
                                               out.println("<option value='"+lista.get(i)+"'>"+lista.get(i+1)+"</option>");
                                               i = i + 2;
                                            }
                                        %>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Descripci&oacute;n
                                </td>
                                <td>
                                    <textarea id="descProm" name="descProm" rows="4" cols="50"></textarea> 
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Vigencia
                                </td>
                                <td>
                                    <select id='mesProm' name="mesProm" class='form-control form-control-sm' required="required">
                                        <option value='' selected='selected'>Mes...</option>
                                        <option value='01'>Enero</option>
                                        <option value='02'>Febrero</option>
                                        <option value='03'>Marzo</option>
                                        <option value='04'>Abril</option>
                                        <option value='05'>Mayo</option>
                                        <option value='06'>Junio</option>
                                        <option value='07'>Julio</option>
                                        <option value='08'>Agosto</option>
                                        <option value='09'>Septiembre</option>
                                        <option value='10'>Octubre</option>
                                        <option value='11'>Noviembre</option>
                                        <option value='12'>Diciembre</option>
                                    </select>
                                    <select id='anioProm' name="anioProm" class='form-control form-control-sm' required="required">
                                        <option value='' selected='selected'>A&ntilde;o...</option>
                                        <option value='2019'>2019</option>
                                        <option value='2020'>2020</option>
                                        <option value='2021'>2021</option>
                                        <option value='2022'>2022</option>
                                        <option value='2023'>2023</option>
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
                        </table>
                    </form>
                </div>
            </div>
        </div><!-- FIN DE SECCION PRINCIPAL -->
    </body>
</html>