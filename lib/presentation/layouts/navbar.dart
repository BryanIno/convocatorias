import 'package:flutter/material.dart';

AppBar navbar() {
  return AppBar(
    title: const Text('Logo de la Convocatoria'),
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ElevatedButton(
            onPressed: () {},
            child: const Row(
              children: [Icon(Icons.arrow_back), Text('Volver')],
            )),
      )
    ],
  );
}
