// Se le pide al usuario ingresar estatura (m) y peso (kg)
let estatura = prompt("Ingrese su estatura en metros (ej: 1.66): ");
let peso = prompt("Ingrese su peso en kg (ej: 64.5): ");

// Se calcula el IMC y se muestra al usuario
let IMC = peso/((estatura)**2);
document.write("Su IMC calculado es: "+IMC.toFixed(3));

// Se analiza la categoría que pertenece segun el IMC
if(IMC<18.5){
    document.write("<br>Su categoría es: BAJO PESO");
}else if(IMC>=18.5 && IMC<24.9){
    document.write("<br>Su categoría es: PESO NORMAL");
}else if(IMC>24.9){
    document.write("<br>Su categoría es: SOBREPESO");
}else{
    alert("Intente otra vez e ingrese bien los datos, por favor");
}