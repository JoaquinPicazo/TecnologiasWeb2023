// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:spaceduo/menu.dart';

class Instrucciones extends StatelessWidget {
  final String nickname;

  const Instrucciones({Key? key, required this.nickname}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fondo de instrucciones
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/INSTRUCCIONES.jpg',
              width: double.infinity,
            ),
          ),
          // Contenedor con las instrucciones en la parte inferior
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipPath(
              child: Container(
                alignment: Alignment.center,
                height: 400,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Container(
                  width: 400,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Título "INSTRUCCIONES" en naranja 
                      Text(
                        'INSTRUCCIONES',
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // Descripción detallada de las instrucciones
                      Text(
                        '1) Toca dos cartas para voltearlas y verificar si son idénticas \n2) En caso de encontrar un par, quedarán boca arriba y debes seguir buscando los pares restantes \n3) Si las cartas no coinciden, regresarán a su posición original (ocultas) \n4) Tu objetivo es encontrar todos los pares antes de que acabe el tiempo para lograr la victoria',
                        style: TextStyle(
                          color: Color(0xFFA65B0E),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // Botón para volver al menú
                      ElevatedButton(
                        onPressed: () {
                          // Navegar de regreso al menú, reemplazando la pantalla actual
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Menu(
                                      nickname: nickname,
                                    )),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orange,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.arrow_back, color: Colors.white),
                            SizedBox(width: 8),
                            Text(
                              '¡Entendido!',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
