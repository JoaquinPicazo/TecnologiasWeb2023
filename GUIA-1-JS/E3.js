let contraseña = prompt("Ingrese su contraseña, recuerde que los requisitos mínimos son: \n 8 CARACTERES \n 1 MAYUSCULA \n 1 NUMERO");

document.write("Contraseña analizada:"+contraseña+"<br>");
tam = contraseña.length;
if (tam>=8){
    document.write("<br>Cumple con cantidad de carácteres");
} else {
    document.write("<br>No cumple con cantidad de carácteres");
}

const mayuscula = /[A-Z]/.test(contraseña);
if(mayuscula){
    document.write("<br>Cumple con tener mínimo 1 mayúscula");
} else {
    document.write("<br>No cumple con tener mínimo 1 mayúscula");
}

const numero = /[1-9]/.test(contraseña); 
if(numero){
    document.write("<br>Cumple con tener mínimo 1 número");
} else {
    document.write("<br>No cumple con tener mínimo 1 número");
}