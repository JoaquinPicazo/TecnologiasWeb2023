// ignore_for_file: prefer_const_constructors, sort_child_properties_last, sized_box_for_whitespace, use_build_context_synchronously, avoid_print
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spaceduo/exito.dart';
import 'package:spaceduo/login.dart';

class Recuperacion extends StatefulWidget {
  const Recuperacion({Key? key}) : super(key: key);

  @override
  State<Recuperacion> createState() => _RecuperacionState();
}

class _RecuperacionState extends State<Recuperacion> {
  final TextEditingController _emailController = TextEditingController();

  // Función para enviar correo de recuperación de contraseña
  Future<void> recuperarContrasena() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: _emailController.text,
      );

      // Navegar a la pantalla de éxito
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Exito()),
      );
      print('Se mandó el correo, funciona bien el código');
    } catch (e) {
      print('Error, algo pasa');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fondo de pantalla
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/RECUPERAR.jpg',
              width: double.infinity,
            ),
          ),
          // Contenido principal
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                height: 450,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30.0),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    // Título de la pantalla
                    Text(
                      'RECUPERAR CONTRASEÑA',
                      style: TextStyle(
                        fontSize: 28,
                        color: Color(0xFFFF9900),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    // Instrucción para ingresar el correo
                    Text(
                      'Ingrese el correo con el que se registró:',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFFA65B0E),
                      ),
                    ),
                    SizedBox(height: 10),
                    // Campo de texto para el correo
                    Container(
                      width: 300,
                      height: 30,
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: ' usuario@gmail.com',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                          hintStyle: TextStyle(color: Colors.grey),
                          suffixIcon: Icon(Icons.mail, color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    // Botón para enviar correo de recuperación
                    Column(
                      children: [
                        SizedBox(
                          width: 300,
                          height: 40,
                          child: TextButton.icon(
                            onPressed: recuperarContrasena,
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.orange,
                            ),
                            icon: Icon(Icons.email, color: Colors.white),
                            label: Text(
                              'RECUPERAR',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        // Enlace para volver a la pantalla de inicio de sesión
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            width: 250,
                            child: InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()),
                                );
                              },
                              child: Text(
                                'Quiero iniciar sesión',
                                style: TextStyle(
                                  color: Colors.purple,
                                ),
                              ),
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
