let num = prompt("Ingrese un numero entero para analizar si es par o impar");

// Análisis si es decimal o contiene letras en mayúscula o minúscula
// Si no cumple, se vuelve a solicitar
let permitido = false;
while(permitido==false){
    let mayusculas = /[A-Z]/.test(num);
    let minusculas = /[a-z]/.test(num);
    // Se analiza que 
    if(mayusculas || minusculas){
        alert("No se permiten letras");
        num = prompt("Ingrese un numero entero para analizar si es par o impar");
        permitido=false;
    } else {
        if(isNaN(num)){
            alert("No se permiten símbolos");
            num = prompt("Ingrese un numero entero para analizar si es par o impar");
            permitido=false;
        }else{
            if(num-Math.floor(num)==0){
                permitido=true;         
            }else{
                alert("No se permiten decimales");
                num = prompt("Ingrese un numero entero para analizar si es par o impar");
                permitido=false;
            }
        }
       
    }
}

// Si llega a cumplir los requisitos, permite que se analice si es par o impar y lo muestra en pantalla
if(num%2==0){
    alert("El numero ingresado es par");
}else{
    alert("El numero ingresado es impar")
}