let Carta1=null;
let Carta2=null;
let dificultad = "Facil";
let CartasDestapadas=0;
let primeraCarta=null;
let segundaCarta = null;
let puntajeTotal = 0;
let jugando = true;
let jugador =0;
let temporizador = setInterval(() => {});
const Contadortiempo = document.getElementById('time');
let tiempoRestante = 10; 
Contadortiempo.textContent = tiempoRestante+" s";

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
  


// Pedir nickname cuando cargue la página
 window.onload = function(){
     document.getElementById('solicitud').style.display = 'flex';
};

// Iniciar juego cuando ingrese un nickname, de lo contrario lanzar alert
function IniciarJuego(){
    jugador = document.getElementById("nombreJugador").value;
    let nickname=document.getElementById("nombreJugador").value;
    if (nickname.trim()==""){
        alert("Debe ingresar un nickname");
    }else{
        
        temporizador = setInterval(()=>{
            tiempoRestante--;
            puntajeFinal = document.getElementById("puntajeFinalDerrota");
            Contadortiempo.innerText = tiempoRestante+" s";
        
            // Si el tiempo llega a 0, el jugador pierde y se muestra ventana de derrota
            if (tiempoRestante == 0){
                clearInterval(temporizador);
                tiempoRestante=0;
                Contadortiempo.textContent = tiempoRestante+" s";
                document.getElementById('derrota').style.display = 'flex';
                puntajeFinal.innerText = puntajeTotal;
                jugando=false;
            }
        }, 1000);

        // Cierra definitivamente la ventana que solicita nickname
        document.getElementById('solicitud').style.display = 'none';
        var eliminado = document.getElementById("solicitud");
        eliminado.remove();
    }


}

// Elementos para cartas y puntaje
let imagenes = ['../IMG/C.png','../IMG/Java.png'];
let numeros = [0,0,1,1]; 
numeros = numeros.sort(()=>{return Math.random()-0.5});
let mostrarpuntajeTotal = document.getElementById('score');

// Tapar cada carta
for(i=1;i<5;i++){
    let Cartas = document.getElementById(i);
    Cartas.innerHTML= '<img src="../IMG/Carta.png" alt="Imagen" style="width:60%";height:80%>';
}

// Voltear carta al hacer click
function DarVuelta(id){
    CartasDestapadas++;
    let Carta = document.getElementById(id);
    let indice = numeros[id-1];
    let imagen = imagenes[indice];

    // Se destapa la primera carta
    if(CartasDestapadas==1){
        Carta1=Carta;
        primeraCarta = imagen;
        Carta.classList.add('voltear');
        
        Carta.innerHTML = '<img src="'+imagen+'" alt="Imagen" style="width:100%";height:auto>';
        
        Carta1.disabled=true;
    // Se destapa la segunda carta
    } else if(CartasDestapadas==2){
        Carta2 = Carta;
        segundaCarta=imagen;
        Carta.classList.add('voltear');
        Carta.innerHTML = '<img src="'+imagen+'" alt="Imagen" style="width:100%";height:100%>';
        Carta2.disabled = true;  


        // Se compara si son iguales
        if(primeraCarta==segundaCarta){
            
            CartasDestapadas = 0;
            puntajeTotal+=10;
            mostrarpuntajeTotal.innerHTML= puntajeTotal;
            puntajeFinal = document.getElementById("puntajeFinal");

            // Se analiza si se llegó al maximo puntaje (victoria)
            if (puntajeTotal==20){
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
        // Si no coincide, se tapan las cartas
        }else{
            setTimeout(()=>{
            Carta1.classList.remove('voltear');
            Carta1.classList.add('desVoltear');
            Carta2.classList.remove('voltear');
            Carta2.classList.add('desVoltear');
            Carta1.innerHTML= '<img src="../IMG/Carta.png" alt="Imagen" style="width:60%";height:80%>';        
            Carta2.innerHTML= '<img src="../IMG/Carta.png" alt="Imagen" style="width:60%";height:80%>';
            Carta1.disabled = false;
            Carta2.disabled = false;
            CartasDestapadas = 0;      
            },600);
        }
    }
    Carta1.classList.remove('desVoltear');
    Carta2.classList.remove('desVoltear');
}


// Botones de reiniciar e inicio usados en la página
function reiniciar(){
    window.location.href = '../HTML/Facil.html';
}

function inicio(){
    window.location.href = '../HTML/Menu.html';
}




