# Streaming Lab – Laboratorio Flutter

Réplica de interfaz móvil (con fines académicos) de plataformas de streaming: **Netflix, Prime Video, Disney+ y Max**.

## Temas aplicados

| Tema | Dónde se usa |
|---|---|
| **ListView** | `ListView.builder` en plataformas y Mi lista; `ListView` vertical con `ListView` horizontales en Inicio |
| **ListTile** | Tarjetas de plataformas, episodios y Mi lista |
| **Listas y Mapas** | `lib/data/datos.dart` → `List<Map<String, dynamic>>` para catálogo, plataformas, perfiles y Mi lista |
| **Rutas** | Rutas con nombre en `main.dart`: `/`, `/perfiles`, `/inicio`, `/detalle`, `/mi-lista` (con `arguments`) |
| **Tema global** | `lib/theme/tema.dart` (`ThemeData` oscuro) + `Theme` que cambia el color según la plataforma |
| **Cards** | Plataformas, pósters, episodios y Mi lista |
| **3 tipos de letra** | Bebas Neue (títulos), Poppins (texto), Oswald (etiquetas y botones) con `google_fonts` |
| **Imágenes locales** | `assets/images/` → banners y avatares de perfiles (`Image.asset`) |
| **Imágenes en la nube** | Pósters y episodios desde picsum.photos (`Image.network`) |

## Estructura

```
lib/
├── main.dart
├── data/datos.dart
├── theme/tema.dart
├── widgets/poster_card.dart
└── screens/
    ├── plataformas_screen.dart
    ├── perfiles_screen.dart
    ├── inicio_screen.dart
    ├── detalle_screen.dart
    └── mi_lista_screen.dart
assets/images/
```

## Ejecutar

```bash
flutter pub get
flutter run
```
