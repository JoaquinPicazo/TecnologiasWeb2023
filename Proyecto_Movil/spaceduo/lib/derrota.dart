// ignore_for_file: prefer_const_constructors, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:spaceduo/menu.dart';

class Derrota extends StatefulWidget {
  final String nickname;

  const Derrota({Key? key, required this.nickname}) : super(key: key);

  @override
  State<Derrota> createState() => _DerrotaState();
}

class _DerrotaState extends State<Derrota> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fondo de pantalla de derrota
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/DERROTA.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Contenedor para la parte superior con información de derrota
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 270,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Título "DERROTA" en rojo y negrita
                  Text(
                    'DERROTA',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  // Mensaje indicando la razón de la derrota
                  Text(
                    'No has logrado emparejar todas las cartas y se te acabó el tiempo.',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  // Botón elevado para volver al menú
                  ElevatedButton.icon(
                    onPressed: () {
                      // Navegar de regreso al menú, reemplazando la pantalla actual
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Menu(
                                  nickname: widget.nickname,
                                )),
                      );
                    },
                    icon: Icon(Icons.home,
                        color: Colors
                            .white), // Icono de casa en color blanco
                    label: Text(
                      'Volver al menú',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                      minimumSize: Size(200, 40),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
