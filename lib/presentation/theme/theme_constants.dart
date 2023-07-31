import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract final class ThemeConstants {
  static final _textTheme = GoogleFonts.poppinsTextTheme().copyWith(
    displayMedium: const TextStyle(
      fontSize: 48,
    ),
  );

  static final defaultTheme = ThemeData.from(
    colorScheme: const ColorScheme.dark(),
  ).copyWith(
    useMaterial3: true,
    textTheme: _textTheme.apply(
      bodyColor: Colors.white,
      displayColor: Colors.white,
    ),
  );

  // custom style for some widgets
  static final roundedButton = ElevatedButton.styleFrom(
    backgroundColor: const Color(0xFF99b7db),
    padding: const EdgeInsets.symmetric(
      horizontal: 24,
      vertical: 14,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
  );

  static const elipsedText = TextStyle(
    color: Colors.black,
    overflow: TextOverflow.ellipsis,
  );
}
