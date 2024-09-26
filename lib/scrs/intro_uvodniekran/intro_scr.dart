import 'package:flutter/material.dart';
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
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.21),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.code,
                size: 69,
                color: Colors.orangeAccent,
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
                    color: Colors.orange, //  tekst
                    decoration: TextDecoration.underline, // Podvlačenje teksta
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
                      color: Colors.orangeAccent,
                    ),
                    SizedBox(height: 8),
                    Text(
                      "fonis_fon",
                      style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.underline,
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
                      color: Colors.black,
                    ),
                    SizedBox(height: 8),
                    Text(
                      "GitHub repo",
                      style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              AppCircButton(
                onTap: () => null,
                width: 60,
                child: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.orangeAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
