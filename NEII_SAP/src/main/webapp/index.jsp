<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% request.getSession().invalidate(); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="Recursos/Bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="Recursos/Bootstrap/include/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="Recursos/Bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="Recursos/Bootstrap/include/popper.min.js" type="text/javascript"></script>
        <link href="Recursos/css/Estilos.css" rel="stylesheet" type="text/css"/>
        <script src="Recursos/js/Validaciones.js" type="text/javascript"></script>
        <title>Iniciar&nbsp;sesi&oacute;n</title>
    </head>
    <body onload="regreso();">
        <div class="div-centrado">
            <div class="form-centrado">
                <form class="form-control" id="login" name="login" method="POST" autocomplete="off" action="IniciarSesion">
                    <table>
                        <tbody>
                            <tr>
                                <td>
                                    <center>
                                        <h1>¡Bienvenido(a)&nbsp;al&nbsp;SAP!</h1>
                                    </center>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <center>
                                        <input type="number" step="any" id="usuario" name="usuario" class="form-control-lg" placeholder="USUARIO" required="required">
                                    </center>
                                </td>
                            </tr>    
                            <tr>
                                <td>
                                    <center>
                                        <input type="password" id="pass" name="pass" class="form-control-lg" placeholder="CONTRASEÑA" required="required">
                                    </center>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <center>
                                        <input type="submit" class="btn btn-success" value="Ingresar">
                                    </center>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>
            <div class="container-fluid" id="errorLogin" name="errorLogin">
                <center>
                    <label style="color: red; text-decoration: underline;">Usuario&nbsp;o&nbsp;contrase&ntilde;a&nbsp;incorrectos</label>
                </center>
            </div>
        </div>
    </body>
</html>