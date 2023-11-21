function EfectoAcordeon(elemento) {
    var Elemento = elemento.parentElement;
    var TotalElementosAcc = document.querySelectorAll('.contenido-acordeon');
    
    TotalElementosAcc.forEach(function (aux) {
        if (aux !== Elemento) {
            aux.classList.remove('open');
        }
    });

    Elemento.classList.toggle('open');
}