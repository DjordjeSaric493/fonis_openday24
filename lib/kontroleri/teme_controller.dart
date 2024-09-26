import 'package:flutter/material.dart';
import 'package:fonis_openday24/konfig/teme/app_dark_tema.dart';
import 'package:fonis_openday24/konfig/teme/app_light_tema.dart';
import 'package:get/get.dart';

class TemeController extends GetxController {
  //priv promenljive koje će kasnije da se inicijalizuju (otud late->ne late makijato nego kao posle)
  late ThemeData _darkTh;
  late ThemeData _lightTh;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  initializeThemeData() {
    //poziva ove metode
    _darkTh = AppDarkTema().buildDarkTheme();
    _lightTh = AppLightTema().buildLightTheme();
  }

  ThemeData get darkTheme => darkTheme;
  ThemeData get lightTheme => lightTheme;
}
//Ova klasa služi za centralizovano upravljanje temama u aplikaciji.