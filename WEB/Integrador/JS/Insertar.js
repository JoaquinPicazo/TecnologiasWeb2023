const express = require('express');
const { Client } = require('pg');
const cors = require('cors');

const app = express();
const port = process.env.PORT || 3000;

app.use(cors());
app.use(express.json());

// Conectar la base de datos con postgresql
const client = new Client({
  user: 'postgres',
  database: ' ', //Nombre base de datos
  password: ' ', // Contraseña base de datos
  port: 5432,
});

client.connect();

// Solicitud de insertar y proceder a insertar
app.post('/insertar-datos', (req, res) => {
  const { tiempoRestante, dificultad,jugador } = req.body;

  const queryPartida = 'INSERT INTO partida(tiempo, dificultad) VALUES($1, $2) RETURNING id_partida';
  const queryJugador = 'INSERT INTO jugador(id_partida, nickname) VALUES($1, $2)';

  const valuesPartida = [tiempoRestante, dificultad];
  const valuesJugador = [null, jugador]; 

  client.query(queryPartida, valuesPartida, (err, result) => {
    if (err) {
      console.error('Error al ejecutar la consulta', err);
      res.status(500).send('Error al insertar los datos');
    } else {
      const id_partida = result.rows[0].id_partida; 
      valuesJugador[0] = id_partida; 

      client.query(queryJugador, valuesJugador, (err, result) => {
        if (err) {
          console.error('Error al ejecutar la consulta', err);
          res.status(500).send('Error al insertar los datos');
        } else {
          console.log('Datos insertados con éxito');
          res.status(200).send('Datos insertados con éxito');
        }
      });
    }
  });
});

app.get('/Facildata', async (req, res) => {
  try {

    const Facil = 'Facil';
    const result = await client.query('SELECT jugador.nickname,partida.tiempo FROM jugador JOIN partida ON jugador.id_partida = partida.id_partida WHERE partida.dificultad = $1 ORDER BY tiempo DESC LIMIT 5',[Facil]);
    const rows = result.rows;
    res.json(rows);
  } catch (error) {
    console.error('Error al obtener datos de la base de datos:', error);
    res.status(500).json({ error: 'Error al obtener datos de la base de datos' });
  }
});

app.get('/Mediodata', async (req, res) => {
  
  try {
    const medio = 'Medio'
    const result = await client.query('SELECT jugador.nickname,partida.tiempo FROM jugador JOIN partida ON jugador.id_partida = partida.id_partida WHERE partida.dificultad = $1 ORDER BY tiempo DESC LIMIT 5',[medio]);
    const rows = result.rows;
    res.json(rows);
  } catch (error) {
    console.error('Error al obtener datos de la base de datos:', error);
    res.status(500).json({ error: 'Error al obtener datos de la base de datos' });
  }
});

app.get('/Dificildata', async (req, res) => {
  try {
    const dificil = 'Dificil'
    const result = await client.query('SELECT jugador.nickname,partida.tiempo FROM jugador JOIN partida ON jugador.id_partida = partida.id_partida WHERE partida.dificultad = $1 ORDER BY tiempo DESC LIMIT 5',[dificil]);
    const rows = result.rows;
    res.json(rows);
  } catch (error) {
    console.error('Error al obtener datos de la base de datos:', error);
    res.status(500).json({ error: 'Error al obtener datos de la base de datos' });
  }
});


app.listen(port, () => {
  console.log('Servidor corriendo en http://localhost:'+port)});