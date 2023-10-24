let contador1 = 0;
let contador2 = 0;
let contador3 = 0;
let contador4 = 0;
function cambiarValor1(){
    contador1++;
    if (contador1%2==0){
        document.getElementById("mayusculas").value="0"; 
    }else{
        let mayusculas = document.getElementById("mayusculas").value;
        document.getElementById("mayusculas").value="1";     
    }
    
}
function cambiarValor2(){
    contador2++;
    if(contador2%2==0){
        document.getElementById("minusculas").value="0";
    }else{
        let mayusculas = document.getElementById("minusculas").value;
        document.getElementById("minusculas").value="1";
    }
    
}
function cambiarValor3(){
    contador3++;
    if(contador3%2==0){
        document.getElementById("numeros").value="0";
    }else{
        let mayusculas = document.getElementById("numeros").value;
    document.getElementById("numeros").value="1";
    }
    
}
function cambiarValor4(){
    contador4++;
    if(contador4%2==0){
        document.getElementById("especiales").value="0";
    }else{
        let mayusculas = document.getElementById("especiales").value;
        document.getElementById("especiales").value="1";
    }
    
}

function Generar(){
    let longitud = document.getElementById("longitud").value;
    let mayusculas = document.getElementById("mayusculas").value;
    let minusculas = document.getElementById("minusculas").value;
    let numeros = document.getElementById("numeros").value;
    console.log(minusculas);
    console.log(mayusculas);
    let especiales = document.getElementById("especiales").value;
    let contraseña="";
    let i=0;

    if(longitud>=8 && longitud<=20){
    let opciones = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25];
    let opciones2 = [0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9];
    let opciones3 = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,0,1,2,3,4,5,6,7,8,9,10,11,12,13];
    

    const letrasMayus = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","Ñ","O","P","Q","R","S","T","U","V","W","X","Y","Z"];
    const letrasMinus = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","ñ","o","p","q","r","s","t","u","v","w","x","y","z"];
    const opcionesNumeros = ["0","1","2","3","4","5","6","7","8","9"];
    const caracteresEspeciales = ["|","!","@","#","$","%","&","/","(",")","=","?","¿","¡"];
    
    while(i<longitud){
        if(mayusculas=="1"){
            opciones = opciones.sort(()=>{return Math.random()-0.5});
            let indice = opciones[i];
            contraseña = contraseña+letrasMayus[indice];
            i++;
        }
        if(i==longitud){
            break;
        }
        if(minusculas=="1"){
            opciones = opciones.sort(()=>{return Math.random()-0.5});
            let indice = opciones[i];
            contraseña=contraseña+letrasMinus[indice];
            i++;
        }else{
            

        }
        if(i==longitud){
            break;
        }
        if(numeros=="1"){
            opciones2 = opciones2.sort(()=>{return Math.random()-0.5});
            let indice = opciones2[i];
            contraseña=contraseña+opcionesNumeros[indice];
            i++;
        }
        if(i==longitud){
            break;
        }
        if(especiales=="1"){
            opciones3 = opciones3.sort(()=>{return Math.random()-0.5});
            let indice = opciones3[i];
            contraseña=contraseña+caracteresEspeciales[indice];
            i++;
        }
        if(i==longitud){
            break;
        }
    }
    document.getElementById("generada").textContent="Contraseña generada: "+contraseña;  
    }else{
        alert("Solo se permiten longitud entre 8 y 20")
    }
    
    
}