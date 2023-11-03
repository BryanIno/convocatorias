import 'package:animated_card/animated_card.dart';
import 'package:catalogo_app/presentation/screens/detalles_convocatoria.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardTrabajos extends StatefulWidget {
  final num idConvocatoria;
  final String nombre;
  final String modalidad;
  final String sede;
  final String escuela;
  final String nivelEducacional;
  final num expeDoce;
  final num expLabo;
  final String otrosRequi;
  final String cursosInteres;
  final String descripcion;

  const CardTrabajos({
    Key? key,
    required this.idConvocatoria,
    required this.nombre,
    required this.modalidad,
    required this.sede,
    required this.escuela,
    required this.nivelEducacional,
    this.expeDoce = 0,
    this.expLabo = 0,
    required this.otrosRequi,
    required this.cursosInteres,
    required this.descripcion,
  }) : super(key: key);

  @override
  State<CardTrabajos> createState() => _CardProductosState();
}

class _CardProductosState extends State<CardTrabajos> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          hover = true;
        });
      },
      onExit: (_) {
        setState(() {
          hover = false;
        });
      },
      child: AnimatedCard(
        direction: AnimatedCardDirection.left,
        initDelay: const Duration(milliseconds: 0),
        duration: const Duration(seconds: 2),
        child: Container(
          decoration: BoxDecoration(
            color:
                hover ? const Color.fromARGB(15, 238, 139, 139) : Colors.white,
            border: Border.all(
              color: hover
                  ? const Color.fromARGB(210, 255, 74, 74)
                  : const Color.fromARGB(124, 102, 102, 102),
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.nombre,
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromRGBO(6, 6, 48, 1),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.work_outline_outlined,
                          color: hover == true
                              ? const Color.fromARGB(210, 255, 74, 74)
                              : const Color.fromRGBO(6, 6, 48, 1),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          widget.modalidad,
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            color: const Color.fromRGBO(6, 6, 48, 1),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: hover == true
                              ? const Color.fromARGB(210, 255, 74, 74)
                              : const Color.fromRGBO(6, 6, 48, 1),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          widget.sede,
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            color: const Color.fromRGBO(6, 6, 48, 1),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: hover
                                ? MaterialStateProperty.all<Color>(
                                    ColorTween(
                                      begin: Colors.white,
                                      end: const Color.fromARGB(
                                          210, 255, 74, 74),
                                    ).lerp(1)!,
                                  )
                                : MaterialStateProperty.all<Color>(
                                    const Color.fromARGB(255, 255, 255, 255)),
                          ),
                          onPressed: () {
                            // Aquí pasamos los datos al constructor de DetallesTrabajo
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetallesTrabajo(
                                    idConvocatoria: widget.idConvocatoria,
                                    nombre: widget.nombre,
                                    modalidad: widget.modalidad,
                                    sede: widget.sede,
                                    curso: widget.cursosInteres,
                                    escuela: widget.escuela,
                                    nivelEducacional: widget.nivelEducacional,
                                    expeDoce: widget.expeDoce,
                                    expLabo: widget.expLabo,
                                    otrosRequi: widget.otrosRequi,
                                    cursosInteres: widget.cursosInteres,
                                    descripcion: widget.descripcion),
                              ),
                            );
                          },
                          child: Text(
                            'Ver Convocatoria',
                            style: TextStyle(
                              color: hover
                                  ? const Color.fromARGB(255, 255, 255, 255)
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
