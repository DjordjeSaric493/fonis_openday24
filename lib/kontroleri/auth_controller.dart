import 'package:get/get.dart';

class AuthController extends GetxController {
  //izvršava logiku kada je view (mvvm) skroz renderovan,interakcija nakon što
  //je UI spreman za odgovor (npr imam učitan welocme)
  @override
  void onReady() {
    //čim je UI spreman pokrenem inAuth
    initAuth();
    super.onReady();
  }

//obzirom da petljam sa Future naravno da moram neki async await
  void initAuth() async {
    //uinicijalizuje auth ili pokreće početnu logiku kad je spremna app
    await Future.delayed(
        const Duration(seconds: 2)); //dve sekunde prebaci sa splash na intro
    naviToIntroScr();
  }

  void naviToIntroScr() {
    //navigacija ka početnom ekranu, korisnik se prebacuje na intro
    //nakon poziva offAll ne može se vrati nazad
    Get.offAllNamed("/intro");
  }
}
