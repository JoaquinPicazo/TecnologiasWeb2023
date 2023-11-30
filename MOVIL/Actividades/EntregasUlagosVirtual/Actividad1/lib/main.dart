// Imports
import 'package:flutter/material.dart';
// Main
void main() {
  runApp(MyApp());
}
// MyApp, contiene la estructura y elementos de la interfaz
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold( // Base de la interfaz
        appBar: AppBar( // Barra superior de la aplicación que contiene el título
          title: Text('Actividad 1'), // Titulo 
        ),
        body: Center( // Body con elementos centrados
          child: ElevatedButton( // child con el botón y su evento
            onPressed: () {
              print('Hola Mundo');
            },
            child: Text('Presiona para saludar'),
          ),
        ),
      ),
    );
  }
}
