function CalcularPropina(){
    let porcentajePropina = document.getElementById("PorcentajePropina").value;
    let montoBoleta = document.getElementById("MontoBoleta").value;
    const mayusculas = /[A-Z]/.test(montoBoleta);
    const minusculas = /[a-z]/.test(montoBoleta);
    if(montoBoleta<=0){
        document.getElementById("propina").textContent = "";
        document.getElementById("MontoFinal").textContent = "";
        setTimeout(function() {
            alert("No se pueden ingresar montos negativos ni 0");
        }, 100);  
    }else if(montoBoleta-Math.floor(montoBoleta)!=0){
        document.getElementById("propina").textContent = "";
        document.getElementById("MontoFinal").textContent = "";    
        setTimeout(function() {
            alert("Debe ser un numero entero en formato CLP!");
        }, 100);
    }else{
        propina = Math.round(porcentajePropina*montoBoleta);
        document.getElementById("propina").textContent = "$"+propina+" CLP";
    
        montoFinal = Number(propina) + Number(montoBoleta);
        document.getElementById("MontoFinal").textContent = "$"+montoFinal+" CLP";
    }   
}