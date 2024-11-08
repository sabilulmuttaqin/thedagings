import 'package:get/get.dart';

import '../controllers/jeroan_controller.dart';

class MenuJeroanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MenuJeroanController>(
      () => MenuJeroanController(),
    );
  }
}
