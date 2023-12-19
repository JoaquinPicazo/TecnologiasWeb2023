// ignore_for_file: prefer_const_constructors, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:spaceduo/menu.dart';

class Victoria extends StatefulWidget {
  final String nickname;

  const Victoria({Key? key, required this.nickname}) : super(key: key);

  @override
  State<Victoria> createState() => _VictoriaState();
}

class _VictoriaState extends State<Victoria> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagen de fondo para la victoria
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/VICTORIA.jpg',
              width: double.infinity,
            ),
          ),
          // Contenido principal en la parte superior
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
                  // Título de la pantalla de victoria
                  Text(
                    'VICTORIA',
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  // Mensaje de victoria
                  Text(
                    'Lograste emparejar las cartas antes de que haya acabado el tiempo',
                    style: TextStyle(
                      color: Color(0xFFA65B0E),
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  // Botón para volver al menú
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Menu(nickname: widget.nickname)),
                      );
                    },
                    icon: Icon(Icons.home, color: Colors.white),
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
