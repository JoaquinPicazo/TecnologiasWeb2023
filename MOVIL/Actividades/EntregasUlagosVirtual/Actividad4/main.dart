// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors, duplicate_ignore, avoid_print

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar
      appBar: AppBar(
        title: Text('Mi App con Tabs'),
      ),
      body: contenido(),

      // La barra de navegacion de abajo
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
      ),
    );
  }

  // Ponerle el contenido según la interfaz en la que se encuentra
  Widget contenido() {
    if (currentIndex == 0) {
      return carrusel();
    } else if (currentIndex == 1) {
      return perfil();
    } else {
      return Center(
        child: Text(
          'Error',
        ),
      );
    }
  }

  // Se genera el carrusel si esta en la interfaz 0
  Widget carrusel() {
    return Center(
      child: CarouselSlider(
        items: [
          Image.network(
              'https://i.pinimg.com/originals/69/14/48/691448a61b6a2aea18f0360212fa6b45.png'),
          Image.network(
              'https://i.pinimg.com/originals/3b/78/47/3b7847675982776e5219e12a680ecd84.png'),
          Image.network(
              'https://i.pinimg.com/564x/c7/59/49/c75949b61fd3adec39fbfa2af201e0e4.jpg'),
        ],
        options: CarouselOptions(
          height: 200.0,
          enlargeCenterPage: true,
          enableInfiniteScroll: true,
        ),
      ),
    );
  }

  // Se genera el perfil si se encuentra en la pagina o interfaz 1
  Widget perfil() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: ClipOval(
            child: Image.network(
              'https://i.pinimg.com/originals/62/e7/13/62e71368b711f43dc3ab967c1c6a17bb.jpg',
              width: 200.0,
              height: 200.0,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 40),
        Center(
          child: ElevatedButton(
            onPressed: () {
              print('Editando perfil nomas \n Flutter es épico');
            },
            child: Text('Editar Perfil'),
          ),
        ),
      ],
    );
  }
}
