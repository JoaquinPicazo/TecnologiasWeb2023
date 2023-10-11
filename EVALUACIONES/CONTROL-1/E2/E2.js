let frase = prompt("Ingrese la frase: ");
let letra = prompt("Ingrese la letra a buscar: ");

// Ciclo que analiza posicion por posicion en busqueda de coincidencias segun la letra ingresada
let contador=0;
for(i=0;i<frase.length;i++){
    // Solo suma al contador cuando la posicion analizada coincide con la letra buscada
    if(letra==frase[i]){
        contador += 1;
    }
}

// Respuesta final para el usuario
document.write("Frase analizada: "+frase);
document.write("<br>La letra "+letra+" aparece "+contador+" veces");
