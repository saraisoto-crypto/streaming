import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Tema global de la app y los 3 tipos de letra:
///  1. Bebas Neue -> títulos grandes
///  2. Poppins    -> texto general (textTheme global)
///  3. Oswald     -> etiquetas, botones y chips
class AppTema {
  static Color colorDe(dynamic valor) => Color(valor as int);

  // Fuente 1: Bebas Neue
  static TextStyle titulo({double size = 28, Color color = Colors.white}) {
    return GoogleFonts.bebasNeue(
      fontSize: size,
      color: color,
      letterSpacing: 1.2,
    );
  }

  // Fuente 2: Poppins
  static TextStyle texto({
    double size = 14,
    Color color = Colors.white,
    FontWeight weight = FontWeight.w400,
  }) {
    return GoogleFonts.poppins(fontSize: size, color: color, fontWeight: weight);
  }

  // Fuente 3: Oswald
  static TextStyle etiqueta({
    double size = 14,
    Color color = Colors.white70,
    FontWeight weight = FontWeight.w500,
  }) {
    return GoogleFonts.oswald(
      fontSize: size,
      color: color,
      fontWeight: weight,
      letterSpacing: 0.8,
    );
  }

  static ThemeData get oscuro {
    final base = ThemeData(brightness: Brightness.dark, useMaterial3: true);
    return base.copyWith(
      scaffoldBackgroundColor: const Color(0xFF0B0B0F),
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFFE50914),
        secondary: Color(0xFF00A8E1),
        surface: Color(0xFF1C1C22),
      ),
      textTheme: GoogleFonts.poppinsTextTheme(base.textTheme),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: GoogleFonts.bebasNeue(
          fontSize: 28,
          color: Colors.white,
          letterSpacing: 1.5,
        ),
      ),
      listTileTheme: ListTileThemeData(
        iconColor: Colors.white70,
        textColor: Colors.white,
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        subtitleTextStyle: GoogleFonts.poppins(fontSize: 12, color: Colors.white60),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          textStyle: GoogleFonts.oswald(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
          side: const BorderSide(color: Colors.white38),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          textStyle: GoogleFonts.oswald(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: const Color(0xFF2A2A30),
        labelStyle: GoogleFonts.oswald(color: Colors.white, fontSize: 14),
        side: BorderSide.none,
        shape: const StadiumBorder(),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        contentTextStyle: GoogleFonts.poppins(color: Colors.white),
        backgroundColor: const Color(0xFF2A2A30),
      ),
    );
  }
}

void mostrarAviso(BuildContext context, String mensaje) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text(mensaje)));
}