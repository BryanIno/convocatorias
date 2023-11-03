import 'package:catalogo_app/main.dart';
import 'package:flutter/material.dart';

void mostrarAlerta(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Postulación Enviada'),
        content: const Text('Tu postulación ha sido enviada con éxito.'),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop(); // Cierra la alerta
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                    builder: (context) => const MyApp()), // Redirige a MyApp
              );
            },
          ),
        ],
      );
    },
  );
}
