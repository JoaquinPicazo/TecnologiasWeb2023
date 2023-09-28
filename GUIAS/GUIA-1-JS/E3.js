// Se pide que ingrese una contraseña al usuario
let contraseña = prompt("Ingrese su contraseña, recuerde que los requisitos mínimos son: \n 8 CARACTERES \n 1 MAYUSCULA \n 1 NUMERO");

// Se muestra la contraseña analizada
document.write("Contraseña analizada:"+contraseña+"<br>");

// Análisis si cumple 8 carácteres
tam = contraseña.length;
if (tam>=8){
    document.write("<br>Cumple con cantidad de carácteres");
} else {
    document.write("<br>No cumple con cantidad de carácteres");
}

// Análisis si tiene 1 Mayúscula en los carácteres
const mayuscula = /[A-Z]/.test(contraseña);
if(mayuscula){
    document.write("<br>Cumple con tener mínimo 1 mayúscula");
} else {
    document.write("<br>No cumple con tener mínimo 1 mayúscula");
}

// Análisis si tiene 1 número en los carácteres
const numero = /[1-9]/.test(contraseña); 
if(numero){
    document.write("<br>Cumple con tener mínimo 1 número");
} else {
    document.write("<br>No cumple con tener mínimo 1 número");
}