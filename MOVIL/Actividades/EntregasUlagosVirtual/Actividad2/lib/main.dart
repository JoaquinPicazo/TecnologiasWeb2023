// ignore_for_file: prefer_const_constructors
// Imports
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
// Main
void main() {
  runApp(const MyApp());
}

// Clase MyApp
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 2, 16, 107)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Sedes Universidad de Los Lagos'), // Titulo de la apicación
    );
  }
}

// Clase para la página principal
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// Esta clase contiene todo el contenido de la interfaz de la aplicación
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( // Base de la interfaz de la aplicación
      appBar: AppBar( // Barra superior que contiene el título, también tiene el diseño y las características (fondo, color de texto)
        backgroundColor: Color.fromRGBO(0, 85, 183, 1),
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white)),

      ),
      backgroundColor: Color.fromRGBO(240, 240, 240, 1), // Color de fondo de Scaffold
      body: Column( // Body que organiza los elementos en una columna
        mainAxisAlignment: MainAxisAlignment.start, // Organiza al inicio de la pagina el contenido de la aplicación
        children: <Widget>[
          ConstructorContenedor('assets/Osorno.jpg', 'Ulagos Sede Osorno'), // En estos 3 se usa el contructor creado más abajo
          ConstructorContenedor('assets/PM.jpg', 'Ulagos Sede Puerto Montt'), // Recibe la ubicación de imagen y el texto de la imagen
          ConstructorContenedor('assets/Chiloe.jpg', 'Ulagos Sede Chiloé'),

          SizedBox(height: 15), // Separación

          // Botón
          ElevatedButton( 
            onPressed: () {
              AbrirPagina(); // Metodo para abrir la página web (evento)
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(229, 229, 229, 1),  // Color de fondo del botón
            ),
            child: Text('Más información'), // Texto del botón
    
          ),
        ],
      ),
    );
  }


  // Constructor para generar un contenedor que recibe una ruta de imagen y un texto para colocar bajo la imagen
  Widget ConstructorContenedor(String rutaImagen, String texto) {
    return Container(
      // Caractereisticas y diseño del contenedor
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Color.fromRGBO(216, 216, 216, 1),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column( // Se crea un child que organiza los elementos en columna
        children: [
          Image.asset( // Se crea la imagen y su ancho
            rutaImagen,
            width: double.infinity,
          ),
          const SizedBox(height: 8),
          Text(
            texto, // Texto de la imagen entregada al constructor
            style: TextStyle(
              fontSize: 15, // Tamaño de letra
              color: Color.fromARGB(255, 0, 0, 0), // Color de la letra
            ),
          ),
        ],
      ),
    );
  }

  // Metodo para abrir la página web, el cual usa el evento de presionar el botón
  AbrirPagina() async {
    const url = 'https://www.ulagos.cl/'; // URL de la página de la Universidad de Los Lagos
    try {
      await launch(url); // Abrir página web
    } catch (e) {
      print('Error al abrir la URL'); // Se notifica en consola en caso de que no se pueda abrir
    }
  }
}
