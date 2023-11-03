import 'package:catalogo_app/presentation/view/favorite_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesBody extends StatelessWidget {
  const FavoritesBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favoritosState = Provider.of<FavoritosState>(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 50.0),
      child: Center(
        child: Column(
          children: [
            const Text(
              'Tus Favoritos',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 50),
            // Mostrar productos favoritos
            for (String producto in favoritosState.favoritos) Text(producto),
          ],
        ),
      ),
    );
  }
}
