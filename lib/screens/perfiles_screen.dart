import 'package:flutter/material.dart';

import '../data/datos.dart';
import '../theme/tema.dart';

class PerfilesScreen extends StatelessWidget {
  const PerfilesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Recibe la plataforma enviada por la ruta
    final plataforma =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final color = AppTema.colorDe(plataforma['color']);

    return Scaffold(
      backgroundColor: AppTema.colorDe(plataforma['fondo']),
      appBar: AppBar(title: Text(plataforma['nombre'] as String)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        child: Column(
          children: [
            Text('¿Quién está viendo?', style: AppTema.titulo(size: 36)),
            const SizedBox(height: 24),
            Expanded(
              child: GridView.builder(
                itemCount: perfiles.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 24,
                  crossAxisSpacing: 24,
                  childAspectRatio: 0.82,
                ),
                itemBuilder: (context, i) {
                  final perfil = perfiles[i];
                  return InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () => Navigator.pushNamed(
                      context,
                      '/inicio',
                      arguments: {'plataforma': plataforma, 'perfil': perfil},
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            // IMAGEN LOCAL
                            child: Image.asset(
                              perfil['avatar']!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(perfil['nombre']!, style: AppTema.etiqueta(size: 16)),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.swap_horiz, color: color),
                label: const Text('Cambiar plataforma'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}