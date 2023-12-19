// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, sort_child_properties_last, deprecated_member_use, camel_case_types, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:spaceduo/login.dart';

class Exito extends StatefulWidget {
  const Exito({Key? key});

  @override
  State<Exito> createState() => _ExitoState();
}

class _ExitoState extends State<Exito> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            // Fondo con degradado
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFFE9801),
                    Color(0xFFCE7939),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Imagen de aprobación
                  Image.asset(
                    'assets/APROBADO.png',
                    width: 200,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Mensaje de éxito
                  Text(
                    'Realizado con éxito',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  SizedBox(height: 30),
                  // Botón "Continuar"
                  SizedBox(
                    width: 200,
                    height: 60,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Navegar a la pantalla de inicio de sesión, reemplazando la pantalla actual
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      },
                      icon: Icon(Icons.arrow_forward, color: Colors.white),
                      label: Text('Continuar',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

