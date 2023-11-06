// ignore_for_file: use_build_context_synchronously
import 'package:catalogo_app/presentation/widgets/alerta.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:validate_rut/validate_rut.dart';
import 'package:cached_network_image/cached_network_image.dart';

final _formKey = GlobalKey<FormState>();

class FormularioView extends StatelessWidget {
  final num idConvocatoria;
  String errorMessage = '';

  FormularioView({super.key, required this.idConvocatoria});

  final nombreController = TextEditingController();
  final apellidoPaternoController = TextEditingController();
  final apellidoMaternoController = TextEditingController();
  final correoController = TextEditingController();
  final rutController = TextEditingController();
  Future<void> enviarDatos(BuildContext context) async {
    final dio = Dio();
    const url = 'https://api-convocatorias-flhp34d5na-tl.a.run.app/postulacion';

    try {
      final response = await dio.post(
        url,
        data: {
          'idConvocatoria': idConvocatoria,
          'nombre': nombreController.text,
          'apellidoPaterno': apellidoPaternoController.text,
          'apellidoMaterno': apellidoMaternoController.text,
          'correo': correoController.text,
          'rut': rutController.text,
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
      errorMessage = 'Usted ya a postulado a esta convocatoria';
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text(errorMessage),
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
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text('Formulario de Postulación'),
          ),
          //fondo
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const CachedNetworkImageProvider(
                    'https://www.iplacex.cl/content/uploads/2023/09/Carreras-100-online-1920x1055-1.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5),
                  BlendMode.darken,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Container(
                  width: 400,
                  // height: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: const Color.fromARGB(124, 102, 102, 102),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Rellena el formulario de postulación:',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          TextFormField(
                            controller: rutController,
                            decoration: const InputDecoration(labelText: 'Rut'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Campo obligatorio';
                              } else {
                                final formattedRut = formatRut(value);
                                if (!validateRut(formattedRut)) {
                                  return 'RUT no válido';
                                }
                                rutController.text = formattedRut;
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: nombreController,
                            decoration:
                                const InputDecoration(labelText: 'Nombre'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Campo obligatorio';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: apellidoPaternoController,
                            decoration: const InputDecoration(
                                labelText: 'Apellido Paterno'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Campo obligatorio';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: apellidoMaternoController,
                            decoration: const InputDecoration(
                                labelText: 'Apellido Materno'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Campo obligatorio';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: correoController,
                            decoration: const InputDecoration(
                                labelText: 'Correo Electrónico'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Campo obligatorio';
                              } else if (!value.contains('@')) {
                                return 'Correo electrónico no válido';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          Text(
                            errorMessage,
                            style: const TextStyle(
                              color: Colors
                                  .red, // Puedes elegir un color que te parezca adecuado
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                enviarDatos(context);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(6, 6, 48, 1),
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
            ),
          ),
        )
      ],
    );
  }
}
