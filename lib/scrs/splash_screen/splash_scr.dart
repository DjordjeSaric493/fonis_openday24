//ovde radim splash screen

import 'package:flutter/material.dart';
import 'package:fonis_openday24/konfig/teme/app_boje.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Koristimo Center widget umesto Container-a za centriranje
        alignment: Alignment.center,
        decoration: BoxDecoration(gradient: mainGradient(context)),
        child: Image.asset(
          "asseti/tara/kevin.png",
          width: 300, // Postaviš širinu slike
          height: 300, // Postaviš visinu slike
        ),
      ),
    );
  }
}
