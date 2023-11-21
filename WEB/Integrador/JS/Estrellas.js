document.addEventListener('DOMContentLoaded', function () {
    const contenedor = document.querySelector('.fondo-estrellas');

    // Ajusta la cantidad de estrellas según tus preferencias
    const cant = 200;

    for (let i = 0; i < cant; i++) {
        generarEstrella();
    }

    function generarEstrella() {
        const estrella = document.createElement('div');
        estrella.className = 'estrella';
        const duracion = Math.random() * (1.5 - 1) + 1;
        estrella.style.left = `${Math.random() * 100}%`;
        estrella.style.top = `${Math.random() * 100}%`;
        estrella.style.animationDuration = `${duracion}s`;
        contenedor.appendChild(estrella);
    }
});
