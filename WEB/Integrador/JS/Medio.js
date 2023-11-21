let Carta1=null;
let Carta2=null;
let dificultad="Medio";
let CartasDestapadas=0;
let primeraCarta=null;
let segundaCarta = null;
let puntajeTotal = 0;
let jugando = true;
let temporizador = setInterval(() => {});
let jugador =0;

const Contadortiempo = document.getElementById('time');

let tiempoRestante = 15;

Contadortiempo.textContent = tiempoRestante+" s";


window.onload = function() {
     document.getElementById('solicitud').style.display = 'flex';
 };
if(jugando==false){
    clearInterval(temporizador);
}

function enviarDatosAlServidor(datos) {
    fetch('http://localhost:3000/insertar-datos', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(datos),
    })
      .then((response) => response.text())
      .then((data) => {
        console.log(data);
      })
      .catch((error) => {
        console.error('Error:', error);
      });
  }
function IniciarJuego(){
    jugador=document.getElementById("nombreJugador").value;
    if (jugador.trim()==""){
        alert("Debe ingresar un nickname");
    }else{
        temporizador = setInterval(() => {
    
            tiempoRestante--;
            puntajeFinal = document.getElementById("puntajeFinalDerrota");
        
    
            Contadortiempo.innerText = tiempoRestante+" s";
        
            if (tiempoRestante <= 0) {
                clearInterval(temporizador);
                tiempoRestante=0;
                Contadortiempo.textContent = tiempoRestante+" s";
                document.getElementById('derrota').style.display = 'flex';
                puntajeFinal.innerText = puntajeTotal;
                jugando=false;

            }
        }, 1000);
        document.getElementById('solicitud').style.display = 'none';
        var eliminado = document.getElementById("solicitud");
        eliminado.remove();
    }

    
    

 }
let imagenes = ['../IMG/C.png','../IMG/Java.png','../IMG/Js.png'];
let numeros = [0,0,1,1,2,2];
numeros = numeros.sort(()=>{return Math.random()-0.5});
let mostrarpuntajeTotal = document.getElementById('score');
for(i=1;i<7;i++){
    let Cartas = document.getElementById(i);
    Cartas.innerHTML= '<img src="../IMG/Carta.png" alt="Imagen" style="width:60%";height:80%>';
}

function DarVuelta(id){
    CartasDestapadas++;
    let Carta = document.getElementById(id);
    let indice = numeros[id-1];
    let imagen = imagenes[indice];
    
    
    if(CartasDestapadas==1){
        Carta1=Carta;
        Carta.classList.add('voltear');
        primeraCarta = imagen;
        if(indice==2){
            Carta.innerHTML = '<img src="'+imagen+'" alt="Imagen" style="width:60%";height:70%>';
        }else{
            Carta.innerHTML = '<img src="'+imagen+'" alt="Imagen" style="width:100%";height:auto>';
        }
        
        Carta1.disabled=true;
    } else if(CartasDestapadas==2){
        
        Carta2 = Carta;
        segundaCarta=imagen;
        Carta.classList.add('voltear');
        if(indice==2){
            Carta.innerHTML = '<img src="'+imagen+'" alt="Imagen" style="width:60%";height:70%>';
        }else{
            Carta.innerHTML = '<img src="'+imagen+'" alt="Imagen" style="width:100%";height:auto>';
        }
        Carta2.disabled = true;

        if(primeraCarta==segundaCarta){
            CartasDestapadas = 0;

            puntajeTotal+=10;
            mostrarpuntajeTotal.innerHTML= puntajeTotal;
            puntajeFinal = document.getElementById("puntajeFinal");
            if (puntajeTotal==30){
                clearInterval(temporizador);
                jugando = false;
                Carta1.classList.remove('voltear');
                Carta2.classList.remove('voltear');
                document.getElementById('victoria').style.display = 'flex';
                puntajeFinal.innerText = puntajeTotal;
                tiempoFinal = document.getElementById('tiempoRestante');
                tiempoFinal.innerText = tiempoRestante;
                let datos = {
                    tiempoRestante: tiempoRestante,
                    dificultad: dificultad,
                    jugador:jugador
                };
        
                enviarDatosAlServidor(datos);
            }

        }else{
            setTimeout(()=>{
           
            Carta1.classList.remove('voltear');
            Carta1.classList.add('desVoltear');
            Carta2.classList.remove('voltear');
            Carta2.classList.add('desVoltear');
            Carta1.innerHTML='<img src="../IMG/Carta.png" alt="Imagen" style="width:60%";height:80%>';
            Carta2.innerHTML= '<img src="../IMG/Carta.png" alt="Imagen" style="width:60%";height:80%>';
            Carta1.disabled = false;
            Carta2.disabled = false;
            CartasDestapadas = 0;
            tiempoRestante=tiempoRestante-1;            
            },500);
            

        }
    }
    Carta1.classList.remove('desVoltear');
    Carta2.classList.remove('desVoltear');
}

function reiniciar(){
    window.location.href = '../HTML/Medio.html';
}

function inicio(){
    window.location.href = '../HTML/Menu.html';
}