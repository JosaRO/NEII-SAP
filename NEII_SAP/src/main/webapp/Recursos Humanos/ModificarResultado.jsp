<%-- 
    Document   : ModificarResultado
    Created on : 3/02/2019, 11:00:52 AM
    Author     : Windows 10 Pro
--%>

<%@page import="neii.sap.conexion.Conexion"%>
<%@page import="java.util.LinkedList"%>
<%@page import="neii.sap.clases.Area"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ArrayList lista = new ArrayList();
    Conexion c = new Conexion();
    if(request.getSession().getAttribute("usuario") == null){
        response.sendRedirect("../errorSesion.jsp");
    }else{
        if(!request.getSession().getAttribute("area").equals("1")&&!request.getSession().getAttribute("area").equals("6")){
            response.sendRedirect("../errorSesion.jsp");
        }else{
            lista = (ArrayList) request.getSession().getAttribute("empleado");
            if(lista.isEmpty()){
                response.sendRedirect("BuscarEmpleado.jsp");
            }
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
        <title>Recursos&nbsp;Humanos</title>
    </head>
    <body onload="regreso();">
        <div class="row"><!-- INICIO DE NAVBAR -->
            <div class="container-fluid">
                <header class="sticky-top">
                    <nav class="navbar navbar-expand-lg navbar-light bg-primary">
                        <a href="#" class="navbar-brand text-white">Recursos&nbsp;Humanos</a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#rh_navbar" aria-controls="rh_navbar" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="rh_navbar">
                            <ul class="navbar-nav mr-auto">
                                <li class="nav-item dropdown">
                                    <a href="#" class="nav-link dropdown-toggle text-white" id="empleado" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Empleado</a>
                                    <div class="dropdown-menu bg-primary" aria-labelledby="empleado">
                                        <a class="nav-link text-white" href="ContratarEmpleado.jsp">Contrataci&oacute;n</a>
                                        <a class="nav-link text-white" href="DespedirEmpleado.jsp">Despido</a>
                                        <a class="nav-link text-white" href="BuscarEmpleado.jsp">Buscar</a>
                                        <a class="nav-link text-white" href="ModificarEmpleado.jsp">Modificar&nbsp;informaci&oacute;n</a>
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
                    <form class="form-control" method="POST" autocomplete="off" onsubmit="return modificarEmpleado();" action="../ModificarEmpleado">
                        <table>
                            <tbody>
                                <tr>
                                    <td>
                                        ID&nbsp;del&nbsp;empleado
                                    </td>
                                    <td>
                                        <input type="text" class="form-control form-control-sm" id="idEmpMod" name="idEmpMod" value="<%= lista.get(0).toString() %>" readonly="readonly">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Nombre
                                    </td>
                                    <td>
                                        <input type="text" class="form-control form-control-sm" value="<%= lista.get(1).toString() %>" id="nombreEmpMod" name="nombreEmpMod" required="required">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Contrase&ntilde;a
                                    </td>
                                    <td>
                                        <input type="text" class="form-control form-control-sm" maxlength="20" value="<%= lista.get(2).toString() %>" id="passEmpMod" name="passEmpMod" required="required">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &Aacute;rea
                                    </td>
                                    <td>
                                        <select id='areaEmpMod' name="areaEmpMod" class='form-control form-control-sm' required="required">
                                            <option value=''>Selecciona&nbsp;una&nbsp;opci&oacute;n...</option>
                                            <%
                                                LinkedList<Area> l = c.area();
                                                for (int i=0;i<l.size();i++)
                                                {
                                                    if(l.get(i).getId() == Integer.parseInt(lista.get(3).toString())){
                                                        out.println("<option selected='selected' value='"+l.get(i).getId()+"'>"+l.get(i).getNombre()+"</td>");
                                                    }else{
                                                        out.println("<option value='"+l.get(i).getId()+"'>"+l.get(i).getNombre()+"</td>");
                                                    }
                                                }
                                            %>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <center>
                                            <input type="submit" class="btn btn-success" value="Modificar">
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
