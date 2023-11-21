-- Crear la tabla partida
CREATE TABLE partida (
    id_partida SERIAL PRIMARY KEY,
    tiempo VARCHAR(50),
    dificultad VARCHAR(50)
);

-- Crear la tabla jugador
CREATE TABLE jugador (
    id SERIAL PRIMARY KEY,
    nickname VARCHAR(50),
    id_partida INT,
    FOREIGN KEY (id_partida) REFERENCES partida(id_partida)
);

SELECT * FROM PARTIDA;
SELECT * FROM Jugador;
