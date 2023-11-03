// ignore_for_file: use_build_context_synchronously

import 'package:catalogo_app/presentation/widgets/alerta.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class FormularioView extends StatelessWidget {
  final num idConvocatoria;

  FormularioView({super.key, required this.idConvocatoria});

  final nombreController = TextEditingController();
  final apellidoPaternoController = TextEditingController();
  final apellidoMaternoController = TextEditingController();
  final correoController = TextEditingController();

  Future<void> enviarDatos(BuildContext context) async {
    final dio = Dio();
    const url = 'https://api-convocatorias-flhp34d5na-tl.a.run.app/postulacion';

    try {
      final response = await dio.post(
        url,
        data: {
          'Convocatoria': idConvocatoria,
          'nombre': nombreController.text,
          'apellidoPaterno': apellidoPaternoController.text,
          'apellidoMaterno': apellidoMaternoController.text,
          'correo': correoController.text,
        },
      );

      if (response.statusCode == 201) {
        mostrarAlerta(context);
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text('Error al enviar la postulación.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } catch (error) {
      print('Error en la solicitud: $error');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Error al enviar la postulación.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario de Postulación'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Container(
            width: 400,
            height: 450,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: const Color.fromARGB(124, 102, 102, 102),
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Rellena el formulario de postulación:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    controller: nombreController,
                    decoration: const InputDecoration(labelText: 'Nombre'),
                  ),
                  TextFormField(
                    controller: apellidoPaternoController,
                    decoration:
                        const InputDecoration(labelText: 'Apellido Paterno'),
                  ),
                  TextFormField(
                    controller: apellidoMaternoController,
                    decoration:
                        const InputDecoration(labelText: 'Apellido Materno'),
                  ),
                  TextFormField(
                    controller: correoController,
                    decoration:
                        const InputDecoration(labelText: 'Correo Electrónico'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => enviarDatos(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(6, 6, 48, 1),
                    ),
                    child: const Text(
                      'Enviar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
