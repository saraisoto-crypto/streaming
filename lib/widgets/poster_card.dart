import 'package:flutter/material.dart';

import '../theme/tema.dart';

/// CARD con póster cargado desde la nube (Image.network)
class PosterCard extends StatelessWidget {
  final Map<String, dynamic> pelicula;
  final Map<String, dynamic> plataforma;
  final int? numero; // si tiene número se muestra estilo "Top 10"

  const PosterCard({
    super.key,
    required this.pelicula,
    required this.plataforma,
    this.numero,
  });

  @override
  Widget build(BuildContext context) {
    final poster = GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        '/detalle',
        arguments: {'pelicula': pelicula, 'plataforma': plataforma},
      ),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
        clipBehavior: Clip.antiAlias,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        // IMAGEN EN LA NUBE
        child: Image.network(
          pelicula['poster'] as String,
          width: 120,
          height: 175,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, progreso) {
            if (progreso == null) return child;
            return Container(
              width: 120,
              height: 175,
              color: Colors.white10,
              child: const Center(
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            );
          },
          errorBuilder: (context, error, stack) => Container(
            width: 120,
            height: 175,
            color: Colors.white10,
            child: const Icon(Icons.broken_image, color: Colors.white38),
          ),
        ),
      ),
    );

    if (numero == null) return poster;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '$numero',
          style: AppTema.titulo(size: 96, color: Colors.white24),
        ),
        poster,
      ],
    );
  }
}