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

  void uploadData() {
    print("Podatak se šalje/upload in progress");
  }
}

 /*zašto pravim kontroler (koji će mi?)
  -upravljam logikom(upload,data valid,kom sa serverom, UI update blabla)
  -MVVM!!!  MODEL-VIEW-VIEWMODEL   (NE MEŠAJ SA MVM,ozb)
(VM-viewmodel kontroler upravlja interakcijama između View (ekrana) i Modela (podaci u app) */