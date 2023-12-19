// Se sugiere utilizar prefer_const_constructors, sort_child_properties_last, etc.

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:spaceduo/ConexionFirebase.dart';
import 'package:spaceduo/exito.dart';
import 'package:spaceduo/login.dart';
import 'firebase_options.dart';  
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController nicknameController = TextEditingController(text: "");
  TextEditingController correoController = TextEditingController(text: "");
  TextEditingController contrasenaController = TextEditingController(text: "");
  bool taparcontra = true;
  bool NicknameValido = true;
  bool CorreoValido = true;
  bool ContrasenaValida = true;

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
              'assets/SIGNUP.png',
              width: double.infinity,
            ),
          ),
          // Contenedor principal
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 450,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 10),
                    // Título "SIGN UP"
                    Text(
                      'SIGN UP',
                      style: TextStyle(
                        fontSize: 30,
                        color: Color(0xFFFF9900),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
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
                          contentPadding: EdgeInsets.symmetric(vertical: 5),
                          hintStyle: TextStyle(color: Colors.grey),
                          suffixIcon: Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    // Mensaje de error si el nickname no es válido
                    if (!NicknameValido)
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          'El nickname ya existe o no puede ser vacío',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    SizedBox(height: 10),
                    // Campo de entrada para el correo electrónico
                    Container(
                      width: 300,
                      height: 30,
                      child: TextField(
                        controller: correoController,
                        decoration: InputDecoration(
                          hintText: ' Correo electrónico',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 5),
                          hintStyle: TextStyle(color: Colors.grey),
                          suffixIcon: Icon(
                            Icons.email,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    // Mensaje de error si el correo electrónico no es válido
                    if (!CorreoValido)
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          'Correo electrónico no válido o no puede ser vacío',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    SizedBox(height: 10),
                    // Campo de entrada para la contraseña
                    Container(
                      width: 300,
                      height: 30,
                      child: TextField(
                        controller: contrasenaController,
                        obscureText: taparcontra,
                        decoration: InputDecoration(
                          hintText: ' Contraseña',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 5),
                          hintStyle: TextStyle(color: Colors.grey),
                          suffixIcon: IconButton(
                            icon: Icon(
                              taparcontra
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              setState(() {
                                taparcontra = !taparcontra;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    // Mensaje de error si la contraseña no es válida
                    if (!ContrasenaValida)
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          'La contraseña debe tener al menos 7 caracteres',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    SizedBox(height: 50),
                    // Botones y enlaces
                    Column(
                      children: [
                        // Botón de registro
                        SizedBox(
                          width: 300,
                          height: 40,
                          child: TextButton.icon(
                            onPressed: () async {
                              bool estaDisponibleNickname =
                                  await NicknameDisponible(
                                      nicknameController.text);
                              bool CorreoValido =
                                  correoEsValido(correoController.text);
                              bool isPasswordValid =
                                  contrasenaController.text.length >= 7;
                              bool isPasswordEmpty =
                                  contrasenaController.text.isEmpty;

                              setState(() {
                                NicknameValido = estaDisponibleNickname;
                                CorreoValido = CorreoValido;
                                ContrasenaValida =
                                    isPasswordValid && !isPasswordEmpty;
                              });

                              if (estaDisponibleNickname &&
                                  CorreoValido &&
                                  ContrasenaValida) {
                                await AgregarJugador(
                                  nicknameController.text,
                                  correoController.text,
                                  contrasenaController.text,
                                );
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Exito(),
                                  ),
                                );
                              }
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.orange,
                            ),
                            icon: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            label: Text(
                              'REGISTRARME',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        // Enlace para ir a la pantalla de inicio de sesión
                        SizedBox(
                          width: 300,
                          child: InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Login(),
                                ),
                              );
                            },
                            child: Text(
                              'Ya tengo una cuenta',
                              style: TextStyle(
                                color: Colors.purple,
                              ),
                            ),
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
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

  // Verifica si el correo electrónico es válido
  bool correoEsValido(String email) {
    bool EsValido = email.contains('@');
    setState(() {
      CorreoValido = EsValido;
    });
    return EsValido;
  }

  final db = FirebaseFirestore.instance;
}
