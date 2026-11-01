// Datos de la app usando LISTAS (List) y MAPAS (Map).
// Imágenes en la nube: picsum.photos | Imágenes locales: assets/images/

Map<String, dynamic> _peli(
  String id,
  String titulo,
  int anio,
  String genero,
  String duracion,
  double rating,
  String descripcion,
) {
  return {
    'id': id,
    'titulo': titulo,
    'anio': anio,
    'genero': genero,
    'duracion': duracion,
    'rating': rating,
    'descripcion': descripcion,
    'poster': 'https://picsum.photos/seed/lab_$id/300/450',
    'fondo': 'https://picsum.photos/seed/lab_$id/800/450',
  };
}

// LISTA de MAPAS con el catálogo de películas/series
final List<Map<String, dynamic>> catalogo = [
  _peli('p01', 'El Último Faro', 2024, 'Drama', '2h 05m', 8.4,
      'Una guardiana de faro descubre mensajes ocultos en las luces que llegan del mar y decide seguirlos hasta el final.'),
  _peli('p02', 'Ciudad de Neón', 2025, 'Acción', '1h 58m', 7.9,
      'Un mensajero nocturno queda atrapado entre dos bandas rivales en una ciudad que nunca apaga sus luces.'),
  _peli('p03', 'Montañas de Sal', 2023, 'Aventura', '2h 12m', 8.1,
      'Tres amigos cruzan el desierto andino para cumplir la última promesa que le hicieron a su abuelo.'),
  _peli('p04', 'Código Rojo', 2025, 'Suspenso', '1h 49m', 7.6,
      'Una programadora detecta un error que podría apagar toda la red eléctrica del país en 24 horas.'),
  _peli('p05', 'La Casa del Lago', 2022, 'Terror', '1h 41m', 7.2,
      'Una familia se muda a una casa junto al lago, pero cada noche el agua sube un poco más.'),
  _peli('p06', 'Sabores de Lima', 2024, 'Documental', '1h 30m', 8.8,
      'Un recorrido por mercados, huariques y cocineros que hicieron de Lima una capital gastronómica.'),
  _peli('p07', 'Pixel y Tuerca', 2025, 'Animación', '1h 35m', 8.0,
      'Un pequeño robot de reparación y una gata curiosa viajan por una ciudad hecha de chatarra.'),
  _peli('p08', 'Reyes del Asfalto', 2023, 'Acción', '2h 01m', 7.4,
      'Pilotos callejeros compiten en la carrera más peligrosa de la costa para salvar su taller.'),
  _peli('p09', 'Ecos del Pasado', 2024, 'Drama', '1h 55m', 8.2,
      'Una historiadora encuentra cartas que cambian todo lo que su familia creía saber de sí misma.'),
  _peli('p10', 'Órbita Cero', 2026, 'Ciencia ficción', '2h 20m', 8.6,
      'La tripulación de una estación espacial pierde contacto con la Tierra y debe decidir si regresar.'),
  _peli('p11', 'Risas en Cuarentena', 2022, 'Comedia', '1h 32m', 6.9,
      'Cinco compañeros de departamento intentan sobrevivir juntos a un encierro lleno de caos.'),
  _peli('p12', 'El Reino Sumergido', 2025, 'Fantasía', '2h 10m', 8.3,
      'Una princesa del océano busca la perla perdida que mantiene a salvo a su pueblo.'),
  _peli('p13', 'Detective Lluvia', 2024, 'Suspenso', '1h 52m', 7.8,
      'En una ciudad donde nunca deja de llover, una detective investiga desapariciones en el puerto.'),
  _peli('p14', 'Copa del Barrio', 2023, 'Deportes', '1h 44m', 7.5,
      'Un equipo de fútbol de barrio llega por sorpresa a la final del campeonato nacional.'),
  _peli('p15', 'Alas de Papel', 2025, 'Animación', '1h 28m', 8.5,
      'Un niño construye alas de papel para encontrar a su abuela en el país de las nubes.'),
  _peli('p16', 'Frontera Sur', 2026, 'Acción', '2h 06m', 7.7,
      'Un guardaparques enfrenta a una red de tala ilegal en lo profundo de la Amazonía.'),
];

// LISTA de MAPAS con las plataformas
const List<Map<String, dynamic>> plataformas = [
  {
    'id': 'netflix',
    'nombre': 'Netflix',
    'eslogan': 'Series y películas sin límites',
    'color': 0xFFE50914,
    'fondo': 0xFF141414,
    'banner': 'assets/images/banner_netflix.png',
    'categorias': ['Series', 'Películas', 'Categorías', 'Juegos'],
    'secciones': [
      'Tendencias ahora',
      'Top 10 en Perú hoy',
      'Porque te gustan los dramas',
      'Nuevos lanzamientos',
    ],
  },
  {
    'id': 'prime',
    'nombre': 'Prime Video',
    'eslogan': 'Películas, series y deportes en vivo',
    'color': 0xFF00A8E1,
    'fondo': 0xFF0F171E,
    'banner': 'assets/images/banner_prime.png',
    'categorias': ['Inicio', 'Películas', 'Series', 'Deportes', 'En vivo'],
    'secciones': [
      'Incluido con Prime',
      'Top 10 en Perú',
      'Películas recomendadas',
      'Ver de nuevo',
    ],
  },
  {
    'id': 'disney',
    'nombre': 'Disney+',
    'eslogan': 'Historias para toda la familia',
    'color': 0xFF1F80E0,
    'fondo': 0xFF0A1330,
    'banner': 'assets/images/banner_disney.png',
    'categorias': ['Para ti', 'Acción', 'Fútbol', 'Clásicos', 'Animación'],
    'secciones': [
      'Recomendaciones para ti',
      'Top 10 de la semana',
      'Aventuras épicas',
      'Animación',
    ],
  },
  {
    'id': 'max',
    'nombre': 'Max',
    'eslogan': 'Las series y películas más comentadas',
    'color': 0xFF7B3FE4,
    'fondo': 0xFF0D0820,
    'banner': 'assets/images/banner_max.png',
    'categorias': ['Destacados', 'Series', 'Películas', 'Niños', 'Deportes'],
    'secciones': [
      'Lo más visto en Max',
      'Top 10 de hoy',
      'Estrenos de la semana',
      'Clásicos imperdibles',
    ],
  },
];

// LISTA de MAPAS con los perfiles (imágenes locales)
const List<Map<String, String>> perfiles = [
  {'nombre': 'Sarai', 'avatar': 'assets/images/avatar1.png'},
  {'nombre': 'Equipo', 'avatar': 'assets/images/avatar2.png'},
  {'nombre': 'Invitado', 'avatar': 'assets/images/avatar3.png'},
  {'nombre': 'Niños', 'avatar': 'assets/images/avatar4.png'},
];

// LISTA en memoria para "Mi lista"
final List<Map<String, dynamic>> miLista = [];

// Devuelve 8 títulos distintos para cada sección de cada plataforma
List<Map<String, dynamic>> peliculasPara(int plataforma, int seccion) {
  final inicio = plataforma * 3 + seccion * 5;
  return List.generate(
    8,
    (i) => catalogo[(inicio + i) % catalogo.length],
  );
}

// Película destacada (banner) de cada plataforma
Map<String, dynamic> destacadaDe(int plataforma) {
  return catalogo[(plataforma * 4 + 1) % catalogo.length];
}