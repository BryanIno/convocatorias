import 'package:catalogo_app/presentation/widgets/card.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class InformaticaTrabajo extends StatefulWidget {
  const InformaticaTrabajo({super.key});

  @override
  State<InformaticaTrabajo> createState() => _InformaticaTrabajoState();
}

class _InformaticaTrabajoState extends State<InformaticaTrabajo> {
  List<Map<String, dynamic>> tarjetas = [];

  @override
  void initState() {
    super.initState();
    fetchDataFromAPI();
  }

  Future<void> fetchDataFromAPI() async {
    try {
      final response = await Dio().get(
          'https://api-convocatorias-flhp34d5na-tl.a.run.app/convocatoria/informatica');
      if (response.statusCode == 200) {
        tarjetas.clear();
        final responseData = response.data as List;

        for (final item in responseData) {
          final idConvocatoria = item['idConvocatoria'];
          final nombre = item['nombre'];
          final descripcion = item['descripcion'];
          final modalidad = item['modalidad'];
          final sede = item['sede'];
          final nivelEducacional = item['NivelEducacional'];
          final expDoce = item['expDoce'];
          final expLabo = item['expLabo'];
          final inicioConvo = item['inicioConvo'];
          final finConvo = item['finConvo'];
          final otrosRequi = item['otrosRequi'];
          final cursosInteres = item['cursosInteres'];

          // para añadir valores a la card
          tarjetas.add({
            'idConvocatoria': idConvocatoria,
            'nombre': nombre,
            'descripcion': descripcion,
            'modalidad': modalidad,
            'sede': sede,
            'nivelEducacional': nivelEducacional,
            'expDoce': expDoce,
            'expLabo': expLabo,
            'inicioConvo': inicioConvo,
            'finConvo': finConvo,
            'otrosRequi': otrosRequi,
            'cursosInteres': cursosInteres,
          });
        }

        setState(() {});
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Wrap(
        spacing: 25,
        runSpacing: 25,
        children: tarjetas.map((tarjetaData) {
          //por si llega algun nulo
          final idConvocatoria = tarjetaData['idConvocatoria'] as int?;
          final nombre = tarjetaData['nombre'] as String?;
          final descripcion = tarjetaData['dedescripcions'] as String?;
          final modalidad = tarjetaData['modalidad'] as String?;
          final sede = tarjetaData['sede'] as String?;
          final escuela = tarjetaData['escuela'] as String?;
          final nivelEducacional = tarjetaData['nivelEducacional'] as String?;
          final expeDoce = tarjetaData['expDoce'] as int?;
          final expLabo = tarjetaData['expLabo'] as int?;
          final otrosRequi = tarjetaData['otrosRequi'] as String?;
          final cursosInteres = tarjetaData['cursosInteres'] as String?;

          return SizedBox(
            width: 290,
            height: 310,
            child: CardTrabajos(
                idConvocatoria: idConvocatoria ?? 0,
                nombre: nombre ?? '',
                modalidad: modalidad ?? '',
                sede: sede ?? '',
                escuela: escuela ?? '',
                nivelEducacional: nivelEducacional ?? '',
                expeDoce: expeDoce ?? 0,
                expLabo: expLabo ?? 0,
                otrosRequi: otrosRequi ?? '',
                cursosInteres: cursosInteres ?? '',
                descripcion: descripcion ?? ''),
          );
        }).toList(),
      ),
    );
  }
}
