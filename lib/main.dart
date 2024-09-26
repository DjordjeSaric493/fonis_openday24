import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fonis_openday24/data_uploader_screen.dart';
import 'package:fonis_openday24/firebase_options.dart';
import 'package:fonis_openday24/rute/app_routes.dart';
import 'package:fonis_openday24/scrs/intro_uvodniekran/intro_scr.dart';
import 'package:fonis_openday24/scrs/splash_screen/splash_scr.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppRoutes.routes(),
    );
  }
}



//Konvertuj u async->desni klik refactor convert to async
//zašto asnihrone->jer oću da interagujem sa Firebase

/* TODO: POGLEDAJ ŠTA SAM RADIO OVDE RANIJE
Future<void> main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //da je flutter sa resursima dobro inicijalizovan
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // Asinhrono inicFirebase sa podešavanjima specifičnim za platformu na kojoj se pokreće app
  // pokrećemo i MyApp gledaš kao root widget -> ko koren odakle niče drvo, u ovom slučaju kao 'rast ako ga ne zapalim tj ne zaserem nešto
  runApp(GetMaterialApp(home: DataUploaderScreen())); // onaj kao koren widg
  //za razliku od tutorijala ne moram da pišem runApp(GetMaterialApp(options: DefaultFirebaseOptions.currentPlatform));
}*/

