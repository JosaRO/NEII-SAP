<%-- 
    Document   : ModificarResultado
    Created on : 3/02/2019, 11:00:52 AM
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
                                        ID&nbsp;del&nbsp;empleado
                                    </td>
                                    <td>
                                        <input type="text" class="form-control form-control-sm" id="idEmpMod" name="idEmpMod" readonly="readonly">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Nombre
                                    </td>
                                    <td>
                                        <input type="text" class="form-control form-control-sm" id="nombreEmpMod" name="nombreEmpMod" required="required">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Contrase&ntilde;a
                                    </td>
                                    <td>
                                        <input type="text" class="form-control form-control-sm" maxlength="20" id="passEmpMod" name="passEmpMod" required="required">
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
