let num = prompt("Ingrese un numero positivo");
let i = 0;
let total = 0;
while(i<=num){
    if(i%2==0){
        total +=i     
    }
    i++;
}

document.write("El resultado es: "+total);