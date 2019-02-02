var numero = /[0-9]/;
var texto = /[A-Za-z]/;
var especial = /[|°!"#$%&/()=?¡¿'+*{}[]^\.:,;<>_]/;

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