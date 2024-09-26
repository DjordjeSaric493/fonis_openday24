import 'package:flutter/material.dart';
import 'package:fonis_openday24/konfig/teme/sub_teme_data.dart';

const Color primaryColorLight = Color.fromARGB(255, 248, 123, 6);
const Color secondaryColorLight = Color.fromARGB(198, 248, 242, 237);
const Color mainTxtColor = Color.fromARGB(255, 40, 41, 41);

class AppLightTema with SubTemeData {
  buildLightTheme() {
    final ThemeData sysLightTheme = ThemeData.light();
    return sysLightTheme.copyWith(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        iconTheme: getIconTheme(),
        textTheme: getTextTeme().apply(
          bodyColor: mainTxtColor,
          displayColor: mainTxtColor,
        ));
  }
}
