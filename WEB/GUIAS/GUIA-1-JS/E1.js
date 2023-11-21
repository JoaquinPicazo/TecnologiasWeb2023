// Se pide el numero positivo al usuario
let num = prompt("Ingrese un numero positivo");

let i = 0;
let total = 0;

// Se analiza si es par, y si es par se suma (incluyendo al numero ingresado)
while(i<=num){
    if(i%2==0){
        total +=i;     
    }
    i++;
}

// Se muestra el resultado final por pantalla
document.write("El resultado es: "+total);