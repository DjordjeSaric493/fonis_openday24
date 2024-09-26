import 'package:fonis_openday24/scrs/intro_uvodniekran/intro_scr.dart';
import 'package:fonis_openday24/scrs/splash_screen/splash_scr.dart';
import 'package:get/get.dart';

class AppRoutes {
  //lista ruta (obj klase GetPage) koje ćemo koristiti u app, bolje u odvojenoj klasi da ne bude haos u main
  static List<GetPage> routes() => [
        GetPage(name: "/", page: () => SplashScreen()),
        GetPage(name: "/intro", page: () => AppIntroScr())
      ];
}
