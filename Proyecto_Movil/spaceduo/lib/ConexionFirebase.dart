// ignore_for_file: avoid_function_literals_in_foreach_calls, file_names, unnecessary_cast, avoid_print, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, duplicate_import, unused_catch_clause
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
FirebaseFirestore bd = FirebaseFirestore.instance;

// Obtener los mejores jugadores
Future<List> getPuntajes() async {
  List mejoresJugadores = [];
  CollectionReference coleccionJugadores = bd.collection('jugador');

  // Consultar los jugadores ordenados por 'time_rest' de forma descendente y limitar a 3
  QuerySnapshot queryJugadores = await coleccionJugadores
      .orderBy('time_rest', descending: true)
      .limit(3)
      .get();

  // Iterar sobre los documentos y agregar los datos de los jugadores a la lista
  queryJugadores.docs.forEach((documento) {
    mejoresJugadores.add(documento.data());
  });

  return mejoresJugadores;
}

// Verificar si un nickname está disponible
Future<bool> NicknameDisponible(String nickname) async {
  // Consultar jugadores con el mismo nickname
  QuerySnapshot<Map<String, dynamic>> registros = await bd
      .collection("jugador")
      .where("nickname", isEqualTo: nickname)
      .get();
  
  // Devolver true si no hay coincidencias, entonces esta disponible
  return registros.docs.isEmpty;
}

// Agregar un nuevo jugador
Future<void> AgregarJugador(
    String nickname, String correo, String password) async {
  try {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    // Crear un nuevo usuario en Firebase 
    await _auth.createUserWithEmailAndPassword(
      email: correo,
      password: password,
    );

    // Datos del jugador a ser agregados a Firestore
    Map<String, dynamic> jugadorData = {
      "nickname": nickname,
      "email": correo,
      "contraseña": password, 
      "time_rest": 0,
    };

    // Agregar datos del jugador a la colección 'jugador' en Firestore
    await bd.collection("jugador").add(jugadorData);
  } on FirebaseAuthException catch (e) {
    print('ERROR al crear usuario en Firebase');
  } catch (e) {
    print('Error');
  }
}

// Actualizar el tiempo restante de un jugador
Future<void> actualizarTiempoRestante(
    String nickname, int tiempoRestante) async {
  try {
    // Buscar al jugador por su nickname
    var jugadorRegistrado = await FirebaseFirestore.instance
        .collection('jugador')
        .where('nickname', isEqualTo: nickname)
        .limit(1)
        .get();

    // Si el jugador existe, comparar y actualizar el tiempo restante si es mayor
    if (jugadorRegistrado.docs.isNotEmpty) {
      var jugador = jugadorRegistrado.docs.first.data() as Map<String, dynamic>;
      int tiempoRestanteRegistrado = jugador['time_rest'] ?? 0;

      if (tiempoRestante > tiempoRestanteRegistrado) {
        var jugadorId = jugadorRegistrado.docs.first.id;
        await FirebaseFirestore.instance
            .collection('jugador')
            .doc(jugadorId)
            .update({'time_rest': tiempoRestante});
      }
    } else {
      print(
          'No existe este jugador, tengo que revisar la variable entre interfaces');
    }
  } catch (e) {
    print('Error al actualizar el tiempo restante');
  }
}
