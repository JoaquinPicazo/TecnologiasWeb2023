// Se le pide al usuario que ingrese una oración
let palabras = prompt("Ingrese una oración");

// Se separa la oracion en palabras a partir de los espacios existentes y se hace un arreglo
let separador = palabras.split(" ");

// Se calcula el tamaño del arreglo, por lo que es la cantidad de palabras
let contador = separador.length;

// Se muestra la palabra ingresada y la cantidad de palabras
document.write("Palabra ingresada: "+palabras+"<br>");
document.write("Cantidad de palabras: "+contador);