import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'formulario.dart';

class DetallesTrabajo extends StatelessWidget {
  final num idConvocatoria;
  final String nombre;
  final String modalidad;
  final String sede;
  final String curso;
  final String escuela;
  final String nivelEducacional;
  final num expeDoce;
  final num expLabo;
  final String otrosRequi;
  final String cursosInteres;
  final String descripcion;
  const DetallesTrabajo({
    super.key,
    required this.idConvocatoria,
    required this.nombre,
    required this.modalidad,
    required this.sede,
    required this.curso,
    required this.escuela,
    required this.nivelEducacional,
    required this.expeDoce,
    required this.expLabo,
    required this.otrosRequi,
    required this.cursosInteres,
    required this.descripcion,
  });

  @override
  Widget build(BuildContext context) {
    const color = Color.fromRGBO(6, 6, 48, 1);
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Regresar'),
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: screenWidth * 0.1, vertical: 50),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Convocatorias $nombre',
                  style: GoogleFonts.montserrat(
                      fontSize: 30, fontWeight: FontWeight.bold, color: color)),
              Text(
                  'Unete a nuestro equipo de docentes en la $nombre del Instituto Profesional Iplaceex! Imparte clases virtuales, diseña programas de estudio y forma parte de una experiencia educativa en linea de calidad. Valoramos tu experiencia en el campo de contabilidad y ofrecemos oportunidades de desarrollo profesional.',
                  style: GoogleFonts.montserrat(fontSize: 15)),
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 10),
                child: Wrap(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Requisitos',
                          style: GoogleFonts.montserrat(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: color),
                        ),
                        Text('- Titulo o licenciatura',
                            style: GoogleFonts.montserrat(fontSize: 15)),
                        Text('- $expeDoce años de experiencia docente',
                            style: GoogleFonts.montserrat(fontSize: 15)),
                        Text(
                            '- $expLabo años de experiencia laboral en el área',
                            style: GoogleFonts.montserrat(fontSize: 15)),
                        Text('- $modalidad',
                            style: GoogleFonts.montserrat(fontSize: 15)),
                        Text('- $otrosRequi',
                            style: GoogleFonts.montserrat(fontSize: 15)),
                        Text(
                            '- Posibles asignaturas a impartir: $cursosInteres',
                            style: GoogleFonts.montserrat(fontSize: 15)),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Image.network(
                      'https://acti.cl/wp-content/uploads/2020/09/trabajo-remoto.jpg',
                      width: 400,
                      height: 350,
                    )
                  ],
                ),
              ),
              Center(
                child: SizedBox(
                  width: 200,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                FormularioView(idConvocatoria: idConvocatoria)),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: color,
                    ),
                    child: const Text(
                      'Postular',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
