import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fonis_openday24/firebase_svasta/loading_status.dart';
import 'package:fonis_openday24/firebase_svasta/reference.dart';
import 'package:fonis_openday24/modeli/spisak_pitanja_model.dart';
import 'package:get/get.dart';

//klasa koja nasleđuje GetxController, moš overriduješ šta ti treba
//can't spell class without ass
class DataUploader extends GetxController {
  //bukvalno ko java (p2/spa/) ukucaš metodu, imaš override i peglaj dalje
  @override
  void onReady() {
    //poenta vica da uploadujem samo jenom,jedan poziv u firebase
    uploadData();
    super.onReady();
  }

  final loadingStatus = LoadingStatus.loading.obs;
//ukratko-> praviš reaktivne UI komponente koje se update u realtime

//logično da je asinhrona operacija
  Future<void> uploadData() async {
    loadingStatus.value = LoadingStatus.loading;

    //početna instanca za inicijalizovanje firestore (dodaj cloud_firestore u pubspec.yaml)
    final fireStore = FirebaseFirestore.instance;
    //kao u java, za bolji error handling cepam try-catch

    // Proveri da l Get.context nije null
    if (Get.context != null) {
      // Učitaj AssetManifest.json datoteku iz asseta
      final manifestContent = await DefaultAssetBundle.of(Get.context!)
          .loadString("AssetManifest.json");

      // Parsiranje JSON-a u mapu
      final Map<String, dynamic> manifestMap = jsonDecode(manifestContent);
      //filtrira ključeve iz mape manifestMap vrati samo putanje  do json sa pitanjima i sadrži .json
      final pitanja_U_ASSetima = manifestMap.keys
          .where((path) =>
              path.startsWith("asseti/DB/pitanja") && path.contains(".json"))
          .toList(); //konvertuj putanje u listu

      List<SpisakPitanjaModel> spiskoviPitanja = [];

      for (var pitanja in pitanja_U_ASSetima) {
        //budem li još jednom stavio ž u naziv promenljive...
        //štampa sadršaj papira sa pitanjim kao string na konzoli
        String stringSadrzajPitanja = await rootBundle.loadString(pitanja);
        //type mismatch da izbegnem, iz json pa on da dekodira sadržaj stringa itd itb
        spiskoviPitanja
            .add(SpisakPitanjaModel.fromJson(jsonDecode(stringSadrzajPitanja)));
      }

      var batch = fireStore.batch();
      /*mali podestnik iz RMT batch- dozvoljava da grupišem više operacija upisa odjednom u jednu transakciju
        sve će uspe ili će sve da ode u PN, atomičnost (celovitost) i konzistentnost */

      for (var spisak in spiskoviPitanja) {
        //iteriram kroz niz objekata spiskoviPitanja
        batch.set(spisakpitanjaref.doc(spisak.id), {
          //referenca na doc po id
          "title": spisak.title, //preko batch.set postavlja podatke koje treba
          "image_url": spisak.imageUrl,
          "description": spisak.description,
          "time_seconds": spisak.timeSeconds,
          //gledaj dal je definisan niz pitanja, ako nije (tj ==null) postavi na 0
          // !. operator koji kaže -kućo garanutujem da nije null da bi mogao pristupim (null aware)
          "question_count":
              spisak.questions == null ? 0 : spisak.questions!.length
        });
        //prolazi kroz listu koja nije null, poziva referencu i prosleđuje id-eve
        for (var pitanja in spisak.questions!) {
          final pitanjaPutanja =
              pitanjaref(spisakId: spisak.id, pitanjeId: pitanja.id);
          //batch postavlja pitanje i tačan odgovor
          batch.set(pitanjaPutanja, {
            "question": pitanja.question,
            "correct_answer": pitanja.correctAnswer
          });

          for (var odgovor in pitanja.answers) {
            batch.set(
                pitanjaPutanja.collection("answers").doc(odgovor.identifier),
                {"answer": odgovor.answer});
          }
        }
      }
      await batch
          .commit(); //ko git commit logika, vraćam Future sa početka (sve ili ništa)
      loadingStatus.value =
          LoadingStatus.completed; //kad završim sa batch ->status je completed
    }
  }
}

/*zašto pravim kontroler (koji će mi?)
  -upravljam logikom(upload,data valid,kom sa serverom, UI update blabla)
  -MVVM!!!  MODEL-VIEW-VIEWMODEL   (NE MEŠAJ SA MVM,ozb)
(VM-viewmodel kontroler upravlja interakcijama između View (ekrana) i Modela (podaci u app) */
