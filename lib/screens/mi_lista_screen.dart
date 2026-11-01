import 'package:flutter/material.dart';

import '../data/datos.dart';
import '../theme/tema.dart';

class MiListaScreen extends StatefulWidget {
  const MiListaScreen({super.key});

  @override
  State<MiListaScreen> createState() => _MiListaScreenState();
}

class _MiListaScreenState extends State<MiListaScreen> {
  @override
  Widget build(BuildContext context) {
    final plataforma =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final color = AppTema.colorDe(plataforma['color']);

    return Scaffold(
      backgroundColor: AppTema.colorDe(plataforma['fondo']),
      appBar: AppBar(title: const Text('MI LISTA')),
      body: miLista.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.bookmark_border, size: 72, color: color),
                  const SizedBox(height: 12),
                  Text('Tu lista está vacía', style: AppTema.titulo(size: 28)),
                  Text(
                    'Agrega títulos desde la pantalla de detalle',
                    style: AppTema.texto(size: 13, color: Colors.white60),
                  ),
                ],
              ),
            )
          // LISTVIEW.BUILDER con CARDS y LISTTILES
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: miLista.length,
              itemBuilder: (context, i) {
                final peli = miLista[i];
                return Card(
                  color: Colors.white.withAlpha(18),
                  child: ListTile(
                    isThreeLine: true,
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.network(
                        peli['poster'] as String,
                        width: 44,
                        height: 64,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(peli['titulo'] as String),
                    subtitle: Text(
                      '${peli['anio']} • ${peli['genero']}\n⭐ ${peli['rating']}',
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete_outline, color: color),
                      onPressed: () {
                        setState(() => miLista.removeAt(i));
                        mostrarAviso(context, 'Eliminado de Mi lista');
                      },
                    ),
                    onTap: () => Navigator.pushNamed(
                      context,
                      '/detalle',
                      arguments: {'pelicula': peli, 'plataforma': plataforma},
                    ).then((_) => setState(() {})),
                  ),
                );
              },
            ),
    );
  }
}