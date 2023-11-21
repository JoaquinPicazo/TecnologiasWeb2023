function CalcularImc(){
    // Obtencion de datos de usuario
    let nombre = document.getElementById("nombre").value;
    let peso = document.getElementById("peso").value;
    let alturaCentimetro = document.getElementById("altura").value;
    let edad = document.getElementById("edad").vale;
    let genero = document.getElementById("genero").value;
    let actividadFisica = document.getElementById("ActividadFisica").value;

    // Se usa el nombre colocado por el usuario
    document.getElementById("Subtitulo").textContent = "Resultados para "+nombre;

    // Calculo de IMC
    let alturaMetro=(alturaCentimetro)/100;
    let ResultadoIMC=(peso)/(alturaMetro**2);
    document.getElementById("IMC").textContent = "IMC: "+ResultadoIMC.toFixed(2);

    // Calculo de clasificación
    if(ResultadoIMC<18.5){
        document.getElementById("Clasificacion").textContent = "Clasifiación: Peso insuficiente";
    }else if(ResultadoIMC>=18.5 && ResultadoIMC<=24.9){
        document.getElementById("Clasificacion").textContent = "Clasificación: Peso normal";
    }else if(ResultadoIMC>=25 && ResultadoIMC<=29.9){
        document.getElementById("Clasificacion").textContent = "Clasificación: Sobrepeso";
    }else if(ResultadoIMC>=30)
        document.getElementById("Clasificacion").textContent = "Clasificación: Obesidad";

    // Calculo de gasto energetico diario
    let GastoEnergetico = actividadFisica*peso;
    document.getElementById("GED").textContent= "Gasto Energético Diario: "+ GastoEnergetico.toFixed(3) +" kcal";

    // Estado nutricional
    if(ResultadoIMC<18.5 || ResultadoIMC>24.9){
        document.getElementById("EstadoNutricional").textContent = "Estado Nutricional: Necesita atención especialada";
    }else{
        document.getElementById("EstadoNutricional").textContent = "Estado Nutricional: No necesita atención especialada";
    }



}