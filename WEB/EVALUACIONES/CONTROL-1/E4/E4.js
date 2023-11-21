let monto = prompt("Ingrese la cantidad de dinero sin IVA: ");
let ivaUsuario = prompt("Ingrese el porcentaje de IVA que aplicará \n Ej: 19");
monto=Number(monto);
ivaUsuario=Number(ivaUsuario);

/* En caso de que el usuario no ingrese el IVA se le
aplica por defecto el 19% para que posteriormente se llame a la función */
if(ivaUsuario=='' || ivaUsuario==' '){
    ivaUsuario=19;
}

PorcentajeIva=ivaUsuario/100;
let aux;
let MontoFinal=0;

// Funcion que calcula el IVA a partir del Monto del usuario y el IVA ingresado por usuario
// Si el usuario no ingresó el IVA, se usa por defecto 19%
function CalcularFacturaFinal(MontoInicial, IVA){
    aux=MontoInicial*IVA;
    MontoFinal=aux+MontoInicial;
    return MontoFinal;
}

// Se muestra el monto final con IVA incluido
document.write("El monto final tras aplicarle el IVA es: "+CalcularFacturaFinal(monto,PorcentajeIva));