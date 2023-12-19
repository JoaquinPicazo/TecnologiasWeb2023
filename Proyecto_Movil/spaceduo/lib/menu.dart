// ignore_for_file: prefer_const_constructors, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:spaceduo/instrucciones.dart';
import 'package:spaceduo/login.dart';
import 'package:spaceduo/partida.dart';
import 'package:spaceduo/puntajes.dart';

class Menu extends StatefulWidget {
  final String nickname;

  const Menu({Key? key, required this.nickname}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Space Duo',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        // Fondo de pantalla del menú
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/MENU.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Botón para iniciar partida
            ElevatedButton.icon(
              onPressed: () {
                // Navegar a la pantalla de partida
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Partida(nickname: widget.nickname)),
                );
              },
              icon: Icon(Icons.play_arrow, color: Colors.black),
              label: Text('Iniciar partida', style: TextStyle(color: Colors.black)),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                minimumSize: Size(200, 60),
                padding: EdgeInsets.symmetric(horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 25),

            // Botón para ver los mejores puntajes
            ElevatedButton.icon(
              onPressed: () {
                // Navegar a la pantalla de puntajes
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Puntajes(nickname: widget.nickname)),
                );
              },
              icon: Icon(Icons.star, color: Colors.black),
              label: Text('Mejores puntajes', style: TextStyle(color: Colors.black)),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                minimumSize: Size(200, 60),
                padding: EdgeInsets.symmetric(horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 25),

            // Botón para ver las instrucciones del juego
            ElevatedButton.icon(
              onPressed: () {
                // Navegar a la pantalla de instrucciones
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Instrucciones(nickname: widget.nickname)),
                );
              },
              icon: Icon(Icons.info, color: Colors.black),
              label: Text('Instrucciones', style: TextStyle(color: Colors.black)),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                minimumSize: Size(200, 60),
                padding: EdgeInsets.symmetric(horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 25),

            // Botón para cerrar sesión
            ElevatedButton.icon(
              onPressed: () {
                // Navegar a la pantalla de inicio de sesión
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
              icon: Icon(Icons.logout, color: Colors.black),
              label: Text('Cerrar sesión', style: TextStyle(color: Colors.black)),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                minimumSize: Size(200, 60),
                padding: EdgeInsets.symmetric(horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
