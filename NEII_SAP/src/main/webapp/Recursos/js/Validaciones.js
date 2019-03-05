var numero = /[0-9]/;
var texto = /[A-Za-z]/;
var especial = /[|�!"#$%&/()=?��'+*{}[]^\:,;<>_]/;

function regreso(){
   window.location.hash="no-back-button";
   window.location.hash="Again-No-back-button";
   window.onhashchange=function(){window.location.hash="no-back-button";};
}

function fecha(fechaMenor,fechaMayor){//Fechas en formato MES/DIA/ANIO con dos digitos en cada posicion
    var menor = Date.parse(fechaMenor);
    var mayor = Date.parse(fechaMayor);
    if((menor < mayor) === false){return false;}
}
//********************************************** RECURSOS HUMANOS ***********************************************************

function buscarEmpleado(){
    var id = document.getElementById("idEmpBuscar").value.toString();
    if(id <= 0){
        alert("El ID del empleado debe ser mayor a 0");
        return false;
    }
    return true;
}

function buscarEmpleadoMod(){
    var id = document.getElementById("idEmpBuscarMod").value.toString();
    if(id <= 0){
        alert("El ID del empleado debe ser mayor a 0");
        return false;
    }
    return true;
}

function buscarEmpleadoDesp(){
    var id = document.getElementById("idEmpDes").value.toString();
    if(id <= 0){
        alert("El ID del empleado debe ser mayor a 0");
        return false;
    }
    return true;
}

function contratarEmpleado(){
    var nombre = document.getElementById("nombreEmp").value.toString();
    if(numero.test(nombre) || especial.test(nombre)){
        alert("El nombre del empleado solo puede contener letras");
        return false;
    }
    return true;
}

function modificarEmpleado(){
    var nombre = document.getElementById("nombreEmpMod").value.toString();
    if(numero.test(nombre) || especial.test(nombre)){
        alert("El nombre del empleado solo puede contener letras");
        return false;
    }
    return true;
}

//********************************************** VENTAS ***********************************************************

function registrarVenta(){
    var cantidad = document.getElementById("cantVenta").value.toString();
    if(cantidad <=0 ){
        alert("La cantidad de productos debe ser mayor a 0");
        return false;
    }
    return true;
}

function registrarCliente(){
    var nombre = document.getElementById("").value.toString();
    var dir = document.getElementById("").value.toString();
    var rol = document.getElementById("").value.toString();
    var puesto = document.getElementById("").value.toString();
    var tel = document.getElementById("").value.toString();
    
    if(numero.test(nombre) || numero.test(rol) || numero.test(puesto) || texto.test(tel)
            || especial.test(nombre) || especial.test(rol) || especial.test(puesto) || especial.test(dir)){
        alert("Los campos NOMBRE, ROL, PUESTO, DIRECCION solo pueden contener texto \n El campo TELEFONO no puede tener letras");
        return false;
    }else{
        if(tel.length < 10 || tel <= 0){
            alert("Los datos del campo TELEFONO son incorrectos");
            return false;
        }
    }
    return true;
}