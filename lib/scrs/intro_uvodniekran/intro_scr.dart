import 'package:flutter/material.dart';
import 'package:fonis_openday24/konfig/teme/app_boje.dart';
import 'package:fonis_openday24/widgeti/app_circ_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class AppIntroScr extends StatelessWidget {
  const AppIntroScr({super.key});

  // Funkcija za otvaranje URL-a
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Ne može da pokrene link:$url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(gradient: mainGradient(context)),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.21),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.code,
                size: 69,
              ),
              const SizedBox(height: 25), // Razmak između ikonice i teksta
              GestureDetector(
                onTap: () =>
                    _launchURL('https://fonis.rs/'), // Otvori FONIS sajt
                child: const Text(
                  'Dobrodošli na štand FONIS-a.\nIsprobajte naš kviz i zabavite se.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16, //veličina slova
                    color: onSurfaceTxtColor, // Boja teksta
                    // Uklonjena linija ispod teksta
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              const SizedBox(
                  height: 20), // Razmak između teksta i Instagram ikonice
              GestureDetector(
                onTap: () => _launchURL(
                    'https://www.instagram.com/fonis_fon/'), // Otvori Instagram profil
                child: Column(
                  children: const [
                    FaIcon(
                      FontAwesomeIcons.instagram,
                      size: 40.0,
                      color: Colors.white,
                    ),
                    SizedBox(height: 8),
                    Text(
                      "fonis_fon",
                      style: TextStyle(
                        color: onSurfaceTxtColor,
                        // Uklonjena linija ispod teksta
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                  height: 20), // Razmak između Instagram i GitHub ikonice
              GestureDetector(
                onTap: () => _launchURL(
                    'https://github.com/DjordjeSaric493/fonis_openday24'), // Otvori GitHub profil
                child: Column(
                  children: const [
                    FaIcon(
                      FontAwesomeIcons.github,
                      size: 40.0,
                      color: Colors.white,
                    ),
                    SizedBox(height: 8),
                    Text(
                      "GitHub repo",
                      style: TextStyle(
                        color: onSurfaceTxtColor,
                        // Uklonjena linija ispod teksta
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              AppCircButton(
                onTap: () => null,
                width: 120,
                height: 80,
                child: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  //color: Colors.orangeAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
