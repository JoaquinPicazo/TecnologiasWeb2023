// Se solicitan las notas al usuario
let n1 = prompt("Ingrese la NOTA 1 (40%)");
let n2 = prompt("Ingrese la NOTA 2 (30%)");
let n3 = prompt("Ingrese la NOTA 3 (30%)");

// Se calcula el promedio final
let n_Final = (n1*0.4) + (n2*0.3) + (n3*0.3);

// Se analiza en que caso queda el estudiante
if(n_Final<3.95){
    document.write("Su nota final es: "+n_Final.toFixed(3)+"<br>");
    document.write("Ha reprobado la asignatura");
}else if(n_Final>=3.95 && n_Final<=4.94){
    document.write("Su nota final es: "+n_Final.toFixed(3)+"<br>");
    document.write("Debes dar examen");
}else if(n_Final>=4.95){
    document.write("Su nota final es: "+n_Final.toFixed(3)+"<br>");
    document.write("Te has eximido de la asignatura");
}else{
    alert("Ingrese las notas nuevamente")
}
