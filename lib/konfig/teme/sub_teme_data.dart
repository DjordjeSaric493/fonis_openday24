//peglam Mixin

import 'package:flutter/material.dart';
import 'package:fonis_openday24/konfig/teme/app_boje.dart';
import 'package:google_fonts/google_fonts.dart';

mixin SubTemeData {
  TextTheme getTextTeme() {
    return GoogleFonts.quicksandTextTheme(
      TextTheme(
          bodySmall: TextStyle(
            fontWeight: FontWeight.w400,
          ),
          bodyMedium: TextStyle(fontWeight: FontWeight.w400)),
    );
  }

  IconThemeData getIconTheme() {
    return const IconThemeData(color: onSurfaceTxtColor, size: 16);
  }
}

/*mixin omogućava da ove metode budu dodate u bilo koju klasu koja 
implementira ovaj mixin, tako da te teme mogu biti lako ponovo
 korišćene u različitim delovima aplikacije.*/