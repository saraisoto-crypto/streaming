import 'package:flutter/material.dart';

import 'theme/tema.dart';
import 'screens/plataformas_screen.dart';
import 'screens/perfiles_screen.dart';
import 'screens/inicio_screen.dart';
import 'screens/detalle_screen.dart';
import 'screens/mi_lista_screen.dart';

void main() {
  runApp(const StreamingApp());
}

class StreamingApp extends StatelessWidget {
  const StreamingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Streaming Lab',
      debugShowCheckedModeBanner: false,
      // TEMA GLOBAL
      theme: AppTema.oscuro,
      // Marco de celular cuando se ejecuta en pantallas grandes (web/escritorio)
      builder: (context, child) => MarcoMovil(child: child!),
      // RUTAS CON NOMBRE
      initialRoute: '/',
      routes: {
        '/': (context) => const PlataformasScreen(),
        '/perfiles': (context) => const PerfilesScreen(),
        '/inicio': (context) => const InicioScreen(),
        '/detalle': (context) => const DetalleScreen(),
        '/mi-lista': (context) => const MiListaScreen(),
      },
    );
  }
}

/// Si la pantalla es ancha, muestra la app dentro de un "celular" centrado.
/// En un teléfono real se muestra normal, a pantalla completa.
class MarcoMovil extends StatelessWidget {
  final Widget child;

  const MarcoMovil({super.key, required this.child});

  static const double anchoMovil = 412;
  static const double altoMovil = 870;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final pantalla = media.size;

    if (pantalla.width <= 500) return child;

    final alto = pantalla.height - 32 < altoMovil ? pantalla.height - 32 : altoMovil;

    return ColoredBox(
      color: const Color(0xFF050507),
      child: Center(
        child: Container(
          width: anchoMovil,
          height: alto,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(36),
            border: Border.all(color: const Color(0xFF2E2E36), width: 8),
            boxShadow: const [
              BoxShadow(color: Colors.black54, blurRadius: 30, spreadRadius: 4),
            ],
          ),
          child: MediaQuery(
            data: media.copyWith(
              size: const Size(anchoMovil - 16, altoMovil),
              padding: EdgeInsets.zero,
              viewPadding: EdgeInsets.zero,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}