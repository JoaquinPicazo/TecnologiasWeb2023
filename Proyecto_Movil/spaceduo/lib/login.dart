// ignore_for_file: use_build_context_synchronously, prefer_const_constructors, deprecated_member_use, avoid_print, non_constant_identifier_names, sized_box_for_whitespace, camel_case_types, library_private_types_in_public_api

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:spaceduo/main.dart';
import 'package:spaceduo/menu.dart';
import 'package:spaceduo/recuperacion.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController nicknameController = TextEditingController();
  TextEditingController contrasenaController = TextEditingController();
  bool oculta = false;

  bool nicknameValido = true;
  bool contrasenaValida = true;
  String alerta = '';

  @override
  Widget build(BuildContext context) {
    double altura = MediaQuery.of(context).size.height;
    double alturaImagen = altura * 2 / 3;

    return Scaffold(
      body: Stack(
        children: [
          // Imagen de fondo del login
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: alturaImagen,
            child: Image.asset(
              'assets/LOGIN.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Logo en la parte superior
          Positioned(
            top: (altura / 2) - 350,
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                'assets/LOGO.png',
                width: 300,
                height: 300,
              ),
            ),
          ),
          // Contenedor de la parte inferior con el formulario
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: altura / 2,
            child: ClipPath(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    // Título "LOGIN" en naranja 
                    Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 30,
                        color: Color(0xFFFF9900),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 300,
                      child: Column(
                        children: [
                          // Campo de entrada para el nickname
                          Container(
                            width: 300,
                            height: 30,
                            child: TextField(
                              controller: nicknameController,
                              decoration: InputDecoration(
                                hintText: ' Nickname',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 5),
                                hintStyle: TextStyle(color: Colors.grey),
                                suffixIcon: Icon(
                                  Icons.person,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          if (!nicknameValido)
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                'El nickname no es válido',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          SizedBox(height: 20),
                          // Campo de entrada para la contraseña
                          Container(
                            width: 300,
                            height: 30,
                            child: TextField(
                              controller: contrasenaController,
                              obscureText: !oculta,
                              decoration: InputDecoration(
                                hintText: ' Contraseña',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 5),
                                hintStyle: TextStyle(color: Colors.grey),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    oculta
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      oculta = !oculta;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                          if (!contrasenaValida)
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                'La contraseña no puede ser vacía',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          if (alerta.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                alerta,
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          SizedBox(height: 20),
                          // Enlaces para recuperar contraseña y registrarse
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              // Enlace para recuperar contraseña
                              TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Recuperacion()),
                                  );
                                },
                                child: Text(
                                  'Recuperar Contraseña',
                                  style: TextStyle(
                                    color: Colors.purple,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              // Enlace para registrarse
                              TextButton(
                                onPressed: () async {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyApp()),
                                  );
                                },
                                child: Text(
                                  'Registrarme',
                                  style: TextStyle(color: Colors.purple),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    // Botón "Ingresar"
                    SizedBox(
                      width: 300,
                      height: 40,
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          if (await analizarInputs()) {
                            IniciarSesion();
                          }
                        },
                        icon: Icon(Icons.login, color: Colors.white),
                        label: Text('INGRESAR'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orange,
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
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

  // Método para analizar la validez de los campos de entrada
  Future<bool> analizarInputs() async {
    bool nicknameVacio = nicknameController.text.isEmpty;
    bool contrasenaVacia = contrasenaController.text.isEmpty;

    setState(() {
      nicknameValido = !nicknameVacio;
      contrasenaValida = !contrasenaVacia;
      alerta = '';
    });

    return !nicknameVacio && !contrasenaVacia;
  }

  // Método para iniciar sesión
  Future<void> IniciarSesion() async {
    try {
      var jugadores = await FirebaseFirestore.instance
          .collection('jugador')
          .where('nickname', isEqualTo: nicknameController.text)
          .limit(1)
          .get();

      if (jugadores.docs.isNotEmpty) {
        var jugador = jugadores.docs.first;

        if (jugador['contraseña'] == contrasenaController.text) {
          // Navegar a la pantalla del menú, pasando el nickname como parámetro
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Menu(nickname: nicknameController.text),
            ),
          );
        } else {
          // Mostrar alerta si la contraseña es incorrecta
          setState(() {
            alerta = 'Nickname o contraseña incorrecta.';
          });
        }
      } else {
        // Mostrar alerta si el usuario no existe en la base de datos
        setState(() {
          alerta =
              'Usuario no encontrado.';
        });
      }
    } catch (e) {
      print('Error al iniciar sesión, algo anda mal');
    }
  }
}
