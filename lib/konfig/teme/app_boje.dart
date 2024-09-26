import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fonis_openday24/konfig/teme/app_dark_tema.dart';
import 'package:fonis_openday24/konfig/teme/app_light_tema.dart';
import 'package:fonis_openday24/konfig/teme/ui_params.dart';

const Color onSurfaceTxtColor = Colors.white;

const mainGradientLight = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    //lista boja a gore su alignmenti
    colors: [primaryColorLight, secondaryColorLight]);

const mainGradientDark = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    //lista boja a gore su alignmenti
    colors: [primaryDarkColor, secondaryDarkColor]);

LinearGradient mainGradient(BuildContext context) =>
//koji je gradijent
    UiParams.isDarkMode(context) ? mainGradientDark : mainGradientLight;
