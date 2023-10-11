let permitido = false;
let puntos;

// Bucle para solicitar un valor válido dentro de las normas
while(permitido==false){
    puntos = prompt("Ingrese sus puntos (Ej: 0.0 , 0.2 , 0.4 , 0.6 , 0.8): \nNO se permiten valores intermedios");
    if (puntos==0.0 || puntos==0.2 || puntos==0.4 || puntos==0.6 || puntos==0.8){
        permitido=true;
    }else{
        permitido==false;
        alert("Solo se puede ingresar los puntajes: 0.0 , 0.2 , 0.4 , 0.6 , 0.8");
    }
}

// Determina el rendimiento de usuario segun su puntaje
puntos=Number(puntos);
if(puntos==0.0){
    document.write("Su nivel de rendimiento es: INSUFICIENTE");
}else if(puntos==0.2){
    document.write("Su nivel de rendimiento es: INSUFICIENTE ");
}else if(puntos==0.4){
    document.write("Su nivel de rendimiento es ACEPTABLE");
}else if(puntos==0.6){
    document.write("Su nivel de rendimiento es: MERITORIO");
}else if(puntos==0.8){
    document.write("Su nivel de rendimiento es: EXCELENTE");
}

// Calcula el dinero ganado por el usuario segun su puntaje
Dinero = puntos*350000;
document.write("<br>La cantidad de dinero que ganará es: "+Dinero);
