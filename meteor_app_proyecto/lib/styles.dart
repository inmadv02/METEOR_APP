import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  static const Color blanco = Colors.white;
  static const Color moradoApagado = Color.fromRGBO(130, 140, 174, 1);
  static const Color gris = Color.fromRGBO(204, 207, 218, 1);
  static const Color azulIconsMenu = Color.fromRGBO(85, 126, 174, 1);
  static const Color azulMenu = Color.fromRGBO(16, 26, 57, 1);
  static const Color bodyBackground = Color.fromRGBO(6, 13, 38, 1);
  static const Color grisOscuro = Color.fromRGBO(44, 48, 63, 1);
  static const Color moradoCard = Color.fromRGBO(167, 180, 224, 1);

  static TextStyle textTitleCustom(double size) => GoogleFonts.getFont(
        'Roboto Slab',
        color: Styles.blanco,
        fontSize: size,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get textLogo => GoogleFonts.getFont(
        'Poppins',
        color: Styles.blanco,
        fontSize: 24,
        fontWeight: FontWeight.w600,
        letterSpacing: 6,
      );

  static TextStyle textNormalCustom(
          double size, Color c, FontWeight fontWeight) =>
      GoogleFonts.getFont(
        'Roboto Slab',
        color: c,
        fontSize: size,
        fontWeight: fontWeight,
      );
}
