import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget currentBody = const CatalogBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Aplicación'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromRGBO(244, 241, 228, 2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Categorías',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text('Catálogo'),
              onTap: () {
                setState(() {
                  currentBody = const CatalogBody();
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Favoritos'),
              onTap: () {
                setState(() {
                  currentBody = FavoritesBody();
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: currentBody,
    );
  }
}

class CatalogBody extends StatelessWidget {
  const CatalogBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.only(top: 50.0),
      child: Center(
        child: Column(
          children: [
            Text(
              'Catálogo de Productos',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

class FavoritesBody extends StatelessWidget {
  const FavoritesBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.only(top: 50.0),
      child: Center(
        child: Column(
          children: [
            Text(
              'Tus Favoritos',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
