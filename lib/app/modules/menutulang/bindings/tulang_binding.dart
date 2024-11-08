import 'package:get/get.dart';

import '../controllers/tulang_controller.dart';

class MenuTulangBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MenuTulangController>(
      () => MenuTulangController(),
    );
  }
}
