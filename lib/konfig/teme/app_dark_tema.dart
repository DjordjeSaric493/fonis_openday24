import 'package:flutter/material.dart';
import 'package:fonis_openday24/konfig/teme/sub_teme_data.dart';

const Color primaryDarkColor = Color.fromARGB(100, 100, 100, 100);
const Color secondaryDarkColor = Color.fromARGB(98, 187, 91, 1);
const Color mainTextColorDark = Colors.white54;

class AppDarkTema with SubTemeData {
  ThemeData buildDarkTheme() {
    final ThemeData systemDarkTheme = ThemeData.dark();
    return systemDarkTheme.copyWith(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      iconTheme: getIconTheme(),
      textTheme: getTextTeme().apply(
        bodyColor: mainTextColorDark,
        displayColor: mainTextColorDark,
      ),
    );
  }
}
