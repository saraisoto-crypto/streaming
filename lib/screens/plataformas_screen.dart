import 'package:flutter/material.dart';

import '../data/datos.dart';
import '../theme/tema.dart';

class PlataformasScreen extends StatelessWidget {
  const PlataformasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('STREAMING LAB'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () => mostrarAviso(
              context,
              'Laboratorio Flutter - Tecsup',
            ),
          ),
        ],
      ),
      // LISTVIEW.BUILDER con CARDS y LISTTILES
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: plataformas.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Elige una plataforma', style: AppTema.titulo(size: 34)),
                  Text(
                    'Réplica de interfaz móvil con fines académicos',
                    style: AppTema.texto(size: 13, color: Colors.white60),
                  ),
                ],
              ),
            );
          }
          return _TarjetaPlataforma(plataforma: plataformas[index - 1]);
        },
      ),
    );
  }
}

class _TarjetaPlataforma extends StatelessWidget {
  final Map<String, dynamic> plataforma;

  const _TarjetaPlataforma({required this.plataforma});

  @override
  Widget build(BuildContext context) {
    final color = AppTema.colorDe(plataforma['color']);
    final fondo = AppTema.colorDe(plataforma['fondo']);

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      clipBehavior: Clip.antiAlias,
      color: fondo,
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: color.withAlpha(140), width: 1.2),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(
          context,
          '/perfiles',
          arguments: plataforma,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                // IMAGEN LOCAL
                Image.asset(
                  plataforma['banner'] as String,
                  height: 130,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, fondo],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 12,
                  top: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'VER CATÁLOGO',
                      style: AppTema.etiqueta(size: 12, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: color,
                child: const Icon(Icons.play_arrow, color: Colors.white),
              ),
              title: Text(plataforma['nombre'] as String),
              subtitle: Text(plataforma['eslogan'] as String),
              trailing: const Icon(Icons.chevron_right),
            ),
          ],
        ),
      ),
    );
  }
}