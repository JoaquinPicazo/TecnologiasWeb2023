// Se solicita el número al usuario
let num = prompt("Ingrese un numero ENTERO para analizar si es par o impar");

// Análisis si es decimal o contiene letras en mayúscula o minúscula
// Si no cumple, se vuelve a solicitar
let permitido = false;
while(permitido==false){
    // Analizar si tiene una letra de la A hasta Z en minuscula o mayuscula
    let mayusculas = /[A-Z]/.test(num);
    let minusculas = /[a-z]/.test(num);
    // Se analiza que no tenga letras mayusculas ni minusculas
    if(mayusculas || minusculas){
        alert("No se permiten letras");
        num = prompt("Ingrese un numero entero para analizar si es par o impar");
        permitido=false;
    } else {
        // Se analiza que no tenga símbolos
        if(isNaN(num)){
            alert("No se permiten símbolos");
            num = prompt("Ingrese un numero entero para analizar si es par o impar");
            permitido=false;
        }else{
            // Se analiza que sea un número entero
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
    document.write("El numero ingresado es par")
}else{
    document.write("El numero ingresado es impar")
    alert("El numero ingresado es impar")
}