//ovde radim splash screen

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Koristimo Center widget umesto Container-a za centriranje
        child: Image.asset(
          "asseti/tara/kevin.png",
          width: 300, // Postaviš širinu slike
          height: 300, // Postaviš visinu slike
        ),
      ),
    );
  }
}
