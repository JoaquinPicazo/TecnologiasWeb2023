// Se pide los numeros separados por comas al usuario
let nums = prompt("Ingrese números separados por coma \nEj: 1,2,3,4");

// Se hace un arreglo separando los numeros por comas
let aux = nums.split(",");

// Se usa como referencia el primer numero del arreglo
let mayor=aux[0];

// Se analiza todo el arreglo y se busca el mayor
for(i=1;i<=aux.length;i++){
    if(mayor>aux[i]){
        mayor=mayor;
    }else if(mayor<aux[i]){
        mayor=aux[i];
    }else if(mayor==aux[i]){
        mayor=mayor;
    }
}

// Se muestra el resultado final
alert("El mayor es: "+mayor);       
