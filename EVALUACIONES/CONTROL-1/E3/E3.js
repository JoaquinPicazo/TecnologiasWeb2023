nickname = prompt("Ingrese su nickname");

// Analisis de Caracteres
let Caracteres=false;
if(nickname.length>=6){
    document.write("Si cumple los requisitos de 6 caracteres");
    Caracteres=true;
}else{
    document.write("No cumple los requisitos de 6 caracteres");
    Caracteres=false;
}

// Expresiones Regulares
const mayus = /[A-Z]/.test(nickname);
const minus = /[a-z]/.test(nickname);
const nums = /[0-9]/.test(nickname);

// Analisis de mayusculas y minusculas
let Letras = false;
if(mayus || minus){
    document.write("<br>Si cumple los requisitos de contener letras");
    Letras=true;
}else{
    document.write("<br>No cumple los requisitos de contener letras");
    Letras=false;
}

// Análisis de numeros
let Numeros = false;
if(nums){
    document.write("<br>Si cumple los requisitos de contener numeros");
    Numeros = true;
}else{
    document.write("<br>No cumple los requisitos de contener numeros");
    Numeros = false;
}

// Expresiones regulares para inicio y fin
let fin = nickname.length - 1;
IniciaMayus = /[A-Z]/.test(nickname[0]);
IniciaMinus = /[a-z]/.test(nickname[0]);
TerminaNum = /[0-9]/.test(nickname[fin]);

// Analisis de que empieza con letra
ComienzaLetra = false;
if(IniciaMayus || IniciaMinus){
    document.write("<br>Si inicia con una letra, cumple");
    ComienzaLetra=true;
}else{
    document.write("<br>No empieza por una letra, NO cumple");
    ComienzaLetra=false;
}

// Analisis de que termina con numero
FinalizaNumero = false;
if(TerminaNum){
    document.write("<br>Termina con un número, cumple");
    FinalizaNumero = true;
}else{
    document.write("<br>No termina con un número, NO cumple");
    FinalizaNumero = false;
}

// Análisis final de requisitos totales
if(Letras==true && Numeros==true && Caracteres==true && ComienzaLetra==true && FinalizaNumero==true){
    document.write("<br><br><br>EL NOMBRE DE USUARIO SI ES VALIDO");
    alert("El nombre de usuario SI es válido");
}else{
    document.write("<br><br><br>EL NOMBRE NO CUMPLE LOS REQUISITOS MENCIONADOS");
    alert("El nombre de usuario NO cumple los requisitos mencionados");
}