import 'package:flutter/material.dart';
import 'package:fonis_openday24/firebase_svasta/loading_status.dart';
import 'package:fonis_openday24/kontroleri/pitanja_kontroler/data_uploader.dart';
import 'package:get/get.dart';

class DataUploaderScreen extends StatelessWidget {
  DataUploaderScreen({super.key});
  //pravim kontroler za dataupload
  /*zašto pravim kontroler (koji će mi?)
  -upravljam logikom(upload,data valid,kom sa serverom, UI update blabla)
  -MVVM MODEL-VIEW-VIEWMODEL 
(VM-viewmodel kontroler upravlja interakcijama između View (ekrana) i Modela (podaci u app) */

  DataUploader controller = Get.put(DataUploader());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Obx(() => Text(
          controller.loadingStatus.value == LoadingStatus.completed
              ? "Upload complete"
              : "Uploading")),
    ));
  }
}
/*
build-kreira UI za ekran,scaffold-osnovna struktura ekrana,ceneter prikazuje tekst
tekst se menja dinamički u zavisnosti od loadingStatus unutar data_uploader.dart
u zavisnosti od statusa ima poruku (dal je completed)
koristim Obx omogućuje da se UI automatski update kad menja vresnot loadingStatus

 */
