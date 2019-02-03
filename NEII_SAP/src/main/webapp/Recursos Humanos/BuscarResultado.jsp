<%-- 
    Document   : BuscarResultado
    Created on : 2/02/2019, 10:06:56 PM
    Author     : Windows 10 Pro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                    <form class="form-control" method="POST" autocomplete="off" onsubmit="" action="">
                        <table>
                            <tbody>
                                <tr>
                                    <td>
                                        ID
                                    </td>
                                    <td>
                                        <input type="text" class="form-control form-control-sm" readonly="readonly">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Nombre
                                    </td>
                                    <td>
                                        <input type="text" class="form-control form-control-sm" readonly="readonly">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Apellidos
                                    </td>
                                    <td>
                                        <input type="text" class="form-control form-control-sm" readonly="readonly">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &Aacute;rea
                                    </td>
                                    <td>
                                        <select class="custom-select custom-select-sm" readonly="readonly">
                                            <option selected="selected" value="">Selecciona&nbsp;un&nbsp;&aacute;rea...</option>
                                            <option value="1">Gerencia</option>
                                            <option value="2">Recursos&nbsp;Humanos</option>
                                            <option value="3">Contabilidad</option>
                                            <option value="4">Ventas</option>
                                            <option value="5">Compras</option>
                                            <option value="6">Inventario</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Direcci&oacute;n
                                    </td>
                                    <td>
                                        <input type="text" class="form-control form-control-sm" readonly="readonly">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Sueldo
                                    </td>
                                    <td>
                                        <input type="text" class="form-control form-control-sm" readonly="readonly">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Cuenta
                                    </td>
                                    <td>
                                        <input type="text" class="form-control form-control-sm" readonly="readonly">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Contrase&ntilde;a
                                    </td>
                                    <td>
                                        <input type="text" class="form-control form-control-sm" readonly="readonly">
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
