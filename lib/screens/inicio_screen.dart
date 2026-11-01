import 'package:flutter/material.dart';

import '../data/datos.dart';
import '../theme/tema.dart';
import '../widgets/poster_card.dart';

class InicioScreen extends StatefulWidget {
  const InicioScreen({super.key});

  @override
  State<InicioScreen> createState() => _InicioScreenState();
}

class _InicioScreenState extends State<InicioScreen> {
  int _categoria = 0;

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final plataforma = args['plataforma'] as Map<String, dynamic>;
    final perfil = args['perfil'] as Map<String, String>;

    final indice = plataformas.indexWhere((p) => p['id'] == plataforma['id']);
    final color = AppTema.colorDe(plataforma['color']);
    final fondo = AppTema.colorDe(plataforma['fondo']);
    final categorias = List<String>.from(plataforma['categorias'] as List);
    final secciones = List<String>.from(plataforma['secciones'] as List);
    final destacada = destacadaDe(indice);

    // El tema global se adapta al color de cada plataforma
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: Theme.of(context).colorScheme.copyWith(primary: color),
        scaffoldBackgroundColor: fondo,
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: fondo.withAlpha(170),
          title: Row(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              ),
              const SizedBox(width: 8),
              Text(
                plataforma['nombre'] as String,
                style: AppTema.texto(size: 20, weight: FontWeight.w700),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.cast),
              onPressed: () => mostrarAviso(context, 'Buscando dispositivos...'),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: CircleAvatar(
                radius: 16,
                backgroundImage: AssetImage(perfil['avatar']!),
              ),
            ),
          ],
        ),
        // LISTVIEW vertical con LISTVIEWS horizontales dentro
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            _Banner(
              pelicula: destacada,
              plataforma: plataforma,
              color: color,
              fondo: fondo,
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 48,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: categorias.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, i) => ChoiceChip(
                  label: Text(categorias[i]),
                  selected: _categoria == i,
                  showCheckmark: false,
                  selectedColor: color,
                  onSelected: (_) => setState(() => _categoria = i),
                ),
              ),
            ),
            for (int s = 0; s < secciones.length; s++)
              _Seccion(
                titulo: secciones[s],
                peliculas: peliculasPara(indice, s),
                plataforma: plataforma,
                ranking: s == 1,
              ),
            const SizedBox(height: 24),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          selectedItemColor: color,
          unselectedItemColor: Colors.white54,
          onTap: (i) {
            if (i == 1) mostrarAviso(context, 'Búsqueda próximamente');
            if (i == 2) {
              Navigator.pushNamed(context, '/mi-lista', arguments: plataforma);
            }
            if (i == 3) Navigator.pop(context);
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Buscar'),
            BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Mi lista'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfiles'),
          ],
        ),
      ),
    );
  }
}

class _Banner extends StatelessWidget {
  final Map<String, dynamic> pelicula;
  final Map<String, dynamic> plataforma;
  final Color color;
  final Color fondo;

  const _Banner({
    required this.pelicula,
    required this.plataforma,
    required this.color,
    required this.fondo,
  });

  @override
  Widget build(BuildContext context) {
    void abrirDetalle() => Navigator.pushNamed(
          context,
          '/detalle',
          arguments: {'pelicula': pelicula, 'plataforma': plataforma},
        );

    return SizedBox(
      height: 480,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // IMAGEN LOCAL de fondo
          Image.asset(plataforma['banner'] as String, fit: BoxFit.cover),
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, fondo.withAlpha(200), fondo],
                stops: const [0.4, 0.8, 1.0],
              ),
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PELÍCULA DESTACADA',
                  style: AppTema.etiqueta(size: 12, color: color),
                ),
                Text(
                  pelicula['titulo'] as String,
                  style: AppTema.titulo(size: 46),
                ),
                Text(
                  '${pelicula['anio']} • ${pelicula['genero']} • ${pelicula['duracion']}',
                  style: AppTema.texto(size: 13, color: Colors.white70),
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: color,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: abrirDetalle,
                        icon: const Icon(Icons.play_arrow),
                        label: const Text('Ver ahora'),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: abrirDetalle,
                        icon: const Icon(Icons.info_outline),
                        label: const Text('Más info'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Seccion extends StatelessWidget {
  final String titulo;
  final List<Map<String, dynamic>> peliculas;
  final Map<String, dynamic> plataforma;
  final bool ranking;

  const _Seccion({
    required this.titulo,
    required this.peliculas,
    required this.plataforma,
    this.ranking = false,
  });

  @override
  Widget build(BuildContext context) {
    final lista = ranking ? peliculas.take(5).toList() : peliculas;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 18, 16, 4),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  titulo,
                  style: AppTema.texto(size: 17, weight: FontWeight.w600),
                ),
              ),
              Text('Ver todo', style: AppTema.etiqueta(size: 13)),
            ],
          ),
        ),
        SizedBox(
          height: 190,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: lista.length,
            itemBuilder: (context, i) => PosterCard(
              pelicula: lista[i],
              plataforma: plataforma,
              numero: ranking ? i + 1 : null,
            ),
          ),
        ),
      ],
    );
  }
}