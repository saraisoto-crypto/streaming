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

## Ejecutar

```bash
flutter pub get
flutter run
```

## Evidencias

| Plataformas | Perfiles | Inicio |
|---|---|---|
| ![](evidencias/01_plataformas.png) | ![](evidencias/02_perfiles.png) | ![](evidencias/03_inicio_netflix.png) |

| Top 10 | Detalle | Mi lista |
|---|---|---|
| ![](evidencias/04_inicio_top10.png) | ![](evidencias/05_detalle.png) | ![](evidencias/06_mi_lista.png) |

| Prime Video | Disney+ | Max |
|---|---|---|
| ![](evidencias/07_prime.png) | ![](evidencias/08_disney.png) | ![](evidencias/09_max.png) |