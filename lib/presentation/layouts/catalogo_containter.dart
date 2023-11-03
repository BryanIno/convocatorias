import 'package:catalogo_app/presentation/layouts/navbar.dart';
import 'package:catalogo_app/presentation/screens/Administracion.dart';
import 'package:catalogo_app/presentation/screens/contruccion.dart';
import 'package:catalogo_app/presentation/screens/desarrollo_social.dart';
import 'package:catalogo_app/presentation/screens/educacion.dart';
import 'package:catalogo_app/presentation/screens/gastronomia.dart';
import 'package:catalogo_app/presentation/screens/informatica.dart';
import 'package:catalogo_app/presentation/screens/salud.dart';
import 'package:catalogo_app/presentation/screens/tecnologia.dart';
import 'package:catalogo_app/presentation/screens/todas_escuelas.dart';

import 'package:catalogo_app/presentation/layouts/aside.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CatalogoContainer extends StatefulWidget {
  const CatalogoContainer({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CatalogoContainerState createState() => _CatalogoContainerState();
}

class _CatalogoContainerState extends State<CatalogoContainer> {
  late Widget categoriaSeleccionada;
  late CategoriasEscuelas categoriasEscuelas;

  @override
  void initState() {
    super.initState();
    categoriaSeleccionada = const FullEscuelas();
    categoriasEscuelas = CategoriasEscuelas(
      onCategoriaSeleccionadaChanged: (nuevaCategoria) {
        setState(() {
          categoriaSeleccionada = nuevaCategoria;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: navbar(),
      drawer: screenWidth > 700
          ? null
          : DrawerWidget(
              onCategoriaSeleccionadaChanged: (nuevaCategoria) {
                setState(() {
                  categoriaSeleccionada = nuevaCategoria;
                  Navigator.pop(context);
                });
              },
            ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BarraBusqueda(screenWidth: screenWidth),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                screenWidth > 700
                    ? Aside(categoriasEscuelas: categoriasEscuelas)
                    : const SizedBox(),
                Expanded(
                  child: screenWidth > 700
                      ? categoriaSeleccionada
                      : Center(child: categoriaSeleccionada),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerWidget extends StatelessWidget {
  final Function(Widget nuevaCategoria) onCategoriaSeleccionadaChanged;

  const DrawerWidget({
    Key? key,
    required this.onCategoriaSeleccionadaChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
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
              onCategoriaSeleccionadaChanged(const FullEscuelas());
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
              onCategoriaSeleccionadaChanged(const AdministracionTrabajo());
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
              onCategoriaSeleccionadaChanged(const DesarrolloSocial());
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
              onCategoriaSeleccionadaChanged(const EducacionTrabajo());
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
              onCategoriaSeleccionadaChanged(const SaludTrabajo());
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
              onCategoriaSeleccionadaChanged(const TecnologiaTrabajo());
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
              onCategoriaSeleccionadaChanged(const GastronomiaTrabajo());
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
              onCategoriaSeleccionadaChanged(const InformaticaTrabajo());
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
              onCategoriaSeleccionadaChanged(const ContruccionTrabajo());
            },
          ),
        ],
      ),
    );
  }
}

class BarraBusqueda extends StatelessWidget {
  const BarraBusqueda({
    Key? key,
    required this.screenWidth,
  }) : super(key: key);

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    // double maxWidthTextField = screenWidth < 900 ? 300 : 630;
    double maxWidthTextField = screenWidth * 0.4;
    return SizedBox(
      // color: const Color.fromARGB(255, 255, 255, 255),
      width: screenWidth,
      height: 150,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Title(
                color: Colors.black,
                child: Text('Convocatorias Docentes',
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold, fontSize: 30))),
            const SizedBox(height: 20),
            Row(
              children: [
                const Icon(Icons.search),
                const SizedBox(width: 8),
                Container(
                  constraints: BoxConstraints(maxWidth: maxWidthTextField),
                  child: const TextField(
                    style: TextStyle(fontSize: 18),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      hintText: '   Escribe aquí...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(fixedSize: const Size(128, 46)),
                  child: Text(
                    'Buscar',
                    style: GoogleFonts.montserrat(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
