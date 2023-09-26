let palabras = prompt("Ingrese una oración");
let separador = palabras.split(" ")
let contador = separador.length;

document.write("Palabra ingresada: "+palabras+"<br>");
document.write("Cantidad de palabras: "+contador);