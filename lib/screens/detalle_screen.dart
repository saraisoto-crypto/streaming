import 'package:flutter/material.dart';

import '../data/datos.dart';
import '../theme/tema.dart';

class DetalleScreen extends StatefulWidget {
  const DetalleScreen({super.key});

  @override
  State<DetalleScreen> createState() => _DetalleScreenState();
}

class _DetalleScreenState extends State<DetalleScreen> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final peli = args['pelicula'] as Map<String, dynamic>;
    final plataforma = args['plataforma'] as Map<String, dynamic>;
    final color = AppTema.colorDe(plataforma['color']);
    final fondo = AppTema.colorDe(plataforma['fondo']);
    final enLista = miLista.any((p) => p['id'] == peli['id']);

    // LISTA de MAPAS generada para los episodios
    final episodios = List.generate(
      6,
      (i) => {
        'numero': i + 1,
        'titulo': 'Capítulo ${i + 1}',
        'duracion': '${40 + i * 3} min',
        'imagen': 'https://picsum.photos/seed/lab_${peli['id']}_ep$i/240/135',
      },
    );

    return Scaffold(
      backgroundColor: fondo,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Stack(
            children: [
              // IMAGEN EN LA NUBE
              Image.network(
                peli['fondo'] as String,
                height: 260,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stack) => Container(
                  height: 260,
                  color: Colors.white10,
                ),
              ),
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.black45, Colors.transparent, fondo],
                    ),
                  ),
                ),
              ),
              const Positioned.fill(
                child: Center(
                  child: Icon(Icons.play_circle_fill, size: 64, color: Colors.white70),
                ),
              ),
              SafeArea(
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(peli['titulo'] as String, style: AppTema.titulo(size: 40)),
                Wrap(
                  spacing: 14,
                  runSpacing: 6,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text('${peli['anio']}', style: AppTema.etiqueta()),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 18),
                        const SizedBox(width: 4),
                        Text('${peli['rating']}', style: AppTema.etiqueta()),
                      ],
                    ),
                    Text(peli['duracion'] as String, style: AppTema.etiqueta()),
                    Chip(label: Text(peli['genero'] as String)),
                  ],
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: color,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () => mostrarAviso(
                      context,
                      'Reproduciendo "${peli['titulo']}"...',
                    ),
                    icon: const Icon(Icons.play_arrow),
                    label: const Text('Reproducir'),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      setState(() {
                        if (enLista) {
                          miLista.removeWhere((p) => p['id'] == peli['id']);
                        } else {
                          miLista.add(peli);
                        }
                      });
                      mostrarAviso(
                        context,
                        enLista ? 'Quitado de Mi lista' : 'Agregado a Mi lista',
                      );
                    },
                    icon: Icon(enLista ? Icons.check : Icons.add),
                    label: Text(enLista ? 'En mi lista' : 'Agregar a mi lista'),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  peli['descripcion'] as String,
                  style: AppTema.texto(size: 14, color: Colors.white70),
                ),
                const SizedBox(height: 20),
                Text('Episodios', style: AppTema.titulo(size: 28)),
              ],
            ),
          ),
          // CARDS con LISTTILES
          ...episodios.map(
            (e) => Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              color: Colors.white.withAlpha(18),
              child: ListTile(
                contentPadding: const EdgeInsets.all(8),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(
                    e['imagen'] as String,
                    width: 100,
                    height: 56,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text('${e['numero']}. ${e['titulo']}'),
                subtitle: Text(e['duracion'] as String),
                trailing: const Icon(Icons.download_outlined),
                onTap: () => mostrarAviso(context, 'Reproduciendo ${e['titulo']}'),
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}