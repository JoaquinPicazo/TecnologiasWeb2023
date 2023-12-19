// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, avoid_print, unnecessary_string_interpolations, deprecated_member_use, library_private_types_in_public_api

import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:spaceduo/ConexionFirebase.dart';
import 'package:spaceduo/derrota.dart';
import 'package:spaceduo/menu.dart';
import 'package:spaceduo/victoria.dart';

class Partida extends StatefulWidget {
  final String nickname;

  const Partida({Key? key, required this.nickname}) : super(key: key);

  @override
  _PartidaState createState() => _PartidaState();
}

class _PartidaState extends State<Partida> {
  List<String> cartas = [
    'assets/P1.png', 'assets/P1.png',
    'assets/P2.png', 'assets/P2.png',
    'assets/P3.png', 'assets/P3.png',
    'assets/P4.png', 'assets/P4.png',
  ];

  List<int> cartasVolteadas = [];
  List<int> cartasEncontradas = [];
  bool bloquear = false;
  int tiempoRestante = 10;

  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _mezclarCartas();
    _iniciarTemporizador();
  }

  void _mezclarCartas() {
    final random = Random();
    for (var i = cartas.length - 1; i > 0; i--) {
      var randIndex = random.nextInt(i + 1);

      var temp = cartas[i];
      cartas[i] = cartas[randIndex];
      cartas[randIndex] = temp;
    }
  }

  void _iniciarTemporizador() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        tiempoRestante--;
      });

      if (tiempoRestante == 0) {
        _timer.cancel();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Derrota(nickname: widget.nickname)),
        );
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fondo de pantalla
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/PARTIDA.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(height: 50),
              // Barra superior con información
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Tiempo restante
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.access_time, color: Colors.black),
                        SizedBox(width: 8),
                        Text(
                          'Tiempo: $tiempoRestante segundos',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  // Botón para salir
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Menu(nickname: widget.nickname)),
                      );
                    },
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                    label: Text(
                      'Salir',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: Size(120, 60),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              // Cartas en el centro de la pantalla
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildColumn([0, 1, 2, 3]),
                  SizedBox(width: 50),
                  _buildColumn([4, 5, 6, 7]),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Construye una columna de botones de cartas
  Widget _buildColumn(List<int> indices) {
    return Column(
      children: indices.map((index) => _buildButton(index)).toList(),
    );
  }

  // Construye un botón de carta
  Widget _buildButton(int index) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          Voltear(index);
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: EdgeInsets.zero,
        ),
        child: Container(
          width: 80,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.lightBlue,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset(
            cartasVolteadas.contains(index) || cartasEncontradas.contains(index)
                ? '${cartas[index]}'
                : 'assets/BACK.png',
            width: 80,
            height: 120,
          ),
        ),
      ),
    );
  }

  // Voltea una carta al hacer clic
  void Voltear(int index) {
    if (!bloquear &&
        !cartasVolteadas.contains(index) &&
        cartasVolteadas.length < 2) {
      setState(() {
        cartasVolteadas.add(index);
      });

      if (cartasVolteadas.length == 2) {
        bloquear = true;
        Comparar();
      }
    }
  }

  // Compara las cartas volteadas
  void Comparar() {
    if (cartasVolteadas.length == 2) {
      int C1 = cartasVolteadas[0];
      int C2 = cartasVolteadas[1];

      if (cartas[C1] == cartas[C2]) {
        print('¡Encontraste una pareja!');
        cartasEncontradas.addAll(cartasVolteadas);

        if (cartasEncontradas.length == 8) {
          print('VICTORIA');
          actualizarTiempoRestante(widget.nickname, tiempoRestante);

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Victoria(nickname: widget.nickname)),
          );
        }
      }

      Future.delayed(Duration(milliseconds: 300), () {
        setState(() {
          cartasVolteadas.clear();
          bloquear = false;
        });
      });
    }
  }
}
