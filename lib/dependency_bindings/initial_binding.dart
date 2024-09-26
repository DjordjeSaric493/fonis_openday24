import 'package:fonis_openday24/kontroleri/auth_controller.dart';
import 'package:fonis_openday24/kontroleri/teme_controller.dart';
import 'package:get/get.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(TemeController());
    Get.put(AuthController(), permanent: true);
  }
}
