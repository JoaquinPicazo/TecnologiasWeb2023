// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:spaceduo/ConexionFirebase.dart';
import 'package:spaceduo/menu.dart';

class Puntajes extends StatelessWidget {
  final String nickname;

  const Puntajes({Key? key, required this.nickname}) : super(key: key);

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
              'assets/INSTRUCCIONES.jpg',
              width: double.infinity,
            ),
          ),
          // Contenido principal
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              height: 450,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  // Título de la pantalla
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 8),
                      Text(
                        'MEJORES PUNTAJES',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  // Lista de puntajes usando DataTable
                  FutureBuilder<List>(
                    future: getPuntajes(),
                    builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text('Error: ${snapshot.error}'),
                        );
                      } else if (!snapshot.hasData) {
                        return Center(
                          child: Text('No hay datos disponibles.'),
                        );
                      } else {
                        List mejoresJugadores = snapshot.data!;
                        // Crear DataTable con los datos
                        return DataTable(
                          headingRowColor:
                              MaterialStateColor.resolveWith((states) => Colors.orange),
                          columns: <DataColumn>[
                            DataColumn(label: Text('Posición')),
                            DataColumn(label: Text('Nickname')),
                            DataColumn(label: Text('Tiempo restante')),
                          ],
                          rows: mejoresJugadores
                              .asMap()
                              .entries
                              .map(
                                (entry) => DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text((entry.key + 1).toString())),
                                    DataCell(Text(entry.value['nickname'] ?? '')),
                                    DataCell(
                                        Text(entry.value['time_rest'].toString() ?? '')),
                                  ],
                                ),
                              )
                              .toList(),
                        );
                      }
                    },
                  ),
                  SizedBox(height: 30),
                  // Botón para volver al menú
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Menu(nickname: nickname)),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange, // Color de fondo del botón
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.arrow_back, color: Colors.white), // Icono de volver
                        SizedBox(width: 8),
                        Text(
                          'Volver al menú',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ],
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
