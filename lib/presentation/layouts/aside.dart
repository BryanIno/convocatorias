import 'package:catalogo_app/presentation/screens/Administracion.dart';
import 'package:catalogo_app/presentation/screens/contruccion.dart';
import 'package:catalogo_app/presentation/screens/desarrollo_social.dart';
import 'package:catalogo_app/presentation/screens/educacion.dart';
import 'package:catalogo_app/presentation/screens/gastronomia.dart';
import 'package:catalogo_app/presentation/screens/informatica.dart';
import 'package:catalogo_app/presentation/screens/salud.dart';
import 'package:catalogo_app/presentation/screens/tecnologia.dart';
import 'package:catalogo_app/presentation/screens/todas_escuelas.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Aside extends StatelessWidget {
  final CategoriasEscuelas categoriasEscuelas;

  const Aside({
    Key? key,
    required this.categoriasEscuelas,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double paddingWidth = screenWidth < 200 ? 1.0 : 30.0;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: paddingWidth, vertical: 30),
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: const Color.fromARGB(62, 151, 141, 141),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: categoriasEscuelas,
      ),
    );
  }
}

class CategoriasEscuelas extends StatefulWidget {
  final Function(Widget nuevaCategoria) onCategoriaSeleccionadaChanged;

  const CategoriasEscuelas({
    Key? key,
    required this.onCategoriaSeleccionadaChanged,
  }) : super(key: key);

  @override
  State<CategoriasEscuelas> createState() => _CategoriasEscuelasState();
}

class _CategoriasEscuelasState extends State<CategoriasEscuelas> {
  late Widget categoriaSeleccionada;

  @override
  void initState() {
    super.initState();
    categoriaSeleccionada = const AdministracionTrabajo();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Title(
            color: Colors.black,
            child: Text(
              'Escuelas',
              style: GoogleFonts.montserrat(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.chevron_right),
          title: Text(
            'Todas las escuelas',
            style: GoogleFonts.montserrat(
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            widget.onCategoriaSeleccionadaChanged(const FullEscuelas());
          },
        ),
        ListTile(
          leading: const Icon(Icons.chevron_right),
          title: Text(
            'Administración y negocios',
            style: GoogleFonts.montserrat(
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            widget
                .onCategoriaSeleccionadaChanged(const AdministracionTrabajo());
          },
        ),
        ListTile(
          leading: const Icon(Icons.chevron_right),
          title: Text(
            'Desarrollo Social y Servicio Público',
            style: GoogleFonts.montserrat(
                fontSize: 13, fontWeight: FontWeight.bold),
          ),
          onTap: () {
            widget.onCategoriaSeleccionadaChanged(const DesarrolloSocial());
          },
        ),
        ListTile(
          leading: const Icon(Icons.chevron_right),
          title: Text(
            'Educación',
            style: GoogleFonts.montserrat(
                fontSize: 13, fontWeight: FontWeight.bold),
          ),
          onTap: () {
            widget.onCategoriaSeleccionadaChanged(const EducacionTrabajo());
          },
        ),
        ListTile(
          leading: const Icon(Icons.chevron_right),
          title: Text(
            'Salud',
            style: GoogleFonts.montserrat(
                fontSize: 13, fontWeight: FontWeight.bold),
          ),
          onTap: () {
            widget.onCategoriaSeleccionadaChanged(const SaludTrabajo());
          },
        ),
        ListTile(
          leading: const Icon(Icons.chevron_right),
          title: Text(
            'Tecnología',
            style: GoogleFonts.montserrat(
                fontSize: 13, fontWeight: FontWeight.bold),
          ),
          onTap: () {
            widget.onCategoriaSeleccionadaChanged(const TecnologiaTrabajo());
          },
        ),
        ListTile(
          leading: const Icon(Icons.chevron_right),
          title: Text(
            'Gastronomía y Turismo',
            style: GoogleFonts.montserrat(
                fontSize: 13, fontWeight: FontWeight.bold),
          ),
          onTap: () {
            widget.onCategoriaSeleccionadaChanged(const GastronomiaTrabajo());
          },
        ),
        ListTile(
          leading: const Icon(Icons.chevron_right),
          title: Text(
            'Informática y Telecomunicaciones',
            style: GoogleFonts.montserrat(
                fontSize: 13, fontWeight: FontWeight.bold),
          ),
          onTap: () {
            widget.onCategoriaSeleccionadaChanged(const InformaticaTrabajo());
          },
        ),
        ListTile(
          leading: const Icon(Icons.chevron_right),
          title: Text(
            'Construcción',
            style: GoogleFonts.montserrat(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: const Color.fromRGBO(6, 6, 48, 1)),
          ),
          onTap: () {
            widget.onCategoriaSeleccionadaChanged(const ContruccionTrabajo());
          },
        ),
      ],
    );
  }
}
